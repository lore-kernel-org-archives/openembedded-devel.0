Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id EEC9B751D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:18 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id 31-v6so9460742plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vctWxk8kgg4Z741hj6UPdgX7WoG5Ar4Nnbx4gJnMGfE=;
	b=dYGvwaiuNcjKDhy5TQY0dBHfjS/xgdECkETjA2Tg4+s3OkTH6lln+5jBok+wQRw3dC
	2H9qWGyD+evTXm2LLf3+q7pci5CFB3SJbbOmVzfLlOgSHLnlbPrNeTEwSKFzhZMKQia/
	cOD3QytMmM4TsKHRJcJDABh5t55Pe+rtHxkVCRyCpXdZ2LT5NnteY16X4VygQTBbes8l
	a4IBNfgwRp1UraZ7Zkiy9RS0iLrxypRheW4dUVu8CnIEQcwN0EtJD4r3kOq6+exP5OWc
	dQdlGCeG4TW2Z7MZLl1JRKl/xyYPZpeFuSxfRblSsr4VM/kwFXDpDRMcbxbVO9P7N0Pk
	DZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vctWxk8kgg4Z741hj6UPdgX7WoG5Ar4Nnbx4gJnMGfE=;
	b=jqW+TWxGWxDXkQl0YGAuDPWx+GzCgeWcEziMwokyvDtvuqfpiFgGn34iwcBuB/qOyW
	HlLdue6m6hgHHFQ7Ivt1Ki4uaoUhHFX9TwVIsq9PDt4FCw9eiW44kPDAizR9e7TDNFNf
	TUEBubZL8VikBwwghtLxZZc3Y3ksPqh5RAXrmx4E1RDGjCvJIL65BZX49W9Wpz8YIRDd
	XupkzsTKYPNFVr3Rs//S4m49C3U1yKR9AWCT2P00iHhip7Jiu7Ieqif4CLIDFYdFJax+
	FM2MX/k9jje8qI66QL3oNZMNEodlcpwSZn5fMXWR5xLWIGu+GQTmYD6DVCsDGMnLeuWR
	C8nA==
X-Gm-Message-State: APt69E2estY36Cswb2+hpVkiCXAUPrSJKqrpaZ60Z0Vm/o5n+QBV/aae
	S2ph3q6iGBrB/gEBLvakdBPUww==
X-Google-Smtp-Source: ADUXVKKQUtFa7TvBTISrQvsC4E1mhku89TUWQQccmrZopDpyvT/Een0cR9IY/gmSKBksp/45u3vpbg==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
	i7-v6mr9724126plt.288.1528526659700; 
	Fri, 08 Jun 2018 23:44:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:14 -0700
Message-Id: <20180609064415.10270-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180609064415.10270-1-raj.khem@gmail.com>
References: <20180609064415.10270-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eck-for-canonicalize_file_name-befor.patch | 56 +++++++++++++++++++
 .../modemmanager/modemmanager_1.7.991.bb      |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
new file mode 100644
index 0000000000..d474edbda6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Add-configure-check-for-canonicalize_file_name-befor.patch
@@ -0,0 +1,56 @@
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
+diff --git a/configure.ac b/configure.ac
+index 9bf26ed..6d7abdb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -72,6 +72,8 @@ AC_SUBST(MM_GLIB_LT_CURRENT)
+ AC_SUBST(MM_GLIB_LT_REVISION)
+ AC_SUBST(MM_GLIB_LT_AGE)
+ 
++AC_CHECK_FUNCS([canonicalize_file_name])
++
+ dnl-----------------------------------------------------------------------------
+ dnl Documentation
+ dnl
+diff --git a/src/kerneldevice/mm-kernel-device-generic.c b/src/kerneldevice/mm-kernel-device-generic.c
+index 6b0f072..a108b7d 100644
+--- a/src/kerneldevice/mm-kernel-device-generic.c
++++ b/src/kerneldevice/mm-kernel-device-generic.c
+@@ -100,6 +100,24 @@ read_sysfs_property_as_string (const gchar *path,
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


