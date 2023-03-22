Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D3CC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 11:20:23 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.40083.1679484021244717452
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 04:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UiMhfDeV;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id b19so414465oib.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679484020;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhR2tGJh0wn1qxjgaV1Qkvi11/Fc34wogVZ+/y3W/Ck=;
        b=UiMhfDeVkoToic+bZfLFS0rVbAdUMvTbeWMDtQYEdHKoZ8bgIE14RYMwv+eU+oo5lc
         eAJeWGHdBPK+nuqhxDkPtFYsGEK4AW1Bvju2+Kau1QNGVkdESx94mUAv6C9v89t4WDPC
         CAKZbI3mpaUA9SAOzj82SDhmpMHTEjSyK1HkR+oXE9AO4FY/eyQ31c+1D6Rd73coH1FJ
         GdYDlVQxO5EfSVln+JqgxHPhQOumAZwqHvwLHRLZRfPJnEpkgTAnvwLY/Z0hWRyGKTre
         9EmfnvajDeaiaZUcCx1r8ExearifQrb7BEC5Yr+wNjLYQMnUp3lKFd8wOK5Uz/FJO9ok
         jmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679484020;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhR2tGJh0wn1qxjgaV1Qkvi11/Fc34wogVZ+/y3W/Ck=;
        b=Z5q1IUyDZkrO8hhbUD6MEaFRTntfs6HGE6DP9EyzVKotxt3k4OhDoumkze8zwGRiAZ
         WrHT1nCRKa5638m+Z5Oj/Kimf/v/NylbESJc4NqL4ExUzCuXGQEsyx6qh15QIYCq7dHM
         ai+scV+b2w2Y+CQQIi8mKmRerz6cBj4WFczfU3VdBM3pd7NVAeKM0bEvDljyX3HKWh/V
         8LfxtIFL8PBrAGmvyRjVE/GOaeU/as8M8FnOAc2wQFnNME6L9D9Xbk7dpSjtTO1xHqsD
         QHW87t4CCznTF8spF6ShKaLK2z0EopYLuKlrxmUY+FCL+Afvzx/pszQkfbQQqkB+7k8D
         9LlA==
X-Gm-Message-State: AO0yUKUSa6gOt2NTnEK55AHtrKPJpoVElMpe9VLBwg1h4txM7oUonRUU
	SjQoWRSl0x2kpKzPiIfsLXZZLWAfa4jeQg==
X-Google-Smtp-Source: AK7set9pG1zGW8FJSlpGHdUAQJJgOciMTyOZCSKtKdmjl+Y+xFCRkYWivk0oPAAH24NCm9Ym9A2zHg==
X-Received: by 2002:a05:6808:2995:b0:384:80:1467 with SMTP id ex21-20020a056808299500b0038400801467mr911878oib.26.1679484020414;
        Wed, 22 Mar 2023 04:20:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3ea:5110:ed2a:eb0c? ([2600:1700:9190:ba10:3ea:5110:ed2a:eb0c])
        by smtp.gmail.com with ESMTPSA id bi13-20020a056808188d00b0037834b1a20bsm5830852oib.0.2023.03.22.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:20:20 -0700 (PDT)
Message-ID: <70dc120e-cb84-de8d-bf96-f57d8eecb938@gmail.com>
Date: Wed, 22 Mar 2023 07:20:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] redis: upgrade 7.0.9 -> 7.0.10
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230322082921.2464069-1-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230322082921.2464069-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 11:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101635



On 3/22/23 4:29 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
>
> (CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service

I am applying this to langdale then kirkstone

-armin
>
> Bug Fixes
> Large blocks of replica client output buffer may lead to PSYNC loops and unnecessary memory usage (#11666)
> Fix CLIENT REPLY OFF|SKIP to not silence push notifications (#11875)
> Trim excessive memory usage in stream nodes when exceeding stream-node-max-bytes (#11885)
> Fix module RM_Call commands failing with OOM when maxmemory is changed to zero (#11319)
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.10.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.10.bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.9.bb b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_7.0.9.bb
> rename to meta-oe/recipes-extended/redis/redis_7.0.10.bb
> index e4b2d45a4..5f972033f 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
> @@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>              file://GNU_SOURCE.patch \
>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>              "
> -SRC_URI[sha256sum] = "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
> +SRC_URI[sha256sum] = "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
>   
>   inherit autotools-brokensep update-rc.d systemd useradd
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101631): https://lists.openembedded.org/g/openembedded-devel/message/101631
> Mute This Topic: https://lists.openembedded.org/mt/97773847/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


