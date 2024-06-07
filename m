Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED11C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 04:45:47 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.34227.1717735537594869787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 21:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVthKW2q;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2544465c9e2so705965fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 21:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717735537; x=1718340337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE5moYI3xP5PeqxGbOsbhGZ5Oola8uGdO5VpQv100is=;
        b=bVthKW2qfGdKKDZfQGbQlXxnNp8ovGbg0ygDaRxpGVgzNsV2OXMZEZlzscpll3zjcn
         jXriGDFxkGmGDxbwlf56RMiAwcWRsxmuMWK6zJbrxi4j7tkqZNaMUWBFW3/CyqzkXn++
         6bV1dOMzog/TTsw32r+YIMggiao15nIViPjrPYzgWXxeXMqMUWUTTZN1uPlCNcyXMwVn
         uw52qwIDQSNCxSZQmKxDvY9CXlfdVDGenI8KN+XbHGhX4/LVtJt+xlcon1uDaL6pOCxH
         k9i/8emNvHYmaZGajzz9HR7ZolwnhDghcpY524hKiB3ahXATyQKc2W39+KSVG564EO9Z
         lVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717735537; x=1718340337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE5moYI3xP5PeqxGbOsbhGZ5Oola8uGdO5VpQv100is=;
        b=GN9XqhtMyoMiVhOvVot54z5rqAu+pWzPYNvlIeDGDyaAsc2/fy4+794QLj7VSiZtkF
         ywpTkU1Jl7O0zaEDW+N8LD4mWIAXyTIj+ZkSQzMPGjX+3imqNlgKG5aLJERCaFzguMzW
         vFk8FA/g072+vuOEY8F3ox2NlaLYNL69/STTtFAaBN4zk4FXF++oRYp9pEW/JXI6xOU1
         ojpvUusayDtQE5DjIM2wTRvn4d4FppuhaNt4ly6LYQvXTx2JMdupBI/21iT3b2w47IMI
         NsmiVULbSF1a3aRZWos6uMf2TJpucvDTWOZ8D9HRhhSTSoBqtR4rWRsfM7OV+NMNKe0R
         Sm4A==
X-Gm-Message-State: AOJu0Yww87py67wUE+4ihshffRfkkM8Z3dqf7pNsIzCq8+QE2kSNFRZC
	2NogAYkO74N0GSsPUZfRysXCiiRNT9KOS+OHxJQGczVpSw+fl4A4KCI6nRVpwtpjPcEbCX26gPy
	oiVzZRY1TV/LoU2gO/rL5FmjAOuY=
X-Google-Smtp-Source: AGHT+IGZgagvHWtyiYx0aQ0c3c3P4UzcHXQt0spwxS0HXgef8o32mr0+jqblqIFb8+6Fxx0LarOOu8hH83i1WHTN3Io=
X-Received: by 2002:a05:6870:92c9:b0:254:7471:56b7 with SMTP id
 586e51a60fabf-2547471bc13mr246448fac.11.1717735536613; Thu, 06 Jun 2024
 21:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sp=+ALCxj1fdNHQgj8eFrexnY8R=EmLp3GVGyvk0+gNTA@mail.gmail.com> <CALT56yMQkRzJGddGJS3P2wH-y87Uce-UNnEd8dADoxUX2bhyTA@mail.gmail.com>
In-Reply-To: <CALT56yMQkRzJGddGJS3P2wH-y87Uce-UNnEd8dADoxUX2bhyTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 21:45:10 -0700
Message-ID: <CAMKF1sq__=aPzdi4S1QD1dSKsOqE51dnoF_+x6NK8Ct7sWDZZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cabextract: add utility to extract Microsft
 cabinet files
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 04:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110758

fails on riscv as well see

https://errors.yoctoproject.org/Errors/Details/785949/

On Thu, May 30, 2024 at 9:53=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmail.=
com> wrote:
>
> On Thu, 30 May 2024 at 18:10, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > fails to build.
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3893/=
steps/14/logs/stdio
>
> So, compiling to the host architecture works (bitbake
> cabextract-native works), but cross-compiling to the host architecture
> doesn't seem to work;
>
> | /usr/src/debug/cabextract/1.11/src/cabextract.c:499:(.text.startup+0x10=
3d):
> undefined reference to `rpl_fnmatch'
>
> This should be fixed by
> https://lore.kernel.org/openembedded-core/20240530164355.3294714-1-dmitry=
.baryshkov@linaro.org/
>
>
>
> >
> > On Wed, May 29, 2024 at 2:02=E2=80=AFAM Dmitry Baryshkov via
> > lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > WoA firmware, fonts and some other useful files are being distributed=
 as
> > > a Microsoft cabinet files. Add recipes for the cabextract utility, wh=
ich
> > > is used to extract such files.
> > >
> > > Cabextract can either use a bundled source tree for libmspack library=
 or
> > > an externally provided library. Package the library separately in ord=
er
> > > to be able to share it with the meta-security layer.
> > >
> > > Cc: Armin Kuster <akuster808@gmail.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../cabextract/cabextract_1.11.bb              | 18 ++++++++++++++++=
++
> > >  .../cabextract/libmspack_0.11alpha.bb          | 16 ++++++++++++++++
> > >  2 files changed, 34 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1.1=
1.bb
> > >  create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.11=
alpha.bb
> > >
> > > diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/=
meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > > new file mode 100644
> > > index 000000000000..4d035eeee4b0
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY =3D "Software for extracting Microsoft cabinet files"
> > > +DESCRIPTION =3D "tool for extracting Microsoft cabinet files"
> > > +HOMEPAGE =3D "http://www.cabextract.org.uk/"
> > > +SECTION =3D "console/utils"
> > > +
> > > +LICENSE =3D "GPL-3.0-or-later"
> > > +LIC_FILES_CHKSUM =3D "file://src/cabextract.c;beginline=3D4;endline=
=3D11;md5=3Db0a10c6d3843f262114e7ecf91fc7e78"
> > > +
> > > +SRC_URI =3D "https://www.cabextract.org.uk/cabextract-${PV}.tar.gz"
> > > +SRC_URI[sha256sum] =3D "b5546db1155e4c718ff3d4b278573604f30dd64c3c5b=
fd4657cd089b823a3ac6"
> > > +
> > > +DEPENDS =3D "libmspack"
> > > +
> > > +EXTRA_OECONF =3D "--with-external-libmspack"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +BBCLASSEXTEND +=3D "native nativesdk"
> > > diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.b=
b b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > > new file mode 100644
> > > index 000000000000..169a5f271be9
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> > > @@ -0,0 +1,16 @@
> > > +SUMMARY =3D "A library for Microsoft compression formats"
> > > +DESCRIPTION =3D "The library provides compressors and decompressors,=
\
> > > +archivers and dearchivers for Microsoft compression formats: CAB, CH=
M, WIM,\
> > > +LIT, HLP, KWAJ and SZDD."
> > > +HOMEPAGE =3D "http://www.cabextract.org.uk/libmspack/"
> > > +SECTION =3D "lib"
> > > +LICENSE =3D "LGPL-2.1-only"
> > > +
> > > +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D7fbc338309ac38fefcd64=
b04bb903e34"
> > > +
> > > +SRC_URI =3D "https://www.cabextract.org.uk/libmspack/libmspack-${PV}=
.tar.gz"
> > > +SRC_URI[sha256sum] =3D "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa0=
81192d1c323a0eeea21b"
> > > +
> > > +inherit autotools
> > > +
> > > +BBCLASSEXTEND +=3D "native nativesdk"
> > > --
> > > 2.39.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#110609): https://lists.openembedded.org/g/openemb=
edded-devel/message/110609
> > > Mute This Topic: https://lists.openembedded.org/mt/106365503/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> With best wishes
> Dmitry

