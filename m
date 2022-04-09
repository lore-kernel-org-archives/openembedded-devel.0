Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A44C6371D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.10082.1649534036680109669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 12:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nBrJRsKZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id x20so846202qvl.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uvHMZ9HMp6iMaV8IRHhsEBDNKFCmcrbUm4jxxcblZGs=;
        b=nBrJRsKZZ0B9r8zGJNwQxVxf6kreJp18IJErW14EzLPcFihyMexC4FOHase9zjIT2H
         8nJKmGlpWNhYsxK3+lVhaBirxFIG13yU9oL7Uk2d3KqxiiK9Cqd8BNN02GcOYRi2C/Bl
         4vz4eSODOevoKKKau8y4VSM4PJR2vZX8hpYBbNgeEjkOtL4R2wp4puRcUud3wO85vp1r
         Jl6I+vUQWQyN6wqyAV3IJ/qO68j5a238IPtMR9ufvEMiMuMsXqwRaXrkvju/SxCatfhK
         hcOZYI5EBj5pPHWmRrkJh5BgDmsalT8IzbY0PJ1e5mtt9C0LgawMcCWVr0EZYTUNoru4
         Y3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uvHMZ9HMp6iMaV8IRHhsEBDNKFCmcrbUm4jxxcblZGs=;
        b=HCI6/jEo7Y0I6ySX2zK1oCi6syTxr07etwg4c+RXeAkqzzHKH+geX8dwkBHTjyxw7K
         vbwweiFomkcWhcSfLaWCl/uZbkTDAJ1ZVyb/h9onXCdc7z+A2O7uL55GJf974EAIMxJh
         aoTbhp4+MgKM09QIkgchEIo1Q2aXc2JyZD7qKTOkiUgQCM9VwBe/CT/XTrIrPixsaRSE
         XzdMWzArwn+NyHVn0GMevGGpLkHJDrp8amPGpORkH8F1VH6m0XDqxu0neLFxF0Y90EcI
         Rwyt+dQ0ScIKOISQRoXtOif1kf4t639wGfrNyW2l/8Lc8si/cK2moWZkW/QJyjAoiIb+
         IQ7g==
X-Gm-Message-State: AOAM5313XRB706DkxdtfaMIyru9KwsdPV4IhKpsF+CaOTYAv0zmD++iw
	2B2IU+Bg1YW68jOGB/Sf090XLQ2n/+xHzag0QFJ+1Dzho/ojOA==
X-Google-Smtp-Source: 
 ABdhPJz0gbytpDqGvXluvRtoBUGgrvz6kAGImyaOIrjZcCUh5iipPyZGj+5BADP2rpxr8XANyEBRZd83xIh5EEED6fE=
X-Received: by 2002:ad4:4186:0:b0:444:1732:d48d with SMTP id
 e6-20020ad44186000000b004441732d48dmr10802304qvp.24.1649534035669; Sat, 09
 Apr 2022 12:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220409194644.78969-1-marex@denx.de>
In-Reply-To: <20220409194644.78969-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Apr 2022 12:53:29 -0700
Message-ID: 
 <CAMKF1sord5m4Ne_P+QJ=K4AM3=SvAbJbO2UMT1HaeVuk3G1auw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] wxwidgets: Fix build without x11 and with opengl
 DISTRO_FEATURES
To: Marek Vasut <marex@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96502

There is already a patch staged in master-next

https://lists.openembedded.org/g/openembedded-devel/message/96479

does that solve the problem?

On Sat, Apr 9, 2022 at 12:46 PM Marek Vasut <marex@denx.de> wrote:
>
> In case DISTRO_FEATURES contains both 'x11' and 'opengl', which is a
> valid use case for systems using e.g. WL instead, the PACKAGECONFIG
> of this recipe is expanded to 'no_gui opengl', and the 'no_gui' option
> conflicts with 'opengl'.
>
> Adjust the default PACKAGECONFIG such that 'opengl' is added only in
> case the 'gtk' GUI option is added, and not when the 'no_gui' option
> is added.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> index e82143040..0c0c8417b 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> @@ -44,8 +44,7 @@ EXTRA_OECMAKE:append:libc-musl = " \
>  "
>
>  # All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
> -PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk ' + bb.utils.filter('DISTRO_FEATURES', 'opengl', d), 'no_gui', d)} \
>  "
>
>  PACKAGECONFIG:remove:class-native = "opengl"
> --
> 2.35.1
>

