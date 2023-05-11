Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA32C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 17:36:57 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.2884.1683826614691898952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 10:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nlVyB0qX;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so42573013276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683826614; x=1686418614;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eVTkTyjP2Nfb4vdXBg+NEwJWbYcUAlymfPT4Os/fkI=;
        b=nlVyB0qXTNjTpzOIqlTesvmRDWdeulGjQIYhXP/ArZHhsm2fv900ltR6wbu5DTQZOz
         quM9PzhMhj5xUg2cctQcmgnpZbSAHFGRX90BuZWp0nzVRa3XDMZ8kfePjWJvHgLGnMwI
         a2g2uWuhq3uz9X2z72qILFM+QWKbYqFYoFrmrGaBT43fkstLK7cWkMKMMeMcEmFeUhPS
         aOIF77JnV5+UiVpKekx1lOqbIvGpaXD0SI3fkTNY9ZOJsiwCVdNWMWa3rdYYOF+ig4QO
         UFKknxu6krp3v3jqg1LYYCnfsir99rZcN/m/adFrxkLFiwxz5snBmVuQC/w7SFdhZYB9
         UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683826614; x=1686418614;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eVTkTyjP2Nfb4vdXBg+NEwJWbYcUAlymfPT4Os/fkI=;
        b=Mix89m2vXbqzSuqMDzrfS2NgqSaRLZO8HNjqoFwbtzajgGydUP/GakPSPn9r0wBTYC
         DDBOT82ojwkXi4Emq9g7t6q7A4ErMjOEcmfq/RjyroHdzad+7ZmKZ6ezLDGyEi3M5/YJ
         WysIHTEwF5LJXhX4p+vS30ZzigMJ70DgOagm3Q8GSyGK5q8LLF0CVBcbIoyihgfnvoyl
         cLnnKPuOt+pHOp5cBScQP8pEFbdWkG2kyvIPOV1/aay2gLfVtEbIbhVLGqEGkr5bo7b3
         0gJF9n9ocHguZqSlm+VOIXhd/vJciSqjizOltuozoWiKmTto6eG9oUeVoiwOU3FAwmNr
         Tlcg==
X-Gm-Message-State: AC+VfDxatn+nnRl9U8JkOKuJh7hciK3m7lMvMiDR6Vco65hjSCabpsLi
	G74xcxcjmnKcIvRkuauo94o=
X-Google-Smtp-Source: ACHHUZ4rrXLsP1RvifJK3cUkWKj4NsBk4R+VYGpnFd8LPKDfvZ8cp+W6CWaOKqGnJxI8GR3jtDOe8g==
X-Received: by 2002:a0d:dfcf:0:b0:55a:416d:5202 with SMTP id i198-20020a0ddfcf000000b0055a416d5202mr18733208ywe.26.1683826613724;
        Thu, 11 May 2023 10:36:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:f345:2295:bbfb:ef27? ([2600:1700:9190:ba10:f345:2295:bbfb:ef27])
        by smtp.gmail.com with ESMTPSA id i64-20020a0ddf43000000b0054662f7b42dsm4992012ywe.63.2023.05.11.10.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 10:36:53 -0700 (PDT)
Message-ID: <3302978f-fc4e-5d1c-8a82-4a9d40e78a43@gmail.com>
Date: Thu, 11 May 2023 13:36:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH 2/2] nss: backport fix for native
 build failure due to dangling pointer with gcc13
Content-Language: en-US
To: Jack Mitchell <ml@embed.me.uk>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20230510090648.2762735-1-ml@embed.me.uk>
 <20230510090648.2762735-2-ml@embed.me.uk>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230510090648.2762735-2-ml@embed.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 17:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102551



On 5/10/23 5:06 AM, Jack Mitchell wrote:
> Upstream-Status: Backport
> Link: https://github.com/nss-dev/nss/commit/cbf5a2bce75ca2c2fd3e247796b9892f5298584e
>
> Signed-off-by: Jack Mitchell <ml@embed.me.uk>

What is the difference between the patch #1 and #2, they look the same 
to me.
> ---
>   ...ecperf-fix-dangling-pointer-warning-.patch | 75 +++++++++++++++++++
>   meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch
>
> diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch
> new file mode 100644
> index 000000000..dc7e172aa
> --- /dev/null
> +++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch
> @@ -0,0 +1,75 @@
> +From cbf5a2bce75ca2c2fd3e247796b9892f5298584e Mon Sep 17 00:00:00 2001
> +From: "John M. Schanck" <jschanck@mozilla.com>
> +Date: Thu, 13 Apr 2023 17:43:46 +0000
> +Subject: [PATCH] Bug 1826650 - cmd/ecperf: fix dangling pointer warning on gcc
> + 13. r=djackson
> +
> +Differential Revision: https://phabricator.services.mozilla.com/D174822

This patch should contain:

Upstream-Status: Backport
Link: https://github.com/nss-dev/nss/commit/cbf5a2bce75ca2c2fd3e247796b9892f5298584e

and your sign-off-by.
> +
> +--HG--
> +extra : moz-landing-system : lando
> +---
> + cmd/ecperf/ecperf.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/cmd/ecperf/ecperf.c b/cmd/ecperf/ecperf.c
> +index 705d68f35..a07004d8e 100644
> +--- a/cmd/ecperf/ecperf.c
> ++++ b/cmd/ecperf/ecperf.c
> +@@ -53,6 +53,7 @@ PKCS11Thread(void *data)
> +     SECItem sig;
> +     CK_SESSION_HANDLE session;
> +     CK_RV crv;
> ++    void *tmp = NULL;
> +
> +     threadData->status = SECSuccess;
> +     threadData->count = 0;
> +@@ -68,6 +69,7 @@ PKCS11Thread(void *data)
> +     if (threadData->isSign) {
> +         sig.data = sigData;
> +         sig.len = sizeof(sigData);
> ++        tmp = threadData->p2;
> +         threadData->p2 = (void *)&sig;
> +     }
> +
> +@@ -79,6 +81,10 @@ PKCS11Thread(void *data)
> +         }
> +         threadData->count++;
> +     }
> ++
> ++    if (threadData->isSign) {
> ++        threadData->p2 = tmp;
> ++    }
> +     return;
> + }
> +
> +@@ -89,6 +95,7 @@ genericThread(void *data)
> +     int iters = threadData->iters;
> +     unsigned char sigData[256];
> +     SECItem sig;
> ++    void *tmp = NULL;
> +
> +     threadData->status = SECSuccess;
> +     threadData->count = 0;
> +@@ -96,6 +103,7 @@ genericThread(void *data)
> +     if (threadData->isSign) {
> +         sig.data = sigData;
> +         sig.len = sizeof(sigData);
> ++        tmp = threadData->p2;
> +         threadData->p2 = (void *)&sig;
> +     }
> +
> +@@ -107,6 +115,10 @@ genericThread(void *data)
> +         }
> +         threadData->count++;
> +     }
> ++
> ++    if (threadData->isSign) {
> ++        threadData->p2 = tmp;
> ++    }
> +     return;
> + }
> +
> +--
> +2.40.1
> +
> diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> index 721b38ddb..af842ee67 100644
> --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> @@ -44,6 +44,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>              file://CVE-2022-22747.patch \
>              file://CVE-2023-0767.patch \
>              file://0001-Bug-1812671-build-failure-while-implicitly-casting-S.patch;patchdir=nss \
> +           file://0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch;patchdir=nss \
>              "
>   
>   SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102528): https://lists.openembedded.org/g/openembedded-devel/message/102528
> Mute This Topic: https://lists.openembedded.org/mt/98802000/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


