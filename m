Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C07EC43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 04:00:54 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.47040.1656734449848924832
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 21:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fSfC3dMS;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id p11so3169336qkg.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 21:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=166ZRmw6vPoau2M3iINpt/tbTdFa74rJc94l6uMSjtM=;
        b=fSfC3dMSrZ8Kt9WQ5T9ymKe7/VdVl4UKVty5t1ZPriAKS1YQQZId2HxOcVry4mZ9As
         JX0LkiYrvNGPSUQ4TKsDVmhEPyMOAoGUoBQdeERhCOCjjirHYKQkGxAV5n7/pV5KecgJ
         g7oxKg96H1XmZIQgsTICnqf68TKEK0L1/3GC7Dreo6aRIGkMueHmJkJX/JrXaJXEJYV/
         tL7APh+ZuyGCWcQRbt3XO/OW8tjx+Fkw/c0g3BwhpfnNb65wd3fq9LN9aQlQq4gUHgyU
         ILfK9JfHWbLoBhEiEduTH5YSmg5Urv5Bi+HVL1xt0pXrsJILqkHqzHipBQ12sn0XagsX
         soCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=166ZRmw6vPoau2M3iINpt/tbTdFa74rJc94l6uMSjtM=;
        b=Wali8StlEBXmmhLpcMwi+xRf6nHWK9i+XoxT7L5JH2CPNf8Z74dmA7WQo4KvHKVduf
         OVteENalPdcr7g1fTYUjFUxcNfd33cTuiug486UxatMBITxyx/z0qmsawEiQetXb0lNh
         ti/bB90Y1Qa9W0WALgtAro2mYW/XKsS0Q8QsQhURiPVMgSjb5QgZQISYvAQmI4TrPBI2
         QNaQnFQsi7FFnDbwTV5VO7wxB/uJVOALioNPNV4vNoXsr5JlYQ/YnqI4TZzX56cEjN9j
         gQUex+AUCBJ8cbBt6OUGj6Cv8zCPKvKpFXw9Y5X2oHQeKVTmAEezwsXAICYhA3mDX9tO
         vaEw==
X-Gm-Message-State: AJIora/oEyH9bVl2pPHAIoVSAA/4P6orLN9N7CivsmexWv1vC/Ot9599
	1tiOevbfjtFrId1xMahjGBgCT4DKhvCO4Q56qoc=
X-Google-Smtp-Source: 
 AGRyM1uiNUv3KDGGMJb4xu1lA/whuH2L8odSr7Yq2FwJ90qDqaJV8RVfDppbyeVL9bORrQ9CjJqlb4OzkQRJmfneTXY=
X-Received: by 2002:a37:68c8:0:b0:6ae:ffb1:8495 with SMTP id
 d191-20020a3768c8000000b006aeffb18495mr13427637qkc.463.1656734448838; Fri, 01
 Jul 2022 21:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220622141710.725808-1-zboszor@pr.hu>
 <20220622141710.725808-4-zboszor@pr.hu>
In-Reply-To: <20220622141710.725808-4-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Jul 2022 00:00:22 -0400
Message-ID: 
 <CAMKF1srP8_Y8-Atfb9i7mQTw3OKz-B1jrYRJoKxrwBPu=RuB-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4 4/4] libspatialite: Upgrade to 5.0.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Jul 2022 04:00:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97674

does this need some specific version of geos ? seeing this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1813/step=
s/14/logs/stdio

On Wed, Jun 22, 2022 at 10:17 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Removed a patch that didn't apply to the new version.
>
> Added three patches without changes from Fedora that allowed
> the new version to compile.
> See https://koji.fedoraproject.org/koji/buildinfo?buildID=3D1924183
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../libspatialite/geos-config.patch           | 17 --------
>  .../libspatialite/libspatialite_geos.patch    | 43 +++++++++++++++++++
>  .../libspatialite/libspatialite_macros.patch  | 12 ++++++
>  .../libspatialite_pkgconfig.patch             | 11 +++++
>  ...alite_4.3.0a.bb =3D> libspatialite_5.0.1.bb} | 14 +++---
>  5 files changed, 74 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e/geos-config.patch
>  create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e/libspatialite_geos.patch
>  create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e/libspatialite_macros.patch
>  create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e/libspatialite_pkgconfig.patch
>  rename meta-oe/recipes-navigation/libspatialite/{libspatialite_4.3.0a.bb=
 =3D> libspatialite_5.0.1.bb} (63%)
>
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/geos-=
config.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/geos-=
config.patch
> deleted file mode 100644
> index 28bd7dad8..000000000
> --- a/meta-oe/recipes-navigation/libspatialite/libspatialite/geos-config.=
patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -https://www.gaia-gis.it/fossil/libspatialite/tktview?name=3Dabeeaad448
> -
> -Upstream-Status: Submitted [rpm5-devel@rpm5.org]
> -
> -Index: libspatialite-4.2.0/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libspatialite-4.2.0.orig/configure.ac
> -+++ libspatialite-4.2.0/configure.ac
> -@@ -260,7 +260,7 @@ if test x"$enable_geos" !=3D "xno"; then
> -   fi
> -   # Extract the linker and include flags
> -   GEOS_LDFLAGS=3D`$GEOSCONFIG --ldflags`
> --  GEOS_CFLAGS=3D-I`$GEOSCONFIG --includes`
> -+  GEOS_CFLAGS=3D`$GEOSCONFIG --cflags`
> -   AC_SUBST([GEOS_LDFLAGS])
> -   AC_SUBST([GEOS_CFLAGS])
> -   # Ensure that we can parse geos_c.h
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libsp=
atialite_geos.patch b/meta-oe/recipes-navigation/libspatialite/libspatialit=
e/libspatialite_geos.patch
> new file mode 100644
> index 000000000..7d8d2c2e4
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialit=
e_geos.patch
> @@ -0,0 +1,43 @@
> +diff -rupN --no-dereference libspatialite-5.0.1/configure.ac libspatiali=
te-5.0.1-new/configure.ac
> +--- libspatialite-5.0.1/configure.ac   2021-03-08 08:57:19.015858195 +01=
00
> ++++ libspatialite-5.0.1-new/configure.ac       2021-03-08 08:57:19.01785=
8195 +0100
> +@@ -312,35 +312,10 @@ AC_ARG_ENABLE(geos, [AS_HELP_STRING(
> +   [], [enable_geos=3Dyes])
> + if test x"$enable_geos" !=3D "xno"; then
> +   #--------------------------------------------------------------------=
---
> +-  #   --with-geosconfig
> +-  #
> +-  AC_ARG_WITH([geosconfig],
> +-        [AS_HELP_STRING([--with-geosconfig=3DFILE], [specify an alterna=
tive geos-config file])],
> +-      [GEOSCONFIG=3D"$withval"], [GEOSCONFIG=3D""])
> +-  if test "x$GEOSCONFIG" =3D "x"; then
> +-        # GEOSCONFIG was not specified, so search within the current pa=
th
> +-        AC_PATH_PROG([GEOSCONFIG], [geos-config])
> +-        # If we couldn't find geos-config, display an error
> +-        if test "x$GEOSCONFIG" =3D "x"; then
> +-                AC_MSG_ERROR([could not find geos-config within the cur=
rent path. You may need to try re-running configure with a --with-geosconfi=
g parameter.])
> +-        fi
> +-  else
> +-        # GEOSCONFIG was specified; display a message to the user
> +-        if test "x$GEOSCONFIG" =3D "xyes"; then
> +-                AC_MSG_ERROR([you must specify a parameter to --with-ge=
osconfig, e.g. --with-geosconfig=3D/path/to/geos-config])
> +-        else
> +-                if test -f $GEOSCONFIG; then
> +-                        AC_MSG_RESULT([Using user-specified geos-config=
 file: $GEOSCONFIG])
> +-                else
> +-                        AC_MSG_ERROR([the user-specified geos-config fi=
le $GEOSCONFIG does not exist])
> +-                fi
> +-        fi
> +-  fi
> +-  # Extract the linker and include flags
> +-  GEOS_LDFLAGS=3D`$GEOSCONFIG --ldflags`
> +-  GEOS_CFLAGS=3D-I`$GEOSCONFIG --includes`
> +-  AC_SUBST([GEOS_LDFLAGS])
> +-  AC_SUBST([GEOS_CFLAGS])
> ++  PKG_CHECK_MODULES([GEOS], [geos], , AC_MSG_ERROR(['geos' is required =
but it doesn't seem to be installed on this system.]))
> ++  GEOS_LDFLAGS=3D"$GEOS_LIBS"
> ++  AC_SUBST(GEOS_CFLAGS)
> ++  AC_SUBST(GEOS_LDFLAGS)
> +   # Ensure that we can parse geos_c.h
> +   CPPFLAGS_SAVE=3D"$CPPFLAGS"
> +   CPPFLAGS=3D"$GEOS_CFLAGS"
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libsp=
atialite_macros.patch b/meta-oe/recipes-navigation/libspatialite/libspatial=
ite/libspatialite_macros.patch
> new file mode 100644
> index 000000000..9b71ab765
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialit=
e_macros.patch
> @@ -0,0 +1,12 @@
> +diff -rupN --no-dereference libspatialite-5.0.1/configure.ac libspatiali=
te-5.0.1-new/configure.ac
> +--- libspatialite-5.0.1/configure.ac   2021-03-08 08:57:18.748858216 +01=
00
> ++++ libspatialite-5.0.1-new/configure.ac       2021-03-08 08:57:18.75185=
8215 +0100
> +@@ -96,7 +96,7 @@ AC_PROG_INSTALL
> + AC_PROG_LN_S
> + AC_PROG_MAKE_SET
> + AC_LIBTOOL_WIN32_DLL
> +-AC_PROG_LIBTOOL
> ++LT_INIT
> +
> + # Checks for typedefs, structures, and compiler characteristics.
> + AC_C_CONST
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libsp=
atialite_pkgconfig.patch b/meta-oe/recipes-navigation/libspatialite/libspat=
ialite/libspatialite_pkgconfig.patch
> new file mode 100644
> index 000000000..149c12676
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialit=
e_pkgconfig.patch
> @@ -0,0 +1,11 @@
> +diff -rupN libspatialite-5.0.1/spatialite.pc.in libspatialite-5.0.1-new/=
spatialite.pc.in
> +--- libspatialite-5.0.1/spatialite.pc.in       2021-02-07 16:53:46.00000=
0000 +0100
> ++++ libspatialite-5.0.1-new/spatialite.pc.in   2021-02-10 09:54:09.64755=
2994 +0100
> +@@ -8,5 +8,6 @@ includedir=3D@includedir@
> + Name: spatialite
> + Description: Spatial SQL database engine based on SQLite
> + Version: @VERSION@
> +-Libs: -L${libdir} -lspatialite @LIBS@ @LIBXML2_LIBS@ -lm
> ++Libs.private: -L${libdir} @LIBS@ @LIBXML2_LIBS@ -lm
> ++Libs: -L${libdir} -lspatialite
> + Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0=
a.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb
> similarity index 63%
> rename from meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a=
.bb
> rename to meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb
> index f6c765519..f46b1083e 100644
> --- a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.3.0a.bb
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.0.1.bb
> @@ -7,14 +7,16 @@ LICENSE =3D "MPL-1.1 & GPL-2.0-or-later & LGPL-2.1-or-l=
ater"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0e92e1a36cc384b60f5b31dde0bdd=
39e"
>
>  SRC_URI =3D "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libs=
patialite-${PV}.tar.gz \
> -           file://geos-config.patch"
> -SRC_URI[md5sum] =3D "6b380b332c00da6f76f432b10a1a338c"
> -SRC_URI[sha256sum] =3D "88900030a4762904a7880273f292e5e8ca6b15b7c6c3fb88=
ffa9e67ee8a5a499"
> +           file://libspatialite_geos.patch \
> +           file://libspatialite_macros.patch \
> +           file://libspatialite_pkgconfig.patch \
> +"
>
> -inherit autotools pkgconfig
> +SRC_URI[sha256sum] =3D "eecbc94311c78012d059ebc0fae86ea5ef6eecb13303e6e8=
2b3753c1b3409e98"
>
> -EXTRA_OECONF =3D "--enable-freexl=3Dno"
> -CFLAGS +=3D "-DACCEPT_USE_OF_DEPRECATED_PROJ_API_H"
> +inherit autotools-brokensep pkgconfig
> +
> +EXTRA_OECONF =3D "--enable-freexl=3Dno --disable-rttopo --disable-minizi=
p"
>
>  # package plugins for SQLite3
>  PACKAGES +=3D "${PN}-plugin"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97567): https://lists.openembedded.org/g/openembedded=
-devel/message/97567
> Mute This Topic: https://lists.openembedded.org/mt/91922737/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

