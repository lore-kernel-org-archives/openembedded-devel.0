Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46570C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:35:13 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.27486.1748784903282766525
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ks6RJS59;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e75f30452so23785997b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Jun 2025 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748784902; x=1749389702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC8bwqA4c1b7dgD/GnFE/gneucgYqCRMBne2I/sAx/0=;
        b=ks6RJS59cukVVCl/4LAkaor2Cd/gxS96IVbvxb9m9x7DLOLuHN6tW0LYvn3PadlpTa
         9LcaBod2hUclMBnWucUyJzWMhkeOCU4Kr1+vObbbb73V0G1qKTtV7X4w9TbnzPo1vokn
         0akZFz2NavjNjGi54gKIZIQbIgdHOZoiWlWRO6EwshvOIebjh/qf37fTetgWV99LES6D
         T2yoXioiS+ESXH55MTcKr/tnMmWXETpLJXW11W1h2VeMxpsSLjd+gBUyhR0y8zxjyPhs
         4hDqUWlr9EolDeWB3Vy54LyxXCtpVG2a095IocB6sF60TQLQhjAJMuJhB6lpfCkpc2tI
         HI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748784902; x=1749389702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC8bwqA4c1b7dgD/GnFE/gneucgYqCRMBne2I/sAx/0=;
        b=H4oJYuyQXPcokVMuEwf9TvFHkvjSSfqWy3TUFu5qhfeKwgj0agw33t3tDm4xgPrVEs
         /4zXddny5Px8JIJeA82ANx7tWpEISnZ3BAjE2tIiaZthKFpPv8Ba+95bni+poQ8gnZya
         SILo2B/IgNWJjeti/w4yh7phskQEZa4WxXxEO4PcU5FKoTM9bKQgA3UEC8q2SzWqZkhm
         jXUVrGQbNWNQNzzF8ipsza2tuc6akToyMxawxWb8XsrXrizXH7CAXcD4e8KFobjbMfnb
         mO+A34X+pyf2IwNRvDx5ji+zxjXVAHQmfVuprMYGGdoRMQbIlov2BgOAHmSqXj+3Sfz2
         W0gw==
X-Gm-Message-State: AOJu0YzeZQ9eoFlGdRtOClPm/zZbXGjFHrc9xOrCGtnoyWs4W+lWBbrx
	pgIIJFAGKDPyJZtowHK8Xcjr10vHE/2pFUgEMhOKNfShgCuNbOa2voe4F5wyJ77gEhG2GnIR/8w
	7x0e5br53goB9xNDoOlf4V1Yw4nvwXHY=
X-Gm-Gg: ASbGncua0pXA+o6A/jHEk4xSgWM/1S33sW2yj1XUI8ZMfEAxfaSV1c6Q4ae0MGWm34z
	SM/5yVqasLScMi2aU1SDQG6rNPk7kz3Sx0kxdzNcbsW9V8ygIos++nxGD1pX70iaDnvp+GlRLjD
	LT8RH8OsHeW9kQQC0/+4s6ntLA03N0twD+NBIwxWOwcaO6b5+HcYwGMtph8ttVJ/QKNQ==
X-Google-Smtp-Source: AGHT+IF30X8HJ64VAE+AdgLM49GK59sFU9OlEcOz8DZxfpBqskWQ+vqxCUq3PJ2UU5HgHgCRBZ0imaEOEc5D0OP+v9o=
X-Received: by 2002:a05:690c:490d:b0:70e:7706:8250 with SMTP id
 00721157ae682-70f97e8b25fmr155659477b3.16.1748784902334; Sun, 01 Jun 2025
 06:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171139.525281-1-jan.vermaete@gmail.com> <CAMKF1sqUJ3rK5Q18pmtNwAE8vfyqMLeC8_Mygpv5D-XSD-DMZw@mail.gmail.com>
In-Reply-To: <CAMKF1sqUJ3rK5Q18pmtNwAE8vfyqMLeC8_Mygpv5D-XSD-DMZw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 1 Jun 2025 15:34:51 +0200
X-Gm-Features: AX0GCFtkyUjM2J_ro9iB0P9sOzQMVN-jlsvSAJGpJxl7zTPM7Bw0m6SiufGPBmg
Message-ID: <CABF_=yixxqZh=sK3JbcvRPCEW17vWSXbK2_NhbOtR=5kD0CEpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: version bump (3.4.0 -> 3.6.0)
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jun 2025 13:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117694

Hi Khem,

Sorry for that.  I was testing it in a larger ROS 2 system where I did
not see this issue.

I do have the same issue when running it in a minimal system.

```
BBLAYERS ?=3D " \
    ${TOPDIR}/../layers/meta-openembedded/meta-networking \
    ${TOPDIR}/../layers/meta-openembedded/meta-oe \
    ${TOPDIR}/../layers/meta-openembedded/meta-python \
    ${TOPDIR}/../layers/poky/meta \
    ${TOPDIR}/../layers/poky/meta-poky \
    ${TOPDIR}/../layers/poky/meta-yocto-bsp"
```

It must be related to this:
https://github.com/freeglut/freeglut/commit/41a7cf81aa28cbbd5f7f3fc32c1ffef=
6465bbd8d

And adding this to the recipe solved it.   However, for now I do not
have any system using it.

EXTRA_OECMAKE +=3D "-DOPENGL_opengl_LIBRARY=3D${STAGING_LIBDIR}/libGL.so"

Could you check if this solution seems to be okay for you?  If so I
can provide you with a v2 of the patch.

Br

On Sun, Jun 1, 2025 at 3:27=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> it fails to configure
>
> https://errors.yoctoproject.org/Errors/Details/856261/
>
> On Fri, May 30, 2025 at 10:11=E2=80=AFAM Jan Vermaete via
> lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > - apply upstream patch to compile at master
> > - added HOMEPAGE
> > - downloads are not from github
> >   "Stable releases are available on our releases page on github, where =
you can find more information about each release. All releases are also mir=
rored on the old downloads page on sourceforge."
> >   @see: https://freeglut.sourceforge.net/
> > - fixed 'devtool check-upgrade-status'
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  ...formDestroyContext-prototype-for-C23.patch | 30 +++++++++++++++++++
> >  .../{freeglut_3.4.0.bb =3D> freeglut_3.6.0.bb}  | 14 +++++++--
> >  2 files changed, 41 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut/0001-egl=
-fix-fgPlatformDestroyContext-prototype-for-C23.patch
> >  rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb =3D> freeg=
lut_3.6.0.bb} (69%)
> >
> > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fg=
PlatformDestroyContext-prototype-for-C23.patch b/meta-oe/recipes-graphics/f=
reeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.pa=
tch
> > new file mode 100644
> > index 0000000000..13ba2316f3
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatfor=
mDestroyContext-prototype-for-C23.patch
> > @@ -0,0 +1,30 @@
> > +From 800772e993a3ceffa01ccf3fca449d3279cde338 Mon Sep 17 00:00:00 2001
> > +From: Sam James <sam@gentoo.org>
> > +Date: Sun, 17 Nov 2024 01:14:26 +0000
> > +Subject: [PATCH 1/1] egl: fix fgPlatformDestroyContext prototype for C=
23
> > +
> > +C23 removes unprototyped functions, so this conflicted with the defini=
tion
> > +in fg_init_x11.c.
> > +
> > +Bug: https://github.com/freeglut/freeglut/issues/186
> > +
> > +Upstream-Status: Backport [https://github.com/freeglut/freeglut/commit=
/800772e993a3ceffa01ccf3fca449d3279cde338]
> > +---
> > + src/egl/fg_init_egl.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
> > +index 592c5221..8753dc0b 100644
> > +--- a/src/egl/fg_init_egl.h
> > ++++ b/src/egl/fg_init_egl.h
> > +@@ -28,6 +28,6 @@
> > +
> > + extern void fghPlatformInitializeEGL();
> > + extern void fghPlatformCloseDisplayEGL();
> > +-extern void fgPlatformDestroyContext();
> > ++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, =
SFG_WindowContextType MContext );
> > +
> > + #endif
> > +--
> > +2.39.5
> > +
> > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta=
-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
> > similarity index 69%
> > rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > rename to meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
> > index 2cd00b0349..ebd5fbcbce 100644
> > --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
> > @@ -1,10 +1,15 @@
> >  DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative t=
o the OpenGL \
> >                 Utility Toolkit (GLUT) library"
> > +HOMEPAGE =3D "https://freeglut.sourceforge.net"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e7=
8adfb"
> >
> > -SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV=
}/${BPN}-${PV}.tar.gz"
> > -SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de54583a838644d=
cd42bb0ea0c6f3eaec"
> > +SRC_URI =3D "\
> > +    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-$=
{PV}.tar.gz \
> > +    file://0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.pat=
ch \
> > +"
> > +
> > +SRC_URI[sha256sum] =3D "9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf3=
7d269e3288a6c3ea52"
> >
> >  inherit cmake features_check pkgconfig
> >
> > @@ -22,7 +27,10 @@ CFLAGS +=3D "-Wno-implicit-function-declaration"
> >
> >  PROVIDES +=3D "mesa-glut"
> >
> > -DEPENDS =3D "virtual/libgl libxi"
> > +DEPENDS +=3D "virtual/libgl libxi"
> > +
> > +UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> > +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
> >
> >  do_install:append() {
> >      # Remove buildpaths
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117675): https://lists.openembedded.org/g/openembed=
ded-devel/message/117675
> > Mute This Topic: https://lists.openembedded.org/mt/113383172/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

