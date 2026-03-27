Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3B010ED65A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 11:00:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70198.1774609241542309481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 04:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S6q/0rrF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso19056705e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774609240; x=1775214040; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkPz6zQj5gUJJhZiSzjjg9p+Cx5pu6vUf8fzdrTzFDk=;
        b=S6q/0rrFsVrosagCoMzklcIkh4/q3Iyj8Rss2xOAvz1IFQxGJ+rGd+PmGnnBOdY51X
         V5EUZH/JBlr976c5DW1fGmh3mDSSZEjHNXCFpoeayu8inTd+BUQ6jZFZr2+5Qhan6UOu
         Je2I4FLK8LbP+6N+zGCE2fgpFi3wS1GplVml1lXWgtgV+Y2YBcRpdoFN+FEE318nzm4J
         4HI2x0Y4YyVIT3bq/PGgYGE+1P9Fdib7zSL6xWVkpD5S/Aic6nllhi4zGT55l5Zxl77v
         z9MPFw9xAAJszUdFr9AfhgZTvDgNVVyvm3s7/SUEhwXQxiuVCd8Qz+pyPOH77QrnzgE+
         bdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609240; x=1775214040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkPz6zQj5gUJJhZiSzjjg9p+Cx5pu6vUf8fzdrTzFDk=;
        b=mau910o01j47RIpBYBiu7Up4TjMZkJ8loFg5pRDVo3CnuTOHuzxVEpUCri5OA080ZL
         gKUknobEruxB/h2P5MvEhAWmIdwwK3WIkWIaRMyOOm0pojtCj3SqEXqDlZUEvRWst+5l
         82DxlcYZ6X+tiicykEkD2ofhIQowOfQX1l6aDRZ/2fR1uf5Co33N2k5C+VGLokczO816
         ILIbIkHpPxVKrla8cW/YvhJnZbgou8/n0eFBfCdoi64kku1fXfkGaYv3l+u7qF4QV/Dy
         D8QZK+LW85SHgO2Se/whgv69lQ7d3BSBGtG8m2GnF79kx/4pzdVAeSr5OwFb+6r/FoEC
         Vq5w==
X-Forwarded-Encrypted: i=1; AJvYcCUukfISyidK70m4SCygbUYBt2mcKhUNEKHfWk5U8Q+YqCzQ7S1ef+GUAZ2PjDb2W+nO8PKlXO++parcZoXiEeNbxIs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxupwm5h3YA0V7VirGRZEjv50nYxjG5FYJ79QKCM6MM+baJ3Khw
	dX8Fz2iHzhPamR+ArauNhgAkCBX+Kp6g/G6gNsVt7UI2kpD41ljwfATS
X-Gm-Gg: ATEYQzxGc/qKu73Tao3b0Qp68GNZNTuw/tv09ZNVNy28YKpqvP8hsrQ31/STax8RcDX
	1XWo/PUgynQGQMFYyl8z/pDHJ0/zJ6F452F3HJpxqQW0cWlpku4YEud5ky3ShwvPU5KsuWzm5UA
	EsYyqSvjxfCqUIUO0SgHmdU4j290zGBgDU2mKZCRtXcjnSIoengKhEvKEkoaiYeKVpGjP73D4Ub
	wZGd7wtAf+Hx4ooIGINBowAKJ3OsMd1PnIb9FV8vB4864X1NNemhFtj+W39KI8lpIRaf3eDpAW7
	9CajxGo8LoPTmbtjPDASsWlXpd+CYlyF68NgPn2zGDx9rf2gEtoAwhatvGnk2fsh3ZFAuRrtu7A
	Yzxgiy8gaUyXJflw8rKMf0uHNK7x8j4+aeTy3zTteEx8Uzq1E+Vl6hAZwKdBS8/2eiwaRTptzBO
	ZVRqMMP0LO35l3ZMGtMOa+etCt9Z0+pxs=
X-Received: by 2002:a05:600c:810a:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-48727e91110mr33439335e9.14.1774609239250;
        Fri, 27 Mar 2026 04:00:39 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65dc4sm94355535e9.3.2026.03.27.04.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:00:38 -0700 (PDT)
Message-ID: <56860348-9de9-42c2-8a81-45cecb5c4c07@gmail.com>
Date: Fri, 27 Mar 2026 12:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [RFC] : android-tools: move from dynamic-layers/selinux to
 meta-oe
To: emailaddress.ashish@gmail.com, openembedded-devel@lists.openembedded.org
References: <nvKR.1774599445194524365.rAwa@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <nvKR.1774599445194524365.rAwa@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 11:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125787

Personally I think you should just break this into two patches (one
patch to delete the old, one to move the other - due to the size, it
will be easier to skim through), and then send as a final patch and wait
to see what happens.

On 3/27/26 09:17, Ashish Mishra via lists.openembedded.org wrote:
> Hello Community Members, 
>  
> I would like to propose a change to move android-tools from dynamic-
> layer/selinux directly to meta-oe/recipes-devtools
> 
> 
> *1) Problem*
> Currently android-tools has two recipe at different layers 
>        meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
>        meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.b
>  
> This is code duplication and most of common user have to use older 5.1
> series 
> 
> *2) Proposed Change
> *We started this approach as an suggestion from Gyorgy 
> Re: [meta-oe][PATCH v2] image_types_sparse: switch ext* conversion to
> ext2simg_android <https://lists.openembedded.org/g/openembedded-devel/
> message/125525>
> We implemented the changes and verified locally 
> 
> ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ls
> adb  fastboot  img2simg  simg2img
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ./fastboot --version
> fastboot version -debian
> Installed as /home/ashish/upstream-yocto/build/tmp/work/x86_64-linux/
> android-tools-native/29.0.6.r14/image/home/ashish/upstream-yocto/build/
> tmp/work/x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-
> native/usr/bin/fastboot
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ./img2simg --version
> Usage: img2simg <raw_image_file> <sparse_image_file> [<block_size>]
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ./simg2img --version
> Usage: simg2img <sparse_image_files> <raw_image_file>
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-to[0/1728]ve/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ./adb --version
> ./adb: error while loading shared libraries: libbase.so.0: cannot open
> shared object file: No such file or directory
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ls
> adb  fastboot  img2simg  simg2img
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ldd adb | grep selinux
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ldd fastboot | grep selinux
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ldd img2simg | grep selinux
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/
> bin : ldd simg2img | grep selinux
>  ~/upstream-yocto/build/tmp/work/x86_64-linux/android-tools-
> native/29.0.6.r14/image/home/ashish/upstream-yocto/build/tmp/work/
> x86_64-linux/android-tools-native/29.0.6.r14/recipe-sysroot-native/usr/bin :
> 
> 
> Attached along is the patch for review 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125779): https://lists.openembedded.org/g/openembedded-devel/message/125779
> Mute This Topic: https://lists.openembedded.org/mt/118531349/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


