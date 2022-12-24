Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92118C4708E
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106119.1671917639920013588
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=HSDlv9Po;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXxbe012804
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:33:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=5kqrEglkl8rALfgVII36hSmEMmnP0U6aNsXugR8jsLQ=;
 b=HSDlv9PomG+vpSZioZ5htnS+kSpe9MSa8vqKpbWMB8sjqml8e8Uriz++ZPsv1F0WOouf
 sz5e/r7tlX7hlG4ad6g/4+0dyiAD3wTwsR9VJiEcz6NtmAWerPV+IDi+z3jtyer8w+pj
 rWhv9+8A4n/0TFSbekQ3d7BLCU2af7Zm9H9uCQLuv5W9Sx8evgyY1yczIbyGkdyg5wBc
 bkGrIYJYrEruDz0PBzYlrDKgBlCPrmFlGTlqPPuCFYd42Yl9E8128NWPLsr5yeg1T+ZH
 N995ub9fOtMb2PfL1vKceQ5S5G7XUf21NtE0WwRYhGKz+POi7SRZg8oGnffSd3TGt57j JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:33:59 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLXxoZ012793
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:33:59 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:33:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:33:59 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:58 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 04/16] exo: 4.16.4 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:35 +0800
Message-ID: <20221224213347.39959-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: n5R-KH5ySLhCUIhL6ecmJNgb2fj8QyPG
X-Proofpoint-ORIG-GUID: 2C__8HLvnhlUvdvKlD2KtvPP-8xer-S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BOLXxbe012804
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100212

From: Kai Kang <kai.kang@windriver.com>

Update exo from 4.16.4 to 4.18.0
* update license which should be GPL-2.0-or-later
* remove configure.patch that it supports cross compil now
* remove obsolete patch reduce-build-to-exo-csource-only.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
 .../exo/exo/exo-no-tests-0.8.patch            |  9 +-
 .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
 .../exo/{exo_4.16.4.bb =3D> exo_4.18.0.bb}      |  5 +-
 4 files changed, 8 insertions(+), 153 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-cs=
ource-only.patch
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb =3D> exo_4.18.0.bb} (84=
%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/r=
ecipes-xfce/exo/exo/configure.patch
deleted file mode 100644
index 89cc1f387..000000000
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Mon, 1 Aug 2011 17:16:29 +0200
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
----
- configure.ac | 34 ++++++++++++++++++----------------
- 1 file changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0de5ceb..3f92d1b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -143,22 +143,24 @@ AC_FUNC_MMAP()
- dnl ***************************************
- dnl *** Check for strftime() extensions ***
- dnl ***************************************
--AC_TRY_RUN([
--  #include <string.h>
--  #include <time.h>
--  int
--  main (int argc, char **argv)
--  {
--    struct tm tm;
--    char      buffer[16];
--    tm.tm_year =3D 81;
--    if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer, "=
1981") =3D=3D 0)
--      return 0;
--    return 1;
--  }
--], [
--  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports =
%E and %O modifiers.])
--])
-+dnl grrrr...  this doesn't work for cross compiling, define it for OE
-+AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E=
 and %O modifiers.])
-+dnl AC_TRY_RUN([
-+dnl   #include <string.h>
-+dnl   #include <time.h>
-+dnl   int
-+dnl   main (int argc, char **argv)
-+dnl   {
-+dnl     struct tm tm;
-+dnl     char      buffer[16];
-+dnl     tm.tm_year =3D 81;
-+dnl     if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffe=
r, "1981") =3D=3D 0)
-+dnl       return 0;
-+dnl     return 1;
-+dnl   }
-+dnl ], [
-+dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime suppo=
rts %E and %O modifiers.])
-+dnl ])
-=20
- dnl ******************************
- dnl *** Check for i18n support ***
diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch b/meta=
-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
index 348e147cf..c5e7a097f 100644
--- a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
@@ -10,17 +10,20 @@ Upstream-Status: Inappropriate [embedded specific]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
=20
+Rebase for xfce4 4.18.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 226e79d..62ad18d 100644
+index 513ac36..c395272 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -9,8 +9,7 @@ SUBDIRS =3D								\
+@@ -6,8 +6,7 @@ SUBDIRS =3D								\
+ 	exo-open							\
  	docs								\
- 	icons								\
  	pixmaps								\
 -	po								\
 -	tests
diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-o=
nly.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-on=
ly.patch
deleted file mode 100644
index 8c950299f..000000000
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.pat=
ch
+++ /dev/null
@@ -1,90 +0,0 @@
-From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Sat, 4 May 2019 14:50:11 +0200
-Subject: [PATCH] reduce build to exo-csource only
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-exo-csource creates c-header files from glade resource output files. Whe=
n
-building xfce-packages from git instead of tarball this exo-csource-nati=
ve is
-required.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
----
- Makefile.am  | 10 +---------
- configure.ac | 20 --------------------
- 2 files changed, 1 insertion(+), 29 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 62ad18d..8934f1f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,15 +1,7 @@
- ACLOCAL_AMFLAGS =3D -I m4 ${ACLOCAL_FLAGS}
-=20
- SUBDIRS =3D								\
--	exo								\
--	exo-csource							\
--	exo-desktop-item-edit						\
--	exo-helper							\
--	exo-open							\
--	docs								\
--	icons								\
--	pixmaps								\
--	po
-+	exo-csource
-=20
- distclean-local:
- 	rm -rf *.cache *~
-diff --git a/configure.ac b/configure.ac
-index 4e4eb5e..237184c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,15 +120,6 @@ AC_PROG_CC()
- AM_PROG_CC_C_O()
- AC_PROG_INSTALL()
- IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])
--AC_CHECK_PROGS([PERL], [perl5 perl])
--
--dnl ***************************************
--dnl *** Check for required Perl modules ***
--dnl ***************************************
--AC_PROG_PERL_MODULES([URI::Escape URI::file URI::URL], [],
--[
--  AC_MSG_ERROR([Atleast one of the required Perl modules (URI::Escape, =
URI::file and URI::URL) was not found on your system])
--])
-=20
- dnl ***************************************
- dnl *** Check for standard header files ***
-@@ -175,12 +166,6 @@ dnl ***********************************
- dnl *** Check for required packages ***
- dnl ***********************************
- XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])
--XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
--XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-u=
nix], [GIO-Unix features])
-=20
- dnl ***********************************************************
- dnl *** Optional support for a GTK+2 version of the library ***
-@@ -190,11 +175,6 @@ XDT_CHECK_OPTIONAL_PACKAGE([GTK2],
-                            [GTK+ 2 support])
- AM_CONDITIONAL([ENABLE_GTK2_LIBRARY], [test "x$GTK2_FOUND" =3D "xyes"])
-=20
--dnl *********************
--dnl *** Check for X11 ***
--dnl *********************
--XDT_CHECK_LIBX11_REQUIRE()
--
- dnl *************************
- dnl *** Check for gtk-doc ***
- dnl *************************
---=20
-2.20.1
-
diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb b/meta-xfce/recipes=
-xfce/exo/exo_4.18.0.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.18.0.bb
index 01c3bff06..b339b181f 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Application library for the Xfce desktop environment"
 SECTION =3D "x11"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
 DEPENDS =3D "gtk+3 libxfce4ui liburi-perl-native cairo"
=20
@@ -13,10 +13,9 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 # SRC_URI must follow inherited one
 SRC_URI +=3D " \
     file://exo-no-tests-0.8.patch \
-    file://configure.patch \
 "
=20
-SRC_URI[sha256sum] =3D "82a50c67e78f1e5c420b7615515bcca759b86eeab99224ab=
8eca4306b89d2eca"
+SRC_URI[sha256sum] =3D "4f2c61d045a888cdb64297fd0ae20cc23da9b97ffb82562e=
d12806ed21da7d55"
=20
 # Note: python bindings did not work in oe-dev and are about to be moved=
 to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.ver=
sion4/19560
--=20
2.17.1


