Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1452ACD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 10:37:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32191.1778841428077374219
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2026 03:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qBwDz1Nc;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: skandigraun@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso77440161fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778841426; x=1779446226; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyzL2U0UdR5aNkmVvVRIkszpdJcwo66swTIeA5OFxsA=;
        b=qBwDz1NcdRQgfk79jLhC9RK9Dhcmrf2TfVzJJ+MAHwHcUI5L2WNcBSQCUnMIpLSQ38
         LOLrkItqh96+xT+DU7dnDdaxBY753IV0AbTBIUFAoqr+/GkzutDtDM4ZJsg66p5xeOvf
         rdCC08XlaYXm9ogUr86FSEyaU2h9o3Cm2NNaWKoQKQoY2Evq5duZmtrTFUCUrZWDhznd
         8cM48qr5lWlhK5GEAPgbjFpDpsPIqLf2rcXoXRtxutZVw358Crm3JN4qPph8yvHci57K
         1asjOqbEhwkB/cFkE8nkAzZOVyxg9n3X9uQ3Ziu6wIR3YMqIINylis1xsx4hEVPHoQeH
         hyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841426; x=1779446226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyzL2U0UdR5aNkmVvVRIkszpdJcwo66swTIeA5OFxsA=;
        b=q/qRNUbfmTy2cyemS8DLu73kjOI8gFgAK0DtVg5IiTHgT7okPY8C4/x7i5Y3tTtpR5
         sSXu0KtAvkDcig8imbOXxDhD69QmzMlMiKfz2juAsK1QcLijCPZyZs1VUZju+U9TU8r+
         13wqazsBZmKYLxgGIFYsS0Mfh8srqygQB2ZFylifb1GZihaUxatOcvIXR3YpipzZ2iC1
         2g9tAC++eigKs+3I5bb83wL729CeiG0sUzQv5OtAjr4rjbaW/e09qfjHjWexRgDrKfro
         2iP8lm6F/YIJpbHTbj/GA3cMPnWLJkwqTgt1N6IEfQdbVXvDLQMflY5b2YYYNZU1NJa8
         2A7A==
X-Forwarded-Encrypted: i=1; AFNElJ84bMIDeLZxt3lsgP4Ot8DlLiYJgGjD5EsGIHGBYZkmRJZ3N0xiNUQOLY/FAMXFm/j7a2yHT7NwQNoeCdQDp5JFyVw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+jAc/sUBYr7EtnzyvPm8nUIdhKK1HAXFAX9MyhE/w52YdayUv
	0fmbypS17XfKNonIoa8Gxvosb71wZzDmkpwWxcXAus8/f8ZK2YSo9crK
X-Gm-Gg: Acq92OHuYVTiCDLyFiIvuFjccXqqCNZeBKrtTCd+s1VHKjqI+bvkTMo6jaLvCwxMMj3
	Udlx/6c7Td0FAw1F81tUCaw6BuTSnTh+5xm9nId6dyDbO/T0e+usjAvavvYZQtmfrrxpuQh2KJL
	kb14/jx7/Jekfg4jzcTXklABaQ+tLesWVdwqh7xIvFjbAnIymNFC+ZKB30shuGa506Kq78Oyqcb
	516yJBgZfY68NBVRtDF1Dbim+zJKoPPxGmJxXsiHr0hGeq9Ag7DbvJoI3d1Zb/NWwbzN/bBB2W+
	yHtzVJ8y/c/iCXwiXoQA9cdK7kwvoWTOugj0ONuUpIS0vr6YdEWPuBvYSW2PUFgnFJpexJc1kzr
	BY8/pnOtGsj9bjw3AMDAxztQcYT3AvIXdrvVkqqN00yhA/eibU0BUsi+n8i8Ovhibiz27HXcSJM
	Co7huE7GreGYf5HgWe9/nYKeZWBaLt6eU=
X-Received: by 2002:a2e:bc93:0:b0:38e:1ebe:960c with SMTP id 38308e7fff4ca-39562041a43mr9403101fa.26.1778841425773;
        Fri, 15 May 2026 03:37:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8e92f2sm14565271fa.17.2026.05.15.03.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:37:05 -0700 (PDT)
Message-ID: <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com>
Date: Fri, 15 May 2026 12:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org>
 <2115555.1778654861364723634@lists.openembedded.org>
 <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com>
 <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com>
 <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
 <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
 <1575450.1778745762950591364@lists.openembedded.org>
 <1575450.1778840626136865406@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1575450.1778840626136865406@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 10:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127005


On 5/15/26 12:23, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Khem / Team , 
> 
> Able to reproduce the build error with CLANG 
> Brought meta-clang and tweaked the toolchain / cc / cxx provider as clang 


Just a small note: do not use meta-clang - it has been part of oe-core
since the Whinlatter release.


> Will work to fix this and share the observation 
> 
> Sharing the error log to get an feedback just to avoid any gap's in
> customization
> 
> Below is the error :
> bake-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-
> tools/29.0.6.r14/android-tools=/usr/src/debug/android-tools/29.0.6.r14
>  -ffile-prefix-map=/home/bti-001003/upstream/bitbake-builds/poky-master/
> build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-
> sysroot=  -ffile-prefix-map=/home/bti-001003/upstream/bitbake-builds/
> poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/
> recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=gnu++20 -
> UADB_HOST -DADB_HOST=0 -DALLOW_ADBD_DISABLE_VERITY -DALLOW_ADBD_NO_AUTH
> -DPLATFORM_TOOLS_VERSION='"28.0.2"'  -Isystem/core/diagnose_usb/include
>  -Isystem/core/adb/daemon/include -Isystem/core/adb/adbconnection/
> include -Isystem/core/libasyncio/include -Isystem/core/libcutils/include
> -Isystem/core/libcrypto_utils/include -Isystem/core/liblog/include/ -
> Isystem/core/libutils/include -Iframeworks/native/libs/adbd_auth/include
> -Wno-c++11-narrowing  -DPAGE_SIZE=4096 -fPIC -Isystem/coreinclude -
> Isystem/core/adb -Isystem/core/base/include  -Idebian/out/system/core -
> Isystem/tools/mkbootimg/include/bootimg -Isystem/core/fs_mgr/include -
> Isystem/core/fs_mgr/include_fstab -DADB_VERSION='""' -D_GNU_SOURCE -Wl,-
> O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -Wl,-
> rpath='$ORIGIN/../lib/android' -Wl,-rpath-link='$ORIGIN/../lib/android'
> -lpthread -Ldebian/out/system/core -Ldebian/out/external/boringssl -
> lbase -lcrypto_utils -l:libcrypto.a -lcutils -llog -lresolv
> | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> | aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-
> header' when in C++ mode, this behavior is deprecated [-Wdeprecated]
> | aarch64-oe-linux-clang++: error: cannot specify -o when generating
> multiple output files
> | make: *** [/home/bti-001003/upstream/bitbake-builds/poky-master/build/
> tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/sources/android-
> tools-29.0.6.r14/debian/system/core/adbd.mk:84: build] Error 1
> | make: Leaving directory '/home/bti-001003/upstream/bitbake-builds/
> poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/
> sources/android-tools-29.0.6.r14'
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/home/bti-001003/upstream/bitbake-builds/poky-master/
> layers/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-
> tools_29.0.6.r14.bb:do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1685 tasks of which 275 didn't need to be
> rerun and 1 failed.
> Summary: 1 task failed:
>   /home/bti-001003/upstream/bitbake-builds/poky-master/layers/meta-
> openembedded/meta-oe/recipes-devtools/android-tools/android-
> tools_29.0.6.r14.bb:do_compile
>     log: /home/bti-001003/upstream/bitbake-builds/poky-master/build/tmp/
> work/cortexa57-oe-linux/android-tools/29.0.6.r14/temp/log.do_compile.1623961
> Summary: There were 12 WARNING messages.
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>  ~/upstream/bitbake-builds/poky-master/build :
>  ~/upstream/bitbake-builds/poky-master/build : 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127004): https://lists.openembedded.org/g/openembedded-devel/message/127004
> Mute This Topic: https://lists.openembedded.org/mt/119162735/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


