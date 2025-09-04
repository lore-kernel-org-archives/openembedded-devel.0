Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6D9CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:44:30 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.2513.1757011464001832674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 11:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTr0IONH;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b02c719a117so254667666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757011462; x=1757616262; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hw4IRhDhyulHiJFR9iloo9frNR83vx7oNAS30pnX9h0=;
        b=iTr0IONHQVQIUqvpeag9L1OqtMe3Gk+4BJwFEZEdb16GNj3/FQqodA4+UwA0Vr1Myx
         f3H7BHTuqNZtzry0gcC9gSZxZAluusC9jfXycnzUkX0jkEQd/E/DocL5JyzjhlHIj3ui
         uEnGX7viSaffgYAs7b3oktvuHrs2ShnJq230gfPEJzyxr49nb8U/BYOgkIYv4RDRqFqr
         wSRyGkCZMDCRqOBsR0w8jgdU2LsCAjPS0i8f1PsfWt/TWNpgf+ixFFUi2O32wfMQeBZN
         0Wo06c0zBHvXbLluUcgJfEYREE+wGwGijf3LHxc0Dn9uJoBWHhOLxmJTa6ff6cf3cgJU
         GRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757011462; x=1757616262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw4IRhDhyulHiJFR9iloo9frNR83vx7oNAS30pnX9h0=;
        b=Eb1VQ10NcL05YA4BXvq7/tKkgBHw9UnJub+iZ0TdZaduRc77+HpQiRe3ak8+foaSW2
         RKeiamdmPbWzdPlyArI6hHmMozyOQCSj6xHqN91BEF1OGLvj+dn5MxbO1wAbqom5P9TB
         +iSr80MtbklCMW16XCkI/tVb11x05GLeD/TgFAH2Mpa96D13r6TldPlVDqxC/kxEF6gH
         GXUCdQmiPRhoO5MDdFza1eAR60X2gza2W6YxjPTaFjja4XsjGWuR8PS17ygOMx+AjeUX
         Vpmx07/A0nnZVfYqyWdzPo+bJCPWOlVYQnZCS5VS4w2OfHJAKTXTboYNqIopGxqfeq1V
         mTzA==
X-Forwarded-Encrypted: i=1; AJvYcCUCruJdklmItQCsqmE2XRO923FkkMbI1I2tyByvsBUGiXN+GlSVbQbT8MzMAEYOCHzIf3jC8O0OAT3Z0feMA1+t4SM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKSxr9rKHtuqPc6rggsSUspa4c4c+VEQUm6C5ztqQMumyCsG/u
	6D9TpEVok7LQMbYa9VTlCns9kEo5DXVCdnG+crYWPXPsUgGgaNGW4VDC
X-Gm-Gg: ASbGncsb7aXAz0haX7K2RfwJhroUQfF2m4EBWvntiXLwVm3oF/ItDpKbp/nOvSQdP7j
	NBOGKXuTfNDk2/DAFyF03tmJq2f6nj3v2T0RXkVZ9HwN6V44SWOzf8TCVKbnHuzyGSY8wvU4gbE
	L+jVahuB4xN6EsS8bgnyFt7Lmxwro/Bh3gj4jVMNe+t1sMMvObL/tishww8LIqtZ/9amgRyqcD9
	qhrM1kdFQv2hMaTFN2bLfNBqT7RVNMoEhXl98Moh24mwTNZw4M5Y+D5O4VBGVyPyMXMLueZ30KI
	SosyFI6rXFqjr7sLhcq2jzmEVN88kU1XQGgoHISC4vVzxg7Bgw9xTPdKUliTEqcvefoz9DLW4Q0
	RkNyJOFeuKipql4qrPvdCTvadYt1cbWz9i2LkU/97hg==
X-Google-Smtp-Source: AGHT+IEePRwD/QwWHkaUMriP8qJP5b2pbXiEKCraFJAKbcHOSGVdLDefNxevtvpAssBEKrKAfonojA==
X-Received: by 2002:a17:907:3d87:b0:b04:6e26:7351 with SMTP id a640c23a62f3a-b046e267adcmr733025366b.54.1757011462246;
        Thu, 04 Sep 2025 11:44:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04265165e0sm1124415466b.74.2025.09.04.11.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:44:21 -0700 (PDT)
Message-ID: <c7e46f0d-533b-4ccc-864a-7b156ef93b1e@gmail.com>
Date: Thu, 4 Sep 2025 20:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][PATCH] tcpdump: Remove patch fuzz from
 CVE-2024-2397
To: joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org
References: <129b72ccb76876396959d3024fbe9935f25aa2dc.1753993689.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <129b72ccb76876396959d3024fbe9935f25aa2dc.1753993689.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 18:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119292

Just a small note: this was a few days earlier submitted also by others:
https://lists.openembedded.org/g/openembedded-devel/message/118535

On 7/31/25 22:28, Jörg Sommer via lists.openembedded.org wrote:
> From: Jörg Sommer <joerg.sommer@navimatix.de>
>
> Applying patch CVE-2024-2397.patch
> patching file print-ppp.c
> Hunk #1 succeeded at 42 with fuzz 2 (offset 5 lines).
> Hunk #2 succeeded at 1365 (offset 5 lines).
> Hunk #3 succeeded at 1372 (offset 5 lines).
> Hunk #4 succeeded at 1397 (offset 5 lines).
> Hunk #5 succeeded at 1447 (offset 5 lines).
>
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../tcpdump/tcpdump/CVE-2024-2397.patch            | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> index 169ec6be70..142b059ea5 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
> @@ -33,16 +33,16 @@ diff --git a/print-ppp.c b/print-ppp.c
>  index 2cf06c363..9aed23eb9 100644
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
> @@ -50,7 +50,7 @@ index 2cf06c363..9aed23eb9 100644
>   
>   	if (caplen == 0)
>   		return;
> -@@ -1366,9 +1367,11 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1371,9 +1372,11 @@ ppp_hdlc(netdissect_options *ndo,
>           if (length == 0)
>                   return;
>   
> @@ -65,7 +65,7 @@ index 2cf06c363..9aed23eb9 100644
>   
>   	/*
>   	 * Unescape all the data into a temporary, private, buffer.
> -@@ -1389,13 +1392,15 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1394,13 +1397,15 @@ ppp_hdlc(netdissect_options *ndo,
>   	}
>   
>   	/*
> @@ -87,7 +87,7 @@ index 2cf06c363..9aed23eb9 100644
>   	length = ND_BYTES_AVAILABLE_AFTER(b);
>   
>           /* now lets guess about the payload codepoint format */
> -@@ -1437,13 +1442,11 @@ ppp_hdlc(netdissect_options *ndo,
> +@@ -1442,13 +1447,11 @@ ppp_hdlc(netdissect_options *ndo,
>           }
>   
>   cleanup:
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118818): https://lists.openembedded.org/g/openembedded-devel/message/118818
> Mute This Topic: https://lists.openembedded.org/mt/114473441/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


