Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7E07E3FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 198so4508641wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Vw7Buz9YOINTGmMTUYmZUTu5BGkW7n0H37z/RtpppQ0=;
	b=Cxcz5GtHUUv/FW9hEcZi9V+3CrRhjYpnSjp0d6/3H0YOkUhxc4wGjZTSh11Zmju6d1
	nNs7uxLdEg2MFkujaKFRX7pJeh6FC9FgvV85r5E61lMYpXpYjf6mctk4jJoG8rCubrxd
	4qRot2+AoEPBJfGfSitS/wwtz82Lj3SPOAOb9mksfB0Gi9OrKbJNoxvkFFiMMch9b9vJ
	l6iybBBZshU7ueH3hgRm7mEGXSL92KPeD1t/HhtII5LVHbMlZUpuT9naGLyJyzqUc71u
	idKHr78QgVfRS5d3rNxSxOz6PPPdu0wF1q6YFX/gjwfRbUcJbDiE1Heox8FF+6U3icCu
	4f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vw7Buz9YOINTGmMTUYmZUTu5BGkW7n0H37z/RtpppQ0=;
	b=TGLcs757P26PrgSdRpa/RaINN0VluyKZt7zWUxx2/aPZu2FysOZcscx3SqS2o+vNW4
	t5b54I4dSqTMWNsNeVvP8EkvTTWF4FPOTtJGinzwIGvBHf9Jzyt1F71EgyT0IV5qpXgB
	/BV9Nos60fIPC95lV2oRChAmAbxC3Fr9IifGjVskEsOWrvmr8lthY9tvKTL1HojWA2mj
	TOYmBR/AFZ5Lhljn1eEr4SIAWKcG2kgNweKZx7FHvFaY1Tbfd7oQaYE9ZNyGjzAcxzxZ
	FLm/NSqOOMoa71P/BU8YaIbby/z77CeuYEOypKy57DnJoQXb/iy5+AzRLw1UQWkX2uUL
	VziQ==
X-Gm-Message-State: APjAAAXeqn80l8GStBCIl4Ii+7fvfq3EBHTMqyfjjkP4f95bMF9tWwDq
	uBIvklN/XkzsULc3uKbkRak0awp0KsY=
X-Google-Smtp-Source: APXvYqy+VksA8jTQXnKzyz6AzZ60Ix+iJ8tPgt2kA2nH67DP9nrJQ4aNoKd1pG3syIKgxsl0YOx/KQ==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr10109608wmk.114.1558594163732; 
	Wed, 22 May 2019 23:49:23 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:36 +0200
Message-Id: <20190523064859.24336-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/41] abiword: remove
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
X-List-Received-Date: Thu, 23 May 2019 06:49:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

seems develompment has stopped - last release was 2016. I had good times
with it so I added it to meta office.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...1-Bug-13770-Require-C-11-from-now-on.patch | 180 ------------------
 ...s-Makefile.am-remove-uncomplete-opti.patch |  39 ----
 .../recipes-gnome/abiword/abiword_3.0.2.bb    | 142 --------------
 3 files changed, 361 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch b/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
deleted file mode 100644
index 3731a23f1..000000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From f6d0dc338fe867c1b064682ae7f15bffe019b306 Mon Sep 17 00:00:00 2001
-From: Hubert Figuiere <hub@figuiere.net>
-Date: Tue, 12 Apr 2016 02:55:47 +0000
-Subject: [PATCH] Bug 13770 - Require C++11 from now on.
-
-git-svn-id: svn+ssh://svn.abisource.com/svnroot/abiword/trunk@35197 bcba8976-2d24-0410-9c9c-aab3bd5fdfd6
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ax_cxx_compile_stdcxx_11.m4  | 133 +++++++++++++++++++++++++++++++++++
- configure.ac                 |   1 +
- src/wp/ap/gtk/ap_UnixApp.cpp |   2 +-
- 3 files changed, 135 insertions(+), 1 deletion(-)
- create mode 100644 ax_cxx_compile_stdcxx_11.m4
-
-diff --git a/ax_cxx_compile_stdcxx_11.m4 b/ax_cxx_compile_stdcxx_11.m4
-new file mode 100644
-index 0000000..af37acd
---- /dev/null
-+++ b/ax_cxx_compile_stdcxx_11.m4
-@@ -0,0 +1,133 @@
-+# ============================================================================
-+#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.html
-+# ============================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CXX_COMPILE_STDCXX_11([ext|noext],[mandatory|optional])
-+#
-+# DESCRIPTION
-+#
-+#   Check for baseline language coverage in the compiler for the C++11
-+#   standard; if necessary, add switches to CXXFLAGS to enable support.
-+#
-+#   The first argument, if specified, indicates whether you insist on an
-+#   extended mode (e.g. -std=gnu++11) or a strict conformance mode (e.g.
-+#   -std=c++11).  If neither is specified, you get whatever works, with
-+#   preference for an extended mode.
-+#
-+#   The second argument, if specified 'mandatory' or if left unspecified,
-+#   indicates that baseline C++11 support is required and that the macro
-+#   should error out if no mode with that support is found.  If specified
-+#   'optional', then configuration proceeds regardless, after defining
-+#   HAVE_CXX11 if and only if a supporting mode is found.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
-+#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
-+#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 3
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [
-+  template <typename T>
-+    struct check
-+    {
-+      static_assert(sizeof(int) <= sizeof(T), "not big enough");
-+    };
-+
-+    typedef check<check<bool>> right_angle_brackets;
-+
-+    int a;
-+    decltype(a) b;
-+
-+    typedef check<int> check_type;
-+    check_type c;
-+    check_type&& cr = static_cast<check_type&&>(c);
-+
-+    auto d = a;
-+])
-+
-+AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [dnl
-+  m4_if([$1], [], [],
-+        [$1], [ext], [],
-+        [$1], [noext], [],
-+        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_11])])dnl
-+  m4_if([$2], [], [ax_cxx_compile_cxx11_required=true],
-+        [$2], [mandatory], [ax_cxx_compile_cxx11_required=true],
-+        [$2], [optional], [ax_cxx_compile_cxx11_required=false],
-+        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_11])])dnl
-+  AC_LANG_PUSH([C++])dnl
-+  ac_success=no
-+  AC_CACHE_CHECK(whether $CXX supports C++11 features by default,
-+  ax_cv_cxx_compile_cxx11,
-+  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
-+    [ax_cv_cxx_compile_cxx11=yes],
-+    [ax_cv_cxx_compile_cxx11=no])])
-+  if test x$ax_cv_cxx_compile_cxx11 = xyes; then
-+    ac_success=yes
-+  fi
-+
-+  m4_if([$1], [noext], [], [dnl
-+  if test x$ac_success = xno; then
-+    for switch in -std=gnu++11 -std=gnu++0x; do
-+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
-+      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
-+                     $cachevar,
-+        [ac_save_CXXFLAGS="$CXXFLAGS"
-+         CXXFLAGS="$CXXFLAGS $switch"
-+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
-+          [eval $cachevar=yes],
-+          [eval $cachevar=no])
-+         CXXFLAGS="$ac_save_CXXFLAGS"])
-+      if eval test x\$$cachevar = xyes; then
-+        CXXFLAGS="$CXXFLAGS $switch"
-+        ac_success=yes
-+        break
-+      fi
-+    done
-+  fi])
-+
-+  m4_if([$1], [ext], [], [dnl
-+  if test x$ac_success = xno; then
-+    for switch in -std=c++11 -std=c++0x; do
-+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
-+      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
-+                     $cachevar,
-+        [ac_save_CXXFLAGS="$CXXFLAGS"
-+         CXXFLAGS="$CXXFLAGS $switch"
-+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
-+          [eval $cachevar=yes],
-+          [eval $cachevar=no])
-+         CXXFLAGS="$ac_save_CXXFLAGS"])
-+      if eval test x\$$cachevar = xyes; then
-+        CXXFLAGS="$CXXFLAGS $switch"
-+        ac_success=yes
-+        break
-+      fi
-+    done
-+  fi])
-+  AC_LANG_POP([C++])
-+  if test x$ax_cxx_compile_cxx11_required = xtrue; then
-+    if test x$ac_success = xno; then
-+      AC_MSG_ERROR([*** A compiler with support for C++11 language features is required.])
-+    fi
-+  else
-+    if test x$ac_success = xno; then
-+      HAVE_CXX11=0
-+      AC_MSG_NOTICE([No compiler with C++11 support was found])
-+    else
-+      HAVE_CXX11=1
-+      AC_DEFINE(HAVE_CXX11,1,
-+                [define if the compiler supports basic C++11 syntax])
-+    fi
-+
-+    AC_SUBST(HAVE_CXX11)
-+  fi
-+])
-diff --git a/configure.ac b/configure.ac
-index 48228be..f7be7de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -131,6 +131,7 @@ win_pkgs="$enchant_req"
- 
- AC_PROG_CC
- AC_PROG_CXX
-+AX_CXX_COMPILE_STDCXX_11(noext,mandatory)
- #AC_PROG_OBJC
- AC_PROG_INSTALL
- # For libtool 1.5.x compatability (AC_PROG_LIBTOOL is deprecated version of LT_INIT)
-diff --git a/src/wp/ap/gtk/ap_UnixApp.cpp b/src/wp/ap/gtk/ap_UnixApp.cpp
-index 061a304..260f8e5 100644
---- a/src/wp/ap/gtk/ap_UnixApp.cpp
-+++ b/src/wp/ap/gtk/ap_UnixApp.cpp
-@@ -863,7 +863,7 @@ static bool is_so (const char *file) {
- 	if (len < (strlen(G_MODULE_SUFFIX) + 2)) // this is ".so" and at least one char for the filename
- 		return false;
- 	const char *suffix = file+(len-3);
--	if(0 == strcmp (suffix, "."G_MODULE_SUFFIX))
-+	if(0 == strcmp (suffix, "." G_MODULE_SUFFIX))
- 		return true;
- 	return false;
- }
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch b/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
deleted file mode 100644
index 0dff1411d..000000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c646159ce817506131b58fdab1cdc1cd6364df7a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 7 Feb 2016 21:45:20 +0100
-Subject: [PATCH] plugins/aiksaurus/Makefile.am: remove uncomplete options
- WITH_BUILTIN_AIKSAURUS_GTK
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* with gtk2 we won't use it
-* it is missing in configure.ac causing
-
-| plugins/aiksaurus/Makefile.am:5: error: WITH_BUILTIN_AIKSAURUS_GTK does not appear in AM_CONDITIONAL
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- plugins/aiksaurus/Makefile.am | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/plugins/aiksaurus/Makefile.am b/plugins/aiksaurus/Makefile.am
-index d402c58..1034e2a 100644
---- a/plugins/aiksaurus/Makefile.am
-+++ b/plugins/aiksaurus/Makefile.am
-@@ -2,10 +2,6 @@ SUBDIRS =
- 
- if TOOLKIT_GTK
- 
--if WITH_BUILTIN_AIKSAURUS_GTK
--SUBDIRS += aiksaurusgtk3
--platform_lib = aiksaurusgtk3/libAiksaurusGtk3.la
--endif
- 
- endif
- 
--- 
-2.5.0
-
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
deleted file mode 100644
index 36b056fdd..000000000
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
+++ /dev/null
@@ -1,142 +0,0 @@
-SUMMARY = "AbiWord is free word processing program similar to Microsoft(r) Word"
-HOMEPAGE = "http://www.abiword.org"
-SECTION = "x11/office"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
-DEPENDS  = " \
-    perl-native \
-    gtk+ \
-    gtkmathview \
-    wv \
-    fribidi \
-    jpeg \
-    libpng \
-    librsvg \
-    libwmf-native \
-    asio \
-    evolution-data-server \
-    libxslt \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'redland rasqal', '', d)} \
-"
-RDEPENDS_${PN}_append_libc-glibc = " \
-    glibc-gconv-ibm850 glibc-gconv-cp1252 \
-    glibc-gconv-iso8859-15 glibc-gconv-iso8859-1 \
-"
-RCONFLICTS_${PN} = "${PN}-embedded"
-
-SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
-           file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
-           file://0001-Bug-13770-Require-C-11-from-now-on.patch \
-           "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
-
-SRC_URI[md5sum] = "cda6dd58c747c133b421cc7eb18f5796"
-SRC_URI[sha256sum] = "afbfd458fd02989d8b0c6362ba8a4c14686d89666f54cfdb5501bd2090cf3522"
-
-#want 3.x from 3.x.y for the installation directory
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-
-inherit distro_features_check autotools-brokensep pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-PACKAGECONFIG ??= " \
-    collab-backend-xmpp collab-backend-tcp \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'libical', '', d)} \
-"
-PACKAGECONFIG[libical] = "--with-libical,--without-libical,libical raptor2"
-PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
-PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth"
-PACKAGECONFIG[collab-backend-tcp] = "--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf libxml2"
-PACKAGECONFIG[collab-backend-service] = "--enable-collab-backend-service,--disable-collab-backend-service,libgsf libxml2 libsoup-2.4 gnutls"
-PACKAGECONFIG[collab-backend-telepathy] = "--enable-collab-backend-telepathy,--disable-collab-backend-telepathy,libgsf libxml2 telepathy-glib telepathy-mission-control"
-PACKAGECONFIG[collab-backend-sugar] = "--enable-collab-backend-sugar,--disable-collab-backend-sugar,libgsf libxml2 dbus-glib"
-
-EXTRA_OECONF = " --disable-static  \
-                 --enable-plugins \
-                 --enable-clipart \
-                 --enable-templates \
-                 --without-gnomevfs \
-                 --with-gtk2 \
-                 --with-libwmf-config=${STAGING_DIR} \
-"
-
-LDFLAGS += "-lgmodule-2.0"
-
-do_compile() {
-    cd goffice-bits2
-    make goffice-paths.h
-    make libgoffice.la
-    cd ${B}
-    oe_runmake
-}
-
-PACKAGES += " ${PN}-clipart ${PN}-strings ${PN}-systemprofiles ${PN}-templates "
-
-FILES_${PN} += " \
-                ${libdir}/lib${PN}-*.so \
-                ${datadir}/mime-info \
-                ${datadir}/icons/* \
-                ${datadir}/${PN}-${SHRT_VER}/glade \
-                ${datadir}/${PN}-${SHRT_VER}/scripts \
-                ${datadir}/${PN}-${SHRT_VER}/system.profile-en \
-                ${datadir}/${PN}-${SHRT_VER}/system.profile-en_GB \
-                ${datadir}/${PN}-${SHRT_VER}/templates/normal.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/normal.awt-en_GB \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Employee-Directory.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Business-Report.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Fax-Coversheet.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Resume.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Two-Columns.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Memo.awt \
-                ${datadir}/${PN}-${SHRT_VER}/templates/Press-Release.awt \
-                ${datadir}/${PN}-${SHRT_VER}/certs \
-                ${datadir}/${PN}-${SHRT_VER}/ui \
-                ${datadir}/${PN}-${SHRT_VER}/xsl* \
-                ${datadir}/${PN}-${SHRT_VER}/mime-info \
-                ${datadir}/${PN}-${SHRT_VER}/Pr*.xml \
-"
-
-# don't steal /usr/lib/libabiword-3.0.so from ${PN}
-# in this case it's needed in ${PN}
-FILES_${PN}-dev = " \
-                  ${includedir} \
-                  ${libdir}/pkgconfig \
-                  ${libdir}/${PN}*.la \
-                  ${libdir}/lib${PN}*.la \
-                  ${libdir}/${PN}-${SHRT_VER}/plugins/*.la \
-"
-FILES_${PN}-dbg += "${libdir}/${PN}-${SHRT_VER}/plugins/.debug"
-FILES_${PN}-doc += "${datadir}/${PN}-*/readme*"
-
-FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/strings"
-FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/system.profile*"
-FILES_${PN}-clipart        += "${datadir}/${PN}-${SHRT_VER}/clipart"
-FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/AbiWord/strings"
-FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/AbiWord/system.profile*"
-FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
-
-PACKAGES_DYNAMIC += "^${PN}-meta.* ^${PN}-plugin-.*"
-
-python populate_packages_prepend () {
-    abiword_libdir    = d.expand('${libdir}/${PN}-${SHRT_VER}/plugins')
-    do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
-
-    metapkg = "abiword-meta"
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    d.setVar('FILES_' + metapkg, "")
-    blacklist = [ 'abiword-plugins-dbg', 'abiword-plugins', 'abiword-plugins-doc', 'abiword-plugins-dev', 'abiword-plugins-locale' ]
-    metapkg_rdepends = []
-    packages = d.getVar('PACKAGES').split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
-            print("Modifying %s" % pkg)
-            metapkg_rdepends.append(pkg)
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-    d.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package')
-    packages.append(metapkg)
-    d.setVar('PACKAGES', ' '.join(packages))
-}
-
-FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-- 
2.20.1


