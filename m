Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B95B4789CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:32 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id n12so19987496wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xRvZHyJbf2wcmqpBEgwMk0K+LtAO5yBlAMpAaYae3Rs=;
	b=Agkho115Ni9tNWLkZ4N8WRSsusYkgjgNqngEjxJgG0YTl79KfUSLisuwezINVDJKGk
	paBGavCaPsRDzUhzrbGM1UPpEt8ZDV7jqVSSNA4+T4jeuZEDvF8Afpc818eg4AXXK1Nk
	Xht+9iYaLFJG4y8XutRVhCQ6BluGFZfv7pRmp0lMPZ/ZQa5fs79OtGQ+8BVAsnCYmn0g
	PPIug8nNr2hIeAIqp6FS+/ECgh7zWieBd/0dYMpqZ9YjE12ZeS+lFGAfAoGE+/GNenzD
	40glrv31flIA9ZauteL+TNJib+KzvK1ORUxSb9atccKfbvXfjdVvXqeDwcJn9jHWyfb7
	iYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xRvZHyJbf2wcmqpBEgwMk0K+LtAO5yBlAMpAaYae3Rs=;
	b=k6VVqIADPSTuo8ZJ9mK7/pmOnyuiMq58WuLfDe/F0VfULsBsJu2A1u2f1tHnCJ1pOX
	9AdpLGZT6ZPX+UTvtPduxG9MrXoZXJc6Uo2gC0IWc8nTr4HgJ2ZFZQ/BGVMBoRdr3OUR
	dHflYcmU3naFar/3bDJAicWijyQl+RaH3FvZj7XB+y8NI7uWLK2CEnMlBNBcywRj2ZzB
	UnEZjT9jv7lsiJk+1a5/ZhdBZZUUuxdp0uZN2QyuI3NKD7gnRBM+iyoefsdXN0IOn/Fu
	sA69arYHTK7H03PNjV9pU7rvdCvpvGlasvUOIb4PHuFENxlYB4cWzUUHRWPAbTp1hBZs
	HqpA==
X-Gm-Message-State: AElRT7GBJeadRRxJCfs3YnbSYyQAMKTra5D22RDMUu1UoCcZbLy+HcHY
	HJMhmfuRQaN46qLfjpJE5FTRbA==
X-Google-Smtp-Source: AG47ELseOYIMGBoqMYgGtMIntCjocFPrJSOF/aGrOADEL+VcOSa7vrB+ekjDFI7/lk4ZLmzqO/MINQ==
X-Received: by 10.223.171.164 with SMTP id s33mr11018751wrc.181.1521491373183; 
	Mon, 19 Mar 2018 13:29:33 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:03 +0100
Message-Id: <20180319202911.30760-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/17] gnome-vfs: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead last release was 2010

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...kefile.am-remove-DG_DISABLE_DEPRECATED-to.patch | 77 ----------------------
 .../do-not-use-srcdir-variable.patch               | 22 -------
 .../gnome-vfs-2.24.4/gconftool-lossage.patch       | 13 ----
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   | 53 ---------------
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    | 58 ----------------
 5 files changed, 223 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
deleted file mode 100644
index 383329970..000000000
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 536e9b57cada4a9f92e073fdf01cdf1def435b6b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 7 May 2013 14:56:06 +0200
-Subject: [PATCH] multiple Makefile.am: remove -DG_DISABLE_DEPRECATED to fix
- build with glib-2.36
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- daemon/Makefile.am      |    1 -
- libgnomevfs/Makefile.am |    1 -
- 2 files changed, 0 insertions(+), 2 deletions(-)
-
-Index: gnome-vfs-2.24.4/daemon/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/daemon/Makefile.am	2013-10-17 16:39:39.081024798 -0700
-+++ gnome-vfs-2.24.4/daemon/Makefile.am	2013-10-17 16:39:39.213024794 -0700
-@@ -8,7 +8,6 @@
- 	-D_LARGEFILE64_SOURCE                   \
- 	-D_POSIX_PTHREAD_SEMANTICS		\
- 	-D_REENTRANT				\
--	-DG_DISABLE_DEPRECATED			\
- 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
- 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
- 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
-Index: gnome-vfs-2.24.4/libgnomevfs/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/libgnomevfs/Makefile.am	2013-10-17 16:39:39.081024798 -0700
-+++ gnome-vfs-2.24.4/libgnomevfs/Makefile.am	2013-10-17 16:39:39.213024794 -0700
-@@ -19,7 +19,6 @@
- 	-D_LARGEFILE64_SOURCE                   \
- 	-D_POSIX_PTHREAD_SEMANTICS		\
- 	-D_REENTRANT				\
--	-DG_DISABLE_DEPRECATED			\
- 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
- 	-DGNOME_VFS_BINDIR=\"$(bindir)\"	\
- 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
-Index: gnome-vfs-2.24.4/modules/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/modules/Makefile.am	2013-10-17 16:39:39.081024798 -0700
-+++ gnome-vfs-2.24.4/modules/Makefile.am	2013-10-17 16:39:39.213024794 -0700
-@@ -18,7 +18,6 @@
- 	-D_POSIX_PTHREAD_SEMANTICS		\
- 	-D_REENTRANT				\
- 	-DSSH_PROGRAM=\"$(SSH_PROGRAM)\"	\
--	-DG_DISABLE_DEPRECATED			\
- 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
- 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
- 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
-Index: gnome-vfs-2.24.4/programs/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/programs/Makefile.am	2013-10-17 16:39:39.081024798 -0700
-+++ gnome-vfs-2.24.4/programs/Makefile.am	2013-10-17 16:39:39.213024794 -0700
-@@ -4,8 +4,7 @@
- 	-I$(top_srcdir)				\
- 	-I$(top_builddir)			\
- 	$(TEST_CFLAGS)				\
--	$(VFS_CFLAGS)				\
--	-DG_DISABLE_DEPRECATED
-+	$(VFS_CFLAGS)
- 
- libraries =						\
- 	$(top_builddir)/libgnomevfs/libgnomevfs-2.la	\
-Index: gnome-vfs-2.24.4/test/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/test/Makefile.am	2010-02-09 04:16:14.000000000 -0800
-+++ gnome-vfs-2.24.4/test/Makefile.am	2013-10-17 16:42:49.109019172 -0700
-@@ -6,7 +6,6 @@
- 	-I$(top_builddir)/libgnomevfs           \
- 	$(TEST_CFLAGS)				\
- 	$(VFS_CFLAGS)				\
--	-DG_DISABLE_DEPRECATED			\
- 	-DMODULES_PATH=\"$(libdir)/vfs/modules\"
- 
- if OS_WIN32
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
deleted file mode 100644
index 30ca29b10..000000000
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-variable.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fixes errors with new autotools
-
-| automake: error: using '$(srcdir)' in TESTS is currently broken: '$(srcdir)/auto-test'
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
-
-Upstream-Status: Not Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: gnome-vfs-2.24.4/test/Makefile.am
-===================================================================
---- gnome-vfs-2.24.4.orig/test/Makefile.am	2013-10-17 16:43:36.677017764 -0700
-+++ gnome-vfs-2.24.4/test/Makefile.am	2013-10-17 16:48:47.369008566 -0700
-@@ -64,7 +64,7 @@
- 	test-async-cancel \
- 	test-escape       \
- 	test-uri       	  \
--	$(srcdir)/auto-test	
-+	auto-test
- 
- libraries =						\
- 	$(top_builddir)/libgnomevfs/libgnomevfs-2.la	\
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch
deleted file mode 100644
index 0f52136e3..000000000
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- gnome-vfs-2.6.0/configure.in~	2004-03-22 12:36:23.000000000 +0000
-+++ gnome-vfs-2.6.0/configure.in	2004-06-07 16:04:34.000000000 +0100
-@@ -154,7 +154,7 @@
- AC_PATH_PROG(GCONFTOOL, gconftool-2, no)
- 
- if test x"$GCONFTOOL" = xno; then
--  AC_MSG_ERROR([gconftool-2 executable not found in your path - should be installed with GConf])
-+  AC_MSG_WARN([gconftool-2 executable not found in your path - should be installed with GConf])
- fi
- 
- AM_GCONF_SOURCE_2
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
deleted file mode 100644
index dabec32c6..000000000
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-removes kerberos completely to avoid conflicts with installed kerberos
---- configure.in.orig	2007-01-05 19:42:26.418541610 +0200
-+++ configure.in	2007-01-05 19:42:56.604261797 +0200
-@@ -436,47 +436,6 @@
- ])
- AM_CONDITIONAL(HAVE_CDDA, test $have_cdda = yes)
- AC_SUBST(CDDA_LIBS)
--
--dnl GSSAPI
--dnl Check for Kerberos installation
--have_gssapi=no
--AC_PATH_PROG([KRB5_CONFIG], krb5-config, none, $PATH:/usr/kerberos/bin)
--					   
--if test "x$KRB5_CONFIG" != "xnone"; then
--   GSSAPI_LIBS="`${KRB5_CONFIG} --libs gssapi`"
--   GSSAPI_CFLAGS="`${KRB5_CONFIG} --cflags gssapi`"
--   
--   saved_CPPFLAGS="$CPPFLAGS"
--   saved_LIBS="$LIBS"
--   LIBS="$LIBS $GSSAPI_LIBS"
--   CPPFLAGS="$CPPFLAGS $GSSAPI_CFLAGS"
--   # MIT and Heimdal put gssapi.h in different places
--   AC_CHECK_HEADERS(gssapi/gssapi.h gssapi.h, [
--       AC_CHECK_FUNCS(gss_init_sec_context, [
--           AC_MSG_NOTICE([GSSAPI authentication support enabled])
--           AC_DEFINE(HAVE_GSSAPI, 1, [Define if GSSAPI support is enabled])
--           AC_CHECK_HEADERS(gssapi/gssapi_generic.h)
--		 have_gssapi=yes
--	 
--       # MIT Kerberos lacks GSS_C_NT_HOSTBASED_SERVICE
--       AC_CHECK_DECL([GSS_C_NT_HOSTBASED_SERVICE],,
--          [AC_DEFINE([GSS_C_NT_HOSTBASED_SERVICE], gss_nt_service_name, 
--             [Define if GSS_C_NT_HOSTBASED_SERVICE is not defined otherwise])
--		], [
--		    #ifdef HAVE_GSSAPI_GSSAPI_H
--		    #include <gssapi/gssapi.h>
--		    #else	   
--		    #include <gssapi.h>
--		    #endif
--		])
--	  ])
--     break
--   ])
--   LIBS="$saved_LIBS" 
--   CPPFLAGS="$saved_CPPFLAGS" 
--fi   
--AC_SUBST(GSSAPI_LIBS)
--AC_SUBST(GSSAPI_CFLAGS)
- 	   
- dnl ******************************
- dnl http-method (neon checks)
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
deleted file mode 100644
index 3ec646697..000000000
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "a userspace virtual filesystem"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libgnomevfs/gnome-vfs.h;endline=25;md5=17071e69707a8f42887d88413f2623cb \
-                    file://programs/gnomevfs-ls.c;endline=23;md5=678a2e8bedaef5818ccabe633840196b \
-                    file://daemon/vfs-daemon.c;endline=21;md5=5f2c61553fb16abb07fc9498ca03fe1f \
-                    file://modules/cdda-cddb.h;endline=22;md5=20ed324ca64907c366ecd7f22b8e0c54"
-
-DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib intltool-native gnome-common-native"
-RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
-# Some legacy packages will require gnome-mime-data to be installed, but use of
-# it is deprecated.
-PR = "r3"
-
-inherit gnome
-
-# This is to provide compatibility with the gnome-vfs DBus fork
-RPROVIDES_${PN} = "gnome-vfs-plugin-dbus"
-
-SRC_URI += " \
-    file://gconftool-lossage.patch \
-    file://gnome-vfs-no-kerberos.patch;striplevel=0 \
-    file://0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch \
-    file://do-not-use-srcdir-variable.patch \
-"
-
-SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
-SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
-GNOME_COMPRESS_TYPE="bz2"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
-PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
-PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
-
-EXTRA_OECONF = " --disable-hal \
-                 --disable-openssl \
-                 --disable-samba \
-                 ac_cv_lib_acl_acl_get_file=no \
-                 ac_cv_lib_sec_acl=no \
-                 gvfs_cv_HAVE_SOLARIS_ACLS=no \
-                 gvfs_cv_HAVE_POSIX_ACLS=no \
-"
-
-FILES_${PN} += "${libdir}/vfs ${datadir}/dbus-1/services"
-FILES_${PN}-dbg += "${libdir}/gnome-vfs-2.0/modules/.debug"
-FILES_${PN}-dev += "${libdir}/gnome-vfs-2.0/include/* ${libdir}/gnome-vfs-2.0/modules/*.la"
-FILES_${PN}-staticdev += "${libdir}/gnome-vfs-2.0/modules/*.a"
-FILES_${PN}-doc += "${datadir}/gtk-doc"
-
-PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
-
-python populate_packages_prepend () {
-    plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
-    do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
-}
-- 
2.14.3


