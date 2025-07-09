Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB2FC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:09:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.964.1752077379464609299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 09:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xv5n+MtU;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b9dfb842so878385ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077379; x=1752682179; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1V1vYyX6uwD81ilCU7XYs0Zv0MbCYp5HupJByq02MU=;
        b=Xv5n+MtUrw0lHs9YSVVhx1gzYIChzJ8Uaeq6FJZG37Zb4y9LL3t6qAngaPvtwCr525
         Z3NzDzPf35gHMnUp1tqrymF9skJIZkwXhQaDtr583I5LmeSAN5YHGvs1YZTP/xjBFQwg
         f0V348VOfahmcONGOSQBYkLRIJegHn8LAqZLjGsVqDhp3WLcYTfwLSsWgyQR+P8lXrsB
         Bas2BhoOAuq26uRXMcGUvwliUgPGpt2wgkEa1Ey2AQl2PCr/2RjURJFYieIYKy2gfnKi
         Jf1Apf3pWQ9y1YCsVm+S/+x9yeaUYqZqMtbkjEiaKn+C8N5BAuj0J3jXw4jYpFzxWjPa
         SyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077379; x=1752682179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1V1vYyX6uwD81ilCU7XYs0Zv0MbCYp5HupJByq02MU=;
        b=AxQhlGRV2KroYH4JR+wgYJvrxHbX5G+MCN1XOQ9lhOCOb2qtgJH/Ja7+TXo3G4ZpKD
         /fT/jnhGvma45ImcLiHChHLqk2eegwSixjf3OFnwddkcrADuXksO82+MB6UvJVDvGrYz
         JNCZfeh6OtauX6FTpj3GFoP4YuT9qLUdCbYxRpvyS3+1Lnq2fBqYrELn5rWH9QQjuWsA
         s4QW6g4U9N1ujKgqIiZOQAVAjUvYfWHS6M21eX4YqJZqB1E9vTJ+1Pe3WmPeUC+22/An
         NwFs6NLnIAusOVCDXDgRNxibgjzmpnHEmzitTo03schb+Jh4lST0Gy4FfakWpP27/U/h
         6aDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbx2F94WQwANeM/1IkKVxtXda0XT4Q7Asb3plfm1YDBT/807qLbwJ2SCPVsnhc8N5UAOc3Nk+3D3uD4n/HFWVrVdg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUoshelk2KPjDD7ji2p0OJqAA/YkxxQv3kFOwYI4lZAK/zUbgN
	XHhEfgMaOcjD0ETgqbQXUQzjrbwzNf1xdkUtiT0XHuhRSTHUsfeV3U/8
X-Gm-Gg: ASbGnctWbkE3QCqq4eIcQWWlJoVSkx6Wx/m8UGBGTqaRpMwTAolnF8BoPOPWhsp+e+2
	MUl6QRpi124vz0zZNIzeDmqnj0veXENvg3BAd5QjPWjuqcYPnSGivH0dxP+90b8ZzwUvZoXfXGM
	Mm9ASiW8Ly0jnYWchsZS4NuP4J/wrV2O1iTB/PeWXignk2aPM6j52130dEZs35XBl+/ks9hGNLQ
	lUrecFO1Kz4Uqpal5EqeOcdMWHURoNZCDGqfUOh4pdSG47u7BXG+WNr3o1qh5ctUUUancprx2ZH
	wMNpG8ysJiTweKe+WUuKJXcJVpjSAVJQkoSXoYHTNqM9D4xTlxIlTKludJ9/ifOc3CWCHkmm1mT
	VRBNIrYXryf5tuvbo3A7AsqGftTHj71SkSRLAzgoPL7iJqy5R6w==
X-Google-Smtp-Source: AGHT+IE0gvl4feGXXSQk7DY3XvgmnaUUXkpM1EkAXI0Wq1BkKLIqp5tBA+bavu0p1/hyAab+yGt3kg==
X-Received: by 2002:a17:903:124a:b0:235:f3df:bc1f with SMTP id d9443c01a7336-23ddb3053cfmr50512205ad.36.1752077378441;
        Wed, 09 Jul 2025 09:09:38 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431f25csm153410235ad.48.2025.07.09.09.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:09:38 -0700 (PDT)
Message-ID: <3cbc36cb-3602-4585-84f7-01df20856991@gmail.com>
Date: Wed, 9 Jul 2025 09:09:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 01/20] cannelloni: Upgrade 1.1.0
 -> 2.0.0 to allow CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 16:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118353

fails to build with clang ( I think its upgrade having added 
incompatible code )

https://errors.yoctoproject.org/Errors/Details/869562/

On 7/8/25 12:56 PM, Alper Ak via lists.openembedded.org wrote:
> - Drop 0001-include-bits-stdc-.h-only-when-using-libstdc.patch because already fixed in newer version.
> 
> Changelog:
> 
> https://github.com/mguentner/cannelloni/compare/v1.1.0...v2.0.0
> 
> Fix:
> 
> | CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> |   Compatibility with CMake < 3.5 has been removed from CMake.
> |
> |   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> |   to tell CMake that the project requires at least <min> but has been updated
> |   to work with policies introduced by <max> or earlier.
> |
> |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> |
> |
> | -- Configuring incomplete, errors occurred!
> 
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   ...bits-stdc-.h-only-when-using-libstdc.patch | 37 -------------------
>   ...annelloni_1.1.0.bb => cannelloni_2.0.0.bb} |  7 +---
>   2 files changed, 2 insertions(+), 42 deletions(-)
>   delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
>   rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_1.1.0.bb => cannelloni_2.0.0.bb} (71%)
> 
> diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
> deleted file mode 100644
> index 71f447c94b..0000000000
> --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 13 Nov 2023 00:07:23 -0800
> -Subject: [PATCH] include bits/stdc++.h only when using libstdc++
> -
> -We have other c++ runtime implementations e.g. llvm's libc++ which does
> -not provide this header bits/stdc++.h, therefore make sure that this
> -header is only included when using libstdc++
> -
> -Fixes
> -| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0/git/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found
> -|    27 | #include <bits/stdc++.h>
> -|       |          ^~~~~~~~~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/56]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tcpthread.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/tcpthread.cpp b/tcpthread.cpp
> -index a1b3047..bb5a7b2 100644
> ---- a/tcpthread.cpp
> -+++ b/tcpthread.cpp
> -@@ -24,7 +24,9 @@
> - #include <cstdint>
> - #include <cstdio>
> -
> -+#ifdef __GLIBCXX__
> - #include <bits/stdc++.h>
> -+#endif
> -
> - #include <linux/can.h>
> - #include <string.h>
> ---
> -2.42.1
> -
> diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
> similarity index 71%
> rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
> index 835f33055a..287c7685e4 100644
> --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
> @@ -2,15 +2,12 @@ SUMMARY = "a SocketCAN over Ethernet tunnel"
>   HOMEPAGE = "https://github.com/mguentner/cannelloni"
>   LICENSE = "GPL-2.0-only"
>   
> -SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master \
> -           file://0001-include-bits-stdc-.h-only-when-using-libstdc.patch \
> -          "
> -SRCREV = "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
> +SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
> +SRCREV = "9f649ef21710999c6f674bc3d914ab2e88363bac"
>   
>   LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   inherit cmake
>   
> -
>   PACKAGECONFIG ??= "lksctp-tools"
>   PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118323): https://lists.openembedded.org/g/openembedded-devel/message/118323
> Mute This Topic: https://lists.openembedded.org/mt/114053246/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


