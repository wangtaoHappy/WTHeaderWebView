//
//  HeaderWebViewController.m
//  WTHeaderWebView
//
//  Created by 王涛 on 2018/2/9.
//  Copyright © 2018年 王涛. All rights reserved.
//

#import "HeaderWebViewController.h"

#import <WebKit/WebKit.h>

static CGFloat headerH = 320.0;

@interface HeaderWebViewController ()

@end

@implementation HeaderWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"title";
    [self setupBanner];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.scrollView.contentOffset = CGPointMake(0, -headerH);
    webView.opaque = NO;
    webView.scrollView.contentInset = UIEdgeInsetsMake(headerH, 0, 0, 0);
//    YXDetailHeaderView *headerView = [[YXDetailHeaderView alloc] initWithFrame:CGRectMake(0, -headerH, SCREEN_WIDTH, headerH)];
//    [webView.scrollView addSubview:headerView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}

- (void)setupNav {
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"navbar_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn sizeToFit];
//    backBtn.yx_x += 10;
//    backBtn.yx_y += 10;
    [self.view addSubview:backBtn];
}

- (void)setupBanner {
    

}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    if (point.x > 0) {
        scrollView.contentOffset = CGPointMake(0, point.y);
    }
}

@end

