Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16302C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 11:06:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16876.1719832003608336001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 04:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398DF339
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 04:07:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3DF43F762
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 04:06:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] libabigail: add recipe for the ABI Generic Analysis and Instrumentation Library
Date: Mon,  1 Jul 2024 12:06:41 +0100
Message-Id: <20240701110641.3444984-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 11:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111197

We need to patch the standalone libfts detection as it currently looks fo=
r
fts-standalone, which is what Gentoo renames musl-fts to.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Check-for-correct-fts-module.patch   | 33 +++++++++++++++++++
 .../libabigail/libabigail_2.5.bb              | 17 ++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail/0001-C=
heck-for-correct-fts-module.patch
 create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-fo=
r-correct-fts-module.patch b/meta-oe/recipes-devtools/libabigail/libabiga=
il/0001-Check-for-correct-fts-module.patch
new file mode 100644
index 0000000000..2a9388b766
--- /dev/null
+++ b/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-corre=
ct-fts-module.patch
@@ -0,0 +1,33 @@
+From b6af55e8ae120488abc83312fcd184d8352175eb Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 1 Jul 2024 10:53:45 +0000
+Subject: [PATCH] Check for correct fts module
+
+fts-standalone is a gentoo-specific name[1], every other distribution th=
at
+uses this library has named it musl-fts.
+
+[1] https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/fts-standalo=
ne/fts-standalone-1.2.7.ebuild#n34
+
+Upstream-Status: Pending [discussing with libabigail and gentoo]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d329490..5bad2ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -295,10 +295,10 @@ AS_IF([test "x$ac_cv_bad_fts" =3D "xyes"],
+       [CFLAGS=3D"$CFLAGS -DBAD_FTS=3D1",
+        CXXFLAGS=3D"$CXXFLAGS -DBAD_FTS=3D1"])
+=20
+-dnl On musl, we need to find fts-standalone
++dnl On musl, we need to find the standalone fts library
+ AS_CASE(
+   [${host_os}], [*-musl*], [
+-    PKG_CHECK_MODULES([FTS], [fts-standalone])
++    PKG_CHECK_MODULES([FTS], [musl-fts])
+ ])
+=20
+ dnl Check for dependency: libelf, libdw, libebl (elfutils)
diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb b/meta=
-oe/recipes-devtools/libabigail/libabigail_2.5.bb
new file mode 100644
index 0000000000..5c262d2880
--- /dev/null
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "The ABI Generic Analysis and Instrumentation Library"
+HOMEPAGE =3D "https://sourceware.org/libabigail/"
+
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D0bcd48c3bdfef0c9d9fd17726=
e4b7dab"
+
+SRC_URI =3D "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
+           file://0001-Check-for-correct-fts-module.patch \
+           "
+SRC_URI[sha256sum] =3D "7cfc4e9b00ae38d87fb0c63beabb32b9cbf9ce410e52ceeb=
5ad5b3c5beb111f3"
+
+DEPENDS =3D "elfutils libxml2"
+DEPENDS:append:libc-musl =3D " fts"
+
+inherit autotools pkgconfig lib_package
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


