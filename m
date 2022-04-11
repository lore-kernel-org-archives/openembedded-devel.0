Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFC8C63708
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.30720.1649692330989768945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QDOHfy2R;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s137so11826120pgs.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=K1wNOFRP9ksS2pRkb2uk06YjGqO1m1P/r3JrbrpUXF8=;
        b=QDOHfy2RI5pZopayVsOm+uhbUBqKXi3I2+yItwOwi0jSrEw+6gqV9CXGenTHxb9VNT
         00jAyAqpDzQ4IEdFZfcXEYSN76lyjr5Sj2UHoeW3kVhRTcAoGcZ8Q8eLpPvuoKvv5IzI
         r2/euKE8Wlh41oQQms4E+z2s1oJcR8BX8LRJcv1OQdHsJY87NfvOueUV0xGzcHd0ThQI
         H9XtRF0ZSruQG1Zomo44lrdqJiz/lPZkdfoqBR0nU4ClyBiSOtWIyVxiNKeekUIHCbqs
         BXvgFFqGlGOCUl1GXBy0Iv+cz8uhCMXrrDyJYWwn68jjhsfbeiwGZema7/ijSJ4J2SLw
         GuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=K1wNOFRP9ksS2pRkb2uk06YjGqO1m1P/r3JrbrpUXF8=;
        b=wOZjeduuzP2YRpCOI7uWZL5w+AFRTa8aGbvEudinh3si1o0DGMTQGCcoTELSADMnpy
         WJn3zV1LusNXNawTV8EhDCxRWrdYYLg0cb+M3VuychUeTElv5HoHQE/KfOERKOwVPdGS
         uVrVxGVoIBKuHu5M4RnbmyRivs8T2o8BNYmmq49blCR8CIP9UZCyhkLT6acRWDTr5sPV
         gcvzmSqGoowyQ7EfeI+IbFefGTJKIRuws+JQyo+i6a8i/0jwWxejz9dGdN7Zj7SLf9k3
         azRlVc9nkBPf6kzwtIXWZuNawFi62quycenvPmN3D91quJx89rBiRJ2Ia4YWZ/p7XXoW
         QyHQ==
X-Gm-Message-State: AOAM533Qo4xQNMXKSn60OaDJFpkWE+PwIe1goQlvyKfG4vU8whjig0Gw
	MDuJExpeHG+5jCFP2Wy/5So=
X-Google-Smtp-Source: 
 ABdhPJwYHcutl0IkvcAnspi9OI+b5JI5SLG5o60EySHtCYrk72n2559LkcEQ/fKCiB/XEKq8DN/SVw==
X-Received: by 2002:a63:b542:0:b0:399:40fd:3ac3 with SMTP id
 u2-20020a63b542000000b0039940fd3ac3mr26665848pgo.564.1649692329963;
        Mon, 11 Apr 2022 08:52:09 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:317a:73f1:795b:d96a?
 ([2601:646:9200:a0f0:317a:73f1:795b:d96a])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a056a000d4800b005059b08a2ecsm8404410pfv.139.2022.04.11.08.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 08:52:09 -0700 (PDT)
Message-ID: <7080173b-b85f-b0d0-237e-54e7e37cd30f@gmail.com>
Date: Mon, 11 Apr 2022 08:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
 <1649423791-29819-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1649423791-29819-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96552



On 4/8/22 6:16 AM, wangmy wrote:
> All changes from 20211224 to 20220128 included in
> https://invisible-island.net/byacc/CHANGES.html
> 
> License-Update:
> ----------------
> - Add Format, Upstream-Name, Upstream-Contact to byacc.
> - Add "Copyright:  2001-2021,2022 by Thomas E. Dickey" to all files of
>    byacc.
> - Copyright of aclocal.m4 and package/debian/* updated to 2022.
> - Modify Licence to License.
> - Add "Copyright: 1992-2021 Free Software Foundation, Inc." and "License: GPL-3"
>    to config.guess config.sub

Is the overall license still 'PD' after all these changes? Can you check

> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../byacc/{byacc_20211224.bb => byacc_20220128.bb}            | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-extended/byacc/{byacc_20211224.bb => byacc_20220128.bb} (65%)
> 
> diff --git a/meta-oe/recipes-extended/byacc/byacc_20211224.bb b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
> similarity index 65%
> rename from meta-oe/recipes-extended/byacc/byacc_20211224.bb
> rename to meta-oe/recipes-extended/byacc/byacc_20220128.bb
> index 85e5072716..8aa8767d37 100644
> --- a/meta-oe/recipes-extended/byacc/byacc_20211224.bb
> +++ b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
> @@ -4,7 +4,7 @@
>   # Setting to PD as this is what the upstream has it as.
>   
>   LICENSE = "PD"
> -LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=e13dd32663e3159031608d536530a080"
> +LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=62c37a10a2faf90235ee64280ad72737"
>   require byacc.inc
>   
> -SRC_URI[sha256sum] = "7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8"
> +SRC_URI[sha256sum] = "42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96544): https://lists.openembedded.org/g/openembedded-devel/message/96544
> Mute This Topic: https://lists.openembedded.org/mt/90389513/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

