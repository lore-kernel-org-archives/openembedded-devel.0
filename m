Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7576979C7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 14:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 42dMc21fyYz5p
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 16:34:26 +0200 (CEST)
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Oct 2018 17:34:24 +0300
Message-Id: <20181021143426.25760-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] modemmanager: Upgrade to 1.8.2
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
X-List-Received-Date: Sun, 21 Oct 2018 14:34:27 -0000

Obsolete patch dropped, upstream solved this differently:
  Use realpath() instead of canonicalize_filename(),
  fixing build with musl libc.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...re-check-for-canonicalize_file_name-befor.patch | 66 ----------------------
 ...demmanager_1.7.991.bb => modemmanager_1.8.2.bb} |  5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.7.991.bb => modemmanager_1.8.2.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
deleted file mode 100644
index f3cf3d639..000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 07f1eda630517816bfa900e811963745a149e57c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jun 2018 20:38:30 -0700
-Subject: [PATCH] Add configure check for canonicalize_file_name() before use
-
-Define canonicalize_file_name API if not provided by system C library
-musl e.g. does not provide this API
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac                                |  2 ++
- src/kerneldevice/mm-kernel-device-generic.c | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+)
-
-Index: ModemManager-1.7.991/configure.ac
-===================================================================
---- ModemManager-1.7.991.orig/configure.ac
-+++ ModemManager-1.7.991/configure.ac
-@@ -72,6 +72,8 @@ AC_SUBST(MM_GLIB_LT_CURRENT)
- AC_SUBST(MM_GLIB_LT_REVISION)
- AC_SUBST(MM_GLIB_LT_AGE)
- 
-+AC_CHECK_FUNCS([canonicalize_file_name])
-+
- dnl-----------------------------------------------------------------------------
- dnl Documentation
- dnl
-Index: ModemManager-1.7.991/src/kerneldevice/mm-kernel-device-generic.c
-===================================================================
---- ModemManager-1.7.991.orig/src/kerneldevice/mm-kernel-device-generic.c
-+++ ModemManager-1.7.991/src/kerneldevice/mm-kernel-device-generic.c
-@@ -21,6 +21,7 @@
- #define _LIBMM_INSIDE_MM
- #include <libmm-glib.h>
- 
-+#include "config.h"
- #include "mm-kernel-device-generic.h"
- #include "mm-kernel-device-generic-rules.h"
- #include "mm-log.h"
-@@ -100,6 +101,24 @@ read_sysfs_property_as_string (const gch
-     return contents;
- }
- 
-+#ifndef HAVE_CANONICALIZE_FILE_NAME
-+#include <limits.h>
-+#include <string.h>
-+#include <stdlib.h>
-+#include <stdio.h>
-+static char * canonicalize_file_name(const char *path)
-+{
-+   char buf[PATH_MAX] = { };
-+
-+   snprintf(buf, sizeof(buf) - 1, "%s", path);
-+
-+   if (!realpath(path, buf))
-+       return NULL;
-+
-+   return strdup(buf);
-+}
-+#endif
-+
- /*****************************************************************************/
- /* Load contents */
- 
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index 26b56d17d..82e3178bd 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -12,11 +12,10 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           file://0001-Add-configure-check-for-canonicalize_file_name-befor.patch \
            "
 
-SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
-SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
+SRC_URI[md5sum] = "a49c9f73e46c7b89e5efedda250d22c0"
+SRC_URI[sha256sum] = "96f2a5f0ed15532b4c4c185b756fdc0326e7c2027cea26a1264f91e098260f80"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.11.0


