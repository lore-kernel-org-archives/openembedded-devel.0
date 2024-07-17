Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26EBC3DA5D
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 23:13:06 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.3605.1721257985521967689
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 16:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lhn1NZL0;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-260e3e295a7so121426fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721257985; x=1721862785; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrpIV1x8CSShj/wB9uTkzVJAzqTEiyeHxCmz25l4ZUA=;
        b=lhn1NZL0yriQ3VJvLplREg/wpzlpdPCVGxGpOYV5g80HWZCzudxM1ydMApbg6Q3juH
         npxDXb6ImnvMhieoQIBEQKqVzCmGlONYocTyqZ38tGU/lF88ynTFp7CHvv7mFf45soTQ
         KTdYOi1cqQ1/iW8dqZdwMwhy0ZU8+PYbvT7jsVUWaZDen/HmCupHydrOhvi2xLymGsfZ
         AXzZLyEjAt4WAyJf454sw8yR/wdUHqVyiJQUBwnWHjz1q/DI4lHYnYN7cFTaqWmnBTon
         sQPZY7EHi1ik22k5uYSMhlOevzgxe7geZ2W8qtPWxmWt061W1krNUccZnU6pk/JYO8Ob
         I89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721257985; x=1721862785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrpIV1x8CSShj/wB9uTkzVJAzqTEiyeHxCmz25l4ZUA=;
        b=wu3kgy8rXrSrSUMOUGpVcx0Rb7dNa+NdFORiwyiskDuFoimv5Gq9JWlVIplJao4pcq
         yDn2maYfcvr0hfwwRwL0SNvoxlYfJ+fkCBy5A4Asf08XHHGrTcuBW3vtM06OogXnw6J4
         QyvaClkPfMnZXGfDowuydJc3EtPNQIXHEg/Q+xNCwK/UdTwaXKdG3kMV5uF6441xCZ8M
         p8jFA9M5qmZVdcupq9x8qTWiD9PIkJUhpESVFMKCl5E7OyqJaojaEBQTXujPGAKv2hPu
         Gtl1UfvfOYX9Up72HjboesCRc9OT/dUgsxg1oQruHEoPACw16OJyGGtmD5sWA1dSh68S
         26Xg==
X-Gm-Message-State: AOJu0Ywv1O+wMC3zXrCSbLW/4++N24EW0ALlcHzrOPTLgoSwVt4BFqnQ
	rgsY9ptv6mjxgdFeIclYN7uES6KTR03V3RLC1uxPgOerdyKlmU1XZgblDYpsDbd7hXT+pftvt7O
	7p6hLSrY+ihDrqpJf+yS3aN3ziMQ=
X-Google-Smtp-Source: AGHT+IFowlwqBTGfA5xn/9AsjzmU2wMbwhnoboGE1U+BcY03blx6a5Lffnn8Om8tfDtdWidkhtp/Sm2iEMsdoR1YXpg=
X-Received: by 2002:a05:6870:ac0f:b0:25e:24d5:4d54 with SMTP id
 586e51a60fabf-260d948e3f5mr2758160fac.35.1721257984698; Wed, 17 Jul 2024
 16:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240716125617.1597303-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20240716125617.1597303-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jul 2024 16:12:38 -0700
Message-ID: <CAMKF1soahBM_iB7JWKoBD2cTcizTjaTDpPgW0eS9+sSq0PvsLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.18 -> 7.0.20
To: costamagna.gianfranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 23:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111386

This fails to build

https://errors.yoctoproject.org/Errors/Details/791076/

Always test with

bitbake -ccleanall <recipe>
bitbake recipe

to ensure all tasks are run.

On Tue, Jul 16, 2024 at 5:56=E2=80=AFAM Gianfranco via lists.openembedded.o=
rg
<costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../{vboxguestdrivers_7.0.18.bb =3D> vboxguestdrivers_7.0.20.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.18=
.bb =3D> vboxguestdrivers_7.0.20.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.=
0.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.=
bb
> similarity index 97%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0=
.18.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2=
0.bb
> index 47f616e99..714814fba 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "http://download.virtualbox.org/virtualbox/=
${PV}/${VBOX_NAME}.tar.bz2
>      file://Makefile.utils \
>  "
>
> -SRC_URI[sha256sum] =3D "d999513533631674a024762668de999411d8197060c51e68=
c5faf0a2c0eea1a5"
> +SRC_URI[sha256sum] =3D "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc5=
6d064de44222dd02"
>
>  S ?=3D "${WORKDIR}/vbox_module"
>  S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111374): https://lists.openembedded.org/g/openembedde=
d-devel/message/111374
> Mute This Topic: https://lists.openembedded.org/mt/107251081/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

