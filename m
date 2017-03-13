Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9F8776AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 08:56:43 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id z15so38637715lfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 01:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rZzQqdsO5KIQvfi32DKkM0mWOrwa2f7fdSY/X/VFhqA=;
	b=iPlrYMoN6Rj7GPUl8Jhs1eTdZhzOC4XR47hVizkssyZBoTldtwRsBj6fRvHvS3QYQb
	0HP7ooL6nUhHJbvdMDww2o7XuYlJOeQAJXdRJ8KRb07M1XJqBreQ9mXY06fHxCIM3Zg0
	m+6NCobPVQEOKC0BLNrNQQGERAh0zwcHELHbGNJiy3r4lsUGf3+DqCb/AWjrGGiCNaPD
	R/fmOrxESQqQY9L/hkw1KfV7JKXAyTFSwhzMMEBB5LpVWRv7mMfino6kvKxzrRCoQeZl
	zm6Li26qovImENO+UcKnTy+ngDWR+cPhWUSZ1n5SQLl+O4jkPEBYezTi0sl1br2/JNGI
	lR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rZzQqdsO5KIQvfi32DKkM0mWOrwa2f7fdSY/X/VFhqA=;
	b=EJUTFWPs05nqF4Q86Uml66c5N2tlgK16OMjXp5OXPVnBmBubzumk7fIjGPTISOtrsK
	vO5ZvEfTbIPE28UFCTJdJjSVDCcrkCbC9TLm8i7L608VKFYjOD4DIftmWfmkapB/5Sb/
	IaNjmiKB5kHvdv2OQFC1holz8afd2wP45NxEPyb60kTwY4gZ7w2fafplKpe5XgPrPp41
	FOVIkBplApFC4Qog0xVfId9kQ5KVcwxGfcw2Eq0MvgMC7mYCbYE7+OYC0cQNKdQmppsy
	cSilWqky2e3JAkhOobRStDH9taeYjvq678ayBgxZWzyDRjZC/T9Ikhrc8I89djDnm+bA
	RobQ==
X-Gm-Message-State: AMke39nleg2bZ12WlRuKlyt+ATdn/FrvRtrO/trqfXBhCTL+pkI1HYJy5zPx3jbyRfhhD6DG
X-Received: by 10.25.145.2 with SMTP id t2mr8662045lfd.91.1489395403100;
	Mon, 13 Mar 2017 01:56:43 -0700 (PDT)
Received: from stout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id 26sm3537587ljo.21.2017.03.13.01.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Mar 2017 01:56:41 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 09:56:35 +0100
Message-Id: <1489395395-7537-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipes: delete obsolete patches
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
X-List-Received-Date: Mon, 13 Mar 2017 08:56:45 -0000

Deleted bunch of patches which are not used anymore by any recipe.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 ...e-old-ecore_string_init-and-ecore_string_.patch |  54 -------
 .../efl/efl/0002-evas_3d-Add-Eet.h-includes.patch  |  51 -------
 .../gcalctool/gcalctool/fix-includedir.patch       |  31 ----
 .../recipes-support/goffice/goffice/c99math.patch  |  12 --
 .../recipes-support/goffice/goffice/nodolt.patch   |  12 --
 .../goffice/goffice/pcre-8.30.patch                |  19 ---
 ...-Fix-missing-gobject-introspection-checks.patch |  17 ---
 .../0001-Fix-build-after-platform-rename.patch     |  67 ---------
 ...emd-allow-with-systemd-to-take-a-path-arg.patch |  47 ------
 .../autofs/autofs/Makefile.rules-cross.patch       |  23 ---
 .../autofs/autofs/autofs-additional-distros.patch  |  12 --
 .../Add-default-entry-for-cross-compile.patch      |  31 ----
 .../curlpp/curlpp/pkgconfig_fix.patch              |  38 -----
 ...1-Makefile.in-don-t-compile-documentation.patch |  38 -----
 .../files/Do-not-set-CC_FOR_BUILD-flags.patch      |  46 ------
 ...rl-lib-to-directory-perl-instead-of-perl5.patch |  39 -----
 ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 --------
 .../obex/openobex/disable-cable-test.patch         |  16 --
 .../obex/openobex/libusb_crosscompile_check.patch  |  11 --
 .../obex/openobex/separate_builddir.patch          |  16 --
 .../create-as-shared-lib.patch                     |  31 ----
 .../proxy-libintl-20100902/stub-only.patch         |  72 ---------
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch |  36 -----
 .../liblockfile/liblockfile-1.09/glibc-2.4.patch   |  70 ---------
 .../mg/files/remove_ncurses_check.patch            |  36 -----
 .../python-m2crypto/0001-M2Crypto-Error-fix.patch  | 162 ---------------------
 .../python/python-numeric/no-lapack.patch          |  33 -----
 .../apache2/apache2/fix-libtool-name.patch         |  55 -------
 28 files changed, 1133 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/waker/0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch
 delete mode 100644 meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
 delete mode 100644 meta-gnome/recipes-support/goffice/goffice/c99math.patch
 delete mode 100644 meta-gnome/recipes-support/goffice/goffice/nodolt.patch
 delete mode 100644 meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch
 delete mode 100644 meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
 delete mode 100644 meta-networking/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
 delete mode 100644 meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch
 delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch
 delete mode 100644 meta-oe/recipes-support/mg/files/remove_ncurses_check.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch

diff --git a/meta-efl/recipes-efl/e17/waker/0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch b/meta-efl/recipes-efl/e17/waker/0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch
deleted file mode 100644
index 2e9d104..0000000
--- a/meta-efl/recipes-efl/e17/waker/0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From b6296958d5516a735053ee4140e85e2b3a896182 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 30 Jan 2011 00:27:57 +0100
-Subject: [PATCH] waker: remove old ecore_string_init and ecore_string_shutdown
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/bin/waker_main.c |    2 --
- src/bin/waker_tool.c |    2 --
- 2 files changed, 0 insertions(+), 4 deletions(-)
-
-diff --git a/src/bin/waker_main.c b/src/bin/waker_main.c
-index b229cf0..dd54b31 100644
---- a/src/bin/waker_main.c
-+++ b/src/bin/waker_main.c
-@@ -568,7 +568,6 @@ main(int argc, char **argv)
-    E_DBus_Connection *c;
-    
-    ecore_init();
--   ecore_string_init();
-    ecore_app_args_set(argc, (const char **)argv);
-    e_dbus_init();
-    
-@@ -586,7 +585,6 @@ main(int argc, char **argv)
-     
-    e_dbus_connection_close(c);
-    e_dbus_shutdown();
--   ecore_string_shutdown();
-    ecore_shutdown();
-    
-    return 0;
-diff --git a/src/bin/waker_tool.c b/src/bin/waker_tool.c
-index 3344fd2..52515c9 100644
---- a/src/bin/waker_tool.c
-+++ b/src/bin/waker_tool.c
-@@ -93,7 +93,6 @@ main(int argc, char **argv)
-      }
-    
-    ecore_init();
--   ecore_string_init();
-    ecore_app_args_set(argc, (const char **)argv);
-    e_dbus_init();
-    
-@@ -301,7 +300,6 @@ main(int argc, char **argv)
-    
-    e_dbus_connection_close(c);
-    e_dbus_shutdown();
--   ecore_string_shutdown();
-    ecore_shutdown();
-    
-    return 0;
--- 
-1.7.4.rc3
-
diff --git a/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch b/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
deleted file mode 100644
index aa7fd4b..0000000
--- a/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b3cbe31c38a088af7b0dade82545475fc9b72492 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 2 Dec 2014 12:21:10 +0100
-Subject: [PATCH 2/3] evas_3d: Add Eet.h includes
-
-* with some very restrictive options like we use in efl-native, the build is complaining
-  about missing symbols from Eet.h, add include where needed
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/lib/evas/canvas/evas_3d_eet.c                        | 1 +
- src/modules/evas/model_loaders/eet/evas_model_load_eet.c | 1 +
- src/modules/evas/model_savers/eet/evas_model_save_eet.c  | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/lib/evas/canvas/evas_3d_eet.c b/src/lib/evas/canvas/evas_3d_eet.c
-index 1515f5a..a438217 100644
---- a/src/lib/evas/canvas/evas_3d_eet.c
-+++ b/src/lib/evas/canvas/evas_3d_eet.c
-@@ -1,3 +1,4 @@
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
-diff --git a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-index 815b9f1..bff2cea 100644
---- a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-+++ b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-@@ -3,6 +3,7 @@
- #endif
- 
- #include <Eo.h>
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
-diff --git a/src/modules/evas/model_savers/eet/evas_model_save_eet.c b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-index e445dca..2e1cf4e 100644
---- a/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-+++ b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-@@ -2,6 +2,7 @@
-    #include "config.h"
- #endif
- 
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
--- 
-2.3.0
-
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
deleted file mode 100644
index aeb02ab..0000000
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
+++ /dev/null
@@ -1,31 +0,0 @@
----
- Makefile.am           |    2 +-
- gcalctool/Makefile.am |    2 --
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-Index: gcalctool-5.8.17/gcalctool/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
-+++ gcalctool-5.8.17/gcalctool/Makefile.am	2007-05-16 16:03:26.000000000 +0100
-@@ -1,8 +1,6 @@
- ## Process this file with automake to produce Makefile.in
- 
- INCLUDES = \
--	-I$(includedir) \
--	-DG_DISABLE_DEPRECATED \
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED \
- 	-DGDK_DISABLE_DEPRECATED \
- 	-DGNOME_DISABLE_DEPRECATED \
-Index: gcalctool-5.8.17/Makefile.am
-===================================================================
---- gcalctool-5.8.17.orig/Makefile.am	2007-05-16 15:35:44.000000000 +0100
-+++ gcalctool-5.8.17/Makefile.am	2007-05-16 16:06:46.000000000 +0100
-@@ -29,7 +29,7 @@ DISTCLEANFILES =                \
- 	gnome-doc-utils.make	\
- 	gcalctool.desktop
- 
--SUBDIRS = po gcalctool help
-+SUBDIRS = po gcalctool
- 
- SCHEMAS_FILE = gcalctool.schemas
- 
diff --git a/meta-gnome/recipes-support/goffice/goffice/c99math.patch b/meta-gnome/recipes-support/goffice/goffice/c99math.patch
deleted file mode 100644
index 24e6c31..0000000
--- a/meta-gnome/recipes-support/goffice/goffice/c99math.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: goffice-0.7.14/configure.in
-===================================================================
---- goffice-0.7.14.orig/configure.in	2009-11-14 19:14:37.106109501 +0100
-+++ goffice-0.7.14/configure.in	2009-11-14 19:19:40.907333188 +0100
-@@ -66,6 +66,7 @@
- 
- AC_ISC_POSIX
- AC_PROG_CC
-+AC_PROG_CC_C99
- AC_PROG_YACC
- AM_PROG_LEX
- AC_PROG_LN_S
diff --git a/meta-gnome/recipes-support/goffice/goffice/nodolt.patch b/meta-gnome/recipes-support/goffice/goffice/nodolt.patch
deleted file mode 100644
index ea1777a..0000000
--- a/meta-gnome/recipes-support/goffice/goffice/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: goffice-0.7.14/configure.in
-===================================================================
---- goffice-0.7.14.orig/configure.in
-+++ goffice-0.7.14/configure.in
-@@ -71,7 +71,6 @@ AC_PROG_YACC
- AM_PROG_LEX
- AC_PROG_LN_S
- AM_PROG_LIBTOOL
--DOLT
- AC_STDC_HEADERS
- AC_SYS_LARGEFILE
- 
diff --git a/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch b/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch
deleted file mode 100644
index ae9370c..0000000
--- a/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Taken from http://trac.macports.org/ticket/34812
-
-Fixes abiword build failing with:
-/usr/lib/libgoffice-0.8.so: undefined reference to `pcre_info'
-
-Upstream-Status: pending
-
-http://www.linuxfromscratch.org/blfs/view/cvs/x/goffice.html
---- a/goffice/utils/regutf8.c.orig	2009-09-05 18:52:09.000000000 -0500
-+++ b/goffice/utils/regutf8.c	2012-06-09 18:04:29.000000000 -0500
-@@ -155,7 +155,7 @@
- 		default: return GO_REG_BADPAT;
- 		}
- 	} else {
--		gor->re_nsub = pcre_info (r, NULL, NULL);
-+		gor->re_nsub = pcre_fullinfo (r, NULL, 0, NULL);
- 		gor->nosub = (cflags & GO_REG_NOSUB) != 0;
- 		return 0;
- 	}
diff --git a/meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch b/meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
deleted file mode 100644
index 8701f58..0000000
--- a/meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -Naur ../tracker-0.10.8/configure.ac tracker-0.10.8//configure.ac
---- ../tracker-0.10.8/configure.ac	2011-04-08 15:03:30.000000000 +0300
-+++ tracker-0.10.8//configure.ac	2011-04-11 13:47:16.625914002 +0300
-@@ -218,7 +218,12 @@
- 
- # Needed to generate .gir files,
- # see http://live.gnome.org/GnomeGoals/AddGObjectIntrospectionSupport
--GOBJECT_INTROSPECTION_CHECK([0.9.5])
-+#GOBJECT_INTROSPECTION_CHECK([0.9.5])
-+# Satisfy missing introspection foo
-+AM_CONDITIONAL(HAVE_INTROSPECTION, test "0" == "1")
-+
-+INTROSPECTION_CFLAGS=""
-+AC_SUBST(INTROSPECTION_CFLAGS)
- 
- # NOTE: dbus and dbus-glib-1 are only used now for libtracker-client
- # which is deprecated and tracker-writeback which will be refactored
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
deleted file mode 100644
index 35e5134..0000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 7cf366faa7a24c7146c745c8cd8dc3ae3d1cabea Mon Sep 17 00:00:00 2001
-From: Garrett Brown <themagnificentmrb@gmail.com>
-Date: Thu, 7 Jan 2016 15:55:22 -0800
-Subject: [PATCH] Fix build after platform rename
-
-update source code to use renamed platform pkg
----
- CMakeLists.txt      | 6 +++---
- debian/control      | 2 +-
- src/util/XMLUtils.h | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2ce8c0d..bf6b659 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -8,7 +8,7 @@ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
- find_package(kodi REQUIRED)
- find_package(TinyXML REQUIRED)
- find_package(Threads REQUIRED)
--find_package(platform REQUIRED)
-+find_package(p8-platform REQUIRED)
- include(UseMultiArch.cmake)
- include(CheckAtomic.cmake)
- 
-@@ -36,10 +36,10 @@ endif()
- 
- set(SOURCES src/util/XMLUtils.cpp)
- 
--include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} ${platform_INCLUDE_DIRS})
-+include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} ${p8-platform_INCLUDE_DIRS})
- 
- add_library(kodiplatform ${SOURCES} ${PLAT_SOURCES})
--target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} ${platform_LIBRARIES})
-+target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} ${p8-platform_LIBRARIES})
- set_target_properties(kodiplatform PROPERTIES VERSION ${kodiplatform_VERSION_MAJOR}.${kodiplatform_VERSION_MINOR}.${kodiplatform_VERSION_PATCH}
-                                               SOVERSION ${kodiplatform_VERSION_MAJOR}.0)
- 
-diff --git a/debian/control b/debian/control
-index 42cadb2..e40c982 100644
---- a/debian/control
-+++ b/debian/control
-@@ -1,7 +1,7 @@
- Source: kodiplatform
- Priority: extra
- Maintainer: Arne Morten Kvarving <arne.morten.kvarving@sintef.no>
--Build-Depends: debhelper (>= 8.0.0), cmake, libtinyxml-dev, kodi-addon-dev, libplatform-dev
-+Build-Depends: debhelper (>= 8.0.0), cmake, libtinyxml-dev, kodi-addon-dev, libp8-platform-dev
- Standards-Version: 3.9.2
- Section: libs
- 
-diff --git a/src/util/XMLUtils.h b/src/util/XMLUtils.h
-index f22fd07..a10d831 100644
---- a/src/util/XMLUtils.h
-+++ b/src/util/XMLUtils.h
-@@ -21,7 +21,7 @@
-  *
-  */
- 
--#include <platform/util/StdString.h>
-+#include <p8-platform/util/StdString.h>
- #include "tinyxml.h"
- 
- class XMLUtils
--- 
-2.0.1
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
deleted file mode 100644
index 742f25d..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 40971911d653bf53de295d7462c643e4073916b9 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe@deserted.net>
-Date: Fri, 1 Nov 2013 12:47:18 -0400
-Subject: [PATCH] systemd: allow --with-systemd to take a path arg
-
-If building for a cross-compile environment with systemd it is convenient
-to be able to specify a systemd path for the target that may not be the
-same as that on the host.
-
-Upstream-status: Submitted [http://www.spinics.net/lists/autofs/msg00740.html]
-
-Signed-off-by: Joe MacDonald <joe@deserted.net>
----
- aclocal.m4 |   10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 3e6f223..105e3e9 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -229,8 +229,10 @@ dnl Check the location of the systemd unit files directory
- dnl --------------------------------------------------------------------------
- AC_DEFUN([AF_WITH_SYSTEMD],
- [AC_ARG_WITH(systemd,
--[  --with-systemd         install systemd unit file if systemd unit directory
--			  is found on system],
-+[  --with-systemd@<:@=systemddir@:>@  install systemd unit file.  If 'yes'
-+			  probe the system for unit directory.
-+			  If a path is specified, assume that
-+			  is a valid install path.],
- [if test "$withval" = yes; then
-   if test -z "$systemddir"; then
-     AC_MSG_CHECKING([location of the systemd unit files directory])
-@@ -247,6 +249,10 @@ AC_DEFUN([AF_WITH_SYSTEMD],
-   else
-     AC_MSG_RESULT(not found)
-   fi
-+else
-+ if test "$withval" != no; then
-+  systemddir=$withval
-+ fi
- fi])
- ])
- 
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch b/meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
deleted file mode 100644
index 7dc7096..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: autofs-5.0.7/Makefile.rules
-===================================================================
---- autofs-5.0.7.orig/Makefile.rules	2012-07-24 23:05:26.000000000 -0700
-+++ autofs-5.0.7/Makefile.rules	2012-10-26 09:23:40.270204270 -0700
-@@ -34,14 +34,14 @@
- else
- CFLAGS    ?= -O2 -Wall
- LDFLAGS   = -s
--STRIP     = strip --strip-debug
-+STRIP     = ${TARGET_PREFIX}strip --strip-debug
- endif
- endif
- 
--CC        = gcc
--CXX       = g++
-+CC        ?= ${TARGET_PREFIX}gcc
-+CXX       ?= ${TARGET_PREFIX}g++
- CXXFLAGS  = $(CFLAGS)
--LD        = ld
-+LD        ?= ${TARGET_PREFIX}ld
- SOLDFLAGS = -shared
- 
- CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
deleted file mode 100644
index 6a35843..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- autofs-4.1.4/samples/rc.autofs.in~	2005-04-11 06:30:54.000000000 -0500
-+++ autofs-4.1.4/samples/rc.autofs.in	2007-04-07 13:18:44.000000000 -0500
-@@ -43,6 +43,9 @@
- 	system=debian
- elif [ -f /etc/redhat-release ]; then
- 	system=redhat
-+elif [ -f /etc/issue ] && grep -q "^SlugOS\|Yocto" /etc/issue ; then
-+	# SlugOS and Yocto behave like Debian, at least for autofs purposes.
-+	system=debian
- else
- 	echo "$0: Unknown system, please port and contact autofs@linux.kernel.org" 1>&2
- 	exit 1
diff --git a/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch b/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
deleted file mode 100644
index 5f845bb..0000000
--- a/meta-networking/recipes-daemons/squid/files/Add-default-entry-for-cross-compile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From faa212a4e0aaf442ff58fca50770a8fadc1038e3 Mon Sep 17 00:00:00 2001
-Message-Id: <faa212a4e0aaf442ff58fca50770a8fadc1038e3.1382041123.git.Jim.Somerville@windriver.com>
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Thu, 17 Oct 2013 16:17:48 -0400
-Subject: [PATCH 1/1] Add default entry for cross compile
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
----
- acinclude/krb5.m4 |    6 +++++-
- 1 files changed, 5 insertions(+), 1 deletions(-)
-
-diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
-index 5d9ac36..7a072a2 100644
---- a/acinclude/krb5.m4
-+++ b/acinclude/krb5.m4
-@@ -82,7 +82,11 @@ main(void)
- 
-         return 0;
- }
--]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ])
-+]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ],
-+[
-+  dnl Can't test in cross compiled env - so assume good
-+  squid_cv_broken_heimdal_krb5_h=no
-+])
-     ],
-     [
-      dnl Can't test in cross compiled env - so assume good
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-support/curlpp/curlpp/pkgconfig_fix.patch b/meta-networking/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
deleted file mode 100644
index ad73c00..0000000
--- a/meta-networking/recipes-support/curlpp/curlpp/pkgconfig_fix.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Inappropriate [packaging]
-
-
-Index: curl-7.20.0/libcurl.pc.in
-===================================================================
---- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
-+++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
-@@ -35,6 +35,7 @@
- URL: http://curl.haxx.se/
- Description: Library to transfer files with ftp, http, etc.
- Version: @CURLVERSION@
--Libs: -L${libdir} -lcurl @LIBS@
--Libs.private: @LIBCURL_LIBS@ @LIBS@
-+Requires.private: @GNUTLS_REQUIRED@
-+Libs: -L${libdir} -lcurl
-+Libs.private: -ldl -lz
- Cflags: -I${includedir}
-Index: curl-7.20.0/configure.ac
-===================================================================
---- curl-7.20.0.orig/configure.ac	2010-02-04 21:41:46.000000000 +0000
-+++ curl-7.20.0/configure.ac	2010-03-25 12:12:18.673129001 +0000
-@@ -1668,6 +1668,7 @@
-        AC_SUBST(USE_GNUTLS, [1])
-        GNUTLS_ENABLED=1
-        USE_GNUTLS="yes"
-+       GNUTLS_REQUIRED="gnutls"
-        curl_ssl_msg="enabled (GnuTLS)"
-        ],
-        [
-@@ -1696,6 +1697,8 @@
- 
- fi dnl OPENSSL != 1
- 
-+AC_SUBST(GNUTLS_REQUIRED)
-+
- dnl ----------------------------------------------------
- dnl NSS. Only check if GnuTLS and OpenSSL are not enabled
- dnl ----------------------------------------------------
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
deleted file mode 100644
index 1de4a86..0000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-don-t-compile-documentation.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From feccf89f08a455460668cf286151662e4c1557b3 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Thu, 20 Aug 2015 15:32:30 +0900
-Subject: [PATCH] Makefile.in: don't compile documentation
-
-The documentation file is not suitable for cross-compile,
-Errors will occur:
-| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
-| ../../user/v9/drbdsetup xml-help disk-options > drbdsetup_xml-help_disk-options.xml
-| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
-| /bin/sh: ../../user/v9/drbdsetup: /lib/ld-linux-x86-64.so.2: bad ELF interpreter: No such file or directory
-| make[1]: *** [drbdsetup_xml-help_new-resource.xml] Error 126
-
-so we do not compile it.
-
-Upstream-Status: pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 5365a2c..d5967d8 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -45,7 +45,7 @@ WITH_84_SUPPORT = @WITH_84_SUPPORT@
- # and not in e.g. dash. I'm too lazy to fix it to be compatible.
- SHELL=/bin/bash
- 
--SUBDIRS     = user/shared user/v9 user/v84 user/v83 scripts documentation/v83 documentation/v84 documentation/v9
-+SUBDIRS     = user/shared user/v9 user/v84 user/v83 scripts
- 
- REL_VERSION := $(shell $(SED) -ne '/^AC_INIT/{s/^[^,]*, *\([^,]*\) *,.*/\1/;p;q}' configure.ac)
- ifdef FORCE
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch b/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch
deleted file mode 100644
index 64a08ad..0000000
--- a/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_BUILD-flags.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-[PATCH] Do not set CC_FOR_BUILD flags
-
-Upstream-status: Pending
-
-AC_WIRESHARK_COMPILER_FLAGS_CHECK() is checking which options CC is supported,
-and put the supported options into CFLAGS, but it should not put them into 
-CFLAGS_FOR_BUILD. since CC and BUILD_CC can be different, CFLAGS_FOR_BUILD is
-used by BUILD_CC 
-
-BUILD_CC is used to generated host tools, do not use the gcc's optimised options,
-do not effect the running of host tools. so do not set CC_FOR_BUILD flags.
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- acinclude.m4 | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 136fc27..8d3d360 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -1755,10 +1755,6 @@ if test "x$ac_supports_gcc_flags" = "xyes" ; then
-               # just the new option.
-               #
-               CFLAGS="$CFLAGS_saved $GCC_OPTION"
--              #
--              # Add it to the flags we use when building build tools.
--              #
--              CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
-             ],
-             [
-               AC_MSG_RESULT(yes)
-@@ -1771,10 +1767,6 @@ if test "x$ac_supports_gcc_flags" = "xyes" ; then
-           # just the new option.
-           #
-           CFLAGS="$CFLAGS_saved $GCC_OPTION"
--          #
--          # Add it to the flags we use when building build tools.
--          #
--          CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
-         fi
-       ],
-       [
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
deleted file mode 100644
index 0b8d0e4..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Inappropriate [oe-core specific]
-
-libhugetlbfs depends on perl, and perl installs a directory 'perl'
-and make a symlink 'perl5' to it. So just install perl libs in
-libhugetlbfs to directory 'perl' instead of 'perl5'. This can avoid
-the following error:
-| CalledProcessError: Command 'tar -cf - -C .../perl/5.14.3-r1/sysroot-destdir
-| -ps . | tar -xf - -C .../tmp/sysroots/t4240qds'
-| returned non-zero exit status 2 with output
-| tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exists
-| tar: Exiting with failure status due to previous errors
-
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
-
---- a/Makefileold	2013-10-11 23:07:31.759421318 -0500
-+++ b/Makefile	2013-10-11 23:08:01.935571122 -0500
-@@ -173,17 +173,17 @@
- DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
- 
- ifdef CC32
--PMDIR = $(PREFIX)/lib/perl5/TLBC
-+PMDIR = $(PREFIX)/lib/perl/TLBC
- endif
- 
- ifdef CC64
- ifeq ($(ARCH),x86_64)
--PMDIR = $(PREFIX)/lib/perl5/TLBC
-+PMDIR = $(PREFIX)/lib/perl/TLBC
- else
- ifeq ($(ARCH),aarch64)
--PMDIR = $(PREFIX)/lib/perl5/TLBC
-+PMDIR = $(PREFIX)/lib/perl/TLBC
- else
--PMDIR = $(PREFIX)/lib64/perl5/TLBC
-+PMDIR = $(PREFIX)/lib64/perl/TLBC
- endif
- endif
- endif
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
deleted file mode 100644
index 7caaf51..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a130153ae84d8bb5914879cef94df09f06825c10 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 18 Jun 2011 11:25:36 +0200
-Subject: [PATCH] buildsys: don't add /usr/include and /usr/lib to configure tests for libusb
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- config/usrp_libusb.m4 |   13 -------------
- 1 files changed, 0 insertions(+), 13 deletions(-)
-
-diff --git a/config/usrp_libusb.m4 b/config/usrp_libusb.m4
-index cc3410f..b421820 100644
---- a/config/usrp_libusb.m4
-+++ b/config/usrp_libusb.m4
-@@ -117,10 +117,6 @@ AC_DEFUN([USRP_LIBUSB], [
-       dnl configured to find this header.
-       AC_LANG_PUSH(C)
-       save_CPPFLAGS="$CPPFLAGS"
--      if test x$USB_INCLUDEDIR != x; then
--        USB_INCLUDES="-I$USB_INCLUDEDIR"
--        CPPFLAGS="$USB_INCLUDES"
--      fi
-       AC_MSG_CHECKING([$libusb_name for header $usb_header])
-       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-         #include "$usb_header"
-@@ -172,9 +168,6 @@ AC_DEFUN([USRP_LIBUSB], [
-             *)
-               AC_LANG_PUSH(C)
-               save_CPPFLAGS="$CPPFLAGS"
--              if test x$USB_INCLUDEDIR != x; then
--                CPPFLAGS="$USB_INCLUDES"
--              fi
-               save_LIBS="$LIBS"
-               LIBS="$USB_LIBS"
-               AC_MSG_CHECKING([$libusb_name for symbol usb_debug in library $usb_lib_name])
-@@ -217,9 +210,6 @@ AC_DEFUN([USRP_LIBUSB], [
-     dnl final error checking, mostly to create #define's
-     AC_LANG_PUSH(C)
-     save_CPPFLAGS="$CPPFLAGS"
--    if test x$USB_INCLUDEDIR != x; then
--      CPPFLAGS="$USB_INCLUDES"
--    fi
-     dnl Check for the header.
-     AC_CHECK_HEADERS([$usb_header], [], [libusbok=no])
-     CPPFLAGS="$save_CPPFLAGS"
-@@ -231,9 +221,6 @@ AC_DEFUN([USRP_LIBUSB], [
-       dnl check for the library (again)
-       AC_LANG_PUSH(C)
-       save_CPPFLAGS="$CPPFLAGS"
--      if test x$USB_INCLUDEDIR != x; then
--        CPPFLAGS="$USB_INCLUDES"
--      fi
-       save_LIBS="$LIBS"
-       LIBS="$USB_LIBS"
-       AC_CHECK_LIB([$usb_lib_name], [$usb_lib_func], [], [
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch b/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
deleted file mode 100644
index 95b636d..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- openobex-1.2/apps/Makefile.am~disable-cable-test
-+++ openobex-1.2/apps/Makefile.am
-@@ -6,7 +6,7 @@
- 	obex_io.c obex_io.h \
- 	obex_put_common.c obex_put_common.h
- 
--bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test
-+bin_PROGRAMS = irxfer obex_tcp irobex_palm3
- 
- obex_test_SOURCES = \
- 	obex_test.c obex_test.h \
diff --git a/meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch
deleted file mode 100644
index 1177dfe..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
-+++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
-@@ -158,7 +158,7 @@
- 		;;
- 	*)
- 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
--		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
-+		REQUIRES="libusb"
- 		;;
- 	esac
- 	AC_SUBST(USB_CFLAGS)
diff --git a/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch b/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
deleted file mode 100644
index 8abf8ae..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix detection of IrDA failing with B!=S
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- a/acinclude.m4	2014-05-24 14:05:41.757796816 +0100
-+++ b/acinclude.m4	2014-05-24 14:03:06.556795536 +0100
-@@ -54,6 +54,7 @@
- ])
- 
- AC_DEFUN([AC_PATH_IRDA_LINUX], [
-+	CPPFLAGS="${CPPFLAGS} -I${srcdir}"
- 	AC_CACHE_CHECK([for IrDA support], irda_found, [
- 		AC_TRY_COMPILE([
- 				#include <sys/socket.h>
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
deleted file mode 100644
index 306e3b8..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/create-as-shared-lib.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/src/proxy-libintl/Makefile.org	2009-09-12 23:19:04.989421607 -0700
-+++ a/src/proxy-libintl/Makefile	2009-09-12 23:21:14.100640001 -0700
-@@ -4,20 +4,20 @@ ZIPFILE = proxy-libintl-$(TIMESTAMP).zip
- CC = gcc
- CFLAGS = -Wall -I ../../include
- 
--all : ../../lib/libintl.a ../../lib/intl.lib
-+all : ../../lib/libintl.so ../../lib/intl.lib
- 
--../../lib/libintl.a : libintl.o
--	ar rc $@ libintl.o
-+../../lib/libintl.so : libintl.o
-+	$(CC) -shared -o $@ libintl.o
- 
--../../lib/intl.lib : ../../lib/libintl.a
--	cp ../../lib/libintl.a $@
--	strip --strip-unneeded $@
-+../../lib/intl.lib : ../../lib/libintl.so
-+	cp ../../lib/libintl.so $@
-+	$(STRIP) --strip-unneeded $@
- 
- libintl.o : libintl.c
- 	$(CC) $(CFLAGS) -c libintl.c
- 
- clean :
--	rm -f *.o ../../lib/libintl.a ../../$(ZIPFILE)
-+	rm -f *.o ../../lib/libintl.so ../../$(ZIPFILE)
- 
- dist : clean all
--	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.a,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
-+	cd ../..; zip $(ZIPFILE) include/libintl.h lib/{libintl.so,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.[ch]}; manifestify $(ZIPFILE)
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch b/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
deleted file mode 100644
index 7186b13..0000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl-20100902/stub-only.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Index: proxy-libintl/src/proxy-libintl/libintl.c
-===================================================================
---- proxy-libintl.orig/src/proxy-libintl/libintl.c
-+++ proxy-libintl/src/proxy-libintl/libintl.c
-@@ -18,9 +18,12 @@
-  */
- 
- #ifdef _WIN32
--#include <windows.h>
-+#  include <windows.h>
- #else
--#include <dlfcn.h>
-+#  include <stddef.h>
-+#  if !STUB_ONLY
-+#    include <dlfcn.h>
-+#  endif
- typedef void* HMODULE;
- #endif
- 
-@@ -65,11 +68,13 @@ static char * (*p_bind_textdomain_codese
- static int
- use_intl_dll (HMODULE dll)
- {
--#ifdef _WIN32
--#define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
--#else
--#define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
--#endif
-+#if !STUB_ONLY
-+#  ifdef _WIN32
-+#    define LOOKUP(fn) p_##fn = (void *) GetProcAddress (dll, #fn); if (p_##fn == NULL) return 0
-+#  else
-+#    define LOOKUP(fn) p_##fn = (void *) dlsym (dll, #fn); if (p_##fn == NULL) return 0
-+#  endif  /* _WIN32 */
-+
- 
-   LOOKUP (gettext);
-   LOOKUP (dgettext);
-@@ -82,7 +87,7 @@ use_intl_dll (HMODULE dll)
-   LOOKUP (bind_textdomain_codeset);
-   
- #undef LOOKUP
--
-+#endif  /* !STUB_ONLY */
-   return 1;
- }
- 
-@@ -171,13 +176,17 @@ setup (void)
- 
-   if (!beenhere)
-     {
--#ifdef _WIN32
--      HMODULE intl_dll = LoadLibrary ("intl.dll");
--#elif defined(__APPLE__) && defined(__MACH__)
--      HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
--#else
--      HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
--#endif
-+#if !STUB_ONLY
-+#  ifdef _WIN32
-+    HMODULE intl_dll = LoadLibrary ("intl.dll");
-+#  elif defined(__APPLE__) && defined(__MACH__)
-+    HMODULE intl_dll = dlopen ("libintl.dylib", RTLD_LAZY);
-+#  else
-+    HMODULE intl_dll = dlopen ("libintl.so", RTLD_LAZY);
-+#  endif
-+#else  /* !STUB_ONLY */
-+    HMODULE intl_dll = NULL;
-+#endif  /* STUB_ONLY */
- 
-       if (intl_dll != NULL &&
- 	  use_intl_dll (intl_dll))
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch
deleted file mode 100644
index 7da13ee..0000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-to-fix-lib64-can-not-be-shiped-in-64bit-target.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f3c39fd2a4b5f53338b5f821788c63858bf860cf Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Sun, 2 Aug 2015 22:08:43 +0900
-Subject: [PATCH] to fix lib64 can not be shiped in 64bit target
-
-To fix the warning as following:
-WARNING: QA Issue: konkretcmpi: Files/directories were installed but not shipped in any package:
-  /usr/lib64
-  /usr/lib64/libkonkret.so
-  /usr/lib64/libkonkret.so.0.0.1
-  /usr/lib64/libkonkret.so.0
-  /usr/lib64/libkonkretmof.so.0.0.1
-  /usr/lib64/libkonkretmof.so
-  ...
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- cmake/modules/FindKonkretCMPI.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindKonkretCMPI.cmake b/cmake/modules/FindKonkretCMPI.cmake
-index b888cfd..097caed 100644
---- a/cmake/modules/FindKonkretCMPI.cmake
-+++ b/cmake/modules/FindKonkretCMPI.cmake
-@@ -9,7 +9,7 @@ find_path(KONKRETCMPI_INCLUDE_DIR
- find_library(KONKRETCMPI_LIBRARY
-     NAMES konkret
-     HINTS $ENV{KONKRETCMPI_LIB_DIR}
--    PATH_SUFFIXES lib64 lib
-+    PATH_SUFFIXES lib lib64
-     PATHS /usr /usr/local
- )
- 
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch
deleted file mode 100644
index e3c4aaa..0000000
--- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-The local function eaccess conflicts with a glibc function of the same name.
-Rename the function so that this can be build under glibc 2.4, and older
-revisions, without any problems.
-
---- liblockfile-1.06/dotlockfile.c	2006/07/10 03:17:40	1.1
-+++ liblockfile-1.06/dotlockfile.c	2006/07/10 03:18:26
-@@ -42,7 +42,7 @@
- extern int optind;
- #endif
- 
--extern int eaccess(char *, gid_t, struct stat *);
-+extern int xeaccess(char *, gid_t, struct stat *);
- 
- /*
-  *	Sleep for an amout of time while regulary checking if
-@@ -252,14 +252,14 @@
- 		return L_ERROR;
- 	}
- 	gid = getgid();
--	if (eaccess(dir, gid, &st) < 0) {
-+	if (xeaccess(dir, gid, &st) < 0) {
- 		if (errno == ENOENT) {
- enoent:
- 			if (!quiet) fprintf(stderr,
- 				"dotlockfile: %s: no such directory\n", dir);
- 			return L_TMPLOCK;
- 		}
--		if ((r = eaccess(dir, getegid(), &st) < 0) && errno == ENOENT)
-+		if ((r = xeaccess(dir, getegid(), &st) < 0) && errno == ENOENT)
- 			goto enoent;
- 		if (r < 0 || !ismaillock(lockfile, pwd->pw_name)) {
- 			if (!quiet) fprintf(stderr,
-@@ -272,7 +272,7 @@
- 	/*
- 	 *	Now we should be able to chdir() to the lock directory.
- 	 *	When we stat("."), it should be the same as at the
--	 *	eaccess() check or someone played symlink() games on us.
-+	 *	xeaccess() check or someone played symlink() games on us.
- 	 */
- 	if (chdir(dir) < 0 || stat(".", &st2) < 0) {
- 		if (!quiet) fprintf(stderr,
---- liblockfile-1.06/lockfile.c	2006/07/10 03:17:40	1.1
-+++ liblockfile-1.06/lockfile.c	2006/07/10 03:18:26
-@@ -54,7 +54,7 @@
- #ifdef LIB
- static
- #endif
--int eaccess(char *fn, gid_t gid, struct stat *st)
-+int xeaccess(char *fn, gid_t gid, struct stat *st)
- {
- 	struct stat	tmp;
- 	uid_t		uid = geteuid();
-@@ -96,7 +96,7 @@
- 		*p = 0;
- 	else
- 		strcpy(dir, ".");
--	if (eaccess(dir, egid, NULL) >= 0) {
-+	if (xeaccess(dir, egid, NULL) >= 0) {
- 		free(dir);
- 		return 0;
- 	}
-@@ -111,7 +111,7 @@
- 			return 0;
- 		mailgid = st.st_gid;
- 	}
--	ret = eaccess(dir, mailgid, NULL) >= 0;
-+	ret = xeaccess(dir, mailgid, NULL) >= 0;
- 	free (dir);
- 	return ret;
- }
diff --git a/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch b/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch
deleted file mode 100644
index 16137da..0000000
--- a/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-diff -uwr mg-20110905/configure mg-20110905-changed/configure
---- mg-20110905/configure	2011-09-05 13:36:16.000000000 -0500
-+++ mg-20110905-changed/configure	2014-08-14 10:46:14.168715425 -0500
-@@ -163,32 +163,6 @@
-     echo 'Fails.'
- fi
- 
--
--if [ ! -r /usr/include/term.h ]; then
--    note 'term.h'
--    if [ -r /usr/include/ncurses/term.h ]; then
--	echo "Found in /usr/include/ncurses"
--	extraflags="$extraflags -I/usr/include/ncurses"
--    else
--	for i in pkg local; do
--	    if [ -r /usr/$i/include/term.h ]; then
--		echo "Found in /usr/$i/include"
--		extralibs="$extralibs -L/usr/$i/lib"
--		extraflags="$extraflags -I/usr/$i/include"
--		break
--	    else
--		false
--	    fi
--	done ||
--	{
--	    echo 'Not found!' >&2
--	    echo 'Do you have the ncurses devel package installed?' >&2
--	    echo 'If you know where term.h is, please email the author!' >&2
--	    exit 1
--	}
--    fi
--fi
--
- note 'base and dirname'
- if gcc_defines "__GLIBC__" || gcc_defines "__CYGWIN__" ; then
-     echo 'Not present, adding.'
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch
deleted file mode 100644
index 2a74b68..0000000
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 02a24ac541df68033d4efd7e2f8a1b92dc49328d Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Mon, 27 Jul 2015 05:06:20 +0900
-Subject: [PATCH] M2Crypto: Error fix.
-
-After swig upgrade from 3.0.2 to 3.0.6,build the recipes which
-depends on python-m2crypto will occur errors like this:
-SALT_LEN = m2.PKCS5_SALT_LEN
-AttributeError: 'module' object has no attribute 'PKCS5_SALT_LEN'
-since python-m2crypto depends on swig-native
-
-Ref:
-https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489
-
-This patch is from:
-http://pkgs.fedoraproject.org/cgit/m2crypto.git/tree/m2crypto-0.21.1-swig-3.0.5.patch
-
-Upstream-Status: pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- M2Crypto/__init__.py |  4 ++--
- M2Crypto/m2.py       |  2 +-
- SWIG/_lib.i          |  4 ++++
- SWIG/_pkcs7.i        |  1 +
- setup.py             | 26 +++++++++++++++++++++++++-
- 5 files changed, 33 insertions(+), 4 deletions(-)
-
-diff --git a/M2Crypto/__init__.py b/M2Crypto/__init__.py
-index e7acfe7..02f4d28 100644
---- a/M2Crypto/__init__.py
-+++ b/M2Crypto/__init__.py
-@@ -19,7 +19,7 @@ Copyright 2008-2011 Heikki Toivonen. All rights reserved.
- version_info = (0, 21, 1)
- version = '.'.join([str(_v) for _v in version_info])
- 
--import __m2crypto
-+import _m2crypto
- import m2
- import ASN1
- import AuthCookie
-@@ -57,4 +57,4 @@ import util
- encrypt=1
- decrypt=0
- 
--__m2crypto.lib_init()
-+_m2crypto.lib_init()
-diff --git a/M2Crypto/m2.py b/M2Crypto/m2.py
-index e4bb695..822143f 100644
---- a/M2Crypto/m2.py
-+++ b/M2Crypto/m2.py
-@@ -25,7 +25,7 @@ Portions created by Open Source Applications Foundation (OSAF) are
- Copyright (C) 2004 OSAF. All Rights Reserved.
- """
- 
--from __m2crypto import *
-+from _m2crypto import *
- lib_init()
- 
- 
-diff --git a/SWIG/_lib.i b/SWIG/_lib.i
-index 42dc180..47a53b8 100644
---- a/SWIG/_lib.i
-+++ b/SWIG/_lib.i
-@@ -100,6 +100,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
-     int cret;
-     int new_style_callback = 0, warning_raised_exception=0;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     ssl = (SSL *)X509_STORE_CTX_get_app_data(ctx);
- 
-@@ -185,6 +186,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
- void ssl_info_callback(const SSL *s, int where, int ret) {
-     PyObject *argv, *retval, *_SSL;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-@@ -204,6 +206,7 @@ DH *ssl_set_tmp_dh_callback(SSL *ssl, int is_export, int keylength) {
-     PyObject *argv, *ret, *_ssl;
-     DH *dh;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-@@ -227,6 +230,7 @@ RSA *ssl_set_tmp_rsa_callback(SSL *ssl, int is_export, int keylength) {
-     PyObject *argv, *ret, *_ssl;
-     RSA *rsa;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-diff --git a/SWIG/_pkcs7.i b/SWIG/_pkcs7.i
-index 174f40a..7bffbfc 100644
---- a/SWIG/_pkcs7.i
-+++ b/SWIG/_pkcs7.i
-@@ -157,6 +157,7 @@ PyObject *smime_read_pkcs7(BIO *bio) {
-     BIO *bcont = NULL;
-     PKCS7 *p7;
-     PyObject *tuple, *_p7, *_BIO;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     if (BIO_method_type(bio) == BIO_TYPE_MEM) {
-         /* OpenSSL FAQ explains that this is needed for mem BIO to return EOF,
-diff --git a/setup.py b/setup.py
-index e7c49eb..b98abe0 100644
---- a/setup.py
-+++ b/setup.py
-@@ -20,6 +20,7 @@ except ImportError:
-     from distutils.command import build_ext
- 
- from distutils.core import Extension
-+from distutils.file_util import copy_file
- 
- 
- class _M2CryptoBuildExt(build_ext.build_ext):
-@@ -57,7 +58,17 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-         self.swig_opts.append('-includeall')
-         #self.swig_opts.append('-D__i386__') # Uncomment for early OpenSSL 0.9.7 versions, or on Fedora Core if build fails
-         #self.swig_opts.append('-DOPENSSL_NO_EC') # Try uncommenting if you can't build with EC disabled
--        
-+        self.swig_opts.append('-modern')
-+        self.swig_opts.append('-builtin')
-+
-+        # These two lines are a workaround for
-+        # http://bugs.python.org/issue2624 , hard-coding that we are only
-+        # building a single extension with a known path; a proper patch to
-+        # distutils would be in the run phase, when extension name and path are
-+        # known.
-+        self.swig_opts.append('-outdir')
-+        self.swig_opts.append(os.path.join(self.build_lib, 'M2Crypto'))
-+
-         self.include_dirs += [os.path.join(self.openssl, opensslIncludeDir),
-                               os.path.join(os.getcwd(), 'SWIG')]        
-             
-@@ -71,6 +82,19 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-                
-         self.library_dirs += [os.path.join(self.openssl, opensslLibraryDir)]
- 
-+    def run(self):
-+        '''Overloaded build_ext implementation to allow inplace=1 to work,
-+        which is needed for (python setup.py test).'''
-+        # This is another workaround for http://bugs.python.org/issue2624 + the
-+        # corresponding lack of support in setuptools' test command. Note that
-+        # just using self.inplace in finalize_options() above does not work
-+        # because swig is not rerun if the __m2crypto.so extension exists.
-+        # Again, hard-coding our extension name and location.
-+        build_ext.build_ext.run(self)
-+        if self.inplace:
-+            copy_file(os.path.join(self.build_lib, 'M2Crypto', '_m2crypto.py'),
-+                      os.path.join('M2Crypto', '_m2crypto.py'),
-+                      verbose=self.verbose, dry_run=self.dry_run)
- 
- if sys.version_info < (2,4):
- 
--- 
-1.8.4.2
-
diff --git a/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch b/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
deleted file mode 100644
index c1916b8..0000000
--- a/meta-python/recipes-devtools/python/python-numeric/no-lapack.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- Numeric-23.7/setup.py~nolapack
-+++ Numeric-23.7/setup.py
-@@ -32,7 +32,7 @@
-     mathlibs = []
- 
- # delete all but the first one in this list if using your own LAPACK/BLAS
--sourcelist = [os.path.join('Src', 'lapack_litemodule.c'),
-+sourcelist = [
-               #os.path.join('Src', 'blas_lite.c'), 
-               #os.path.join('Src', 'f2c_lite.c'), 
-               #os.path.join('Src', 'zlapack_lite.c'),
-@@ -40,12 +40,12 @@
-              ]
- # set these to use your own BLAS;
- 
--library_dirs_list = ['/usr/lib/atlas']
--libraries_list = ['lapack', 'cblas', 'f77blas', 'atlas', 'g2c'] 
-+library_dirs_list = []
-+libraries_list = [] 
- 
- # set to true (1), if you also want BLAS optimized matrixmultiply/dot/innerproduct
--use_dotblas = 1 
--include_dirs = ['/usr/include/atlas']  
-+use_dotblas = 0
-+include_dirs = []  
-                    # You may need to set this to find cblas.h
-                    #  e.g. on UNIX using ATLAS this should be ['/usr/include/atlas']
- extra_link_args = []
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch b/meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch
deleted file mode 100644
index 027af04..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fix build scripts to use correct libtool filename
-
-Upstream-Status: Inappropriate [configuration]
-
----
- httpd-2.4.2/build/config_vars.sh.in |    2 +-
- httpd-2.4.2/configure               |    2 +-
- httpd-2.4.2/configure.in            |    2 +-
- httpd-2.4.2/support/apxs.in         |    2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/build/config_vars.sh.in
-+++ b/build/config_vars.sh.in
-@@ -35,7 +35,7 @@ else
-    APU_CONFIG=@APU_CONFIG@
- fi
- 
--APR_LIBTOOL="`${APR_CONFIG} --apr-libtool`"
-+APR_LIBTOOL="`${APR_CONFIG} --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`"
- APR_INCLUDEDIR="`${APR_CONFIG} --includedir`"
- test -n "@APU_CONFIG@" && APU_INCLUDEDIR="`${APU_CONFIG} --includedir`"
- 
---- a/configure
-+++ b/configure
-@@ -6205,7 +6205,7 @@ case $host in
-       if test "x$LTFLAGS" = "x"; then
-           LTFLAGS='--silent'
-       fi
--      my_libtool=`$apr_config --apr-libtool`
-+      my_libtool=`$apr_config --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`
-       LIBTOOL="$my_libtool \$(LTFLAGS)"
-       libtoolversion=`$my_libtool --version`
-       case $libtoolversion in
---- a/configure.in
-+++ b/configure.in
-@@ -264,7 +264,7 @@ case $host in
-       if test "x$LTFLAGS" = "x"; then
-           LTFLAGS='--silent'
-       fi
--      my_libtool=`$apr_config --apr-libtool`
-+      my_libtool=`$apr_config --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`
-       LIBTOOL="$my_libtool \$(LTFLAGS)"
-       libtoolversion=`$my_libtool --version`
-       case $libtoolversion in
---- a/support/apxs.in
-+++ b/support/apxs.in
-@@ -352,7 +352,7 @@ if ($apr_major_version < 2) {
-     }
- }
- 
--my $libtool = `$apr_config --apr-libtool`;
-+my $libtool = `$apr_config --apr-libtool| sed -e s,libtool,${host_alias}-libtool,`;
- chomp($libtool);
- 
- my $apr_includedir = `$apr_config --includes`;
-- 
2.7.4


