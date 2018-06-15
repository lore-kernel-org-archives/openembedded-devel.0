Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 363AB75479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 03:31:05 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id 30-v6so4616904pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SEHUCTbIzKGQhNhEh+ORmi5MfB3W2dAG0v3gddrQ5KA=;
	b=cEj2VDwMORPLOyji/nY+CafplP5Z9YnB6OOi0+d3zF9s+wP8TFpAVHCmo9IxqZpGLf
	ktUwYafHMf5u136w2APXOgzCDygQuG1mvque0aKrTjdvIYVOcggxq2u/gACU5jpiiGjA
	p2g2CGznvSphDhcTkRVTT5IiK0xJlwP9IvQRJnB9VbTOSY41njSXyESfgIQxqrklU6A+
	mzChnG7TWVbykN7S+/AT3ywgVJrScc/bwgzIWovPA3jjAEBC4Gyc0iwFDeTxemOb8t5h
	GUAIWB7s1e2qOf4oJs2F/u6LbHAhaM7gwxtD0yRMK9gUV6zANCW8vbOhUkzPSKYeGwW2
	bBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SEHUCTbIzKGQhNhEh+ORmi5MfB3W2dAG0v3gddrQ5KA=;
	b=KKy2mPfyVPz9qbFzek2Fx2AKrHUs6QKZFSZZI+nvJPw6FxhulEyKDEd9wQ3jyRwmfq
	C9Zr1Y55otdDkQKJeIxJWH/gp5PF0jZIX99VLNUnG5sbNOJnIWb6EqD81QUKEI3CqcGu
	/I1CryXFwcOlDQAT3rwRUesqXcVB6dn1Dj4hFufgHM5n8OlmCl3p84NlpPlwgwrVR+/6
	8DCmR5QIhmDIKMOxOT15iLcNWV3UXtqBeUlJkfZd5dqdf7SjuVEnn4PpnSAyhBnt+sd3
	uHNc7B4l7j2PX62yz24QQeYJTI8f9gMAKiHCfcf7pGejiaNVDjMRuTKjIJXoEcrmX71b
	rlXQ==
X-Gm-Message-State: APt69E3hsk8rJLA1JPA3cGjDUv/PbndBhVB9/eueOavGcn/LmCckskxz
	vK19mF847CyGKJ7CTNkX3gf35Q==
X-Google-Smtp-Source: ADUXVKKttfhrhLDs7xy4OoHpZG7TVvvMd4va4lc5CIK9G2UATsBC7HlIXGUMVVvrsqPG/dq4tJzzFA==
X-Received: by 2002:a17:902:6903:: with SMTP id
	j3-v6mr5848785plk.313.1529033465927; 
	Thu, 14 Jun 2018 20:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm23257253pfa.34.2018.06.14.20.31.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 20:31:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jun 2018 20:31:06 -0700
Message-Id: <20180615033106.32342-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180615033106.32342-1-raj.khem@gmail.com>
References: <20180615033106.32342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 2/2] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Fri, 15 Jun 2018 03:31:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changed in V2:
- Add Upstream-Status

 ...eck-for-canonicalize_file_name-befor.patch | 66 +++++++++++++++++++
 .../modemmanager/modemmanager_1.7.991.bb      |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
new file mode 100644
index 0000000000..f3cf3d639b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
@@ -0,0 +1,66 @@
+From 07f1eda630517816bfa900e811963745a149e57c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 20:38:30 -0700
+Subject: [PATCH] Add configure check for canonicalize_file_name() before use
+
+Define canonicalize_file_name API if not provided by system C library
+musl e.g. does not provide this API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac                                |  2 ++
+ src/kerneldevice/mm-kernel-device-generic.c | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+Index: ModemManager-1.7.991/configure.ac
+===================================================================
+--- ModemManager-1.7.991.orig/configure.ac
++++ ModemManager-1.7.991/configure.ac
+@@ -72,6 +72,8 @@ AC_SUBST(MM_GLIB_LT_CURRENT)
+ AC_SUBST(MM_GLIB_LT_REVISION)
+ AC_SUBST(MM_GLIB_LT_AGE)
+ 
++AC_CHECK_FUNCS([canonicalize_file_name])
++
+ dnl-----------------------------------------------------------------------------
+ dnl Documentation
+ dnl
+Index: ModemManager-1.7.991/src/kerneldevice/mm-kernel-device-generic.c
+===================================================================
+--- ModemManager-1.7.991.orig/src/kerneldevice/mm-kernel-device-generic.c
++++ ModemManager-1.7.991/src/kerneldevice/mm-kernel-device-generic.c
+@@ -21,6 +21,7 @@
+ #define _LIBMM_INSIDE_MM
+ #include <libmm-glib.h>
+ 
++#include "config.h"
+ #include "mm-kernel-device-generic.h"
+ #include "mm-kernel-device-generic-rules.h"
+ #include "mm-log.h"
+@@ -100,6 +101,24 @@ read_sysfs_property_as_string (const gch
+     return contents;
+ }
+ 
++#ifndef HAVE_CANONICALIZE_FILE_NAME
++#include <limits.h>
++#include <string.h>
++#include <stdlib.h>
++#include <stdio.h>
++static char * canonicalize_file_name(const char *path)
++{
++   char buf[PATH_MAX] = { };
++
++   snprintf(buf, sizeof(buf) - 1, "%s", path);
++
++   if (!realpath(path, buf))
++       return NULL;
++
++   return strdup(buf);
++}
++#endif
++
+ /*****************************************************************************/
+ /* Load contents */
+ 
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index b1a718dbfb..26b56d17d0 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -11,7 +11,9 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
+           file://0001-Add-configure-check-for-canonicalize_file_name-befor.patch \
+           "
 
 SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
 SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
-- 
2.17.1


