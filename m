Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C247EC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:04:29 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.378.1646845468930388437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOnfRVGO;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id v189so2268532qkd.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EH5Nk9YTZAQ4efcX47gktvISFu59JwInQPutiIrHIp8=;
        b=VOnfRVGOuL5MMouF47kwoKYztnPCaG+K5zypdw03c9PxQYPKaU73OJP09xkycLb+06
         tNR/BfhLSf2W9ord/facFnnK6j/XGLbhUL3cimLXGGznc+rCdaq+xMOxzDTFTuzXV//l
         lZZso930rIN/zg/YH0VsaDF9nfxlSuHIbkyCNOQKCQbIftj/gBIn+K2ed1NuZeU8Qduu
         TBZkdSmdtxOafUqJopYCr7f+KR8GgMusdc5njC3BIkkNYbLcfH8usTqay2hyPOx7GPHR
         FFMZh44mgqO15pPRPUs6x7yJVNUAesJeIcEkfRSqgjpVMsl7xyttNULVIvmEpp5eosSi
         pT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EH5Nk9YTZAQ4efcX47gktvISFu59JwInQPutiIrHIp8=;
        b=hbDkfSF2WX8vkQzFby5JPaejnpPWh7t73nlo0Zvgjk+3XIFAdIQCDLmpj6fYJIpe5v
         sX+JQ9zv6ceT5whrE68XpYaAKWXzxFin3DsN3uQNDjQbSrxKmp+tb4iG2grSoOmLb30q
         S4WsfW8YwRRcP/KQwhZnl52PYwQXuQH6QMFChUrqGHUiBciibpi0Z0BrTxPahmOpyBSb
         EOV/x1BlWJ72N6tP6EROS5clRTaPfeCu/iODCrrY0FYABotP4MKKF7a0Qpd5fZgkGiFw
         m/YNVb6YxJnAj1sfV5DM+ZW9GNFL/TYNdeUuhh9I7PmCIs1p6qoB6wYD48cyk4tupCOZ
         3sdQ==
X-Gm-Message-State: AOAM532/n2UhFwj44SCTzwmwJ4CTEgOlNb2N0VlM67pLDDKDRVLoo3+s
	p4QP7+vg/CZWAIpAfrJBzvzk1nW6JVy3HmFuT8Y=
X-Google-Smtp-Source: 
 ABdhPJwqlxutr6ql3NVU92k78uADB5UNzrrDjjrbEGhTjOzn3t3JOrxvUXuDoZVXIzeaj4Ef3UkMqqCtzsVjra914k8=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr430508qko.72.1646845467915; Wed, 09 Mar
 2022 09:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20220309165840.267657-1-clemens.terasa@garz-fricke.com>
In-Reply-To: <20220309165840.267657-1-clemens.terasa@garz-fricke.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 09:04:02 -0800
Message-ID: 
 <CAMKF1srriviyq9VC7WCjwXha-t8=PGiq9vSqTHX2N4sNi50Xfg@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-fasteners: Revert new
 override syntax
To: clemens.terasa@garz-fricke.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 17:04:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95909

On Wed, Mar 9, 2022 at 8:58 AM Clemens Terasa via
lists.openembedded.org
<clemens.terasa=garz-fricke.com@lists.openembedded.org> wrote:
>
> Commit 7889158dcd187546fc5e99fd81d0779cad3e8d17 introduces a regression,
> breaking a dunfell build. It adds a variable override of RDEPENDS with
> the new colon based syntax, that was introduced with honister but is
> incompatible with dunfell.
>
> Fix this by using the plain old underscore syntax.
>
> Signed-off-by: Clemens Terasa <clemens.terasa@garz-fricke.com>
> ---
>  meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> index 1ba2c6f20..7ebaa4590 100644
> --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
>
>  inherit pypi setuptools3
>
> -RDEPENDS:${PN} += "\
> +RDEPENDS_${PN} += "\

perhaps you can try with latest dunfell release of bitbake and see if
you still see the issue.

>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-fcntl \
>  "
> --
> 2.25.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95908): https://lists.openembedded.org/g/openembedded-devel/message/95908
> Mute This Topic: https://lists.openembedded.org/mt/89666632/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

