Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09283C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:57:18 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.50679.1674665834683923600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 08:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YIlCjRJu;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-15f64f2791dso22074316fac.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwKOTeesXXNVdqx4WBchH4Ot6in1mt6m0S1Knv1k2ow=;
        b=YIlCjRJuSrKJl6Bo3Ok9N0omx7Ne4TZgv69/Ku1H1mnuUEoUSFcHUfNLUnMxZiCheU
         hcydH0tzXZ4PstFfQmLHF3v/DAvJH/aJF+KXMFbDl3Q70RA2R3Poi+18ga+PdcvFUDho
         7/sbglH2Y8EBfAGsNlirSuL3lM3+w5ehsqDU4b9dlZUmfGHS8r9Cd78Vo/FZHTmNGWSH
         7qtBqlwF8nyp99/vQv1BDuk56hARV9oSewi/qNX7MPSzL/DX+SpNT9XJ5eq7/9xWXRwF
         uye7xWYcOjYgP4Gbdq9EN7ymJu/Buvh3KZmLnMvUxE03d2rYBimotl2Z3jhdQZurlalu
         +Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwKOTeesXXNVdqx4WBchH4Ot6in1mt6m0S1Knv1k2ow=;
        b=4m9jP7UGbnbeEhZ+7lLaQMRK6oWxAE+efX4tLxSXgQY7gUgVjCX889zj4X4H10av20
         Gs+t6QMRS0vKFNlqdqwn7Zx/QGeaJ26DWS9akej9Qppb5cLUT7o8mF3SbKzomPu1DLsh
         WwQxPy1dubncmZ/2ImIokkZSfKN97hwSkuxb3ABCB54DYAkA26YFCK/q15bZmGpkZAmX
         NBRu1pgbRrPmq230WZDmjFVIcMGvr6gGCwN0HamI3Zh3ly5U0jjF3UABM0QB9KyGfPak
         HoON62iVrix9DIy6Vnw0eKiwtk3Uk/dnaTb7GumGOaEakrsQ01yZDswIenmzacz97Ev7
         ZLXw==
X-Gm-Message-State: AO0yUKU3BWHb8mMMsHgvQCUcSQa5ufQgbyAOblWMJ2bSWB5J/T3OOe4h
	5oXadQWQIkkkxGtLAU2ZELtRnfFQ6RAyTDQBFnbXmMbLsPlU9g==
X-Google-Smtp-Source: AK7set++Ksx6sVAqvrI+PP/gO0jrK4o3b04ovVHjyErUKN0zFvlpJ0++dG+F1KeqiS8naKt8+XkNKN2Sw8rwhF+m+c8=
X-Received: by 2002:a05:6870:c34a:b0:161:d899:6ee0 with SMTP id
 e10-20020a056870c34a00b00161d8996ee0mr606918oak.262.1674665833753; Wed, 25
 Jan 2023 08:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20230124131336.3877979-1-jlu@pengutronix.de>
In-Reply-To: <20230124131336.3877979-1-jlu@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2023 08:56:47 -0800
Message-ID: <CAMKF1spCW78kZiADbiurViZOyjA_Eyuv09XH050uimJc3kj3zg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] softhsm: enable objectstore backend
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 16:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100780

seeing a build failure

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2389/steps/15/logs/stdio

On Tue, Jan 24, 2023 at 5:13 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> We already depend on sqlite, but the objectstore backend using it is not
> enabled by default. Add the necessary configure option.
>
> The db backend is more robust when accessing the objectstore from many
> parallel processes (such as during kernel module signing).
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> index d7bcd4f03bb2..1fded8df3dbb 100644
> --- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> +++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> @@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614d
>  inherit autotools pkgconfig siteinfo
>
>  EXTRA_OECONF += " --with-sqlite3=${STAGING_DIR_HOST}/usr"
> +EXTRA_OECONF += " --with-objectstore-backend-db"
>  EXTRA_OECONF += "${@oe.utils.conditional('SITEINFO_BITS', '64', ' --enable-64bit', '', d)}"
>
>  PACKAGECONFIG ?= "ecc eddsa pk11 openssl"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100721): https://lists.openembedded.org/g/openembedded-devel/message/100721
> Mute This Topic: https://lists.openembedded.org/mt/96496618/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

