Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442A3C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:53:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1713.1717087991758750449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 09:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpwRua2Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b83225088so397447e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717087990; x=1717692790; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4sRm+9UNw2NEujjzylddTn1lP1i9UtPG5elTcvLWck=;
        b=VpwRua2YkFYg1Ln9v5TkRmbBwzIpQ0af+o/b3Ci9CAjgcO2CCvEhxOkyG2OTRr9lnr
         x4mbZt5Y7iiidJSf0yEwEsJdkrO62UXCxSId+q5UCEVMyKtdgcWyC/V4cWn/+ntQE1nO
         6GuQ6QcGlxuVajJyuwZACktVaUovntO6j0NHtlB9aBAK+D6FQvkFwDcMdJxkuKB+A3UV
         uqLZoeTpHVhwX2+quWY7aIEM2Co/SxqHW4NRss0yiHlq6Hbbi2SLkvh7drHvZIgh63sx
         a2h8eZEsjBOinKF2CT2wEUs3mzpnl8Pa1tuiPKT0rsoNJ/vQrdyywXgGiCp79DlnSU/I
         aE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087990; x=1717692790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4sRm+9UNw2NEujjzylddTn1lP1i9UtPG5elTcvLWck=;
        b=G+Pc7WLZdBoiK81vEwwGuqiVEwdPD6UxgghU3uC778xKtXxPO7oQSZlphheL4deqTp
         ApTVUGytaexQsUeKXCCq/rbODfIpsH0chVFmCYkL3oXUgASN9SPx7qvPdGUYbvCoR1cL
         mmZQmxxbL3YuL+LA1wfo6wsAknyCWr8One8kpaOuZMPM0QPgRjnVIMjbXhkEdcOCG2I7
         0TwhJ7Be3iNGv7sZ8YhC1Ihp8DZCXmmXY79uhc0QnqNbrVB/XIx00frJqbxQJLekCLAk
         4FJnVyHHFGkY1icagNZXZ6iZRL/L/9mqNBM2TyXI3ObBGU5fBBHHvjq6IASpVjOVid99
         0MoA==
X-Gm-Message-State: AOJu0YyDPSx2SU/f42cd4UApQkqW99/7hC6TRi6pK3U5XJ8fv4zhiLbP
	noVpppcTbhWQuCqjVhFZnjB2V20o1pPX09e7hmXhJHP8/ROzRAG3hNjDi1wJmntUP5I86zNOeWw
	W9trfnSk67+5Qsw2EqI1XoTmkoPXfhFZX
X-Google-Smtp-Source: AGHT+IEdiN9P3ybR2I+DLrYhZcWazPUAIY07PuvpSc+ZhGpIm5djOuX1kIr09jrL3WV8tQ9pmTJ0T+pARLL5oGEKyFQ=
X-Received: by 2002:ac2:4218:0:b0:529:b717:2a18 with SMTP id
 2adb3069b0e04-52b7d47a483mr1680485e87.47.1717087989059; Thu, 30 May 2024
 09:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org> <CAMKF1sp=+ALCxj1fdNHQgj8eFrexnY8R=EmLp3GVGyvk0+gNTA@mail.gmail.com>
In-Reply-To: <CAMKF1sp=+ALCxj1fdNHQgj8eFrexnY8R=EmLp3GVGyvk0+gNTA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 30 May 2024 19:52:57 +0300
Message-ID: <CALT56yMQkRzJGddGJS3P2wH-y87Uce-UNnEd8dADoxUX2bhyTA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cabextract: add utility to extract Microsft
 cabinet files
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 16:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110635

On Thu, 30 May 2024 at 18:10, Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3893/st=
eps/14/logs/stdio

So, compiling to the host architecture works (bitbake
cabextract-native works), but cross-compiling to the host architecture
doesn't seem to work;

| /usr/src/debug/cabextract/1.11/src/cabextract.c:499:(.text.startup+0x103d=
):
undefined reference to `rpl_fnmatch'

This should be fixed by
https://lore.kernel.org/openembedded-core/20240530164355.3294714-1-dmitry.b=
aryshkov@linaro.org/



>
> On Wed, May 29, 2024 at 2:02=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > WoA firmware, fonts and some other useful files are being distributed a=
s
> > a Microsoft cabinet files. Add recipes for the cabextract utility, whic=
h
> > is used to extract such files.
> >
> > Cabextract can either use a bundled source tree for libmspack library o=
r
> > an externally provided library. Package the library separately in order
> > to be able to share it with the meta-security layer.
> >
> > Cc: Armin Kuster <akuster808@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../cabextract/cabextract_1.11.bb              | 18 ++++++++++++++++++
> >  .../cabextract/libmspack_0.11alpha.bb          | 16 ++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1.11.=
bb
> >  create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.11al=
pha.bb
> >
> > diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/me=
ta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > new file mode 100644
> > index 000000000000..4d035eeee4b0
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Software for extracting Microsoft cabinet files"
> > +DESCRIPTION =3D "tool for extracting Microsoft cabinet files"
> > +HOMEPAGE =3D "http://www.cabextract.org.uk/"
> > +SECTION =3D "console/utils"
> > +
> > +LICENSE =3D "GPL-3.0-or-later"
> > +LIC_FILES_CHKSUM =3D "file://src/cabextract.c;beginline=3D4;endline=3D=
11;md5=3Db0a10c6d3843f262114e7ecf91fc7e78"
> > +
> > +SRC_URI =3D "https://www.cabextract.org.uk/cabextract-${PV}.tar.gz"
> > +SRC_URI[sha256sum] =3D "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd=
4657cd089b823a3ac6"
> > +
> > +DEPENDS =3D "libmspack"
> > +
> > +EXTRA_OECONF =3D "--with-external-libmspack"
> > +
> > +inherit autotools pkgconfig
> > +
> > +BBCLASSEXTEND +=3D "native nativesdk"
> > diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb =
b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > new file mode 100644
> > index 000000000000..169a5f271be9
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "A library for Microsoft compression formats"
> > +DESCRIPTION =3D "The library provides compressors and decompressors,\
> > +archivers and dearchivers for Microsoft compression formats: CAB, CHM,=
 WIM,\
> > +LIT, HLP, KWAJ and SZDD."
> > +HOMEPAGE =3D "http://www.cabextract.org.uk/libmspack/"
> > +SECTION =3D "lib"
> > +LICENSE =3D "LGPL-2.1-only"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D7fbc338309ac38fefcd64b0=
4bb903e34"
> > +
> > +SRC_URI =3D "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.t=
ar.gz"
> > +SRC_URI[sha256sum] =3D "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081=
192d1c323a0eeea21b"
> > +
> > +inherit autotools
> > +
> > +BBCLASSEXTEND +=3D "native nativesdk"
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110609): https://lists.openembedded.org/g/openembed=
ded-devel/message/110609
> > Mute This Topic: https://lists.openembedded.org/mt/106365503/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--
With best wishes
Dmitry

