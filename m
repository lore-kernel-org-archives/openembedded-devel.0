Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A03C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 17:44:39 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.90770.1701971070767299968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 09:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZxJPvr8;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5907ded6287so261270eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 09:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701971070; x=1702575870; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdCQ4VwbHmj8ySJxM0AxNxyBY48i4/y8daUpUuRx2KU=;
        b=SZxJPvr8PNT+GxXiOuMOXGo8oGBakII6IgDOfL6D/xVZslAwx867AEVpADJ9DT9X5q
         fkzYKC/nYwrUhYE5FBPdAGFYFMbsKN8wpY5exRrPjfBslM6bfL/HdxZIznUS3EvAYSz7
         RUvfuhoLX4ZjZJM4//e94A/jAYhw1c79ogSqNnpMUvk4cEInkooUjw+/3avohmotmghM
         9D8oUaA0rdwHl5ywVyhiCD0uew8tdAbDYeXow9Dq5AUUlePMj8ngmMv8S7+++QDnlVgv
         F3IgF7OHyDmBs/g62KLD4+OzUhLhWBaxvo/nRwPFL309LlS77v53Qoq8IUJ+fQyr6SCG
         Qwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971070; x=1702575870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdCQ4VwbHmj8ySJxM0AxNxyBY48i4/y8daUpUuRx2KU=;
        b=V/TxtnI9x8qi5Uh1AXUuSk5fNrwIP1IzL4+DVRnqm/fXRnuM12SRaGTCD5uL0dJuXt
         nwaAw591Z1dHfxZf6T6qf26t8+fAJqB4nAZY6wLogiPD+9OcoTcI/bSJQiH2rGPX7QfB
         e+mLay9NfE0uTXnQsUX4aZV/f+AldMXwGQ36Sxa8Nzsbh/RhMuaLygUKqKYhxUEon/t8
         tBRZHk+5EHZUfAEYjf7YP8sSis8IqB1IVyT7gi9kw9n7vKWDh6xvk3Io5I1as6k1+Y4E
         oUPOPdgTwEI54JRwhGngfclr/VH9960AG8fCoVlV+I7od+h+sSyVAVXbmHm/6/I37K0f
         4tkA==
X-Gm-Message-State: AOJu0Yx2DZs0PpCW+P3m6WnXe34biP4n2cRxxyHENDSRStgGZkMxFQAc
	Z5ih8OZe09Z1USfoF106/E/iOTrwGuNVb4abK2Y=
X-Google-Smtp-Source: AGHT+IGDwOLbgZqXuvbT7Ssy2lfv2VE1xWCH9z3rTwoEvrzkcnZffLWmb0PE2jT6QIMG1rtZ0lorQScPWsLrq/WXkuM=
X-Received: by 2002:a05:6820:1ac8:b0:58e:1c47:76c3 with SMTP id
 bu8-20020a0568201ac800b0058e1c4776c3mr3313364oob.15.1701971069819; Thu, 07
 Dec 2023 09:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20231207091300.1292252-1-alperyasinak1@gmail.com>
In-Reply-To: <20231207091300.1292252-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 09:44:03 -0800
Message-ID: <CAMKF1srzfKRXu_hdf7s5ZV6Us5tKbZ_qjDi9JqMQmMivE7ha_A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 17:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107284

On Thu, Dec 7, 2023 at 1:13=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> w=
rote:
>
> * checkfile.patch removed because fixed in the new version -> https://git=
lab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64=
b567783825a2c18b87971
> * License-Update: Fix spelling/wording
>
> Changelog:
>
> * Fix uninitialized read in MGAEnableSecondOutPut
> * gitlab CI: add a basic build test
> * Fix spelling/wording issues
> * Build xz tarballs instead of bzip2
> * configure.ac: fix cross-compilation
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../xf86-video-mga/checkfile.patch            | 68 -------------------
>  ...o-mga_2.0.0.bb =3D> xf86-video-mga_2.0.1.bb} |  8 +--
>  2 files changed, 3 insertions(+), 73 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/c=
heckfile.patch
>  rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_2.0.0.bb =3D=
> xf86-video-mga_2.0.1.bb} (66%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfil=
e.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.pat=
ch
> deleted file mode 100644
> index ceae6dfba..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=
=3D57606]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Thu, 29 Nov 2012 11:00:43 +0000
> -Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> -
> -Automatically enabling or disabling a feature based on installed files i=
sn't
> -deterministic, and AC_CHECK_FILE returns an error when cross-compiling.
> -
> -Fix this by enabling DRI by default, and removing the explicit file chec=
ks as
> -pkg-config is good enough.
> -
> -(#57606)
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - configure.ac |   25 ++-----------------------
> - 1 file changed, 2 insertions(+), 23 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index fca1a9c..d2aa2ed 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> -             [moduledir=3D"$libdir/xorg/modules"])
> -
> - AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> --                                  [Disable DRI support [[default=3Dauto=
]]]),
> -+                                  [Disable DRI support [[default=3Denab=
led]]]),
> -               [DRI=3D"$enableval"],
> --              [DRI=3Dauto])
> -+              [DRI=3Dyes])
> - AC_ARG_ENABLE(exa,
> -               AS_HELP_STRING([--disable-exa],
> -                              [Disable EXA support [[default=3Denabled]]=
]),
> -@@ -76,27 +76,6 @@ sdkdir=3D`$PKG_CONFIG --variable=3Dsdkdir xorg-server=
`
> -
> - # Checks for libraries.
> -
> --if test "x$DRI" !=3D xno; then
> --        AC_CHECK_FILE([${sdkdir}/dri.h],
> --                      [have_dri_h=3D"yes"], [have_dri_h=3D"no"])
> --        AC_CHECK_FILE([${sdkdir}/sarea.h],
> --                      [have_sarea_h=3D"yes"], [have_sarea_h=3D"no"])
> --        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> --                      [have_dristruct_h=3D"yes"], [have_dristruct_h=3D"=
no"])
> --fi
> --
> --AC_MSG_CHECKING([whether to include DRI support])
> --if test "x$DRI" =3D xauto; then
> --        if test "x$have_dri_h" =3D xyes && \
> --           test "x$have_sarea_h" =3D xyes && \
> --           test "x$have_dristruct_h" =3D xyes; then
> --                DRI=3D"yes"
> --        else
> --                DRI=3D"no"
> --        fi
> --fi
> --AC_MSG_RESULT([$DRI])
> --
> - AM_CONDITIONAL(DRI, test "x$DRI" =3D xyes)
> - if test "x$DRI" =3D xyes; then
> -         PKG_CHECK_MODULES(DRI, [libdrm >=3D 2.0 xf86driproto])
> ---
> -1.7.10.4
> -
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb=
 b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> similarity index 66%
> rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
> rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> index a9ae901d0..34b3e4cde 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> @@ -4,16 +4,14 @@ SUMMARY =3D "X.Org X server -- Matrox MGA display drive=
r"
>
>  DESCRIPTION =3D "mga is an Xorg driver for Matrox video cards"
>
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbc1395d2cd32dfc5d6c57d2d8f83d=
3fc"
> -
> -SRC_URI +=3D "file://checkfile.patch"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4aa220f495ce9be5ce4243d21ebac=
14f"

Why did this checksum change? Please document the change in commit message =
with

License-Update: <reason>

>
>  DEPENDS +=3D "virtual/libx11 libpciaccess"
>
>  COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
>
> -SRC_URI[md5sum] =3D "b8fc99b4adea8bfe80156b13df4b6c9c"
> -SRC_URI[sha256sum] =3D "268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf=
456924e9fdbb5d79"
> +XORG_DRIVER_COMPRESSOR =3D ".tar.xz"
> +SRC_URI[sha256sum] =3D "27a33b70837965bb4a5f27fd260be085ca5bba837a4e6290=
7f093c2f205603ab"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'd=
ri', '', d)}"
>  PACKAGECONFIG[dri] =3D "--enable-dri,--disable-dri,drm xorgproto,xserver=
-xorg-extension-dri"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107275): https://lists.openembedded.org/g/openembedde=
d-devel/message/107275
> Mute This Topic: https://lists.openembedded.org/mt/103031116/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

