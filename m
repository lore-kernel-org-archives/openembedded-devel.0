Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB00C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 11:23:33 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.39851.1679484204608316257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 04:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g+wixqX/;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id r5so22098156qtp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679484203;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ei/EKOhF7yt/M0ZQ5dq5EnNOyE5EjmBWF01jlGhr9uQ=;
        b=g+wixqX/zEwPEHs2Sby93j12btLgwrWze1E0IFgd3WiBMrW2Nh3OTAZq/DY3XNv+BG
         3B8S2KYCJXb0KGwnszgQofTjoXPdpJslrWY0tdgeK7ig6aIaVeAiICFvLoulpPCmjxpQ
         qjUHr/KwiawCXBKUr5G77AL6htTq3W8YCamMSqJlrTyXZ5tFhx3O/iJtS8g2n5Qfjzve
         8Ex8CsKfTf0+3ys1H5UEcSoSFp74+Gr2XskR3CXa8lS3fHivyekIqz04s/92FEHDbMPf
         zzwxXf2JI3a55OqIKK3rkYub3wfbSmnZPyj2sw7MpQNT7MO6DwWo4N1gXzwcdK7p/Bl1
         /CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679484203;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ei/EKOhF7yt/M0ZQ5dq5EnNOyE5EjmBWF01jlGhr9uQ=;
        b=MpWvNA4hhr49U0k2i9tw/eSN1FNLKeERzsQKtilZORLtHz1ENXOBh5gLUwJMHUeiM6
         AxqgbkQaqJfchP/0fN0gkCpRbhmxHUJjp0iPO5wYtSq4GAslvMrnZazp0ErIiz3abwT2
         Pkg9byibC/395aygSjkH8mfchKVYtWAnA6TbEcTOlIxMk1MAvn5PQLgkxVPaGMzpr7sn
         uWbBuBhEpZhVzhWEkVH+siatar+YXFFpQ9lpWLUToF4b1epSbcwEuT+8C4rJM92vcltJ
         33sxb76QF0sFkRnoU27FeC3vjtx7oUYOlneZ/Z3vOA5uqWvFUaB+R+z2iWvQFDqgA3Qs
         NQJQ==
X-Gm-Message-State: AO0yUKXSmnnu0LO+o7fzQ9mGf4LRu41zQT6PBzHGXd+1rq//EKxea1Dm
	x8YsHrdbrGzZq+4hwu4ICkM=
X-Google-Smtp-Source: AK7set/HyuLuM7DTGywUtlRidDfKvHY//qrCRplFT203VL9cmb7WnwTxUWmrdiQcM0aDYdchH8ertw==
X-Received: by 2002:a05:622a:199b:b0:3bf:ba1b:3615 with SMTP id u27-20020a05622a199b00b003bfba1b3615mr5187670qtc.55.1679484203626;
        Wed, 22 Mar 2023 04:23:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3ea:5110:ed2a:eb0c? ([2600:1700:9190:ba10:3ea:5110:ed2a:eb0c])
        by smtp.gmail.com with ESMTPSA id e1-20020ac84901000000b003d460ec242esm9934738qtq.81.2023.03.22.04.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:23:23 -0700 (PDT)
Message-ID: <ad2ad401-b01c-ad73-7a93-a699af8a9fd3@gmail.com>
Date: Wed, 22 Mar 2023 07:23:22 -0400
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
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 11:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101636



On 3/22/23 4:29 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
>
> (CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service

Was this sent to master?
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


