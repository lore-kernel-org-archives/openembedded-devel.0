Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522A2C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:50:06 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.1587.1717087801051385278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 09:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js8fU/3f;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627e3368394so878617b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717087800; x=1717692600; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qC7wBlyGJ7wPOjLPeYNnrHmvstb9oT9AU3Bk8H6nDcM=;
        b=Js8fU/3f8FFgkAkKdUF038bQz1ahw/J0yd0fqp5IxLGWnXzl6Xrgkf1R5SEzTl7UbL
         Jf1zN2FtbHgAq7g9NYCOIQ2ydRN0qHsCeoEaf/AdFk2QHwal5CZp1Fgw/9An/ndcUc1u
         SKSVltKOo5J4EfS2+wwD/nDB1OQJYh21YhplVDMAa20zKdcgrHdL1AS+VqtULpZtOfMs
         aFySktLR3lWTMf+YHjGnIYlXNSQ0U4ISYcOt2TFQd8k9He8mUv5NiFetkDrDWyvFVY3e
         deZkjhLvnoBys6TSzyLFTwG1/DwsIoftzRi8QKQXSU5UBbRBMRBLV4mQPgj0LyPs0uQK
         o25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087800; x=1717692600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC7wBlyGJ7wPOjLPeYNnrHmvstb9oT9AU3Bk8H6nDcM=;
        b=sqOgdJaFNfKARqv2Vjkxvy6qVwJRTdKd2KO3Fg05trjqx+1iRtqo/H+v+LcqIjoZvh
         45UeKpjE7BumlMot7JIgTuvce34FKRipdfzkX4r27CSFwB07vsUPo0eooB8xVKqtVa1I
         jfsVI1FPnMcPJb4yxoRvPJF3ZUjRW7OfdiRaUrvP6j43MI8xlUGBUm8K8cHuwE8qUYfw
         hsypOX+qZKLTiL/pkgHHF2WIvagnEb8uIvlwG6zSGMF0PYEl6wnkn8sM9aZOt83rdsYB
         Dc/gCs4TMjXUOjm6XAXdKlnl27UTD9u/6rNmz+ui2jtxdZacG73za3wMSHLV/t638e9h
         +kDA==
X-Forwarded-Encrypted: i=1; AJvYcCVyq8nZhxEe6iackpeW4zUnsOQxHaev+PBND2NvqhixeZSCenTcuL0Nvmdjo3qjqgF1mofW0ml8LoBdIsT4FZYWokBIhBeFXvRZcc04ZZ9kjEqIvqXMuws+dw==
X-Gm-Message-State: AOJu0YwrNldILoP8481WnrGsVsW+HlrNvxDd0dvCDwRZ0XuZhDn/pfDJ
	OjVC0FyYcvRQKQg59SH3ci4xpTkHdfpD476iS6gjdA9b/GajlGhXMndLjw==
X-Google-Smtp-Source: AGHT+IHLiClpdmzgWKCVNz7qyQryxfNAxd+EVpECfc6p8IoQQMks9nBKTd83CPpWjmN3lygEWplkKQ==
X-Received: by 2002:a81:d005:0:b0:61b:3346:eb60 with SMTP id 00721157ae682-62c6bc00b7cmr28133927b3.22.1717087800093;
        Thu, 30 May 2024 09:50:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:fd30:ccb0:f3d7:336b? ([2600:1700:45dd:7000:fd30:ccb0:f3d7:336b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766b344esm98697b3.127.2024.05.30.09.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 09:49:59 -0700 (PDT)
Message-ID: <b6cff313-fb99-4f14-af62-ba4b6413e428@gmail.com>
Date: Thu, 30 May 2024 12:49:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH] libdeflate: fix build with
 -mcpu=cortex-a76+crypto without -march=armv8.2-a+crypto
To: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20240529131655.3187405-1-martin.jansa@gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240529131655.3187405-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 16:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110634



On 5/29/24 9:16 AM, Martin Jansa via lists.openembedded.org wrote:
> * fixes:
>    https://github.com/ebiggers/libdeflate/issues/369
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I have this already backported to scarthgap-nut

thanks,
Armin
> ---
>   ...e-explicit-armv8.2-a-on-gcc-13.2-and.patch | 57 +++++++++++++++++++
>   .../libdeflate/libdeflate_1.20.bb             |  5 +-
>   2 files changed, 60 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
>
> diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch b/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
> new file mode 100644
> index 0000000000..e87972af27
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libdeflate/libdeflate/0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch
> @@ -0,0 +1,57 @@
> +From 684ebc7f8eb44558219d4b5be52add1250b3c0ca Mon Sep 17 00:00:00 2001
> +From: Eric Biggers <ebiggers@google.com>
> +Date: Tue, 30 Apr 2024 11:27:55 -0700
> +Subject: [PATCH] lib/arm: don't use explicit armv8.2-a on gcc 13.2 and later
> +
> +Resolves https://github.com/ebiggers/libdeflate/issues/369
> +---
> +Upstream-Status: Backport [https://github.com/ebiggers/libdeflate/pull/370]
> +
> + lib/arm/adler32_impl.h | 10 ++++++----
> + lib/arm/crc32_impl.h   | 10 ++++++----
> + 2 files changed, 12 insertions(+), 8 deletions(-)
> +
> +diff --git a/lib/arm/adler32_impl.h b/lib/arm/adler32_impl.h
> +index 6453b8e..6144afb 100644
> +--- a/lib/arm/adler32_impl.h
> ++++ b/lib/arm/adler32_impl.h
> +@@ -214,11 +214,13 @@ adler32_arm_neon(u32 adler, const u8 *p, size_t len)
> + #  ifdef __clang__
> + #    define ATTRIBUTES	_target_attribute("dotprod")
> +    /*
> +-    * With gcc, arch=armv8.2-a is needed for dotprod intrinsics, unless the
> +-    * default target is armv8.3-a or later in which case it must be omitted.
> +-    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
> ++    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
> ++    * "aarch64: Remove architecture dependencies from intrinsics"),
> ++    * arch=armv8.2-a is needed for the dotprod intrinsics, unless the default
> ++    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
> ++    * or later can be detected by checking for __ARM_FEATURE_JCVT.
> +     */
> +-#  elif defined(__ARM_FEATURE_JCVT)
> ++#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
> + #    define ATTRIBUTES	_target_attribute("+dotprod")
> + #  else
> + #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+dotprod")
> +diff --git a/lib/arm/crc32_impl.h b/lib/arm/crc32_impl.h
> +index 3c4bec7..5363041 100644
> +--- a/lib/arm/crc32_impl.h
> ++++ b/lib/arm/crc32_impl.h
> +@@ -551,11 +551,13 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
> + #  ifdef __clang__
> + #    define ATTRIBUTES	_target_attribute("aes,crc,sha3")
> +    /*
> +-    * With gcc, arch=armv8.2-a is needed for the sha3 intrinsics, unless the
> +-    * default target is armv8.3-a or later in which case it must be omitted.
> +-    * armv8.3-a or later can be detected by checking for __ARM_FEATURE_JCVT.
> ++    * With gcc 13.1 and earlier (before gcc commit 73d3bc348190 or 9aac37ab8a7b,
> ++    * "aarch64: Remove architecture dependencies from intrinsics"),
> ++    * arch=armv8.2-a is needed for the sha3 intrinsics, unless the default
> ++    * target is armv8.3-a or later in which case it must be omitted.  armv8.3-a
> ++    * or later can be detected by checking for __ARM_FEATURE_JCVT.
> +     */
> +-#  elif defined(__ARM_FEATURE_JCVT)
> ++#  elif GCC_PREREQ(13, 2) || defined(__ARM_FEATURE_JCVT)
> + #    define ATTRIBUTES	_target_attribute("+crypto,+crc,+sha3")
> + #  else
> + #    define ATTRIBUTES	_target_attribute("arch=armv8.2-a+crypto+crc+sha3")
> diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> index f0a966f2b4..e3de8aca62 100644
> --- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> +++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> @@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7b6977026437092191e9da699ed9f780"
>   
>   DEPENDS += "gzip zlib"
>   
> -SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
> +SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master \
> +    file://0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch \
> +"
>   
>   S = "${WORKDIR}/git"
>   SRCREV = "275aa5141db6eda3587214e0f1d3a134768f557d"
>   
>   inherit cmake pkgconfig
> -
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110614): https://lists.openembedded.org/g/openembedded-devel/message/110614
> Mute This Topic: https://lists.openembedded.org/mt/106368430/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


