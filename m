Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E459BC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:37:37 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.10333.1634387857285489655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XMXvVYc4;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id t16so11245437qto.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BRP6k8hbzW83hrV6cXz2iAjNsC1dC403nb+W/j+QGAM=;
        b=XMXvVYc4osQbxnR4c2s+SC5d/KGXsoGGrhi4I0Qglj8ruzDWZQqWXcMQYFLVCfIsav
         dcZEDH289/sxVdmy8gMqE2sD7zM0pOWH9sOCqilEay+JSX/51aPyp5YBzfZ0eH6Lza9T
         Wn4h0P9L5WWlTgJWa/s8Ej2xTFNDqDLmnVkZvTz0cjiqyvK2MSgmNqylpPT64qUYr6eU
         AL0n44+5QRoHI9eLPwowu4fK06Ml2rUf4N2/aqSGmtQwIZd2z2+hsAu3KHM04aUuoFoD
         kBYJxJgMuAetQHXryMCXuKlFX/1sQbyXDVGQOyNbUFmFnfeVaEL1aIP5YOYqMvCn87s2
         d5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRP6k8hbzW83hrV6cXz2iAjNsC1dC403nb+W/j+QGAM=;
        b=59wMOuvm+1BxZ0Kr6C6uJ+2NrMRn97kOQf9vsQfZdXODoPyqcBvdhbJE6I0pehW7Vf
         eb3G5azkGWCcZrCbYIXSQOVdfq6hBsmlMob+alhu9RePgnvnlzeMs2HnoEpALI7Mjj5B
         6op5FRDmFB40Wz4Yh/I6EhcyQYgChhvDyZX505XWqTjfLKmcyNjYbMcFnbAy//7EJvuj
         WKqFO7RFGzAmD+fJE9JCKZ9h0x6TS7OD81+zQ0sT1d4zNmNPjq/Nhh/v0FxMOKdLPZCm
         H8bqsUPT1UNbEAjmOQjfkX3iEeLQyko90gL5ki+rL9oY0B0OFasTpIzEAQr+bOdiyfxU
         rMiA==
X-Gm-Message-State: AOAM530vdADHxJUz1MzZhXGMMRapUysLSkohAMjtD+WWejP+Yzwcs8DP
	/6dYyPMFXcBia+6Wx2bcLsaN3aoPlwm8qC4v9Q21TsyBR1SuMw==
X-Google-Smtp-Source: 
 ABdhPJw2vDdoC3T81FaI7eWNr64vN69dcHRqk6hpO3ZwijMLZ55kH03ckyXU48D4rEZAJso7/3nqHd9FWqxZwYBDYdM=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr19896963qtk.227.1634387856441;
 Sat, 16 Oct 2021 05:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211015225609.4162418-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211015225609.4162418-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 05:37:10 -0700
Message-ID: 
 <CAMKF1sru31ebKboZX0FfbAj36GF2A1+sqK9nPz9skYfGKfMTVA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyroute2: update to 0.6.5
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:37:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93400

fails to build ptest see

https://errors.yoctoproject.org/Errors/Details/612589/

On Fri, Oct 15, 2021 at 3:56 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> index a85b0929d..83cf8b41b 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
>
> -SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
> +SRC_URI[sha256sum] = "d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c"
>
>  inherit setuptools3 pypi ptest
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93350): https://lists.openembedded.org/g/openembedded-devel/message/93350
> Mute This Topic: https://lists.openembedded.org/mt/86361664/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

