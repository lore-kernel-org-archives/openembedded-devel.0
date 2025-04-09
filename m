Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601ECC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 01:43:08 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.12364.1744162972656893783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 18:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfOgk2wP;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60406de9cbfso1354894eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744162972; x=1744767772; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJusLOFLw3FVlyJSiG1NXof4hWrhvm7lLO1u2eukLSs=;
        b=UfOgk2wPP+6CBZtGAOEQHTFVeSkIrdqqRF93oL/3JJOxFvGB4mR5ePNnbWLxyuFFTp
         yBie1lG7yotRK8LmdDAnO81hrJDTbjTa7KfTcxhx1/OkH8X8fbxOw+YEGA77sQvtpEiT
         ozApcRNjSPFkDffb3Jmq9ciASVxfHQoJiupHZJhziKoas2lZ8RF4oI/3kKZQvqoCuY2O
         pchuVaJqcwSMPDb/zU/hMVRrN2yJKWN+KFXjNFBOLr+h6i3YUSCJxPQbToyEL7KU7rxO
         rGwyFHr2ZG/z730S4kTDG81p3EAPn5/XchrUv6Mt/Iyea1xZnzuE/TRz8TqxstGwV1yB
         NbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744162972; x=1744767772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJusLOFLw3FVlyJSiG1NXof4hWrhvm7lLO1u2eukLSs=;
        b=fsf+6n2uZh3ZO4UZLVT+9KgLZbhfUx0TLDtvcKdaNCuCO3yjo00lxZSZZIW626bDoE
         oWC3OWSSUktVRkIaUEXtCLGGlEzUcrz+N1GmCgu5At2b8STvtGpRvyrm+vwL4kThxbYP
         PD2yO6g7F6gRjMikvkS7gm2qAyA4XXaRjthfPI7Ohs2DMOwbc87uELvq6LM/NSKShsjK
         jmmbBIzd3A4w/0XYISuQNuBXtSC7qtpQQO10KvQPE3/QZ5qj79GyUu6MY2J7UOk6o7TY
         tHSa1aSIMWkPo7QqLLPjTauMHa8BC/vxF8Gv2gBwzJ3asBx4wZBj9V+ErLSDRXX4Oexf
         mPZA==
X-Forwarded-Encrypted: i=1; AJvYcCVjcwL7KAghfpPXiHJoISp/z4JKxAbMWQvdFFGUBmberC6DpAbK1Qyy3PUOxuKU+C2NIanCHEZoaq+R4yBObtKXDQw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSR/sFmWBFir7iKtNkg8il5Cr6zRp4nt0RqR3iDCJKSM/K6NRk
	76lVmt7625g3LjYZxFUrx7J/dHkHf6MEmL8VdWVt12tesUW6ZXssx5sEDBm1DUoAK+IRwHtJOCQ
	MgP2DwGCe7DJPUfCVz7mvT2LyVM6kaOzfAU0=
X-Gm-Gg: ASbGncsAbFJQjxnlN4ijxCb8Eu9mmspJ2b2E4HW1R5gSir8m6WVi9jLDzP3hQe8T6lP
	e2KPDyOJpZJHVlDlJcrhsiANZX6LQFUNyFdf543pre22wNItZy2Sm0lwRqaPtk93kt9HwLa5ZIZ
	GdOzWgX2vxoswvGA/OhyhMOQKiUQ==
X-Google-Smtp-Source: AGHT+IElhtrpBtppDxERKpPI8J5syQ578uDLS5Wfhvr2wfnzkDvjFGbM7hIQ4+IjW+BocX8w2GE1A48tSfY/B2fJwPg=
X-Received: by 2002:a05:6820:1b85:b0:603:f973:1b1 with SMTP id
 006d021491bc7-6045d8cdb0fmr347498eaf.0.1744162971804; Tue, 08 Apr 2025
 18:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr>
 <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com> <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com>
In-Reply-To: <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2025 18:42:25 -0700
X-Gm-Features: ATxdqUFIhxo_L_v3xImwXMHDTyTeIfMvnVaxivJ4UHgONB3_IUMDOvluSNmN4SU
Message-ID: <CAMKF1soyfmqbvo918uaTaAqPaMtv=EFtZXgXkiyRc4vAyTdQbg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: yoann.congal@smile.fr
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 01:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116718

On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Yoann Congal via lists.openembedded.=
org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
> Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa <martin.jansa@gmail.com> a=
 =C3=A9crit :
> >
> > This seems to cause:
> >
> > ERROR: QA Issue: lib32-cmatrix: Files/directories were installed but
> > not shipped in any package:
> >   /usr/lib
> >   /usr/lib/X11
> >   /usr/lib/X11/fonts
> >   /usr/lib/X11/fonts/misc
> >   /usr/lib/X11/fonts/misc/mtx.pcf
> > Please set FILES such that these items are packaged. Alternatively if
> > they are unneeded, avoid installing them or delete them within
> > do_install.
> > lib32-cmatrix: 5 installed and not shipped files. [installed-vs-shipped=
]

These files look arch independent, We can think of putting them into
separate output packages and install them into ${datadir} and mark them all=
arch
ideally. But I think that might require spinning it into two recipes. Other=
wise
using nonarch_libdir during install should work I guess.

> >
> > in cases where libdir isn't /usr/lib (e.g. /usr/lib32 or /usr/lib64).
> > Even in builds without x11 in DISTRO_FEATUERS.
>
> I will look into it. Thanks for the report!
>
> >
> > On Wed, Apr 2, 2025 at 12:13=E2=80=AFAM Yoann Congal via
> > lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> > wrote:
> > >
> > > From: Yoann Congal <yoann.congal@smile.fr>
> > >
> > > cmatrix configuration code choose where to install fonts based on wha=
t
> > > directory exists on build host. This is not reproducible[0].
> > >
> > > Remove the existence check and change the lists to the ones matching
> > > OpenEmbedded paths.
> > >
> > > [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/buil=
ds/38/steps/32/logs/stdio
> > >
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > ---
> > >  ...Prevent-configuration-from-reading-h.patch | 58 +++++++++++++++++=
++
> > >  .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  7 ++-
> > >  2 files changed, 63 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0001-rep=
roducibility-Prevent-configuration-from-reading-h.patch
> > >
> > > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducib=
ility-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extended=
/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.=
patch
> > > new file mode 100644
> > > index 0000000000..5f23252605
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-P=
revent-configuration-from-reading-h.patch
> > > @@ -0,0 +1,58 @@
> > > +From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 20=
01
> > > +From: Yoann Congal <yoann.congal@smile.fr>
> > > +Date: Tue, 1 Apr 2025 23:42:39 +0200
> > > +Subject: [PATCH] reproducibility: Prevent configuration from reading=
 host
> > > + directories
> > > +
> > > +Current code choose where to install fonts based on what directory
> > > +exists on build host. This is not reproducible.
> > > +
> > > +Remove the existence check and change the lists to the one matching
> > > +OpenEmbedded paths.
> > > +
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > +---
> > > + CMakeLists.txt | 8 ++------
> > > + 1 file changed, 2 insertions(+), 6 deletions(-)
> > > +
> > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > +index c5548b3..c9af31c 100644
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -7,8 +7,8 @@ set(VERSION "2.0")
> > > +
> > > + # These are relative to CMAKE_INSTALL_PREFIX
> > > + # which by default is "/usr/local"
> > > +-set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts")
> > > +-set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" "s=
hare/fonts/X11/misc")
> > > ++set(CONSOLE_FONTS_DIRS "share/consolefonts")
> > > ++set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
> > > +
> > > + set(MKFONTDIR "/usr/bin/mkfontdir")
> > > +
> > > +@@ -47,16 +47,13 @@ install(TARGETS cmatrix DESTINATION bin)
> > > +
> > > + if     (UNIX)
> > > +       foreach    (CONSOLE_FONTS_DIR ${CONSOLE_FONTS_DIRS})
> > > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${CONSO=
LE_FONTS_DIR}")
> > > +                       message(STATUS "Installing matrix console fon=
ts to ${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
> > > +                       install(FILES
> > > +                               "${CMAKE_SOURCE_DIR}/matrix.fnt"
> > > +                               "${CMAKE_SOURCE_DIR}/matrix.psf.gz"
> > > +                               DESTINATION "${CONSOLE_FONTS_DIR}")
> > > +-              endif  ()
> > > +       endforeach ()
> > > +       foreach    (X_FONTS_DIR ${X_FONTS_DIRS})
> > > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${X_FON=
TS_DIR}")
> > > +                       message(STATUS "Installing matrix X window fo=
nts to ${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
> > > +                       install(FILES
> > > +                               "${CMAKE_SOURCE_DIR}/mtx.pcf"
> > > +@@ -67,7 +64,6 @@ if     (UNIX)
> > > +                               "execute_process(COMMAND \"${MKFONTDI=
R}\" \"${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}\")")
> > > +                       install(CODE
> > > +                               "message(STATUS \"If this is the firs=
t time you have installed CMatrix you will probably have to restart X windo=
w in order to use the mtx.pcf font.\")")
> > > +-              endif  ()
> > > +       endforeach ()
> > > + endif  ()
> > > +
> > > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-o=
e/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > index 6b6acf1be8..829e9588c8 100644
> > > --- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > @@ -3,7 +3,10 @@ SUMMARY =3D "Terminal based 'The Matrix' screen impl=
ementation"
> > >  LICENSE =3D "GPL-3.0-only"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
> > >
> > > -SRC_URI =3D "git://github.com/abishekvashok/cmatrix.git;branch=3Dsta=
ble;protocol=3Dhttps"
> > > +SRC_URI =3D " \
> > > +    git://github.com/abishekvashok/cmatrix.git;branch=3Dstable;proto=
col=3Dhttps \
> > > +    file://0001-reproducibility-Prevent-configuration-from-reading-h=
.patch \
> > > +"
> > >  SRCREV =3D "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
> > >  S =3D "${WORKDIR}/git"
> > >
> > > @@ -11,4 +14,4 @@ inherit cmake
> > >
> > >  DEPENDS +=3D "ncurses"
> > >
> > > -FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/*"
> > > +FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/* ${libdir}/X11/fonts/"
> > >
> > >
> > >
>
>
>
> --
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116716): https://lists.openembedded.org/g/openembedde=
d-devel/message/116716
> Mute This Topic: https://lists.openembedded.org/mt/112036531/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

