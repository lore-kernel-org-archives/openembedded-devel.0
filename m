Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4E3789CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:38 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l9so8435082wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nphhc623R+TxoitNbxIog0TM708SfvPyOP1Kbe9lZGY=;
	b=sEt0RrfWOLfSQF4rIcGSKOVZsTYic0Gf7Ymm/+aQU/KqDKPBa8cid0YuA+g7h26sQl
	aqtVdhboYKI3d0Dd5MfDK3pryjs/YvpFg3mCeJd6Tvk2V6xe9nn1RL19EpYhpqgJIwmF
	tCuqsnyg8zlr49NlQMoGDxOTudUC5IkjNYyXqIOdpoq3shatbmx6rdzbbNKUopn8D32T
	ZpzBEAjFENigRZbXiaHKdorKxGlwO09jai17Ge53YnSmn3W7qmgt3zlnfp4MBGUiVICK
	7tukmEonOCjgHcEuWFUf1sT2IsnKumMRNO6Kn7joWsQ+GgGBK/68EF3IAxGJaZ//re/i
	/WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nphhc623R+TxoitNbxIog0TM708SfvPyOP1Kbe9lZGY=;
	b=VkYbingH6VSwS1Z3+gzks2zv7MZF+coY8XEuwGH8GO56i+FXsJCFjG/BOGnM7Q0hJQ
	DlisuUiwhUEpAAozg2PDQSRwXnQBiv6Fx7nmryukmgTVsTLp3Ql0lyMg6mQRIYcibLX5
	OLJ2KRDzyGiYA0TPgCWlXiL880xrQB52DlBx0cnT1f/o9i/fxQN8TYwi2G8atUtxhZQ5
	EAMXr/c2jOhx8wfGSE3vaPlbaeNiGCgvO6x+IKSNVjPdk6CCHx3hRiKUbq6oDfTvD8kx
	1PtrQuu8WMsj5EjfexIuOi+U/9HAqXcBBOTEdYEQk0yxaS/EASjKZ0x8xpo01aJUVABV
	Epxw==
X-Gm-Message-State: AElRT7HF13cGnpbn2HQD/S7h+N8IUH5JYDQ5YMXheZc0LefsS5swNGb1
	q+ZFD9LklsJGD4s8Hp9txbLJ4g==
X-Google-Smtp-Source: AG47ELs18GeBXep6gXYvOMrHv/+hjpQc3kWOA0yfbieUEQZQdboisE07fHCP9Geq8j73PZGEEwhTHg==
X-Received: by 10.28.178.208 with SMTP id b199mr68679wmf.125.1521491379383;
	Mon, 19 Mar 2018 13:29:39 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:09 +0100
Message-Id: <20180319202911.30760-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/17] orbit2: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 20:29:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last release was 2010

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-src-Makefile.am-fix-build-with-glib-2.36.patch | 34 ------------------
 ...LAGS-instead-of-INCLUDES-and-fix-problem-.patch | 42 ----------------------
 .../orbit2/orbit2/configure-lossage.patch          | 37 -------------------
 .../orbit2/orbit2/pkgconfig-fix.patch              | 12 -------
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb  | 42 ----------------------
 5 files changed, 167 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
deleted file mode 100644
index daf7464c3..000000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 10bd8094e1d94e5c737791c7f4b6b844f535c120 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 3 May 2013 10:00:16 +0200
-Subject: [PATCH] linc2/src/Makefile.am: fix build with glib 2.36
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted [1]
-
-[1] https://bugzilla.gnome.org/show_bug.cgi?id=696900
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- linc2/src/Makefile.am |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/linc2/src/Makefile.am b/linc2/src/Makefile.am
-index 357a2dd..ba0e347 100644
---- a/linc2/src/Makefile.am
-+++ b/linc2/src/Makefile.am
-@@ -12,8 +12,7 @@ INCLUDES =                         \
- 	-I$(top_builddir)/linc2/include  \
- 	-I$(top_srcdir)/linc2/include    \
- 	$(LINC_CFLAGS)             \
--	$(WARN_CFLAGS)             \
--	-DG_DISABLE_DEPRECATED
-+	$(WARN_CFLAGS)
- 
- if OS_WIN32
- else
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
deleted file mode 100644
index 7993abb92..000000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d91dbb42dc3b6073720027f68827acd0abee6d75 Mon Sep 17 00:00:00 2001
-From: Kjartan Maraas <kmaraas@gnome.org>
-Date: Tue, 14 May 2013 13:29:53 +0200
-Subject: [PATCH] Use AM_CPPFLAGS instead of INCLUDES and fix problem using
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [1]
-
-[1] https://git.gnome.org/browse/ORBit2/commit/test/everything/Makefile.am?id=d91dbb42dc3b6073720027f68827acd0abee6d75
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- test/everything/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/test/everything/Makefile.am b/test/everything/Makefile.am
-index 32beb36..cb4b1d6 100644
---- a/test/everything/Makefile.am
-+++ b/test/everything/Makefile.am
-@@ -10,7 +10,7 @@ EVERYTHING_IDLOUT =          \
- 	$(EVERYTHING_BUILT)  \
- 	everything-imodule.c
- 
--INCLUDES =                                 \
-+AM_CPPFLAGS =                              \
- 	-I$(top_srcdir)/include            \
- 	-I$(top_builddir)/include          \
- 	-I$(top_builddir)/src              \
-@@ -78,7 +78,7 @@ include $(top_srcdir)/Makefile.shared
- BUILT_SOURCES = ${EVERYTHING_BUILT} everything-imodule.c
- CLEANFILES = ${BUILT_SOURCES} iorfile
- 
--TESTS = $(srcdir)/test.sh
-+TESTS = $(top_builddir)/test/everything/test.sh
- 
- EXTRA_DIST = $(IDL_FILES) test.sh $(included_src)
- 
--- 
-1.8.3.1
-
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
deleted file mode 100644
index 5fc1de561..000000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
+++ /dev/null
@@ -1,37 +0,0 @@
---- ORBit2-2.14.17/configure.in-orig	2009-01-10 09:36:18.000000000 -0800
-+++ ORBit2-2.14.17/configure.in	2009-06-17 15:10:59.000000000 -0700
-@@ -217,20 +217,20 @@ dnl
- dnl   So many people with broken linking setups asked about this
- dnl it turned out to be necessary to check for this.
- dnl
--dofus_save_libs="$LIBS"
--LIBS="$ORBIT_LIBS $LIBS"
--AC_TRY_RUN([ #include <stdio.h>
--             main ()
--             {
--               return 0;
--             } ],,
--           AC_MSG_ERROR([
--Linking is badly borked on your system. Please ensure your library path is correct
--Check config.log for details - check near the end of the log above 'failed program was'
--Alternatively ensure that your /etc/ld.so.conf (and/or LD_LIBRARY_PATH) includes the
--prefix you're compiling on: '${prefix}' ]), 
--AC_MSG_WARN([Could not check for borked linking while cross-compiling]))
--LIBS="$dofus_save_libs"
-+dnl dofus_save_libs="$LIBS"
-+dnl LIBS="$ORBIT_LIBS $LIBS"
-+dnl AC_TRY_RUN([ #include <stdio.h>
-+dnl             main ()
-+dnl              {
-+dnl                return 0;
-+dnl              } ],,
-+dnl            AC_MSG_ERROR([
-+dnl Linking is badly borked on your system. Please ensure your library path is correct
-+dnl Check config.log for details - check near the end of the log above 'failed program was'
-+dnl Alternatively ensure that your /etc/ld.so.conf (and/or LD_LIBRARY_PATH) includes the
-+dnl prefix you're compiling on: '${prefix}' ]), 
-+dnl AC_MSG_WARN([Could not check for borked linking while cross-compiling]))
-+dnl LIBS="$dofus_save_libs"
- 
- orig_CPPFLAGS=$CPPFLAGS
- CPPFLAGS="$CPPFLAGS $ORBIT_CFLAGS"
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch b/meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
deleted file mode 100644
index f629e506d..000000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN ORBit2-2.14.12.orig/ORBit-2.0.pc.in ORBit2-2.14.12/ORBit-2.0.pc.in
---- ORBit2-2.14.12.orig/ORBit-2.0.pc.in	2008-01-29 13:45:22.000000000 +0100
-+++ ORBit2-2.14.12/ORBit-2.0.pc.in	2008-09-23 20:13:07.000000000 +0200
-@@ -2,7 +2,7 @@
- exec_prefix=@exec_prefix@
- libdir=@libdir@
- includedir=@includedir@
--orbit_idl=@bindir@/orbit-idl-2@EXEEXT@
-+orbit_idl=@exec_prefix@/bin/orbit-idl-2@EXEEXT@
- 
- 
- Name: ORBit-2.0
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
deleted file mode 100644
index eb4397263..000000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "CORBA ORB"
-HOMEPAGE = "http://www.gnome.org/projects/ORBit2"
-SECTION = "x11/gnome/libs"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-SRC_NAME = "ORBit2"
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = " \
-    ${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
-    file://configure-lossage.patch \
-    file://pkgconfig-fix.patch \
-    file://0001-linc2-src-Makefile.am-fix-build-with-glib-2.36.patch \
-    file://0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch \
-"
-SRC_URI[md5sum] = "7082d317a9573ab338302243082d10d1"
-SRC_URI[sha256sum] = "55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd857550"
-
-BBCLASSEXTEND = "native"
-
-IDL_COMPILER_DEPENDS = "orbit2-native"
-IDL_COMPILER_DEPENDS_class-native = " "
-DEPENDS = "libidl popt ${IDL_COMPILER_DEPENDS}"
-
-# IDL_COMPILER_DEPENDS_class-native for some reason didn't work and orbit2-native
-# was still in orbit2-native DEPENDS causing circular dependency
-DEPENDS_class-native = "libidl-native popt-native"
-PARALLEL_MAKE = ""
-
-
-FILES_${PN} += "${libdir}/orbit-2.0/*.so"
-FILES_${PN}-dev += "${libdir}/orbit-2.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/orbit-2.0/*.a"
-FILES_${PN}-dbg += "${libdir}/orbit-2.0/.debug"
-
-S = "${WORKDIR}/${SRC_NAME}-${PV}"
-
-LEAD_SONAME = "libORBit-2.so"
-
-inherit autotools pkgconfig gtk-doc
-
-EXTRA_OEMAKE = "IDL_COMPILER='${STAGING_BINDIR_NATIVE}/orbit-idl-2'"
-EXTRA_OEMAKE_class-native = " "
-- 
2.14.3


