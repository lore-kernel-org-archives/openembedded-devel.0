Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB70C0015E
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 12:41:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38366.1688992889301824834
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jul 2023 05:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6972B;
	Mon, 10 Jul 2023 05:42:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 462123F67D;
	Mon, 10 Jul 2023 05:41:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] liblbxutil: remove obsolete library
Date: Mon, 10 Jul 2023 13:41:25 +0100
Message-Id: <20230710124127.3177352-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 12:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103724

From: Ross Burton <ross.burton@arm.com>

This is the client-side library for the LBX extension, which was removed
from xserver 1.2 (released 2007).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...lbx_zlib-Mark-declration-with-extern.patch | 36 ------------
 .../liblbxutil-1.1.0/mkg3states-1.1.patch     | 57 -------------------
 .../xorg-lib/liblbxutil_1.1.0.bb              | 18 ------
 4 files changed, 112 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/00=
01-lbx_zlib-Mark-declration-with-extern.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mk=
g3states-1.1.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 469e202175..c555ade629 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -595,7 +595,6 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
     font-cursor-misc \
     font-misc-misc \
     xorg-fonts-100dpi \
-    liblbxutil \
     libxaw6 \
     libxkbui \
     libxpresent \
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_=
zlib-Mark-declration-with-extern.patch b/meta-oe/recipes-graphics/xorg-li=
b/liblbxutil-1.1.0/0001-lbx_zlib-Mark-declration-with-extern.patch
deleted file mode 100644
index 32a24b4be1..0000000000
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_zlib-Ma=
rk-declration-with-extern.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 95ed4b743f197e20f1884a326d5a7128187a7ba6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Aug 2020 17:56:30 -0700
-Subject: [PATCH] lbx_zlib: Mark declration with extern
-
-Fixes build with gcc10/-fno-common
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lbx_zlib/lbx_zlib.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/lbx_zlib/lbx_zlib.h b/src/lbx_zlib/lbx_zlib.h
-index 8ae8956..bec3b96 100644
---- a/src/lbx_zlib/lbx_zlib.h
-+++ b/src/lbx_zlib/lbx_zlib.h
-@@ -136,9 +136,9 @@ extern void Xfree(pointer /*ptr*/);
- #endif
-=20
- /* lbx_zlib.c */
--unsigned long stream_out_compressed;
--unsigned long stream_out_uncompressed;
--unsigned long stream_out_plain;
--unsigned long stream_in_compressed;
--unsigned long stream_in_uncompressed;
--unsigned long stream_in_plain;
-+extern unsigned long stream_out_compressed;
-+extern unsigned long stream_out_uncompressed;
-+extern unsigned long stream_out_plain;
-+extern unsigned long stream_in_compressed;
-+extern unsigned long stream_in_uncompressed;
-+extern unsigned long stream_in_plain;
---=20
-2.28.0
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3state=
s-1.1.patch b/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3stat=
es-1.1.patch
deleted file mode 100644
index af7d208282..0000000000
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.p=
atch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Pending
-
-diff -uNr liblbxutil-1.1.0.orig/configure.ac liblbxutil-1.1.0/configure.=
ac
---- liblbxutil-1.1.0.orig/configure.ac	2009-12-04 23:52:04.000000000 +01=
00
-+++ liblbxutil-1.1.0/configure.ac	2009-12-16 10:45:00.000000000 +0100
-@@ -50,4 +50,5 @@
-=20
- AC_OUTPUT([Makefile
- 	   src/Makefile
-+	   src/image/Makefile
- 	   lbxutil.pc])
-diff -uNr liblbxutil-1.1.0.orig/src/image/Makefile.am liblbxutil-1.1.0/s=
rc/image/Makefile.am
---- liblbxutil-1.1.0.orig/src/image/Makefile.am	1970-01-01 01:00:00.0000=
00000 +0100
-+++ liblbxutil-1.1.0/src/image/Makefile.am	2009-12-16 10:45:00.000000000=
 +0100
-@@ -0,0 +1,15 @@
-+# evil hack
-+CFLAGS=3D$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
-+
-+CC=3D$(CC_FOR_BUILD)
-+LIBTOOL =3D @LIBTOOL@ --tag=3DCC
-+
-+noinst_PROGRAMS =3D mkg3states
-+
-+mkg3states_SOURCES =3D				\
-+	mkg3states.c
-+
-+mkg3states_CFLAGS=3D$(CFLAGS_FOR_BUILD)
-+mkg3states_LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
-diff -uNr liblbxutil-1.1.0.orig/src/Makefile.am liblbxutil-1.1.0/src/Mak=
efile.am
---- liblbxutil-1.1.0.orig/src/Makefile.am	2009-12-16 10:48:11.000000000 =
+0100
-+++ liblbxutil-1.1.0/src/Makefile.am	2009-12-16 10:46:47.000000000 +0100
-@@ -3,10 +3,7 @@
- AM_CFLAGS =3D $(CWARNFLAGS) $(LBXUTIL_CFLAGS)
- INCLUDES =3D -I$(top_srcdir)/include
-=20
--noinst_PROGRAMS =3D mkg3states
--
--mkg3states_SOURCES =3D				\
--	$(srcdir)/image/mkg3states.c
-+SUBDIRS =3D image
-=20
- liblbxutil_la_SOURCES =3D				\
- 	$(srcdir)/lbx_zlib/reqstats.h		\
-@@ -38,9 +35,8 @@
-=20
- $(srcdir)/image/dfaxg42d.c: g3states.h
-=20
--g3states.h: mkg3states
--	-rm -f g3states.h
--	$(AM_V_GEN) ./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
-+g3states.h: image/mkg3states
-+	$(AM_V_GEN) ./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3st=
ates.h
-=20
- liblbxutil_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
-=20
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta=
-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
deleted file mode 100644
index ce064903b9..0000000000
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require recipes-graphics/xorg-lib/xorg-lib-common.inc
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db0d5bdc98f7ebab3b6c3791d9bf40=
907"
-
-SUMMARY =3D "XFIXES Extension"
-DEPENDS +=3D " xorgproto zlib"
-PE =3D "1"
-PR =3D "r11"
-
-XORG_EXT =3D "tar.bz2"
-
-SRC_URI +=3D "file://mkg3states-1.1.patch \
-            file://0001-lbx_zlib-Mark-declration-with-extern.patch \
-           "
-SRC_URI[md5sum] =3D "273329a78c2e9ea189ac416c7fde94a1"
-SRC_URI[sha256sum] =3D "c6b6ff7858ec619cafa8205debca6bf78c5610a2844a782e=
d643c7fd017cf8ae"
-
-export CC_FOR_BUILD =3D "gcc"
--=20
2.34.1


