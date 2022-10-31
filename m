Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEF0FA373D
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 00:48:27 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.4224.1667177297712346160
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 17:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=haqeH5MV;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso12035935fac.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 17:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI2wTMcOOAd82eV7lArgMixbUw78Fxvim3Fm2ekQqfA=;
        b=haqeH5MVyfGqVSeJBdhy2hCkg3VIcYlu1/LmdAy1G3FPuk3pfJyNrT7bh4LcT8zyOR
         NE2Zp27xWnWGySqmESSLTD/z4Y/yAIho9oNlYtrZMUAqVA0ufx7lWMY0uIHIBZKs0uq7
         dhl0FfKjRa8zCHtKWAnydlxz1cmV8Agqc/9NE7qI5aC2jLidJox+5+PKbBaQ1CVr/jyC
         d08hP/+Vw30ecimNswm3L/lUwpQuIG42svztrblsAmJEesEH1LofXw34gYK6FulO/HGS
         7VrlT0+XYLeYNpUtzahWX7PBcogKX1Mquz26zwjI3hrzZrPwJswyjgioOA2N2C6z9NWS
         LtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DI2wTMcOOAd82eV7lArgMixbUw78Fxvim3Fm2ekQqfA=;
        b=Ia2+gCQdtcHH4tbN7/YqECR2UAa+RrNSSJNZQKJ+FBn9menYiVnUJCQK35nsFQsIOQ
         4yWuMM68jsgGpr+QaX7EdF2cIgo9U02Xgs8+eIrJQtjX/jAwtuBaeIIVQDPsPETatdsu
         YuakG+lxGEXXcyUQWzZZIOhSVh6aWPScOToxC1lQhmrO/dOjWFtblNviAt5pjU6tgzT6
         0UjES2BxGwuYyK4AkKDSBH/VNHXqdJt70gEyU73pxcLa6f6K68MrEbf27+F4aQTQHMiW
         mKIVP0eOMb1OycBX1LQ6n6HCvG1a0mQ3904ANnlnICxIUECIH0LDPm+7ktvo7xAWKjbt
         hLsQ==
X-Gm-Message-State: ACrzQf0RkwjhNWD+8FpBVvR8KqjLnkGV9VSfcU4VsvHZ3u5v+HcxqBZn
	vCqtGK8e0namsvYTdH0ALFuKIwf1BmsoGa4wb98=
X-Google-Smtp-Source: AMsMyM6HUxTeiZXSgl3uwYz2DQuVoJVjUGo/yxH/CJEbn0qiyMB22CQ8KT/ymCO0/mULvI9LgPvuhOcLU66SUlwzhYE=
X-Received: by 2002:a05:6870:80cd:b0:13b:9ee7:34cc with SMTP id
 r13-20020a05687080cd00b0013b9ee734ccmr15225536oab.55.1667177296921; Sun, 30
 Oct 2022 17:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221029154116.3128371-1-f_l_k@t-online.de> <172294851D2ECF2D.19890@lists.openembedded.org>
 <17229508563226DE.31302@lists.openembedded.org> <QXZJKR.KVXE45SVRMV71@t-online.de>
In-Reply-To: <QXZJKR.KVXE45SVRMV71@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Oct 2022 17:47:51 -0700
Message-ID: <CAMKF1sq+bgf=huqz5399e1RLFoGOLXtP5NREPMK+e_XZUbFESA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 3/3] spice: build with opus and opengl
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 00:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99354

seeing some errors regarding polkit dependency I think it should be
guarded with appropriate distro feature.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2139

On Sat, Oct 29, 2022 at 11:42 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> After I had a closer look at the spice configure log it turned out, that =
the dependencies and the autotools configure options were quite outdated an=
d partly wrong. For that reason i did a rework for the spice recipe, upgrad=
et to 0.15.1 and switched the buildsystem over to meson. I've sent a v2 for=
 the spice.bb
>
> Am Sa, 29. Okt 2022 um 17:50:54 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> These recipes are needed to compile virt-viewer, for which I have also cr=
eated a recipe. I would send it as a proposal to meta-virtualization, but I=
'm not sure which mailing list would be the right one?
>
> I have done compilation tests for x86_64, aarch64 and mipsqemu with gcc. =
Fingers crossed for clang.
>
> Runtime tested with proxmox on x86_64
>
> Am Sa, 29. Okt 2022 um 17:41:16 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> - remove COMPATIBLE_HOSTS whitelist because I was able to compile this fo=
r qemumips also Signed-off-by: Markus Volk <f_l_k@t-online.de> --- meta-net=
working/recipes-support/spice/spice_git.bb | 4 +--- 1 file changed, 1 inser=
tion(+), 3 deletions(-) diff --git a/meta-networking/recipes-support/spice/=
spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb index b3e=
687476..69e220050 100644 --- a/meta-networking/recipes-support/spice/spice_=
git.bb +++ b/meta-networking/recipes-support/spice/spice_git.bb @@ -47,7 +4=
7,7 @@ CFLAGS:append =3D " -Wno-error" PACKAGECONFIG:class-native =3D "" PA=
CKAGECONFIG:class-nativesdk =3D "" -PACKAGECONFIG ?=3D "sasl" +PACKAGECONFI=
G ?=3D "sasl ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} opus" PACK=
AGECONFIG[celt051] =3D "--enable-celt051,--disable-celt051,celt051" PACKAGE=
CONFIG[smartcard] =3D "--enable-smartcard,--disable-smartcard,libcacard," @=
@ -58,8 +58,6 @@ PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libo=
pus," PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,," PACKAG=
ECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama,libxinerama," -=
COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux' - BBCLASSEXTEND =3D "na=
tive nativesdk" EXTRA_OECONF:append:toolchain-clang =3D " --disable-werror"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99349): https://lists.openembedded.org/g/openembedded=
-devel/message/99349
> Mute This Topic: https://lists.openembedded.org/mt/94660290/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

