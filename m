Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA6C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 03:12:22 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.24549.1660705939175803349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 20:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DmqRAyJ0;
 spf=pass (domain: gmail.com, ip: 209.85.166.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id g18so6357520ilk.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=7RA/aq5qZIU/h7yC81NZcNyw7VTfemfCK/V1xKX3zVY=;
        b=DmqRAyJ0h0FD+eiPb5U8DmJWQBN0DesMb59oErqIuTT8Cb6OWCsQKohK/Cwpd0bfp2
         dhC29tunRa1aIw9ynyhRabwZxoLBWQ6wqgUEeId2eBo6nyAqMmX+Qxgc5Z/phauH+mMg
         tPzWy+SRu6dFGwUIOS160zqpgLCwdfG26fLKSMsyhTZIqHsY7lI2U01s58+hkRAiKaVT
         FgVnyh74ZvIyB+DMfyUH64XbtX95UHFXwmiEWA3m/nr4/DInjkkTgf5DKEXovgOk1L9M
         wKx38Kn0XolSqvZoUarnAd60uqh9xS8xsOt/OAF6iDb8WSuvDS996/+eovJ+e/1SnsCh
         5LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=7RA/aq5qZIU/h7yC81NZcNyw7VTfemfCK/V1xKX3zVY=;
        b=UE0L2c6X3otFpKeEt5ONlCbctAOHSURJvXhLI4jEo1P3eJGF4zZqm1DjgZCYWy6+ZB
         3WR4EZuE8namUnNAVp+sx1klC5Whd/VSnnnLJdQyQuFDIFw5yqcVnmm010M/6G3fx/56
         C2K3tktOG93RjyrBigztFG+3Uvzak6FfRuHwZEQwJdh0cvYZzA94LF5i2WFZR7FK8fLY
         gCRYZGb6RStMyzvzyn4HJvEwe+3z9RG0lHlqj37EgDNV66AMZpl/cf9fdBUtyNMsn+Rk
         KDaXk7Fx3J3WzX8c/o64V646OPVEEUt1JS4gsNgLuBujOjK0nNVGP/ulTS13hlsv595F
         rvdA==
X-Gm-Message-State: ACgBeo1PzYPzKfLeBv+Wo5XlAd39sX7sVtb9fqq/mnS/Mu1W6qZyIrVk
	asw9FcUsA61GOQXfnqmm6Hk=
X-Google-Smtp-Source: 
 AA6agR40vqCEGI+mAe8ZZzXLrI++8aZj4VIYU4dJBV6qjQb+wyhbcGBfDfcx8PHXv3hrPR7XN8QEqw==
X-Received: by 2002:a05:6e02:170b:b0:2e6:7ab0:648a with SMTP id
 u11-20020a056e02170b00b002e67ab0648amr2971263ill.140.1660705938342;
        Tue, 16 Aug 2022 20:12:18 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:2424:48b5:92f4:f3d2?
 ([2601:646:9200:a0f0:2424:48b5:92f4:f3d2])
        by smtp.gmail.com with ESMTPSA id
 u7-20020a02b1c7000000b003427281824csm5061044jah.128.2022.08.16.20.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 20:12:17 -0700 (PDT)
Message-ID: <d3dc6dc7-7288-59aa-c7c5-4c6190c1beb5@gmail.com>
Date: Tue, 16 Aug 2022 20:12:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0)
 Gecko/20100101 Thunderbird/104.0
Subject: Re: [PATCH] [oe] [meta-python] [PATCH] python3-asttokens: upgrade
 2.0.5 -> 2.0.7
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1660249019-20179-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
In-Reply-To: <1660249019-20179-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 03:12:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98286

please adjust your system clock before sending patches. They are again 
arriving in past dates.

On 8/11/22 1:16 PM, zhengruoqin wrote:
> Add dependence python3-six
> 
> Changelog:
> Fix astroid type checking import errors
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   ...ython3-asttokens_2.0.5.bb => python3-asttokens_2.0.7.bb} | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.5.bb => python3-asttokens_2.0.7.bb} (73%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
> index da49040d76..5e3ca9e30f 100644
> --- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.7.bb
> @@ -7,8 +7,12 @@ PYPI_PACKAGE = "asttokens"
>   
>   inherit pypi python_setuptools_build_meta
>   
> -SRC_URI[sha256sum] = "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7ccd0ee3ee35cf4d5"
> +SRC_URI[sha256sum] = "8444353e4e2a99661c8dfb85ec9c02eedded08f0006234bff7db44a06840acc2"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
> +RDEPENDS:${PN} += " \
> +	${PYTHON_PN}-six \
> +"
> +
>   BBCLASSEXTEND = "native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98272): https://lists.openembedded.org/g/openembedded-devel/message/98272
> Mute This Topic: https://lists.openembedded.org/mt/93073545/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

