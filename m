Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249C8C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 05:57:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.7593.1634363868255987042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 22:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WZfSI78W;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id v20so7703238plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 22:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=IEsxJReSpe5Tt+0aSPxNhojbQGpCvVGi8usx5YsVPMY=;
        b=WZfSI78Wdo7C8wFZQtUM3H4Huizuv0bGj2kz8CtEg85wLmQ1gfAk2Nj7mGWIus2CHb
         p0jxtSz3BFWOKyPOGH/I7iUbmrb4Il2Uy3c7xWqk4P+lUa5wUXJrbCki+qlYB4kEpxV2
         RmGlqTUkUYqJY8o9hT4IAmtw1oNG2vviYFV1HxIEaWVJK5/y37f9K0Uk8n/fwnogctz0
         z2DMJycBMo3auJMMPSAWC9TfCovFK0eNZaIp1P90BaG69SnmDCj/Y+k5F6A+H3jHGEKg
         nush6aQveseY5g7NuaZkukF3LuC4QmvA725Vg5yCLlbkVp/0CklY5Dg2RB+HM3gshMX3
         v+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=IEsxJReSpe5Tt+0aSPxNhojbQGpCvVGi8usx5YsVPMY=;
        b=AdbTITnNY+aJ6w/dnFXqGymdm1yZvuxURS/Mnh/CuS5V7bauT5wVnH6coqM12DTQwT
         aJneWYbfTqArT3Hg6Z6EL+gS4/6GF/WHLVZV7g+PPsUCwjMk6LuXQTEqVO9lJkSnnxaf
         VMRMs5DnILb/SS2q9z5proQky/ZamCRIkDfwY1HVeWboxOk/7uZFfmsXNYNJYez/0apT
         ro1TXBufsrNWv9MLWzQUydRGEKXTAiAuLv4vDQmoGLZotWw1EPIUpa/lAXjZ5aAiZfBw
         CrtVFPcZRapOH+ZoITFMq3McwBuCEUnS3hKPwrdoHzzYgMBM6G9i60tDp03QQGDBOm+5
         RLPg==
X-Gm-Message-State: AOAM530S3GG9SLNu9w/Qb3iNC8JdiYbjuXOPI1yjuZ+eN3rKmGJlpl14
	n6Dut6/YPd6Xdc7yhvjZFPQ=
X-Google-Smtp-Source: 
 ABdhPJxsPS+gExSWKtGfofXRbwzUmwvTK33IROq6/t5KYoC8MdWvnqYomwpN0yJqpnWf9vZN+CG1lA==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr32441358pjp.191.1634363867721;
        Fri, 15 Oct 2021 22:57:47 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:6555:f795:63a:89c6?
 ([2601:646:9200:a0f0:6555:f795:63a:89c6])
        by smtp.gmail.com with ESMTPSA id
 q1sm2765311pgt.90.2021.10.15.22.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 22:57:47 -0700 (PDT)
Message-ID: <54493620-b855-14c5-efb2-d60584896540@gmail.com>
Date: Fri, 15 Oct 2021 22:57:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [meta-python][PATCH] python3-humanize: update to 3.12.0
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20211015225708.4163616-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211015225708.4163616-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 05:57:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93389

this is already at 3.12.0

On 10/15/21 3:57 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb} (82%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
> index aacda65ca..1aecc5a96 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
> @@ -5,7 +5,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[sha256sum] = "4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f"
> +SRC_URI[sha256sum] = "5ec1a66e230a3e31fb3f184aab9436ea13d4e37c168e0ffc345ae5bb57e58be6"
>   
>   inherit pypi setuptools3
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93367): https://lists.openembedded.org/g/openembedded-devel/message/93367
> Mute This Topic: https://lists.openembedded.org/mt/86361694/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

