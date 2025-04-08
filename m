Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EC5C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:19:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.213.1744129171277155282
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lh0UGIed;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549946c5346so6786447e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744129169; x=1744733969; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ThhoKjNdR3JxtJREv79drf1ZqeBSFS95nGPs7NIXww=;
        b=Lh0UGIedf7K7/k7+jsfa2iMWlPhOwLX+/3WFY/RrJVlPEA3/qiYN1hwT1CX7oAQiCH
         GgvQTDb2wFpkS2Flt/9l39+6GL5VpAXQ0UPoPbQtB09t9EIMQDbJjYG2mNtyOvBbyoP/
         1Qz9xPpzixw9aWL7CyeTdNrOopDqZmlwpxeIPHMS18Uchk37sqdKlAKo748i4T+UxBYa
         KEjVouo+J9lRIO4bNAfbgABDAsLKN8sd6KABS3ORV4miKZMdQossOr8bg2LnV5ZSj8k2
         Eiz81VVjVwzW+M6Uan5u/ZVXIwj4JYAHcGqQUmerdncrBZfnZUK+jcMzMzWsovV5Jz8P
         2s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129169; x=1744733969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ThhoKjNdR3JxtJREv79drf1ZqeBSFS95nGPs7NIXww=;
        b=c2iKyQTdHMibzr0fcY+QX/gujf+aEhejkAuIm38GfwGw5obPO/VLHqrBlyUBCIuIG+
         hvxIYUhc6va3jCERq0uOiyO67Ert4t7QDupW+UVsiRTsqWIN2K2Zvnq+sN/AC0KQmBWW
         Y/XBGNGb2fQz5DquAbxrBxl0TNdWst4kZ27/Ju2vx+0BuidAyPNHAF9vKJ5CxTFgqF3n
         B4qdWAXbZhPzWfV1cUKmazBXWQq1sVyM9uj1DsYstieRAnQ06POY63ZixGauEPnin2R4
         MulpgEuY7uLppYg9fKRPltppsn/I1rb0/RwbiqnMAOGprtBtVryUz6lDJO0kyByifZBu
         L6gA==
X-Gm-Message-State: AOJu0Yx8TIxwZmONaix7DKQzaDzyIVmD6Uy9ooCLmvP/XAcr271E1pWz
	Fl5S/E51d3IPlU2oez54il9SoQbqBK0qgwSovB0gQzndR51lSwC5tW/bVd2y0Bqt7AzeLtBQEyM
	2X6KlBurv8hJiGadCvz/qElrmrBY=
X-Gm-Gg: ASbGncu3IVRHL960sq5Heli6rDIZxFGHfnK/Tbs4FVoGYVsbIVqACe3FC9zPnkTXi+3
	kX4Hur0IyFNupxXRAN0qzTgYmwoZeLI8gCJAHOt5nGSdispQx3NWiKFSKifaAkREHZtSnTgbPmM
	KrzzkYeYI84MLrTimwPqIc4bICyOu2
X-Google-Smtp-Source: AGHT+IF6M8nfg6OpYrA9ILfFEM7iJR5j0UXJXkKx++ImXiYStfRrVMEm/p1oCV4ga7L8REAqC/EAd4x8YDNLxgArS1g=
X-Received: by 2002:a05:6512:3e03:b0:545:3032:91fd with SMTP id
 2adb3069b0e04-54c22776ec1mr6197029e87.16.1744129169055; Tue, 08 Apr 2025
 09:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250401221249.2506503-1-yoann.congal@smile.fr>
In-Reply-To: <20250401221249.2506503-1-yoann.congal@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Apr 2025 18:19:16 +0200
X-Gm-Features: ATxdqUEJ0mVZS36GyIyQozshX9rm3YUTt8cep1JJHe1fNvYd0-D3o9eWdaklaIY
Message-ID: <CA+chaQc1_KMuC7LXyZymUEmPOTYMmOK67XqVfY7uPCFCmj8rww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 16:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116712

This seems to cause:

ERROR: QA Issue: lib32-cmatrix: Files/directories were installed but
not shipped in any package:
  /usr/lib
  /usr/lib/X11
  /usr/lib/X11/fonts
  /usr/lib/X11/fonts/misc
  /usr/lib/X11/fonts/misc/mtx.pcf
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
lib32-cmatrix: 5 installed and not shipped files. [installed-vs-shipped]

in cases where libdir isn't /usr/lib (e.g. /usr/lib32 or /usr/lib64).
Even in builds without x11 in DISTRO_FEATUERS.

On Wed, Apr 2, 2025 at 12:13=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> cmatrix configuration code choose where to install fonts based on what
> directory exists on build host. This is not reproducible[0].
>
> Remove the existence check and change the lists to the ones matching
> OpenEmbedded paths.
>
> [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/3=
8/steps/32/logs/stdio
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  ...Prevent-configuration-from-reading-h.patch | 58 +++++++++++++++++++
>  .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  7 ++-
>  2 files changed, 63 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0001-reprodu=
cibility-Prevent-configuration-from-reading-h.patch
>
> diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibilit=
y-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extended/cma=
trix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patc=
h
> new file mode 100644
> index 0000000000..5f23252605
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Preve=
nt-configuration-from-reading-h.patch
> @@ -0,0 +1,58 @@
> +From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 2001
> +From: Yoann Congal <yoann.congal@smile.fr>
> +Date: Tue, 1 Apr 2025 23:42:39 +0200
> +Subject: [PATCH] reproducibility: Prevent configuration from reading hos=
t
> + directories
> +
> +Current code choose where to install fonts based on what directory
> +exists on build host. This is not reproducible.
> +
> +Remove the existence check and change the lists to the one matching
> +OpenEmbedded paths.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +---
> + CMakeLists.txt | 8 ++------
> + 1 file changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index c5548b3..c9af31c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -7,8 +7,8 @@ set(VERSION "2.0")
> +
> + # These are relative to CMAKE_INSTALL_PREFIX
> + # which by default is "/usr/local"
> +-set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts")
> +-set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" "share=
/fonts/X11/misc")
> ++set(CONSOLE_FONTS_DIRS "share/consolefonts")
> ++set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
> +
> + set(MKFONTDIR "/usr/bin/mkfontdir")
> +
> +@@ -47,16 +47,13 @@ install(TARGETS cmatrix DESTINATION bin)
> +
> + if     (UNIX)
> +       foreach    (CONSOLE_FONTS_DIR ${CONSOLE_FONTS_DIRS})
> +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${CONSOLE_F=
ONTS_DIR}")
> +                       message(STATUS "Installing matrix console fonts t=
o ${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
> +                       install(FILES
> +                               "${CMAKE_SOURCE_DIR}/matrix.fnt"
> +                               "${CMAKE_SOURCE_DIR}/matrix.psf.gz"
> +                               DESTINATION "${CONSOLE_FONTS_DIR}")
> +-              endif  ()
> +       endforeach ()
> +       foreach    (X_FONTS_DIR ${X_FONTS_DIRS})
> +-              if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${X_FONTS_D=
IR}")
> +                       message(STATUS "Installing matrix X window fonts =
to ${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
> +                       install(FILES
> +                               "${CMAKE_SOURCE_DIR}/mtx.pcf"
> +@@ -67,7 +64,6 @@ if     (UNIX)
> +                               "execute_process(COMMAND \"${MKFONTDIR}\"=
 \"${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}\")")
> +                       install(CODE
> +                               "message(STATUS \"If this is the first ti=
me you have installed CMatrix you will probably have to restart X window in=
 order to use the mtx.pcf font.\")")
> +-              endif  ()
> +       endforeach ()
> + endif  ()
> +
> diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/re=
cipes-extended/cmatrix/cmatrix_2.0.bb
> index 6b6acf1be8..829e9588c8 100644
> --- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> @@ -3,7 +3,10 @@ SUMMARY =3D "Terminal based 'The Matrix' screen implemen=
tation"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRC_URI =3D "git://github.com/abishekvashok/cmatrix.git;branch=3Dstable;=
protocol=3Dhttps"
> +SRC_URI =3D " \
> +    git://github.com/abishekvashok/cmatrix.git;branch=3Dstable;protocol=
=3Dhttps \
> +    file://0001-reproducibility-Prevent-configuration-from-reading-h.pat=
ch \
> +"
>  SRCREV =3D "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
>  S =3D "${WORKDIR}/git"
>
> @@ -11,4 +14,4 @@ inherit cmake
>
>  DEPENDS +=3D "ncurses"
>
> -FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/*"
> +FILES:${PN} +=3D "${datadir}/* ${libdir}/kbd/* ${libdir}/X11/fonts/"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116489): https://lists.openembedded.org/g/openembedde=
d-devel/message/116489
> Mute This Topic: https://lists.openembedded.org/mt/112036531/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

