Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 023837901A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:11 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id a7-v6so931912plp.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YB2Rwz9JtgOOqaHU6Hjxa3VZb/ZLJyUqfsXW6LH5ihc=;
	b=ihybJSvusM+b9ond11k3tj0wRt+UTibfoHslKKtXFKGvwNYYhx8w98ZGucpNm6PVcn
	YfDRPBEY7eXm7vtkfpbtoAtnbMO34/77Ymu3PZp8p9o4kbCal4kV9m9lZ8QaVqXMhA5e
	Y4VfVDBWUxXT63oQRCGuM50P7e+mjekCIg6zjzqAkZ1Jym6TiHcGsMiHGMhxTY/6D8mP
	Ggp7Bjx+P3oAvVORUCY3C6AWPwHhVwofGIKtNvDkBm0cYuOfgvdGGbVR+FVEGZvaX+Cq
	2lVJm1lAEH+99XZy4r1afyhA7zC1eC0dBQUXyOQRwVHk1aDW/CVRHm5kuYrWs0QddmfC
	rOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YB2Rwz9JtgOOqaHU6Hjxa3VZb/ZLJyUqfsXW6LH5ihc=;
	b=SRCqtgNNLO2woJL0MkiYTKr9uCqCFrtky9vNpf5muEd+atA1qFHYYJkzKoaxgFoBJE
	+H3ShbaYHQ1xIjl3UCskWY4r9MYfXI02UFg9AXommuRnfIYT8LwuH/0UyxFSIX1AF/bJ
	nLNORF65hYQc8a6siT3zApLXhRXnwVoOAs9KAPxHVx1W1NMZ0e1OdH42Wlx4Cx6MUtVv
	N7n5gMRy7YUd7HkJdOMeMDGgSPXOZICfUooHOPHcZCDWsIbX3ySTX2RokmJkqi51YZyO
	FgYOMA+RVXENcKqo78wZXELnP9Qv8bBiKWeGfg52wmt1q3u+ookqjTx+eNHd5D7y5AJT
	GnGQ==
X-Gm-Message-State: APt69E2SznYR5VGLHyK08qfHqMLKJDNV+fdRPwVEctHUT9XfzouWM1EV
	tFLtanVMUzCdxlBNQu4xNuWGlg==
X-Google-Smtp-Source: ADUXVKJXjIYKpvJfgV6gNmBOPHT8j+h9R0mHMvyrrm7/JZwv/Suw8P7qM3nbeGY1+3rfotRf2RKAbg==
X-Received: by 2002:a17:902:5945:: with SMTP id
	e5-v6mr1995826plj.64.1528871712723; 
	Tue, 12 Jun 2018 23:35:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm3525707pfe.159.2018.06.12.23.35.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:35:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 23:35:09 -0700
Message-Id: <20180613063512.1755-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613063512.1755-1-raj.khem@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 2/5] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eck-for-canonicalize_file_name-befor.patch | 64 +++++++++++++++++++
 .../modemmanager/modemmanager_1.7.991.bb      |  4 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
new file mode 100644
index 0000000000..256dd2ce0b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
@@ -0,0 +1,64 @@
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


