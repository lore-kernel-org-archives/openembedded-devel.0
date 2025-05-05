Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEF2C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 14:51:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.52458.1746456710670613884
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 07:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORwBJWZm;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376e311086so6431143b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746456710; x=1747061510; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DGdSiOC0hzB67UI4QqTJjDh6KD2CfKVh4n5n6OycXA=;
        b=ORwBJWZmhkkv/2PRjP/6Nkcfn7pu9n3LRoJHVjxdy+TM+YkCQMLX23tt0g5wYaPevL
         /MmrChzmZDhedUXGXKU37/r0rdWdZwXj6Yn/z2tdci3wDRaYF19n6USJUlFV9GXMoK2D
         vEK2m7kcnEs4xMctXDqKvcT8ViLLsnV2tUipdz7iWhbje5H+QMlCPq0sK1WbnWkvIJUq
         Wh2qiHGzppjOm43e6l7zR6q2wux0Sz4QwN6nH/Gwyng9ONiqQccd4anFblGvZRObAPUF
         cN0+K9vnGSJj4G6qvyhhuRnk2nTUCkJ0IdpmIB0h2Ayy6Ql4NX0Oy5eWS/E6lRaYDwQ7
         p0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746456710; x=1747061510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DGdSiOC0hzB67UI4QqTJjDh6KD2CfKVh4n5n6OycXA=;
        b=TZOmz5EW0lfxz6F0EkvwW+kECWXypm5p1a7NHquaKkmPJfYrVO3jKvosxlzxqy2xec
         iyC+EMViA3OT7YGveOvFw8Nm6KAtdzhRbuAky0MXPUcQ+K254qIP0LG54ZHGlYDUt20N
         NjgjxDoO/QNWXgL73jJ8PntYbaMWZQ2jXNfkCV9fdN6EERmyx4HjHxn0fkRy3jrj4U4X
         ginlg11qmkiAQ0q5Vas/Myq0jgTSXIFmEZOM5Bvk7rZgXMgSZaY6M9WNDGNb7vX/aL8f
         moG00ALXysa9OzNtZd5wL/j+2AnQqhBL3aI1rXNjSwKuA5ro8Nao8vhECJlAIHgDiVa/
         Fp7A==
X-Gm-Message-State: AOJu0YzkpUHfxtEwRfz2WvI+ndXnNIOXb7mB7qS+WzYcBDct83usOQDV
	xaRbRJ6zLB8uAmPdTik1hmlTJaic9m0YJ5pggd4zdYn3ezqoymQ1RG/tVxAY
X-Gm-Gg: ASbGncvSy+2womTkSi4wjwDocrutC/gTSKbyD007JMp8NQEzO9QeKDXK0FyWIWVQz91
	L6F+QG/u/exzPXzIJA5d50voOqi3PKbmANeQVXZRcWR24raypMP5ALjWo2Os0x8FG0mNn/ZSa3O
	WqfCgWfYghoB/jAZq8YbcqvWndLiFIhL2jaCDYxFtIn0M616IYcBmk7Pv/G35fmDMwTv4U0GlPT
	SPRP/SaOwUrkn2XwrQOEOddDZBOlBbXXpkudrVYE0SS81vWSGes2cLl9bD1aOKZtWTN+jk2j67a
	Pi3TNr/YHVfDItS6wRlIqsbl9pNT8ojZAQUwzQu3ZtVg/YW/xqaRPx3aY+fHtC0Gx1EUS1/byF9
	NpK+2rF5zeiCDbuCznhIapU1nrkkq
X-Google-Smtp-Source: AGHT+IFa+OKBQomE2iBpoNq1vRPzxhGBZOkFwtdh6BlRdIUhYyeO2YB5h4vBF35nq/WvU4ufcOG+eg==
X-Received: by 2002:a05:6a21:338c:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-20e97dad4d3mr11467001637.40.1746456709672;
        Mon, 05 May 2025 07:51:49 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:10a3:c7ea:a7a0:8c0d? ([2601:646:8201:fd20:10a3:c7ea:a7a0:8c0d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b51570sm5625905a12.20.2025.05.05.07.51.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:51:49 -0700 (PDT)
Message-ID: <1748b1e3-9831-4bfb-ab6a-81d43f27b284@gmail.com>
Date: Mon, 5 May 2025 07:51:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] x265: Fix error: 'uint8_t'
To: openembedded-devel@lists.openembedded.org
References: <20250505143255.1548816-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250505143255.1548816-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 14:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117317



On 5/5/25 7:32 AM, Leon Anavi via lists.openembedded.org wrote:
> Include cstdint in json11.cpp Fixes:
> 
> json11.cpp:101:32: error: 'uint8_t' does not name a type
> 
> This work was sponsored by GOVCERT.LU.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../0001-json11.cpp-Include-cstdint.patch     | 33 +++++++++++++++++++
>   .../recipes-multimedia/x265/x265_4.1.bb       |  5 ++-
>   2 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
> 
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
> new file mode 100644
> index 0000000000..38a5a319c7
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
> @@ -0,0 +1,33 @@
> +From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 5 May 2025 14:08:36 +0000
> +Subject: [PATCH] json11.cpp: Include cstdint
> +
> +Fixes:
> +
> +json11.cpp:101:32: error: 'uint8_t' does not name a type
> +
> +This work was sponsored by GOVCERT.LU.
> +
> +Upstream-Status: Inappropriate

This does seem to a good patch for upstreaming, if it is deemed to be 
inappropriate, we need a reason to mention it in the upstream-status tag.

> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + dynamicHDR10/json11/json11.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11.cpp
> +index 7625777..74f990a 100644
> +--- a/dynamicHDR10/json11/json11.cpp
> ++++ b/dynamicHDR10/json11/json11.cpp
> +@@ -25,6 +25,7 @@
> + #include <cstdlib>
> + #include <cstdio>
> + #include <limits>
> ++#include <cstdint>
> +
> + #if _MSC_VER
> + #pragma warning(disable: 4510) //const member cannot be default initialized
> +--
> +2.39.5
> +
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> index 23d6342d26..ae0f7758c1 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> @@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>   
>   DEPENDS = "nasm-native gnutls zlib libpcre numactl"
>   
> -SRC_URI = "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz"
> +SRC_URI = " \
> +    https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz \
> +    file://0001-json11.cpp-Include-cstdint.patch \
> +"
>   SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
>   S = "${WORKDIR}/x265_${PV}/source"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117316): https://lists.openembedded.org/g/openembedded-devel/message/117316
> Mute This Topic: https://lists.openembedded.org/mt/112630481/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


