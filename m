Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0EBCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:49:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2576.1757011772216519962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 11:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/Ujhmay;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso1090870f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757011771; x=1757616571; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJPu9DgGuWXZN3Q9dgiE7QKgAExomLTuAj1qZ3Wosig=;
        b=L/Ujhmay6YlbYlTXED1D10zTVFToTAqUs4LFCMOAapWYoUuv2tFXQ4AXOrEc0TE1nr
         GAsccijCYzcQSeOIgNlwGzCWu1Srub4NXDPOgsNxOyGawtyiRE0NpIlO0XbgXAMnoPlp
         /PFIiE5YPuZ/GNJUPIMHw+u7crKrnQu8bCrOExkboqY6BHT5p3s/5Es5rJFLBT2Ii5vd
         0JjcU7rvFbvfifavvB5EVLZduaDxWuYivgSw64Cm+n6hlHnqZPIlUnbFU8QakFD3V+3X
         G4GsDQXj20dDffpMai6Im25Py1w9SmsdlXsk0fHBZPLOeiMARSfup1S+od2e49pRIyxE
         ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757011771; x=1757616571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJPu9DgGuWXZN3Q9dgiE7QKgAExomLTuAj1qZ3Wosig=;
        b=XA3TiGp3riGgA5X4+VncHygrEzlxcN+Bh4/bH1dBX6rtvk8IxJX/VMHzAXWL/C13DY
         8WEsINQJCYpNqvmpsRu8rksYDdEA/v07Hl4uqDZuwxILQfsEPt6t1ztKGQyt77tZgsl5
         cHdU04EUiEJXg2gqkpFtj8BrifDxgPE8Ljr+8rh2y+GO2Zs13wiBDdbdNkkGP1ivx3p7
         A5XZoT4I6Ui5FTRQGTjq2+OjIsBe7oqh5GPwx4G7l3YWkogFsPbGrlIPjzOdBd/hGD/8
         up89ano7MJaVC+Xzeu3FpmaE7mnBtyFRy4oykfK4Vn9s1YHkBArOjiLE2RnCGu/37lRr
         pOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMwDAAT7qDSwc5BpoF9MdnW8awuhAG4k4HuPkMizPZSDCKfup1jEj1ttbEZfdL6ACEFg/5uyTLC+BggwPp67WLies=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBtoG+lJNTCM4fC5tDXb3KDb/+uC4tfQqSO/HcCz3o3Ds5x4LR
	6LIhLBzVVDCFkfqVcmXQnEbxTla+gq7hMaP1PLzGUvP8zEa6xXlpTdnVy8YILhb7
X-Gm-Gg: ASbGnctdrd03OpxgQxvMyMFIGslubzBelxzfPSbJczFRpo2sFt2iRA3SbONPh6KxxoI
	PsRf4BXhq6CleQIR4ju8oE14ouzvXb394+pttSZziJkjpBTHsc/LKucCJqK0VShRhkY+fUg2yns
	jogdAwesZ0CwyOHm0bpdq3veRkdtdOmMMQcOEnlVJ7oIIHfrvwZPV0tM0wgx7r6/XMiJDYQ1ZAE
	1blq3kKevXGtvP2sg4fNcXpanoYAfhtE2YThYOLgQVx57hmaJsfcWjMTMqS6cZ7a9+wVwuW76of
	h8VVGwrmkvytR/L8nKFI2J9RcJs+5soc68F9GpxoD5jBrgQz7awV/YZsXp52vK2jR4gljf6a+ie
	i54lmkw3ov79CqqaIeMHXLp3TV+NicV2UvuqwIkHHBw==
X-Google-Smtp-Source: AGHT+IFZbcilExgc3JRoRv53xmkWYX2hDT/cOSjmCYTS5SYKC+oIsxPMCvbFZUyz7ahO5nqfX46GEA==
X-Received: by 2002:a05:6000:1aca:b0:3e0:cea3:f61a with SMTP id ffacd0b85a97d-3e0cea3f852mr2879024f8f.56.1757011770436;
        Thu, 04 Sep 2025 11:49:30 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d95df59e50sm13434001f8f.23.2025.09.04.11.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:49:30 -0700 (PDT)
Message-ID: <b1a5780d-6a01-4d3e-b9d0-59634c8273ee@gmail.com>
Date: Thu, 4 Sep 2025 20:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 1/1] tcpdump: refresh
 CVE-2024-2397 patch to remove fuzz warning
To: Haixiao.Yan.CN@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250820024527.2917040-1-haixiao.yan.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250820024527.2917040-1-haixiao.yan.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 18:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119293

Note: This is a duplicate of
https://lists.openembedded.org/g/openembedded-devel/message/118535

On 8/20/25 04:45, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> The CVE-2024-2397 patch was applied with fuzz and offset adjustments:
>   Hunk #1 succeeded at 42 with fuzz 2 (offset 5 lines).
>   ...
>
> Refreshed the patch against tcpdump 4.99.4 sources to align context and
> line numbers.
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  .../tcpdump/tcpdump/CVE-2024-2397.patch       | 26 +++++++++++--------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> index 169ec6be7044..a0e7df923734 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> @@ -1,4 +1,4 @@
> -From b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2 Mon Sep 17 00:00:00 2001
> +From 32a589ec83fa4536353f05df4c0cda05176cfe65 Mon Sep 17 00:00:00 2001
>  From: Guy Harris <gharris@sonic.net>
>  Date: Tue, 12 Mar 2024 00:37:23 -0700
>  Subject: [PATCH] ppp: use the buffer stack for the de-escaping buffer.
> @@ -24,25 +24,26 @@ routine, in case nd_pop_all_packet_info() didn't restore it.
>  Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2]
>  CVE: CVE-2024-2397
>  Signed-off-by: Ashish Sharma <asharma@mvista.com>
> -
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
>   print-ppp.c | 31 +++++++++++++++++--------------
>   print.c     |  8 ++++++--
>   2 files changed, 23 insertions(+), 16 deletions(-)
>  
>  diff --git a/print-ppp.c b/print-ppp.c
> -index 2cf06c363..9aed23eb9 100644
> +index aba243ddb6f2..e5ae0646ebae 100644
>  --- a/print-ppp.c
>  +++ b/print-ppp.c
> -@@ -37,6 +37,8 @@
> - 
> - #include "netdissect-stdinc.h"
> +@@ -42,6 +42,8 @@
> + #include <net/if_ppp.h>
> + #endif
>   
>  +#include <stdlib.h>
>  +
>   #include "netdissect.h"
>   #include "extract.h"
>   #include "addrtoname.h"
> -@@ -1358,7 +1360,6 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1363,7 +1365,6 @@ ppp_hdlc(netdissect_options *ndo,
>   	u_char *b, *t, c;
>   	const u_char *s;
>   	u_int i, proto;
> @@ -50,7 +51,7 @@ index 2cf06c363..9aed23eb9 100644
>   
>   	if (caplen == 0)
>   		return;
> -@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
>           if (length == 0)
>                   return;
>   
> @@ -65,7 +66,7 @@ index 2cf06c363..9aed23eb9 100644
>   
>   	/*
>   	 * Unescape all the data into a temporary, private, buffer.
> -@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
>   	}
>   
>   	/*
> @@ -87,7 +88,7 @@ index 2cf06c363..9aed23eb9 100644
>   	length = ND_BYTES_AVAILABLE_AFTER(b);
>   
>           /* now lets guess about the payload codepoint format */
> -@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
>           }
>   
>   cleanup:
> @@ -104,7 +105,7 @@ index 2cf06c363..9aed23eb9 100644
>   }
>   
>  diff --git a/print.c b/print.c
> -index b9ba5997d..f20633388 100644
> +index 9c0ab8622de1..33706b93228d 100644
>  --- a/print.c
>  +++ b/print.c
>  @@ -431,10 +431,14 @@ pretty_print_packet(netdissect_options *ndo, const struct pcap_pkthdr *h,
> @@ -124,3 +125,6 @@ index b9ba5997d..f20633388 100644
>   	if (ndo->ndo_Xflag) {
>   		/*
>   		 * Print the raw packet data in hex and ASCII.
> +-- 
> +2.34.1
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119010): https://lists.openembedded.org/g/openembedded-devel/message/119010
> Mute This Topic: https://lists.openembedded.org/mt/114793519/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


