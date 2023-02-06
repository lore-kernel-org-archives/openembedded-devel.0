Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910E1C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 17:19:25 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.59638.1675703955620505393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 09:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awWMfq3d;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-16a291b16bfso6395540fac.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtDTESRa87R57/1/xpoYvRcaNLuTv+JB9dcwxr7VRyY=;
        b=awWMfq3dTltxhdYI7z8hNFsUNCV1AiFpFQ4RBnAbo3G6zbfw5Dy4g+BdEnP/R+P9XI
         Hg2DvJNKB5/v2FOHR0oi0unu4qEJl/NgSaKIRhnD8fkp36Bn55nyLRLLtu8sbPh1g8Pz
         FbVUXvPED6xwMsiGie6omMDKKCc01XVHzvm95/3vjRmfSDAXn+6RJaWKuuKYAeUtA7XL
         bDlIbMM+DAL/g+E5HL9/afjmZvUBUN48JWeFYs2TcoUfWUpQTe2MQ5IwcylWBBQQQ8MT
         2Y8V6PClac4OcKLfE08T7sTrIZbu8Xen2qo1xKBEvPl3ToVyNewIOKkxdkjEv48SQJ42
         SCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtDTESRa87R57/1/xpoYvRcaNLuTv+JB9dcwxr7VRyY=;
        b=eZ8OuHZfU8ayLEvh++8i0y9etUmqPx+VrNprPoaUII0rPFlnRTYoZcbTyKO801wmtE
         3L36XLpW0yhiep+GeI6zbjKIWbNOXUaBBUvvmAqiYidmYd4XXFL4yZm1yT8AHlYWFe+b
         0astvzfEC9deHTH58wsd1JRB1pjHp6SpYcj0w6Gw3e5D2qN4FGoyYRfa1vGJpMe1jTqZ
         TURJlEnLg+SpQQy13lOnMz1Ptlp9UkekEOjIbP3++LWQeif1oay+vUTguFZBy5H/fXAc
         tFFCd8GbKHCkt6YmVZx8/AvSadCPD2g+XXQyxDLEQUsg7zgSE1GtwoOJzuMMBVGrOczP
         8WZg==
X-Gm-Message-State: AO0yUKVGIieMBNvcOqiyLOWlkyA4fLSwuzwm/f9WArRIcbvAGyP8ilKz
	7Aig/kCDJIEYoW/74KJDin5lPmhMBKU=
X-Google-Smtp-Source: AK7set/NJ5LqFZ+7JPurzYsdLYRZNcH7yqf02ZNjggihi4iBV2OlV0gGFmr1m92FsIKg/s8X32ZBYA==
X-Received: by 2002:a05:6870:3923:b0:16a:689:b1a1 with SMTP id b35-20020a056870392300b0016a0689b1a1mr6772193oap.20.1675703954922;
        Mon, 06 Feb 2023 09:19:14 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:5da2:e19c:7aa7:41ee? ([2600:1700:9190:ba10:5da2:e19c:7aa7:41ee])
        by smtp.gmail.com with ESMTPSA id p3-20020a05687037c300b00150835847c2sm950018oai.16.2023.02.06.09.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 09:19:14 -0800 (PST)
Message-ID: <097ee929-7d48-c925-60bc-a1147510e811@gmail.com>
Date: Mon, 6 Feb 2023 12:19:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 6/6] python3-pillow: Add
 distutils, unixadmin for ptest
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-6-Randy.MacLeod@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230131230851.2785067-6-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 17:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100944

Randy,

On 1/31/23 6:08 PM, Randy MacLeod wrote:
> ptest results:
>     ====== 3600 passed, 324 skipped, 2 xfailed, 1 xpassed in 74.41s (0:01:14) ======
> for qemux86-64 with 2 GB RAM which is the same as seen on master.

Did I miss the patch for master?

-armin
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> index 68c81029c..5a466778c 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> @@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest += " \
>       jpeg-tools \
>       libwebp \
>       ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-distutils \
>       ${PYTHON_PN}-image \
>       ${PYTHON_PN}-mmap \
>       ${PYTHON_PN}-pytest \
>       ${PYTHON_PN}-pytest-timeout \
>       ${PYTHON_PN}-resource \
> +    ${PYTHON_PN}-unixadmin\
>       tk \
>   "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100895): https://lists.openembedded.org/g/openembedded-devel/message/100895
> Mute This Topic: https://lists.openembedded.org/mt/96664650/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


