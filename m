Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.419.1617594191763724071
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUN9X6iy;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id p12so3310763pgj.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 20:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KcAfw4B0pFW1vX4nCxgwYiMvP/TdpD6ajs182D7uks0=;
        b=DUN9X6iyFqvLDL/B0jijLBKyzO9JML4g341OVDRjsUBcG8RWiKSDgmn6Kc4Li4YqRS
         l+zomNDLZcE2BPcXO/LrbeBAJtv7ikgTn9Ez29LNzrRjOaQEWI4DJSKDMT/lAFqZzyGB
         Of9Z8wZ41bC8CC01zP7NFtgCLNM3CaBoO9rIfxKIbcuQ9ZRiRqj6JPghGz0hPyZDRRgT
         JPSu+AWVlwoeWfB50vhoBGefnJ7v5QdBEbVyL3JnDapGAbxKEZFjNEbT7fibcXkLgZMJ
         2U863O0hSukm+7u+IfJ0uMM81Ee1loi0DY3ZSH4Qkb4OGmhhMI4XW//29Vh4UkNsGLsI
         Bvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KcAfw4B0pFW1vX4nCxgwYiMvP/TdpD6ajs182D7uks0=;
        b=f2Z6CQumKmOxpMrmX/3U7pYTaR53fQEilgjj2F61UU57SKsJ7WOo439r2+9/QdZLXJ
         yQdFFN8mDrgHSHqJS0k4BR/kZrOZU72TKUFTxp63zqzfjlodu01HH3MFPL4m6eH7gOKI
         jtwqGSxnm+qEmqg94TrWyi8Mn/2PaJeo2mshcJJk7QcE9Mam8LCLOkPtyx0OEoeJxEIq
         ZLaTnKxtRMQybQZLGGLSGHz7xH+wN2kxOHeB0x6f+e+r+fmsqOg2KY4Jh05j7PIZSMRD
         /WTBYRr4dnNp8Lr6pkbjDAyCMXY9rnh3vtcmyQ8tfSKHFDsBwtCERKhk7Mky83OQYl+Q
         k5Wg==
X-Gm-Message-State: AOAM530wgmsDJfNpeEFT9SrJCLQd+0+q9MHuooB0ylO3ZAzVnWvV+/aM
	78bMP2MjmREOoDAQ/mnme98505+GD71U8g==
X-Google-Smtp-Source: ABdhPJy23kWuWgy6xibor0LcssA0oGHsNoBjnuHa+twrAe61bk6iu6zMz5dj4ufEcH2b2tW05c3gjQ==
X-Received: by 2002:a63:4944:: with SMTP id y4mr21649124pgk.9.1617594190762;
        Sun, 04 Apr 2021 20:43:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:cc08:3ed2:5510:d537? ([2601:646:9200:a0f0:cc08:3ed2:5510:d537])
        by smtp.gmail.com with ESMTPSA id p17sm13816930pfn.62.2021.04.04.20.43.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Apr 2021 20:43:10 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] wireguard: fix build issue with updated 5.4 kernel
To: openembedded-devel@lists.openembedded.org
References: <20210404032455.22904-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7c939a73-4d16-66c3-bcda-e2789c8d4173@gmail.com>
Date: Sun, 4 Apr 2021 20:43:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210404032455.22904-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

are we already past this patch in master ?

On 4/3/21 8:24 PM, akuster wrote:
>   error: static declaration of 'icmp_ndo_send' follows non-static declaration
>   |   959 | static inline void icmp_ndo_send(struct sk_buff *skb_in, int type, int code, __be32 info)
>   |       |                    ^~~~~~~~~~~~~
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   ...send-functions-were-backported-exten.patch | 32 +++++++++++++++++++
>   .../wireguard-module_1.0.20200401.bb          |  3 +-
>   2 files changed, 34 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
> 
> diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
> new file mode 100644
> index 00000000000..f01cfe4e1c5
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
> @@ -0,0 +1,32 @@
> +From 122f06bfd8fc7b06a0899fa9adc4ce8e06900d98 Mon Sep 17 00:00:00 2001
> +From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> +Date: Sun, 7 Mar 2021 08:14:33 -0700
> +Subject: [PATCH] compat: icmp_ndo_send functions were backported extensively
> +
> +Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> +
> +Upstream-Status: Backport
> +
> +Fixes build with 5.4.103 update.
> +/include/linux/icmpv6.h:56:6: note: previous declaration of 'icmpv6_ndo_send' was here
> +|    56 | void icmpv6_ndo_send(struct sk_buff *skb_in, u8 type, u8 code, __u32 info);
> +
> +Signed-of-by: Armin Kuster <akuster808@gmail.com>
> +
> +---
> + src/compat/compat.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: src/compat/compat.h
> +===================================================================
> +--- src.orig/compat/compat.h
> ++++ src/compat/compat.h
> +@@ -946,7 +946,7 @@ static inline int skb_ensure_writable(st
> + }
> + #endif
> +
> +-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 102) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 178) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) && LINUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804)
> + #if IS_ENABLED(CONFIG_NF_NAT)
> + #include <linux/ip.h>
> + #include <linux/icmpv6.h>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
> index e8891c4428a..6ed988bafa2 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
> @@ -3,7 +3,8 @@ require wireguard.inc
>   SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
>   
>   SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat \
> -           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch"
> +           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch \
> +           file://0001-compat-icmp_ndo_send-functions-were-backported-exten.patch "
>   
>   inherit module kernel-module-split
>   
> 
> 
> 
> 
> 
