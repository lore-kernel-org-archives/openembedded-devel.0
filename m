Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99174C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 06:56:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.2565.1744181774119056384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 23:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Twl1SJng;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3466385f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744181772; x=1744786572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEbNmuNextnNd72X1iLqa7WL3OUTiFhvn9AxId0s238=;
        b=Twl1SJng1h/wLfIAg+E9RbGNZTgRnCJSdgC5nKGjWrJsHb3WGgYEr1uqvx2kgGwbmD
         ZNFx96Vc5/xWtrIV3nJa+3DS94OVP8YGlWtaSk9zWUqrR5/BiOiGsuCHSEBK2DOj75EA
         0UTOIy6fldYxEConSjg5rZeKQvHNHxanTmAYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181772; x=1744786572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEbNmuNextnNd72X1iLqa7WL3OUTiFhvn9AxId0s238=;
        b=GpkcKT7Kt+OhxWwStmx6xMUJQ/hgh0g0e6fpCmyu3+0iqD9n47IDAlzKxrfDlAIVn8
         exC1CmcR8vTWAW00XOQFLeyhVhIah3V6Itk30F+taK6OvvTsTRQbJphQyamIdBulCq/r
         HFFJmUBQjLXiPEd1/M5+jNcbB41mkBBCFegSWT45PkPsYuxrv+PIrry31FerOHgUS7K+
         5d9wJTzee9IkSaYbLkUwFCZseLFJ7iMieG2D6BRqcLeRcBjFLNy7EIhrgVWxa1sGTzU/
         5I/Aj84z1dFePEe3vOHHnSENlFNI4yQKGyPYvycRTrsx3ZyfMOpRaxNb/bXgk1Tc4mb5
         U69Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqwhLiqKHyuk3tid/QPTGKMrlInkjX9JOkazUuTdNyjoZVFfX3FnTR05CTXGTK6Hbk7t1njlPM74z+FBCV/KG8/7g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUw3/HqhFtxDovvgoX8JcCyWX+4l/Jy9J7RXggWwDmLUFmOEyv
	qWpyktWzNNIWW8rQu93siaj+t5nJ3iQdLe8QcTM3YNDzTYU3OdMrQgdYj4lkFYphrP9jr/gQnQx
	lL7Vo+tDIYkgUFsKcO1qCbDs9F6Vl06arFBMxqQ==
X-Gm-Gg: ASbGnctPjzU5A9VSOMy7Vb9oZqf4yXUA6ixGaj1ZenoQTNgY3CqCOf+3lj7wfIZ7hiC
	Jl36z0+/zFqhoytQ4NdFRgYvnbz98rkI19xRS1Kc9RSfQ6dqDe1eJ/xsz/LVZ9/IfR/+axXH5LT
	i41xLadUvi3kIlxCW/auxbRzfmUmQTJnJ/zNygPRtOtsSLSUJu9rSqi+s=
X-Google-Smtp-Source: AGHT+IHOmHg+S6vUDLfwirMD8be53JmoyDt6OpKndOUrtUJIdRHdoQ7jAKnS4tyuePxL7frvexkvtvJpJEHif4RtnpE=
X-Received: by 2002:a5d:6d83:0:b0:391:49f6:dad4 with SMTP id
 ffacd0b85a97d-39d885649b4mr1086874f8f.41.1744181772226; Tue, 08 Apr 2025
 23:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr>
 <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
 <CAMSfU+6Egmdumnc5JxOoRDR_tM2nMphkbG8gNBqarhHZSG3k9g@mail.gmail.com> <CAMKF1soyfmqbvo918uaTaAqPaMtv=EFtZXgXkiyRc4vAyTdQbg@mail.gmail.com>
In-Reply-To: <CAMKF1soyfmqbvo918uaTaAqPaMtv=EFtZXgXkiyRc4vAyTdQbg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 9 Apr 2025 08:55:46 +0200
X-Gm-Features: ATxdqUG-372Xo13LKFBrh0KobACY2KUa3RwAhmsjREJKw-o9WeW4gt2gV8_8HZw
Message-ID: <CAMSfU+5LAe4EXgjrBj8+UYgY-C9+kqXBSUvuXEN+Zqhq4=nrSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 06:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116724

Le mer. 9 avr. 2025 =C3=A0 03:42, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :
>
> On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Yoann Congal via lists.openembedde=
d.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > Le mar. 8 avr. 2025 =C3=A0 18:19, Martin Jansa <martin.jansa@gmail.com>=
 a =C3=A9crit :
> > >
> > > This seems to cause:
> > >
> > > ERROR: QA Issue: lib32-cmatrix: Files/directories were installed but
> > > not shipped in any package:
> > >   /usr/lib
> > >   /usr/lib/X11
> > >   /usr/lib/X11/fonts
> > >   /usr/lib/X11/fonts/misc
> > >   /usr/lib/X11/fonts/misc/mtx.pcf
> > > Please set FILES such that these items are packaged. Alternatively if
> > > they are unneeded, avoid installing them or delete them within
> > > do_install.
> > > lib32-cmatrix: 5 installed and not shipped files. [installed-vs-shipp=
ed]
>
> These files look arch independent, We can think of putting them into
> separate output packages and install them into ${datadir} and mark them a=
llarch
> ideally. But I think that might require spinning it into two recipes. Oth=
erwise
> using nonarch_libdir during install should work I guess.

Those files are fonts for X and the console. I've looked at other
recipes writing such fonts and they seem to use subdirs of $libdir.
I've tried to find an automated way for cmatrix to find the correct
path to install its fonts but I did not find any obvious.

I like the nonarch_libdir idea: My plan:
* change the patch to set the path to a marker @BASE_PATH@ or something
* in do_configure:prepend(), sed the correct path (nonarch_libdir) into the=
 file
* Update FILES:${PN} to include the font files

Sounds good?

> > >
> > > in cases where libdir isn't /usr/lib (e.g. /usr/lib32 or /usr/lib64).
> > > Even in builds without x11 in DISTRO_FEATUERS.
> >
> > I will look into it. Thanks for the report!
> >
> > >
> > > On Wed, Apr 2, 2025 at 12:13=E2=80=AFAM Yoann Congal via
> > > lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.or=
g>
> > > wrote:
> > > >
> > > > From: Yoann Congal <yoann.congal@smile.fr>
> > > >
> > > > cmatrix configuration code choose where to install fonts based on w=
hat
> > > > directory exists on build host. This is not reproducible[0].
> > > >
> > > > Remove the existence check and change the lists to the ones matchin=
g
> > > > OpenEmbedded paths.
> > > >
> > > > [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/bu=
ilds/38/steps/32/logs/stdio
> > > >
> > > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > > ---
> > > >  ...Prevent-configuration-from-reading-h.patch | 58 +++++++++++++++=
++++
> > > >  .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  7 ++-
> > > >  2 files changed, 63 insertions(+), 2 deletions(-)
> > > >  create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0001-r=
eproducibility-Prevent-configuration-from-reading-h.patch
> > > >
> > > > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproduc=
ibility-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extend=
ed/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-=
h.patch
> > > > new file mode 100644
> > > > index 0000000000..5f23252605
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility=
-Prevent-configuration-from-reading-h.patch
> > > > @@ -0,0 +1,58 @@
> > > > +From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 =
2001
> > > > +From: Yoann Congal <yoann.congal@smile.fr>
> > > > +Date: Tue, 1 Apr 2025 23:42:39 +0200
> > > > +Subject: [PATCH] reproducibility: Prevent configuration from readi=
ng host
> > > > + directories
> > > > +
> > > > +Current code choose where to install fonts based on what directory
> > > > +exists on build host. This is not reproducible.
> > > > +
> > > > +Remove the existence check and change the lists to the one matchin=
g
> > > > +OpenEmbedded paths.
> > > > +
> > > > +Upstream-Status: Inappropriate [embedded specific]
> > > > +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > > +---
> > > > + CMakeLists.txt | 8 ++------
> > > > + 1 file changed, 2 insertions(+), 6 deletions(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index c5548b3..c9af31c 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -7,8 +7,8 @@ set(VERSION "2.0")
> > > > +
> > > > + # These are relative to CMAKE_INSTALL_PREFIX
> > > > + # which by default is "/usr/local"
> > > > +-set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts=
")
> > > > +-set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" =
"share/fonts/X11/misc")
> > > > ++set(CONSOLE_FONTS_DIRS "share/consolefonts")
> > > > ++set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
> > > > +
> > > > + set(MKFONTDIR "/usr/bin/mkfontdir")
> > > > +
> > > > +@@ -47,16 +47,13 @@ install(TARGETS cmatrix DESTINATION bin)
> > > > +
> > > > + if     (UNIX)
> > > > +       foreach    (CONSOLE_FONTS_DIR ${CONSOLE_FONTS_DIRS})
> > > > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${CON=
SOLE_FONTS_DIR}")
> > > > +                       message(STATUS "Installing matrix console f=
onts to ${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
> > > > +                       install(FILES
> > > > +                               "${CMAKE_SOURCE_DIR}/matrix.fnt"
> > > > +                               "${CMAKE_SOURCE_DIR}/matrix.psf.gz"
> > > > +                               DESTINATION "${CONSOLE_FONTS_DIR}")
> > > > +-              endif  ()
> > > > +       endforeach ()
> > > > +       foreach    (X_FONTS_DIR ${X_FONTS_DIRS})
> > > > +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${X_F=
ONTS_DIR}")
> > > > +                       message(STATUS "Installing matrix X window =
fonts to ${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
> > > > +                       install(FILES
> > > > +                               "${CMAKE_SOURCE_DIR}/mtx.pcf"
> > > > +@@ -67,7 +64,6 @@ if     (UNIX)
> > > > +                               "execute_process(COMMAND \"${MKFONT=
DIR}\" \"${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}\")")
> > > > +                       install(CODE
> > > > +                               "message(STATUS \"If this is the fi=
rst time you have installed CMatrix you will probably have to restart X win=
dow in order to use the mtx.pcf font.\")")
> > > > +-              endif  ()
> > > > +       endforeach ()
> > > > + endif  ()
> > > > +
> > > > diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta=
-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > > index 6b6acf1be8..829e9588c8 100644
> > > > --- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > > +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> > > > @@ -3,7 +3,10 @@ SUMMARY =3D "Terminal based 'The Matrix' screen im=
plementation"
> > > >  LICENSE =3D "GPL-3.0-only"
> > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80=
d47fae504"
> > > >
> > > > -SRC_URI =3D "git://github.com/abishekvashok/cmatrix.git;branch=3Ds=
table;protocol=3Dhttps"
> > > > +SRC_URI =3D " \
> > > > +    git://github.com/abishekvashok/cmatrix.git;branch=3Dstable;pro=
tocol=3Dhttps \
> > > > +    file://0001-reproducibility-Prevent-configuration-from-reading=
-h.patch \
> > > > +"
> > > >  SRCREV =3D "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > @@ -11,4 +14,4 @@ inherit cmake
> > > >
> > > >  DEPENDS +=3D "ncurses"
> > > >
> > > > -FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/*"
> > > > +FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/* ${libdir}/X11/fonts=
/"
> > > >
> > > >
> > > >
> >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116716): https://lists.openembedded.org/g/openembed=
ded-devel/message/116716
> > Mute This Topic: https://lists.openembedded.org/mt/112036531/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS

