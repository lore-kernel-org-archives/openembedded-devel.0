Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E321C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 07:23:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.36285.1717745024450209531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 00:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gFobo6uj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a691bbb7031so235342766b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717745023; x=1718349823; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ6yKHJlfGXkayzS81QlvpaKy45050s8Vl7GBUqYZUI=;
        b=gFobo6ujmrt0eKM++7pzt6BfnKdFN24Rn2vA7M3/xayVm2XdLZ7GYRLLpw2pAvY58o
         WttidE4GeRmBcs5R0fRdGpIk6Gcvqd9oxLYnjdaaxXCodoT0fJH7Y1mSqcMsVM9a/jXX
         lpz5XKkNYKM0su3VsG2du5LBfbb9k8iQw7G0aH0g15+QJJIYDcVeu9ftskZP0fzY9Fzd
         1mUpsDNFwLFB/4byEyRQ1Cqf8zQVVvpDWkKZrZOD42Tp1i14pRD4RQu9uG9ziDb00nx8
         CpPXrQFZzixbYBdWvcuGbVFyhUFgkaQ0UbwDXrExMtA+rhZloi/Fzl3TK+xRTOI3Oe5P
         ORTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717745023; x=1718349823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ6yKHJlfGXkayzS81QlvpaKy45050s8Vl7GBUqYZUI=;
        b=ZNnoYyjrypCLsPPaVCqwFlYHZANKMATy7Cj8enED0Vs9vNWoUx8T8LDBW9vJt978aX
         HXtz6NhmV9B5sc5gRFV8mNSfu8pEYK8cfjGYCNHg9svQOtYbnGnr2bVtWaw03HdSW+Ek
         7xVadIaEDxIrYmgd/M2EfwUSzdwYlS97ZkfO2II0LuO2jddezdAUNWtQeW9L+uwb5M0w
         KinI/ndJ5b14bCfx3nX3beL6W0ByzMhhPT6tg3y0oH2IS7R2QwFli/rgu6jDyl9BbO5w
         ehfDI0QQK0h63KjZexQDSPN+C+RSqFIMdzUSD3YZQ7xbfKuw7n46pTi6zKA7je1sJ9VO
         neag==
X-Gm-Message-State: AOJu0YwolEQXj7NXxfr3tWHtzWdsaRDLNRxE1Z30Ne27FnjuWt80NFA8
	BtE5hSFmFzPd6NZ1BubKlQ0BIumd8hXJPWTZ8MW/aSw8AJMwwr9dp3meY4S1DBBmcp76hWZfqg5
	cej2+z6f+6nqcs1aVnbOoM2VHghs=
X-Google-Smtp-Source: AGHT+IHYpYEk2CQAQFLWnL37EWHdRI8OaG1bVa8BEG/GIXcf9erNmFQYyZ3FXted3WM7sp9h9uDxYE8ljIIJxgdtrA4=
X-Received: by 2002:a17:907:20ed:b0:a6c:8076:1a5e with SMTP id
 a640c23a62f3a-a6cd7a7e9b6mr142362166b.43.1717745022522; Fri, 07 Jun 2024
 00:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sp=+ALCxj1fdNHQgj8eFrexnY8R=EmLp3GVGyvk0+gNTA@mail.gmail.com>
 <CALT56yMQkRzJGddGJS3P2wH-y87Uce-UNnEd8dADoxUX2bhyTA@mail.gmail.com> <CAMKF1sq__=aPzdi4S1QD1dSKsOqE51dnoF_+x6NK8Ct7sWDZZA@mail.gmail.com>
In-Reply-To: <CAMKF1sq__=aPzdi4S1QD1dSKsOqE51dnoF_+x6NK8Ct7sWDZZA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 7 Jun 2024 10:23:31 +0300
Message-ID: <CALT56yMvqqU3B9ZzRfi_sRvk1Dg74oeFSwEbcDDa9vUAG4NsrA@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 07:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110761

On Fri, 7 Jun 2024 at 07:45, Khem Raj <raj.khem@gmail.com> wrote:
>
> fails on riscv as well see
>
> https://errors.yoctoproject.org/Errors/Details/785949/


https://lore.kernel.org/openembedded-core/20240607072252.1732005-1-dmitry.b=
aryshkov@linaro.org

>
> On Thu, May 30, 2024 at 9:53=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmai=
l.com> wrote:
> >
> > On Thu, 30 May 2024 at 18:10, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > fails to build.
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/389=
3/steps/14/logs/stdio
> >
> > So, compiling to the host architecture works (bitbake
> > cabextract-native works), but cross-compiling to the host architecture
> > doesn't seem to work;
> >
> > | /usr/src/debug/cabextract/1.11/src/cabextract.c:499:(.text.startup+0x=
103d):
> > undefined reference to `rpl_fnmatch'
> >
> > This should be fixed by
> > https://lore.kernel.org/openembedded-core/20240530164355.3294714-1-dmit=
ry.baryshkov@linaro.org/
> >
> >
> >
> > >
> > > On Wed, May 29, 2024 at 2:02=E2=80=AFAM Dmitry Baryshkov via
> > > lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org=
>
> > > wrote:
> > > >
> > > > WoA firmware, fonts and some other useful files are being distribut=
ed as
> > > > a Microsoft cabinet files. Add recipes for the cabextract utility, =
which
> > > > is used to extract such files.
> > > >
> > > > Cabextract can either use a bundled source tree for libmspack libra=
ry or
> > > > an externally provided library. Package the library separately in o=
rder
> > > > to be able to share it with the meta-security layer.
> > > >
> > > > Cc: Armin Kuster <akuster808@gmail.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  .../cabextract/cabextract_1.11.bb              | 18 ++++++++++++++=
++++
> > > >  .../cabextract/libmspack_0.11alpha.bb          | 16 ++++++++++++++=
++
> > > >  2 files changed, 34 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1=
.11.bb
> > > >  create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.=
11alpha.bb
> > > >
> > > > diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb =
b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > > > new file mode 100644
> > > > index 000000000000..4d035eeee4b0
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > > > @@ -0,0 +1,18 @@
> > > > +SUMMARY =3D "Software for extracting Microsoft cabinet files"
> > > > +DESCRIPTION =3D "tool for extracting Microsoft cabinet files"
> > > > +HOMEPAGE =3D "http://www.cabextract.org.uk/"
> > > > +SECTION =3D "console/utils"
> > > > +
> > > > +LICENSE =3D "GPL-3.0-or-later"
> > > > +LIC_FILES_CHKSUM =3D "file://src/cabextract.c;beginline=3D4;endlin=
e=3D11;md5=3Db0a10c6d3843f262114e7ecf91fc7e78"
> > > > +
> > > > +SRC_URI =3D "https://www.cabextract.org.uk/cabextract-${PV}.tar.gz=
"
> > > > +SRC_URI[sha256sum] =3D "b5546db1155e4c718ff3d4b278573604f30dd64c3c=
5bfd4657cd089b823a3ac6"
> > > > +
> > > > +DEPENDS =3D "libmspack"
> > > > +
> > > > +EXTRA_OECONF =3D "--with-external-libmspack"
> > > > +
> > > > +inherit autotools pkgconfig
> > > > +
> > > > +BBCLASSEXTEND +=3D "native nativesdk"
> > > > diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha=
.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > > > new file mode 100644
> > > > index 000000000000..169a5f271be9
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > > > @@ -0,0 +1,16 @@
> > > > +SUMMARY =3D "A library for Microsoft compression formats"
> > > > +DESCRIPTION =3D "The library provides compressors and decompressor=
s,\
> > > > +archivers and dearchivers for Microsoft compression formats: CAB, =
CHM, WIM,\
> > > > +LIT, HLP, KWAJ and SZDD."
> > > > +HOMEPAGE =3D "http://www.cabextract.org.uk/libmspack/"
> > > > +SECTION =3D "lib"
> > > > +LICENSE =3D "LGPL-2.1-only"
> > > > +
> > > > +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D7fbc338309ac38fefcd=
64b04bb903e34"
> > > > +
> > > > +SRC_URI =3D "https://www.cabextract.org.uk/libmspack/libmspack-${P=
V}.tar.gz"
> > > > +SRC_URI[sha256sum] =3D "70dd1fb2f0aecc36791b71a1e1840e62173079eada=
a081192d1c323a0eeea21b"
> > > > +
> > > > +inherit autotools
> > > > +
> > > > +BBCLASSEXTEND +=3D "native nativesdk"
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#110609): https://lists.openembedded.org/g/opene=
mbedded-devel/message/110609
> > > > Mute This Topic: https://lists.openembedded.org/mt/106365503/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

