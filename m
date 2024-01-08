Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B42EC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 21:35:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.1704.1704749709294774732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 13:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 183961F273
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:35:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.164.233]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMxGx-3UsucT0; Mon, 8 Jan 2024 22:35:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.1-8 -> 7.1.1.26
Date: Mon,  8 Jan 2024 22:34:55 +0100
Message-ID: <20240108213455.1532998-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704749703-DD9C5917-803FA1E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 06d540ab-2a4b-4c36-89da-3eaed75f9699
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 21:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108173

- remove autoconf patch [https://github.com/ImageMagick/ImageMagick/blob/=
570a9a048bb0e3a5c221ca87be9408ae35f711e2/configure.ac#L496]
- update sed command
- license file changed [https://github.com/ImageMagick/ImageMagick/commit=
/2c87d7da1b1db4573a37bd7933dfbf772ac3eecf]
---
 ...-Use-autconf-provided-AC_FUNC_FSEEKO.patch | 42 -------------------
 .../imagemagick/imagemagick_7.1.1.bb          | 11 +++--
 2 files changed, 5 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-=
m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-=
autconf-provided-AC_FUNC_FSEEKO.patch b/meta-oe/recipes-support/imagemagi=
ck/imagemagick/0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch
deleted file mode 100644
index 6b225a10c..000000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick/0001-m4-Use-autconf=
-provided-AC_FUNC_FSEEKO.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0912e49d58c2a5f455fabf76ab7dc61cfc44cfb9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 30 Mar 2023 20:50:26 -0700
-Subject: [PATCH] m4: Use autconf provided AC_FUNC_FSEEKO
-
-This helps in building with autoconf 2.72
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4/ac_func_fseeko.m4 | 18 +-----------------
- 1 file changed, 1 insertion(+), 17 deletions(-)
-
-diff --git a/m4/ac_func_fseeko.m4 b/m4/ac_func_fseeko.m4
-index eaeabb978..f9b8859cf 100644
---- a/m4/ac_func_fseeko.m4
-+++ b/m4/ac_func_fseeko.m4
-@@ -53,20 +53,4 @@
- # --------------
- AN_FUNCTION([ftello], [AC_FUNC_FSEEKO])
- AN_FUNCTION([fseeko], [AC_FUNC_FSEEKO])
--AC_DEFUN([AC_FUNC_FSEEKO],
--[_AC_SYS_LARGEFILE_MACRO_VALUE(_LARGEFILE_SOURCE, 1,
--   [ac_cv_sys_largefile_source],
--   [Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2).]=
,
--   [[#include <sys/types.h> /* for off_t */
--     #include <stdio.h>]],
--   [[int (*fp) (FILE *, off_t, int) =3D fseeko;
--     return fseeko (stdin, 0, 0) && fp (stdin, 0, 0);]])
--
--# We used to try defining _XOPEN_SOURCE=3D500 too, to work around a bug
--# in glibc 2.1.3, but that breaks too many other things.
--# If you want fseeko and ftello with glibc, upgrade to a fixed glibc.
--if test $ac_cv_sys_largefile_source !=3D unknown; then
--  AC_DEFINE(HAVE_FSEEKO, 1,
--    [Define to 1 if fseeko (and presumably ftello) exists and is declar=
ed.])
--fi
--])# AC_FUNC_FSEEKO
-+AC_FUNC_FSEEKO
---=20
-2.40.0
-
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index e59b511a7..dcc951bce 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -4,16 +4,15 @@ HOMEPAGE =3D "https://www.imagemagick.org/"
 DESCRIPTION =3D "ImageMagick is a collection of tools for displaying, co=
nverting, and \
 editing raster and vector image files. It can read and write over 200 im=
age file formats."
 LICENSE =3D "ImageMagick"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dac58ac14f9d9d02cafd2d81ef38fb=
2cc \
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2f9de66264141265b203cde990281=
9ea \
                     file://NOTICE;md5=3Dbcbf1f1897b40ec8df39700cb560e9ed=
"
 # FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
 DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
=20
 BASE_PV :=3D "${PV}"
-PV .=3D "-8"
-SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps \
-           file://0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch"
-SRCREV =3D "920f79206ff59f30a4cff22c9c9c393508b82663"
+PV .=3D "-26"
+SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps"
+SRCREV =3D "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -38,7 +37,7 @@ PACKAGECONFIG[xml] =3D "--with-xml,--without-xml,libxml=
2"
=20
 do_install:append:class-target() {
     for file in MagickCore-config.im7 MagickWand-config.im7 Magick++-con=
fig.im7; do
-        sed -i 's,${STAGING_DIR_NATIVE},,g' ${D}${bindir}/"$file"
+        sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${bindir}/"$file"
     done
     sed -i 's,${S},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HD=
RI/configure.xml
     sed -i 's,${B},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HD=
RI/configure.xml
--=20
2.43.0


