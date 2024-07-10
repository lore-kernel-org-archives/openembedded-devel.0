Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE15FC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 15:20:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17224.1720624825903400595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 08:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDE6106F
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 08:20:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D117F3F766
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 08:20:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libabigail: refresh musl/fts patch
Date: Wed, 10 Jul 2024 16:20:17 +0100
Message-Id: <20240710152017.3187361-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 15:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111303

This patch has now been sent upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Check-for-correct-fts-module.patch   | 90 +++++++++++++++----
 1 file changed, 74 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-fo=
r-correct-fts-module.patch b/meta-oe/recipes-devtools/libabigail/libabiga=
il/0001-Check-for-correct-fts-module.patch
index 2a9388b766..7c500e0b54 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-corre=
ct-fts-module.patch
+++ b/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-corre=
ct-fts-module.patch
@@ -1,33 +1,91 @@
-From b6af55e8ae120488abc83312fcd184d8352175eb Mon Sep 17 00:00:00 2001
+From 0db4af09f1bf4456527b5f6ec60fc1305e770c4c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 1 Jul 2024 10:53:45 +0000
-Subject: [PATCH] Check for correct fts module
+Date: Tue, 9 Jul 2024 15:19:35 +0100
+Subject: [PATCH] configure.ac: improve fts checks
=20
-fts-standalone is a gentoo-specific name[1], every other distribution th=
at
-uses this library has named it musl-fts.
+The current code checks explicitly for musl and if so uses pkg-config to
+find fts-standalone. This is suboptimal because musl may not be the only
+libc to need a standalone fts implementation, and fts-standalone is an
+old gentoo-specific name[1] so libabigail won't build on any other syste=
m
+against musl.
=20
-[1] https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/fts-standalo=
ne/fts-standalone-1.2.7.ebuild#n34
+Instead, use AC_SEARCH_LIBS to look for fts_open in libc then libfts. Do
+this before the check for behaviour just in case someone has a standalon=
e
+and broken implementation.  I assume that the standalone fts is installe=
d
+on the standard search path, which should be a fair assumption.
=20
-Upstream-Status: Pending [discussing with libabigail and gentoo]
+As we're not using pkg-config anymore the required link flags are now in
+LIBS, so remove all instances of FTS_CFLAGS and FTS_LIBS.
+
+[1] https://gitweb.gentoo.org/repo/gentoo.git/commit/sys-libs/fts-standa=
lone?id=3Da403fe6c61d1aaeecd58d521f3def2f6d3513449
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libabigail/=
2024q3/005973.html]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac      | 9 ++++-----
+ src/Makefile.am   | 4 ++--
+ tools/Makefile.am | 2 --
+ 3 files changed, 6 insertions(+), 9 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index d329490..5bad2ae 100644
+index e118a9c0..0aff2ec2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -295,10 +295,10 @@ AS_IF([test "x$ac_cv_bad_fts" =3D "xyes"],
+@@ -281,6 +281,10 @@ fi
+=20
+ AC_SUBST(VISIBILITY_FLAGS)
+=20
++# glibc and BSD include fts into their libc, but musl does not so check=
 if we
++# need to explicitly link to the standalone musl-fts.
++AC_SEARCH_LIBS([fts_open], [fts])
++
+ dnl Older glibc had a broken fts that didn't work with Large File Syste=
ms.
+ dnl We want the version that can handler LFS, but include workaround if=
 we
+ dnl get a bad one. Add define to CFLAGS (not AC_DEFINE it) since we nee=
d to
+@@ -295,11 +299,6 @@ AS_IF([test "x$ac_cv_bad_fts" =3D "xyes"],
        [CFLAGS=3D"$CFLAGS -DBAD_FTS=3D1",
         CXXFLAGS=3D"$CXXFLAGS -DBAD_FTS=3D1"])
 =20
 -dnl On musl, we need to find fts-standalone
-+dnl On musl, we need to find the standalone fts library
- AS_CASE(
-   [${host_os}], [*-musl*], [
+-AS_CASE(
+-  [${host_os}], [*-musl*], [
 -    PKG_CHECK_MODULES([FTS], [fts-standalone])
-+    PKG_CHECK_MODULES([FTS], [musl-fts])
- ])
+-])
 =20
  dnl Check for dependency: libelf, libdw, libebl (elfutils)
+ dnl Note that we need to use at least elfutils 0.159 but
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3044c136..1c98bf84 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -52,12 +52,12 @@ if BTF_READER
+ libabigail_la_SOURCES +=3D abg-btf-reader.cc
+ endif
+=20
+-libabigail_la_LIBADD =3D $(DEPS_LIBS) $(FTS_LIBS)
++libabigail_la_LIBADD =3D $(DEPS_LIBS)
+ libabigail_la_LDFLAGS =3D -lpthread -Wl,--as-needed -no-undefined -vers=
ion-info $(LIBABIGAIL_SO_CURRENT):$(LIBABIGAIL_SO_REVISION):$(LIBABIGAIL_=
SO_AGE)
+=20
+ CUSTOM_MACROS =3D -DABIGAIL_ROOT_SYSTEM_LIBDIR=3D\"${libdir}\"
+=20
+ AM_CPPFLAGS=3D\
+-$(CUSTOM_MACROS) $(DEPS_CPPFLAGS) $(FTS_CFLAGS) \
++$(CUSTOM_MACROS) $(DEPS_CPPFLAGS) \
+ -Wall -I$(abs_top_srcdir) -I$(abs_top_srcdir)/include \
+ -I$(abs_top_builddir)/include -I$(abs_top_builddir)
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index cbb5ce10..ea2d300c 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -41,8 +41,6 @@ abicompatdir =3D $(bindir)
+=20
+ abipkgdiff_SOURCES =3D abipkgdiff.cc
+ abipkgdiffdir =3D $(bindir)
+-abipkgdiff_CPPFLAGS =3D $(FTS_CFLAGS)
+-abipkgdiff_LDADD =3D $(FTS_LIBS)
+ abipkgdiff_LDFLAGS =3D $(abs_top_builddir)/src/libabigail.la -pthread
+=20
+ kmidiff_SOURCES =3D kmidiff.cc
+--=20
+2.34.1
+
--=20
2.34.1


