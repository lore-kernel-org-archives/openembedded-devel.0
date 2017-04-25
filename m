Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id CEE6D77AA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:43 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id a103so206922761ioj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aI9u3lpEM1GMFqjwcfZcYCvkAcUSCYWNpaV/BUt/Qgs=;
	b=dxSrc4atV77dad5LUpkfQQ/+2CRl6XfULol+QE27wcrRKUU7vfnT9+7OPA6c7OtoqQ
	/dLccF/31J6vORPM5pnHFejOZc3dUQwGm21dNeq15ubJ2HWfL2iwV+hcHi7zB0KJ4XXm
	jgaQy8eSb1kRmbOUU2ADXMS7ZXFtynF8306G7JKGmY9UmfIJRky29xxdbd8Q2w3k7qQ+
	rVct6dxJJ9Pryyk6b+26y60lEbJa0Z3xdSMvUDZihdXwRPF3yDVlQJY+AWil+SbntJd9
	Zc5x4CinJZZEGdCLEDV/LMMx8kYj9w/+fOtGOfmhYMqhRfTTOv7lfdQMNqtFi8kEUdU+
	d6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aI9u3lpEM1GMFqjwcfZcYCvkAcUSCYWNpaV/BUt/Qgs=;
	b=KeSpbxcoHCYYOLLIIf9yIzHeOK4cVtPxSuRPq1y162lYNr6ypRgfXQnxT9ZvjPLCOf
	IxR5q+w0GJ/IIz/dsKLS1q3QBs12b61wyrQqQLCjjH0YcfuaPiSfqPUoWr50nJ276cI7
	4G8BvSF015ccNtGz0UdsdS0szh+ZBdONP1rm96LZhv+EpmAuDBO8BwRUHMm33TigI1CI
	OJbP1DJZWjiYDXXCRerbx9loQlPcfaw3qkmHeONDlA3Kr3KmJwbhE/acgbsbb+nr55Mc
	vdTInwfHKlK9UIimo+NpE5drCjUuYgoxM4dPVZoYz+UPEHm/5EZ0xz0S6dY6mLtizLVY
	5LkQ==
X-Gm-Message-State: AN3rC/5DusRxaRr2PLA6AYzWhVkyoavixDwIjKIPqhG2ipDKW7PTRJ08
	Wr/dHP5IdlZdEw==
X-Received: by 10.107.19.224 with SMTP id 93mr10985014iot.188.1493092064916;
	Mon, 24 Apr 2017 20:47:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:16 -0700
Message-Id: <20170425034719.8630-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 08/11] mozjs: Fix build with gcc7
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-add-support-for-big-endian-32bit-ARM.patch | 26 ------------------
 ...-first-character-of-string-to-be-null-or-.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     | 29 ++++++++++----------
 3 files changed, 46 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
deleted file mode 100644
index 7b7038f6f..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 07830cbc409f8e998fa839275470031fc83d6eb6 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Thu, 21 Apr 2016 14:10:54 +0200
-Subject: [PATCH] add support for big endian 32bit ARM
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
----
- mfbt/double-conversion/utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
-index fe26dab..78a19cb 100644
---- a/mfbt/double-conversion/utils.h
-+++ b/mfbt/double-conversion/utils.h
-@@ -58,7 +58,7 @@
-     defined(__mips__) || defined(__powerpc__) || \
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
--    defined(__aarch64__) || \
-+    defined(__aarch64__) || defined(__ARMEB__) || \
-     defined(_MIPS_ARCH_MIPS32R2)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
--- 
-2.4.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
new file mode 100644
index 000000000..40d646c7d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-compare-the-first-character-of-string-to-be-null-or-.patch
@@ -0,0 +1,32 @@
+From f36c9476d2816e0d3e61c9e13c22ed73883cb54a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Apr 2017 12:13:43 -0700
+Subject: [PATCH] compare the first character of string to be null or not
+
+Fixes
+
+error: ISO C++ forbids comparison between pointer and integer [-fpermissive]
+|          if (value[0] == '\0')
+|                          ^~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ js/src/shell/jsoptparse.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/shell/jsoptparse.cpp b/js/src/shell/jsoptparse.cpp
+index b49d0a5..612aa00 100644
+--- a/js/src/shell/jsoptparse.cpp
++++ b/js/src/shell/jsoptparse.cpp
+@@ -243,7 +243,7 @@ OptionParser::extractValue(size_t argc, char **argv, size_t *i, char **value)
+     char *eq = strchr(argv[*i], '=');
+     if (eq) {
+         *value = eq + 1;
+-        if (value[0] == '\0')
++        if (value[0][0] == '\0')
+             return error("A value is required for option %.*s", eq - argv[*i], argv[*i]);
+         return Okay;
+     }
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 3424669b8..6c9920ef4 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -2,21 +2,20 @@ SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = " \
-    http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
-    file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
-    file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
-    file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../../ \
-    file://0003-Add-AArch64-support.patch;patchdir=../../ \
-    file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
-    file://0005-aarch64-64k-page.patch;patchdir=../../ \
-    file://0001-regenerate-configure.patch;patchdir=../../ \
-    file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
-    file://fix_milestone_compile_issue.patch \
-    file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
-    file://0001-add-support-for-big-endian-32bit-ARM.patch;patchdir=../../ \
-    file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
-  "
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
+           file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
+           file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
+           file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../../ \
+           file://0003-Add-AArch64-support.patch;patchdir=../../ \
+           file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
+           file://0005-aarch64-64k-page.patch;patchdir=../../ \
+           file://0001-regenerate-configure.patch;patchdir=../../ \
+           file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
+           file://fix_milestone_compile_issue.patch \
+           file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
+           file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
+           file://0001-compare-the-first-character-of-string-to-be-null-or-.patch;patchdir=../../ \
+           "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
 SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba"
-- 
2.12.2


