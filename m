Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1CCC6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 18:24:50 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.27247.1678472687937546591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 10:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VrNR+USz;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-176e43eb199so6795079fac.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678472687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOVnEShtww4nFPtA/7bYGlyxWEPBhcg4sLvIyU6WXpc=;
        b=VrNR+USzgAFM9EA7k6d5p3vm6e4CwQ5z7RR0F4pxJsec+7HK4G4t09pV/Spe8GdrQN
         XCDpPNQErZLRQSNWkaXmg6ansseO8Bzs16wPJfKj4ns6WuagUeGEpIKNx2fFGNJ3h1S5
         o+7dVaiQEIX0VeRF7SJ5gDDFk8AATSIxKO/ZQXcIGn2+VZtDlMsFdIxcBdaZ2EqdxQsw
         ZSr9Ox5pB8FT0KOBBYouqIiVll9xTqWN2oGEzFGKjv1vDm+sE7eBhiGFoDfyzumIY4di
         1zsrAjhc+tOjGPQnsqufm+MLDLCl3TDeMR1qVUtJKL1Sgp9FFlwKyHwy8wCubWaM6MQw
         GMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678472687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOVnEShtww4nFPtA/7bYGlyxWEPBhcg4sLvIyU6WXpc=;
        b=E9+x4Yumf4SBZJqFs5e3z/vAjurvrmk+/Xn03PZPU3ONSEEf/VB+FC+9pRI/dkEAdA
         OnVALLMcUmzaUQDBsItPvZrukH7fR781JqbWmoTj4Fben24k9WIy5u7vqB2LjjYe7x1S
         4t1MgNEP3L2yW4WcwG8WYlJruvs4PqysJsjnN03OfDOuM4LSoXIgbYatYbyjv4f1qcaI
         OWawTyPuULp9gQev+BiJdNPoQpkLW99kpk6103Ho3iC5uk+8NN1pHoDIaK0gsutl3LwU
         sp+6RPHu6O5zU8ImKXx2/3GWiyjwWgjxZyEX6e0bqirylWPdcypp4pIbq/bHAj2DfZ7R
         vQ5w==
X-Gm-Message-State: AO0yUKXGxX8HWmcWpvZWAb3aFqs5FYLWIJkZr+Q2zRR/nspFy0a3NKCk
	AAtaYn5qwaYGLtrEpglt7AEGb+cu7gECb2kKWtH2sjN7
X-Google-Smtp-Source: AK7set9+okknCfm43ICAqXt5rGOEmq78JUVGYEvK1vw95ZeMxtnzfNGIV+krPEqMOtA9oLYjHGnRjuDs/+KIZWoyNmk=
X-Received: by 2002:a05:6870:d346:b0:176:2168:12a2 with SMTP id
 h6-20020a056870d34600b00176216812a2mr9362533oag.2.1678472687043; Fri, 10 Mar
 2023 10:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20230308135705.796596-1-yi.zhao@windriver.com>
 <20230308135705.796596-2-yi.zhao@windriver.com> <2023031016464269dcfd97@mail.local>
In-Reply-To: <2023031016464269dcfd97@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Mar 2023 10:24:20 -0800
Message-ID: <CAMKF1srB7mrZvy9y4QmaAfw3xXw=hoybuv==bCOP_OykDr=66w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] netplan: add missing runtime dependencies
To: alexandre.belloni@bootlin.com
Cc: Yi Zhao <yi.zhao@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 18:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101495

On Fri, Mar 10, 2023 at 8:46=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This broke check-layer-nightly on the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/s=
teps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/s=
teps/21/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/s=
teps/23/logs/stdio
>
> I'm not completely sure why yet.

it started to depend on python-rich and the recipe for python-rich is
now in meta-python but perhaps this went in ahead of the new recipe.
Ideally they should have
gone in atomically.

>
> On 08/03/2023 21:57:05+0800, Yi Zhao wrote:
> > Add python3-dbus and python3-rich[1] to RDEPENDS.
> >
> > [1] https://github.com/canonical/netplan/pull/290
> >
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ---
> >  .../meta-python/recipes-connectivity/netplan/netplan_0.106.bb   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/ne=
tplan/netplan_0.106.bb b/meta-oe/dynamic-layers/meta-python/recipes-connect=
ivity/netplan/netplan_0.106.bb
> > index b7fe7ae3e..8c1eaa550 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/n=
etplan_0.106.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/n=
etplan_0.106.bb
> > @@ -26,7 +26,7 @@ PACKAGECONFIG ?=3D ""
> >
> >  PACKAGECONFIG[tests] =3D ",,,python3-nose python3-coverage python3-net=
ifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
> >
> > -RDEPENDS:${PN} =3D "python3 python3-core python3-netifaces python3-pyy=
aml util-linux-libuuid libnetplan"
> > +RDEPENDS:${PN} =3D "python3 python3-core python3-netifaces python3-pyy=
aml util-linux-libuuid libnetplan python3-dbus python3-rich"
> >
> >  inherit pkgconfig systemd
> >
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101494): https://lists.openembedded.org/g/openembedde=
d-devel/message/101494
> Mute This Topic: https://lists.openembedded.org/mt/97472579/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

