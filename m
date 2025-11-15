Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922B6CEB2F0
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:11:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13804.1763230290081488196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXzBedmw;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b31c610fcso2630813f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230288; x=1763835088; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8kgIBw4gVZega1QYKV28kMTj8qgjd1iOX25z5eXA9M=;
        b=CXzBedmwQGNSEHZaZ35nmKMYexBtgWn5rvXkvtbdukJ86UibUmtV1vjFA0fPARDco7
         Ks2+f1nz+z3oURw2Zgsozydi2UphHTvj56AGOhQWhrjIvvTcA2FQjHpwRarq3cV2BAN4
         buMuHlKzjyHKtUMBItN6jHz+5NzapmaLOlxJLY32QCT9gN+K4olO9DQNdM3ewNnUoL4v
         3L6lybF14BUHntLH7rdFt20flmjD9j8WUukJ8OwvewJn+dZpW/FAmRHFSpryNmYOWxnL
         Rb2zN9hXuc4THD3U84S+H6hWDAtitkKmNXGe05frtnAaR49ni218CjVmCCBpOC8ZeC40
         dJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230288; x=1763835088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8kgIBw4gVZega1QYKV28kMTj8qgjd1iOX25z5eXA9M=;
        b=H8uWfh43IfV8oD48ook+b68q5L9G5Rgn5EGOkwk3sX9YdqHUGhKFqkpJx47ahzsv8j
         KEyDLOcQ7ufiT/um44yq7pJ+G8mpfnFo5GG38yCQe5gDTpkTwOAlylD7bQncwsYbw37o
         LwSGZXuHVE9aIHQpSVOsyOlMaWfB9F1aWQQj740idN9DNBPI+v72onQC99Zq4+LiMOyC
         LWEVjOf8GZa8vYAEBJd0yIcKz+u/DtNA+Vzl1VA/DPR/4t+24NzIeyjSEGS43ZwnHZv+
         lTi9aKxbVhSCXIvA+lv35DhViKrq3VbJnfobOlCHe3sCEIPcSk1uxe5NZn6c4I4TE8C6
         heFw==
X-Gm-Message-State: AOJu0Yy0Y54O4o9H7y5GtzThWLj5+DNI2AmRV36DMtuPYgCc1zmZ4edp
	0PswgljSRG1X5ceRrwWa5MKMlouT0b9/AIJiXs1UdbIYsv8590og4d5l7oG4X34C
X-Gm-Gg: ASbGncsbnfVFs0bS9qtmFny/L3IlP7CAFYLWpEl7MrsuJ4UF08UUuZp04JSVnG8llg7
	+EmLHJzEsdvMUnhxCRcdqtlTq0GaiU/PpdD4SQO5MtUT/Zi2YkJW1oZM1YU0ejYEx7ojfMiSFAQ
	yVyq47LAd7Gd5jBttaqIe6CSIBNa0mn1gUBVP/xy89mUkQy974D2D76Lp2I3B0RehisfQwu4/Br
	5DNmBkkq1Ns4sFS9k0KtfYxzEQ8NKHACw8+llmRWdSjXWck6VPJCEBn89smGyxgOIBVzJDOi1Tq
	J2VYKEFeCZtuGubSVGtlK0nyLNBJpbfaaDdVa6jdB3W3BvAbsHwag80Cfbw4kjUsOKcO2Zdf8fb
	DvA1nKEKa1vvCkSHdxx3CXKCs6ULeSJoBnRxxfXfksrsb/URf60JTdVjwzkgOmBMZJ6YOFBxT2x
	YLDrrXLAAI8zkCgwhUfY4=
X-Google-Smtp-Source: AGHT+IGD5g43czF4b30wKK1G37dnEC9gmvUXb/7mW9QKsLwf4SZtFUwtXHu3XDfZkw2/qoSm/DZRfg==
X-Received: by 2002:a5d:5f50:0:b0:42b:300f:7d8d with SMTP id ffacd0b85a97d-42b593869c6mr6779555f8f.34.1763230287994;
        Sat, 15 Nov 2025 10:11:27 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84b12sm17899379f8f.15.2025.11.15.10.11.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 10:11:27 -0800 (PST)
Message-ID: <627ca98d-8aa6-4c7f-80c5-0453f811dee8@gmail.com>
Date: Sat, 15 Nov 2025 19:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/4] yasm: patch CVE-2023-59579
To: openembedded-devel@lists.openembedded.org
References: <20251115123843.708911-1-skandigraun@gmail.com>
 <18782E73673BFCC1.1143620@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18782E73673BFCC1.1143620@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121737

Please ignore this -  made a typo in the CVE id at multiple places - it
is 29579, not 59579. Will send a new version.

On 11/15/25 13:38, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2023-29579
>
> The patch was taken from Debian:
> https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../yasm/yasm/CVE-2023-59579.patch            | 39 +++++++++++++++++++
>  meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch
>
> diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch
> new file mode 100644
> index 0000000000..564b27f5e5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-59579.patch
> @@ -0,0 +1,39 @@
> +From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Sat, 15 Nov 2025 13:24:21 +0100
> +Subject: [PATCH] Make sure CPU feature parsing use large enough string buffer.
> +  Fixes CVE-2023-29579.
> +
> +Author: Petter Reinholdtsen <pere@debian.org>
> +Bug: https://github.com/yasm/yasm/issues/214
> +Bug-Debian: https://bugs.debian.org/1035951
> +Forwarded:  https://github.com/yasm/yasm/issues/214
> +Last-Update: 2025-04-30
> +
> +This patch is taken from Debian:
> +https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
> +
> +CVE: CVE-2023-59579
> +Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + modules/arch/x86/x86arch.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
> +index bac11774..58327958 100644
> +--- a/modules/arch/x86/x86arch.c
> ++++ b/modules/arch/x86/x86arch.c
> +@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *valparams,
> +                 yasm_error_set(YASM_ERROR_SYNTAX,
> +                                N_("invalid argument to [%s]"), "CPU");
> +             else {
> +-                char strcpu[16];
> +-                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
> ++                char strcpu[21]; /* 21 = ceil(log10(LONG_MAX)+1) */
> ++                assert(8*sizeof(unsigned long) <= 64);
> ++                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get_uint(intcpu));
> +                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
> +             }
> +         } else
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> index abaeef4db3..f4f84a21f7 100644
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -14,7 +14,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
>             file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
>             file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
>             file://0001-bitvect-fix-build-with-gcc-15.patch \
> -"
> +           file://CVE-2023-59579.patch \
> +           "
>  
>  
>  inherit autotools gettext python3native
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121723): https://lists.openembedded.org/g/openembedded-devel/message/121723
> Mute This Topic: https://lists.openembedded.org/mt/116306636/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


