Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5890C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 17:54:49 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.91270.1701971680866118448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 09:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUBgbx4Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so965551a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701971680; x=1702576480; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShVQQZ6OWpFcuxh+3u4SitOMKSXEy64ms2X6UpD7YeM=;
        b=WUBgbx4ZBN+ceefJDw9RXS6q67fL7yw32byX4awNiRrHpTuAnHjNvQb6YHX2IwGweB
         cxSUwyi74kPKXFNJQ57FQakzVrxgOkOSfCWHigic1eUpAMr9kQ0zNqoR2ly/bbYT3Tw/
         lYtEQ1+NswPdMwYA9Y8/5E96HKFuo9yJ0gyKRQpdmL3S499FCcm9P6MgmsVCCdHAn813
         BAefNzI+cBSXuF3Mk2NCin2dDgLCGA0Pe5PQj9G/TzqmNt78SZy6ICN0nVV9e5/xvarM
         hBCAUiu6aQnQlfnQ0feXsE3Wi8l6iJPdZtydrsuAKWXNiNlgi7pcZ7W4UBRoS6Bc03eb
         nVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971680; x=1702576480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShVQQZ6OWpFcuxh+3u4SitOMKSXEy64ms2X6UpD7YeM=;
        b=kY3EV/wHSK1ipAhZdZ7to7RTkNaa2oXYdIPwEw1/I19NaDMTWgKeOosErFVL7Vwpxm
         zAwkVLGmr+nN/V9tPcbZHrceIbUy9qqZ5FzOxOMjB/C36O9CMPWv5Uyvt99aSoBRj+14
         57MdmaMYHG707A4n44rKjwGeIOYMAfQnyceQzDq9jolTXyRsx7hbR5tBT8JpdEgCURf9
         JX4CXx9fOq0+QBTa+YugnGXUISVCayXnDr7ZX8xeGPRKllsokwrc4DXDVm2jK7vsqvxa
         D2OcymzbfQIk2a4nYboWi8FxC2q6DMrYExzk/hhu4nyJWTs1kvDk52rbtF40oihchPG6
         Rv/A==
X-Gm-Message-State: AOJu0Yz+WAQdE+ga/fI51bD4rg1sAX1GQzI0WFjikY/dVhSpIj22k4K/
	fPIZmrZTGOsXhd1lK3yRcQ/lDxeYZobrEnuZGmH/+fQeo4A1lA==
X-Google-Smtp-Source: AGHT+IHfXMq4XmBVnP7hKCtbC2Utpuh2iYmtC+/tSPas/QIFh/sjwi4M4fh3ZS362ngA4tPFoVHQCdWs1KvNpzgO2C8=
X-Received: by 2002:a17:90a:d910:b0:285:d32c:670f with SMTP id
 c16-20020a17090ad91000b00285d32c670fmr2872411pjv.10.1701971680153; Thu, 07
 Dec 2023 09:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20231207091300.1292252-1-alperyasinak1@gmail.com> <CAMKF1srzfKRXu_hdf7s5ZV6Us5tKbZ_qjDi9JqMQmMivE7ha_A@mail.gmail.com>
In-Reply-To: <CAMKF1srzfKRXu_hdf7s5ZV6Us5tKbZ_qjDi9JqMQmMivE7ha_A@mail.gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Thu, 7 Dec 2023 20:54:28 +0300
Message-ID: <CAGpma=4c4q5WpFnG6E7+ffzdjDJ2jcX1pSfF-m3QiCyQbvhBZg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 17:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107286

They just fixed the typo in a word. "MERCHANTIBILITY" ->
"MERCHANTABILITY". Also, I already added it as a description ->
"License-Update: Fix spelling/wording"

https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/1e4dbef6=
54bd31f5706b4b860f6b34c7e5e5f440

Khem Raj <raj.khem@gmail.com>, 7 Ara 2023 Per, 20:44 tarihinde =C5=9Funu ya=
zd=C4=B1:
>
> On Thu, Dec 7, 2023 at 1:13=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
> >
> > * checkfile.patch removed because fixed in the new version -> https://g=
itlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca=
64b567783825a2c18b87971
> > * License-Update: Fix spelling/wording
> >
> > Changelog:
> >
> > * Fix uninitialized read in MGAEnableSecondOutPut
> > * gitlab CI: add a basic build test
> > * Fix spelling/wording issues
> > * Build xz tarballs instead of bzip2
> > * configure.ac: fix cross-compilation
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../xf86-video-mga/checkfile.patch            | 68 -------------------
> >  ...o-mga_2.0.0.bb =3D> xf86-video-mga_2.0.1.bb} |  8 +--
> >  2 files changed, 3 insertions(+), 73 deletions(-)
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga=
/checkfile.patch
> >  rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_2.0.0.bb =
=3D> xf86-video-mga_2.0.1.bb} (66%)
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkf=
ile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.p=
atch
> > deleted file mode 100644
> > index ceae6dfba..000000000
> > --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.pat=
ch
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?=
id=3D57606]
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Thu, 29 Nov 2012 11:00:43 +0000
> > -Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> > -
> > -Automatically enabling or disabling a feature based on installed files=
 isn't
> > -deterministic, and AC_CHECK_FILE returns an error when cross-compiling=
.
> > -
> > -Fix this by enabling DRI by default, and removing the explicit file ch=
ecks as
> > -pkg-config is good enough.
> > -
> > -(#57606)
> > -
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ----
> > - configure.ac |   25 ++-----------------------
> > - 1 file changed, 2 insertions(+), 23 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index fca1a9c..d2aa2ed 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> > -             [moduledir=3D"$libdir/xorg/modules"])
> > -
> > - AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> > --                                  [Disable DRI support [[default=3Dau=
to]]]),
> > -+                                  [Disable DRI support [[default=3Den=
abled]]]),
> > -               [DRI=3D"$enableval"],
> > --              [DRI=3Dauto])
> > -+              [DRI=3Dyes])
> > - AC_ARG_ENABLE(exa,
> > -               AS_HELP_STRING([--disable-exa],
> > -                              [Disable EXA support [[default=3Denabled=
]]]),
> > -@@ -76,27 +76,6 @@ sdkdir=3D`$PKG_CONFIG --variable=3Dsdkdir xorg-serv=
er`
> > -
> > - # Checks for libraries.
> > -
> > --if test "x$DRI" !=3D xno; then
> > --        AC_CHECK_FILE([${sdkdir}/dri.h],
> > --                      [have_dri_h=3D"yes"], [have_dri_h=3D"no"])
> > --        AC_CHECK_FILE([${sdkdir}/sarea.h],
> > --                      [have_sarea_h=3D"yes"], [have_sarea_h=3D"no"])
> > --        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> > --                      [have_dristruct_h=3D"yes"], [have_dristruct_h=
=3D"no"])
> > --fi
> > --
> > --AC_MSG_CHECKING([whether to include DRI support])
> > --if test "x$DRI" =3D xauto; then
> > --        if test "x$have_dri_h" =3D xyes && \
> > --           test "x$have_sarea_h" =3D xyes && \
> > --           test "x$have_dristruct_h" =3D xyes; then
> > --                DRI=3D"yes"
> > --        else
> > --                DRI=3D"no"
> > --        fi
> > --fi
> > --AC_MSG_RESULT([$DRI])
> > --
> > - AM_CONDITIONAL(DRI, test "x$DRI" =3D xyes)
> > - if test "x$DRI" =3D xyes; then
> > -         PKG_CHECK_MODULES(DRI, [libdrm >=3D 2.0 xf86driproto])
> > ---
> > -1.7.10.4
> > -
> > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.=
bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> > similarity index 66%
> > rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.b=
b
> > rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> > index a9ae901d0..34b3e4cde 100644
> > --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
> > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> > @@ -4,16 +4,14 @@ SUMMARY =3D "X.Org X server -- Matrox MGA display dri=
ver"
> >
> >  DESCRIPTION =3D "mga is an Xorg driver for Matrox video cards"
> >
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbc1395d2cd32dfc5d6c57d2d8f8=
3d3fc"
> > -
> > -SRC_URI +=3D "file://checkfile.patch"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4aa220f495ce9be5ce4243d21eb=
ac14f"
>
> Why did this checksum change? Please document the change in commit messag=
e with
>
> License-Update: <reason>
>
> >
> >  DEPENDS +=3D "virtual/libx11 libpciaccess"
> >
> >  COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
> >
> > -SRC_URI[md5sum] =3D "b8fc99b4adea8bfe80156b13df4b6c9c"
> > -SRC_URI[sha256sum] =3D "268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fc=
bf456924e9fdbb5d79"
> > +XORG_DRIVER_COMPRESSOR =3D ".tar.xz"
> > +SRC_URI[sha256sum] =3D "27a33b70837965bb4a5f27fd260be085ca5bba837a4e62=
907f093c2f205603ab"
> >
> >  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', =
'dri', '', d)}"
> >  PACKAGECONFIG[dri] =3D "--enable-dri,--disable-dri,drm xorgproto,xserv=
er-xorg-extension-dri"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107275): https://lists.openembedded.org/g/openembed=
ded-devel/message/107275
> > Mute This Topic: https://lists.openembedded.org/mt/103031116/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

