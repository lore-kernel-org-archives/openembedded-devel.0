Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBC8C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 10:57:22 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.28851.1683629837805702161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 03:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NKn3Rvb+;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55d2e87048cso84990827b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683629837; x=1686221837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=poRrxsuxG3V5O0VbHUlcM+JULZ6P50UPwkp37rjITVs=;
        b=NKn3Rvb+6jIbkU5Ukq3jUATqt59hMIrpTPcpUQbgrcWtcar2OQccnniM8E1mj8Lad/
         8/SU0HvcdhFgdL3XRPgY/MGkbonb+GGvT6it0gnTL6jX/JDd8+vsIBdn59B1GgKkuR95
         3VvJ4pWf8K9S4ywpWtrXo35Qzz+AoG1AJEtMbrR3phudmCY2JZMfbU4kre1TDoxHUr3o
         Dl7BIVDagIyeO1cfTPFfc9mLRvu1vjEE4YxIpd0h2W3nn6lmNz+aovsEIK4Dz+ktHJ5Q
         /ZRW42qQTFhKec2Q4v7sHmhQdG/CIdjMPeBC1kIk3qc5XGTxUakkLCNgjQzvEScGhkuL
         RNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683629837; x=1686221837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poRrxsuxG3V5O0VbHUlcM+JULZ6P50UPwkp37rjITVs=;
        b=BTnir87keL7HeBH/nzVBKHIjIHSDAZGV+zA1OW7gEHeXsTl/oImC1q1ZE8QFy1knpH
         /tBKv4srcl0/nphERFlzd8t/0r/hk7vDDRMO9BHoR8nxU19I//eoyrFpno1AzL3D0qcw
         hHbt9zYdbRPeSxTG+T9hiIpRKqB1Oto4JIj1hSl6xixkNjuno+JIIM/l9khcLNLbg4qa
         9rcLI1ZdTZRkSlJmKhV45rWgL00YeGz4cjFE/SJQZ9MZyEVa7Nh/mUr8jcZA1HjUTz/J
         WlWq9dR6VDFZ55f9uy1RwxkJRf7o2lYw+ZZLgRuaRSSwhUVXg0ng1e4N5KWXrX7P26+E
         r28Q==
X-Gm-Message-State: AC+VfDwg0ST+2BJpjgcuVYdk7ar8bBCSl47EERMajLXyALrHfP8QXNbB
	+1IfRXRY9Wqb9r1bgsccx8k=
X-Google-Smtp-Source: ACHHUZ5R+E474CA/1THrfZ+MMVtSF9ElH3W3l6iwKOiT3Sjn5o9gP5YbpGyEglAXfChTblC04pX4CQ==
X-Received: by 2002:a0d:db4b:0:b0:55a:8c02:c00b with SMTP id d72-20020a0ddb4b000000b0055a8c02c00bmr13588034ywe.25.1683629836866;
        Tue, 09 May 2023 03:57:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:183a:1604:2591:7a1e? ([2600:1700:9190:ba10:183a:1604:2591:7a1e])
        by smtp.gmail.com with ESMTPSA id f206-20020a816ad7000000b00559fb950d9fsm3204650ywc.45.2023.05.09.03.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:57:16 -0700 (PDT)
Message-ID: <4568531a-3825-7ad3-53e1-989f4c5211c7@gmail.com>
Date: Tue, 9 May 2023 06:57:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe] [kirkstone] [PATCH 1/1] lmdb: Don't inherit base
Content-Language: en-US
To: Ming Liu <liu.ming50@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20230509074509.7362-1-liu.ming50@gmail.com>
 <20230509074509.7362-3-liu.ming50@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230509074509.7362-3-liu.ming50@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102499



On 5/9/23 3:45 AM, Ming Liu wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> base is always inherited so remove this code which will soon cause an error.

This is already in kirkstone:
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs/lmdb?h=kirkstone&id=c5b5f631fc485e91f67827c536c06215a803d7cc

Was this meant for another branch?

-armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> index f23960f40..a76d388d7 100644
> --- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
>   
>   SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
>   
> -inherit base ptest
> +inherit ptest
>   
>   S = "${WORKDIR}/git/libraries/liblmdb"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102487): https://lists.openembedded.org/g/openembedded-devel/message/102487
> Mute This Topic: https://lists.openembedded.org/mt/98779065/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


