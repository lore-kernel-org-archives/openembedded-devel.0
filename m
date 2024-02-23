Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86D2C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 09:15:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.6991.1708679721103889729
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 01:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0+yVf/h;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso137640a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 01:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708679719; x=1709284519; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDScgz8hHvy7fmhdlU1CP1Z4oANrPan4M0sHSg3/thY=;
        b=G0+yVf/hhi7ssOa7gnpeEDAWdDJjNC9oTkm6Zv91qzEeyTToK71GzoG6nJG2ojTjft
         wSyp3B2jWb3pJ20TQq1ZwhhQ/AKj795oJzrVOrbs8om55Pnu14HYaKyXdrKr2QZu31rP
         csAAz718NtXsNM3MgWyCcTb2Vmf9aZ5Fj5CQyjzfSEACWuPEVl0izORv2UrKzDujDLvV
         4DggBXHcNefMPMxYQji0t8EL3om/FxgvVZZIWCpxRLP8hJ3HG9KbcIShh9K4OLzHcsM0
         a03dOgqmtFnB+Ttqtohx05rAwfPxmm5tBMU84VrsG6nv7iS+oSsNQa2pOfmx+9+2JLqC
         N3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708679719; x=1709284519;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDScgz8hHvy7fmhdlU1CP1Z4oANrPan4M0sHSg3/thY=;
        b=ZcWEZIidYPim1RJ3OUP86SDw3Ue8bVEk6y4QULJzO0GLtoxjzO5vw/niVGjC/KCAGn
         jUOwDCjbE0RdFu9wT1x3BvrATk3tG8JO5RCuNeAHfa5gZh5s+9qeQIZyJGx/z9/FEDaS
         ZA7QXs0yB4eXAdDqTDpT7Oj+tAR9IVM6/H34jxdY2LIyiylCTcrCIOBtI9jbXT8Nc39S
         CLrjJx3CyhTbew7s/DRRb/kSR2UwYBlQ7G1A0yJp7EV633gEd/p+4/KHfjld97bNAQHI
         Tgk7+HnWKBFnB1xhnyNZmdkZ2mX+YEXoiYIT2dfPoBz552DOTRoG36dPdkPuXhC/Cxwf
         vQ8Q==
X-Gm-Message-State: AOJu0YxgJgDH/p4detmHfqMHEShGGJZK43rlS/veWqegxHC0KLnyokr4
	1Bk+Z34RDwdYGrHwEi78M+fIgN4AB0aAPgK6cnRVWL+gKGNUA1WH712uOWpq
X-Google-Smtp-Source: AGHT+IEWjHe6CrpqlSQbs6B0W7efLmUMlhyRIVrzml6jYyHUOsV02GcarVFRABZsLW34kRES9OxguA==
X-Received: by 2002:a05:6402:2748:b0:565:741f:5c05 with SMTP id z8-20020a056402274800b00565741f5c05mr709159edd.36.1708679718918;
        Fri, 23 Feb 2024 01:15:18 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h18-20020aa7c952000000b00564ed2dc990sm2467224edt.87.2024.02.23.01.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 01:15:18 -0800 (PST)
Message-ID: <2f55c72d-7519-4a8b-82fd-385cfef64f95@gmail.com>
Date: Fri, 23 Feb 2024 10:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Max Ihlenfeldt <max@igalia.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: chromium-x11 build error with Rust enabled
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109009

Hi,

since commit 0438fba4e773824fd2b41ded2728076deeeedeb1
("chromium: Enable Rust") in meta-browser, I get this error
on several different chromium-x11 builds (i.e. Fedora 33 and
Fedora 39 hosts, mickledore and nanbield Yocto versions):

| FAILED: obj/build/rust/std/target.json obj/build/rust/std/lib/libstd.rlib 
obj/build/rust/std/lib/liballoc.rlib obj/build/rust/std/lib/libcfg_if.rlib 
obj/build/rust/std/lib/libcompiler_builtins.rlib obj/build/rust/std/lib/libcore.rlib 
obj/build/rust/std/lib/libgetopts.rlib obj/build/rust/std/lib/libhashbrown.rlib 
obj/build/rust/std/lib/liblibc.rlib obj/build/rust/std/lib/libpanic_abort.rlib 
obj/build/rust/std/lib/libpanic_unwind.rlib obj/build/rust/std/lib/librustc_demangle.rlib 
obj/build/rust/std/lib/libstd_detect.rlib obj/build/rust/std/lib/libtest.rlib 
obj/build/rust/std/lib/libunicode_width.rlib obj/build/rust/std/lib/libunwind.rlib 
obj/build/rust/std/lib/libaddr2line.rlib obj/build/rust/std/lib/libadler.rlib 
obj/build/rust/std/lib/libgimli.rlib obj/build/rust/std/lib/libmemchr.rlib 
obj/build/rust/std/lib/libminiz_oxide.rlib obj/build/rust/std/lib/libobject.rlib 
obj/build/rust/std/lib/libprofiler_builtins.rlib 
obj/build/rust/std/lib/librustc_std_workspace_alloc.rlib 
obj/build/rust/std/lib/librustc_std_workspace_core.rlib 
obj/build/rust/std/lib/librustc_std_workspace_std.rlib
| python3 ../../build/rust/std/find_std_rlibs.py --rust-bin-dir 
../../../recipe-sysroot-native/usr/bin --output obj/build/rust/std --depfile 
obj/build/rust/std/stdlib.d --depfile-target std --rustc-revision custom --target 
x86_64-oe-linux-gnu
| Traceback (most recent call last):
|   File 
"/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/chromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../../build/rust/std/find_std_rlibs.py", 
line 139, in <module>
|     sys.exit(main())
|              ^^^^^^
|   File 
"/home/zozo/test-yocto-4.2-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/chromium-x11/120.0.6099.224-r0/chromium-120.0.6099.224/out/Release/../../build/rust/std/find_std_rlibs.py", 
line 104, in main
|     (crate_name, metadata) = RLIB_NAME_REGEX.match(f).group(1, 2)
|                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| AttributeError: 'NoneType' object has no attribute 'group'

Obviously, using the previous commit works.

Best regards,
Zoltán Böszörményi


