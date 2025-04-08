Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E218C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 21:03:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7249.1744146206359858414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 14:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HYwK08rW;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso41106055e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 14:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744146204; x=1744751004; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I78gM20rNX0ZtA2kiP95eAEO+BV734M1DPM/rbv0ITg=;
        b=HYwK08rWbTN30h+7HBLUf6f/RXbCHQaqV0zss0ai05fv8cADGD9vAyf+RaSxf3vFS3
         2u09jGzs1z8W3u3wdjg7Q9ffKWBrxfHGhaRevUpEbNNTOm3NyVL3SN08qEKnUWeNb4/9
         MLhgeYTxnZDQhvZXJ7m4WCk5iIS/S97erdxsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146204; x=1744751004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I78gM20rNX0ZtA2kiP95eAEO+BV734M1DPM/rbv0ITg=;
        b=Ce8EEnEoEJ4btvjIVhi1CCW3TpGLrBy14Bo3OCh5G7W/D0dCUOTTuMuQ3SkPZm98HS
         Zt8454dQSffkKn4vV6eXfmf9UP9Upsb52g7VgFR2naSKC8JfOWK7nIUk2z4et6gIxYTG
         rlf9aSZr0tyG30oUu3WnAUdi7l7pgzYZPO/b5KyHYIzUMksvBxvh57QaNkDisF0y37y8
         41O9LDC8u/x/I4tUKNPNv3gdG8rGcFBQB2iV4aStPewg/fHOwKX1wABUE0Mw9/QmBCvG
         dsygtfHyvtm/iZkdYXa5CD7TIzibKPZcnZzNoH1xFNkLnK2eUN5qtdppob9Ujek7iQOX
         DURA==
X-Gm-Message-State: AOJu0YxCHkMre+SghWv1/B3sr7fdGDv1r7H6CH1vzfEwia0LVoNDW0O3
	RZFb8bfFZiR8441r52FwyXOKzV3EDGOw2h71/tg2bM4Ha5TjibiJYuVQAQgSHYAzE3bFP4ECfj5
	3p4SZHu6Yn7JoGgE9a0CwUYriJNjExmX4P435nA==
X-Gm-Gg: ASbGncurcoZtcaXfFp938m4qqoz2rm02MALsg61pP1EGi9cyUYw72go9aoznyfKgs74
	oHC2tXwegGpIH4KCvAogYatY7mW+6HjtT6xoTCYMlifAdVtuO1085sWPfWjgdwT3v8V/6GMoi4g
	44hPqfuceRD+I820vrGaOFJCQA6glTDbyY0wa2MB05E0j6mEit+RV38BVLPlE=
X-Google-Smtp-Source: AGHT+IEORBQd/y/xb7V7uyj2yWCztiCjxEf3jcmb8XFe3suAE3Sak94EdLOM8phifDm4HfESninXHG1H/aoHo0lqprw=
X-Received: by 2002:a05:600c:3b85:b0:43c:eeee:b706 with SMTP id
 5b1f17b1804b1-43f1ff399d6mr1224415e9.24.1744146204266; Tue, 08 Apr 2025
 14:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr> <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
In-Reply-To: <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 8 Apr 2025 23:02:57 +0200
X-Gm-Features: ATxdqUHURev8RJLhy4NllnOAXHfrU-dBOFUsCfMZAnvOX9c0XI3nuxF1kG2te8A
Message-ID: <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 21:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116716

Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :
>
> This seems to cause:
>
> ERROR: QA Issue: lib32-cmatrix: Files/directories were installed but
> not shipped in any package:
>   /usr/lib
>   /usr/lib/X11
>   /usr/lib/X11/fonts
>   /usr/lib/X11/fonts/misc
>   /usr/lib/X11/fonts/misc/mtx.pcf
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> lib32-cmatrix: 5 installed and not shipped files. [installed-vs-shipped]
>
> in cases where libdir isn't /usr/lib (e.g. /usr/lib32 or /usr/lib64).
> Even in builds without x11 in DISTRO_FEATUERS.

I will look into it. Thanks for the report!

>
> On Wed, Apr 2, 2025 at 12:13=E2=80=AFAM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > cmatrix configuration code choose where to install fonts based on what
> > directory exists on build host. This is not reproducible[0].
> >
> > Remove the existence check and change the lists to the ones matching
> > OpenEmbedded paths.
> >
> > [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds=
/38/steps/32/logs/stdio
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  ...Prevent-configuration-from-reading-h.patch | 58 +++++++++++++++++++
> >  .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  7 ++-
> >  2 files changed, 63 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0001-repro=
ducibility-Prevent-configuration-from-reading-h.patch
> >
> > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibil=
ity-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extended/c=
matrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.pa=
tch
> > new file mode 100644
> > index 0000000000..5f23252605
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Pre=
vent-configuration-from-reading-h.patch
> > @@ -0,0 +1,58 @@
> > +From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 2001
> > +From: Yoann Congal <yoann.congal@smile.fr>
> > +Date: Tue, 1 Apr 2025 23:42:39 +0200
> > +Subject: [PATCH] reproducibility: Prevent configuration from reading h=
ost
> > + directories
> > +
> > +Current code choose where to install fonts based on what directory
> > +exists on build host. This is not reproducible.
> > +
> > +Remove the existence check and change the lists to the one matching
> > +OpenEmbedded paths.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > +---
> > + CMakeLists.txt | 8 ++------
> > + 1 file changed, 2 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index c5548b3..c9af31c 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -7,8 +7,8 @@ set(VERSION "2.0")
> > +
> > + # These are relative to CMAKE_INSTALL_PREFIX
> > + # which by default is "/usr/local"
> > +-set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts")
> > +-set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" "sha=
re/fonts/X11/misc")
> > ++set(CONSOLE_FONTS_DIRS "share/consolefonts")
> > ++set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
> > +
> > + set(MKFONTDIR "/usr/bin/mkfontdir")
> > +
> > +@@ -47,16 +47,13 @@ install(TARGETS cmatrix DESTINATION bin)
> > +
> > + if     (UNIX)
> > +       foreach    (CONSOLE_FONTS_DIR ${CONSOLE_FONTS_DIRS})
> > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${CONSOLE=
_FONTS_DIR}")
> > +                       message(STATUS "Installing matrix console fonts=
 to ${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
> > +                       install(FILES
> > +                               "${CMAKE_SOURCE_DIR}/matrix.fnt"
> > +                               "${CMAKE_SOURCE_DIR}/matrix.psf.gz"
> > +                               DESTINATION "${CONSOLE_FONTS_DIR}")
> > +-              endif  ()
> > +       endforeach ()
> > +       foreach    (X_FONTS_DIR ${X_FONTS_DIRS})
> > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${X_FONTS=
_DIR}")
> > +                       message(STATUS "Installing matrix X window font=
s to ${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
> > +                       install(FILES
> > +                               "${CMAKE_SOURCE_DIR}/mtx.pcf"
> > +@@ -67,7 +64,6 @@ if     (UNIX)
> > +                               "execute_process(COMMAND \"${MKFONTDIR}=
\" \"${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}\")")
> > +                       install(CODE
> > +                               "message(STATUS \"If this is the first =
time you have installed CMatrix you will probably have to restart X window =
in order to use the mtx.pcf font.\")")
> > +-              endif  ()
> > +       endforeach ()
> > + endif  ()
> > +
> > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/=
recipes-extended/cmatrix/cmatrix_2.0.bb
> > index 6b6acf1be8..829e9588c8 100644
> > --- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > @@ -3,7 +3,10 @@ SUMMARY =3D "Terminal based 'The Matrix' screen implem=
entation"
> >  LICENSE =3D "GPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >
> > -SRC_URI =3D "git://github.com/abishekvashok/cmatrix.git;branch=3Dstabl=
e;protocol=3Dhttps"
> > +SRC_URI =3D " \
> > +    git://github.com/abishekvashok/cmatrix.git;branch=3Dstable;protoco=
l=3Dhttps \
> > +    file://0001-reproducibility-Prevent-configuration-from-reading-h.p=
atch \
> > +"
> >  SRCREV =3D "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -11,4 +14,4 @@ inherit cmake
> >
> >  DEPENDS +=3D "ncurses"
> >
> > -FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/*"
> > +FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/* ${libdir}/X11/fonts/"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116489): https://lists.openembedded.org/g/openembed=
ded-devel/message/116489
> > Mute This Topic: https://lists.openembedded.org/mt/112036531/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS

