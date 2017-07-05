//
//  MBProgressHUD+GF.m
//  GFCocoaTools
//
//  Created by guofengld on 2017/3/14.
//  Copyright © 2017年 guofengld@gmail.com. All rights reserved.
//

#import "MBProgressHUD+GF.h"
#import "NSBundle+GF.h"

@implementation MBProgressHUD (GF)

+ (MBProgressHUD *)showHudOn:(UIView *)view
                        mode:(MBProgressHUDMode)mode
                       image:(UIImage *)image
                     message:(NSString *)message
                   delayHide:(BOOL)delayHide {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (image) {
        [hud setMode:MBProgressHUDModeCustomView];
        [hud setCustomView:[[UIImageView alloc] initWithImage:image]];
    }
    else {
        [hud setMode:mode];
    }
    hud.label.text = message;
    
    if (delayHide) {
        [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_HIDE];
    }
    
    return hud;
}

+ (void)finishHudWithResult:(BOOL)success
                        hud:(MBProgressHUD *)hud
                  labelText:(NSString *)labelText
                 completion:(void (^)())completionBlock {
    if (success) {
        [hud setMode:MBProgressHUDModeCustomView];
        [hud setCustomView:[[UIImageView alloc] initWithImage:[UIImage bundleImageNamed:@"ic_hud_success"]]];
        hud.label.text = GFLocalizedString(@"Success", nil);
    }
    else {
        [hud setMode:MBProgressHUDModeCustomView];
        [hud setCustomView:[[UIImageView alloc] initWithImage:[UIImage bundleImageNamed:@"ic_hud_fail"]]];
        hud.label.text = labelText?: GFLocalizedString(@"Failed", nil);;
    }
    [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_HIDE];
    [hud setCompletionBlock:completionBlock];
}

@end