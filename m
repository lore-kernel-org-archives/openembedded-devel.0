Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D4BC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 13:18:02 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.22867.1675257478124276593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 05:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMkh4+Dw;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1685cf2003aso3093198fac.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MX2fO2hf2qP0fRGZIS64BnajPgETR5YwRuZZ/Z+vMmk=;
        b=aMkh4+DwBWJucZZ3Ru8qBT3BNPeUZ0qJu47Bm+dX1+PZ8Q6KcSomgPj4uopIY8DmWE
         Lkhet5X/8VQ4MzJORo7/hN58V5Aii9DfMHctmMDtZFgsVCSVRBGL6mZRpZLUQWXkZ131
         7TEBE+ERijBlHkSdK41H3rSNze0j35lL8j6DS4R5PZJvK9nBDeamg0PjvSeHdvZAFvel
         ZDmVc0mGTNyEG64m7FH3JEatBcgVfGUPywP9IYYTa9j6ZlFGcT91IVgkAJN6mbirkByI
         uIBeS38RLiqk3s8jVwgOSg7On15NEcObRisKkstnNfcgdfoaDRwMoN+VxBJSVi7+jYv3
         g6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MX2fO2hf2qP0fRGZIS64BnajPgETR5YwRuZZ/Z+vMmk=;
        b=vm8FwiXB2l1NRy2npPp2U7IvzGAU1ERECfsT8RL7Em0cbAY+xumSiaJlpM95b3dO9s
         3ANbcZJX3cE619ltRjmvfLPW+q5aV/0kxpeW419KRRfFprcLBJlRIUzfkYjvEXcWByK4
         Ez5o0vXF8ko4kxkFb/rpdk+BLNXKG5+BJJFetegF+OiSIlKagmk2Lk+Uhg1GsiS08o1w
         VYYgw5kFb5m71bl70Qu0GBMlHdnPhyVKMhx5+I6IS175VaZBdvpyAIjLM7Ud4wsExKT0
         7qdGqYCd0JJU6YTG2/3Gia83JJTBfP4w3KC53UdAfHFcO1MiPqJ3ilkXkD2kismmABF8
         w/vg==
X-Gm-Message-State: AO0yUKV53JK8d2gj5eskswRpsSypGmmtV8A08py13khOAHb1GXv3afuX
	3lSES8iQGeKmXdj6Kbe+NSPpOnL+Kpc=
X-Google-Smtp-Source: AK7set+V/3UUVBXFswzjLSKMLma/u7lxp3oy1dguKrWMV+PiNfSVSRXjtSN186MIMQSwOzI0O3+PuA==
X-Received: by 2002:a05:6870:c69f:b0:163:a45a:9fe1 with SMTP id cv31-20020a056870c69f00b00163a45a9fe1mr923424oab.2.1675257477139;
        Wed, 01 Feb 2023 05:17:57 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:47a4:b49a:4424:1351? ([2600:1700:9190:ba10:47a4:b49a:4424:1351])
        by smtp.gmail.com with ESMTPSA id y1-20020a4ae701000000b004c60069d1fbsm7341877oou.11.2023.02.01.05.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:17:56 -0800 (PST)
Message-ID: <5a57dd8f-0069-28ef-f524-70f08e87627d@gmail.com>
Date: Wed, 1 Feb 2023 08:17:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/6] python3-pillow: upgrade
 9.0.1 -> 9.1.1
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 13:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100903

Randy,


On 1/31/23 6:08 PM, Randy MacLeod wrote:
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb}    | 6 +++---

Why would I want to take this? Is this an LTS or bug fix only?

Also, you didn't signoff this backport.

- armin
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
> index fb86322f7..00df22a3d 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
> @@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.0.x;protocol=https \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.1.x;protocol=https \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
> -"
> +           "
>   SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
>   
>   inherit setuptools3
> @@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
>   
>   BBCLASSEXTEND = "native"
>   
> -SRCREV = "6deac9e3a23caffbfdd75c00d3f0a1cd36cdbd5d"
> +SRCREV = "0f44136e720cd3b2db72bdf29614897b7aa3e868"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100890): https://lists.openembedded.org/g/openembedded-devel/message/100890
> Mute This Topic: https://lists.openembedded.org/mt/96664645/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


