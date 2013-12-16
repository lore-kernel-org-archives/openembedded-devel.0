Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id EA9FF6A596
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 23:16:33 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so2542622eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 15:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nB+xzB7DC6EFCYuAlmXHdcmIAkqwMkVDmJ+on2UkpPM=;
	b=WSFTmcDRVhKkpqJWsy2JEg+FwqrAbrTiVM2Bx6RCZ+cbeiZog7Tg41WQET5jWeFkhA
	kY1aD99BXrUfK3U5UIDaCCTnnIzMO1g0+kYYm22+YOhEchq1Qionq6/ewKKJOJgODrYx
	HxAbKC8wZVQsCzueS/49F8whIKO3UwXsqjFiaFC5FTW0EDRQns8P5kdyL7ATjU+1LKUO
	2dA/HELNA+GGkCo2nHnRfzSP7BNGiWoA4TkdMXjdKDrGzmRXZaxJsngwwVXGA+mGYx23
	np9FmIo0bY9d0vFZp0l3k7MkXSxGf+ESost+2P84gwsZPY0FuEMNJbWgejLliE0uZc7z
	cwiA==
X-Received: by 10.14.109.5 with SMTP id r5mr11306631eeg.110.1387235793100;
	Mon, 16 Dec 2013 15:16:33 -0800 (PST)
Received: from mizar.localdomain
	(host155-43-dynamic.54-79-r.retail.telecomitalia.it. [79.54.43.155])
	by mx.google.com with ESMTPSA id a45sm47602185eem.6.2013.12.16.15.16.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 15:16:32 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2013 00:16:29 +0100
Message-Id: <1387235789-14596-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] klibc: upgrade from 2.0.2 to release 2.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 23:16:34 -0000

Klibc now support aarch64 / arm64
While there, remove PR/INC_PR from the recipes

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/{klcc-cross_2.0.2.bb => klcc-cross_2.0.3.bb} | 2 --
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/armv4-fix-v4bx.patch             | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-config-eabi.patch          | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-linux-libc-dev.patch       | 0
 .../recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/staging.patch   | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/use-env-for-perl.patch           | 0
 .../klibc/{klibc-static-utils_2.0.2.bb => klibc-static-utils_2.0.3.bb}  | 2 --
 .../klibc/{klibc-utils_2.0.2.bb => klibc-utils_2.0.3.bb}                | 2 --
 meta-initramfs/recipes-devtools/klibc/klibc.inc                         | 2 --
 .../recipes-devtools/klibc/{klibc_2.0.2.bb => klibc_2.0.3.bb}           | 2 --
 10 files changed, 10 deletions(-)
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.2.bb => klcc-cross_2.0.3.bb} (97%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/armv4-fix-v4bx.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-config-eabi.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-linux-libc-dev.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/staging.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/use-env-for-perl.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.2.bb => klibc-static-utils_2.0.3.bb} (93%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.2.bb => klibc-utils_2.0.3.bb} (92%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.2.bb => klibc_2.0.3.bb} (97%)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
similarity index 97%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 07b76d7..40a65fd 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
@@ -1,5 +1,3 @@
-PR = "${INC_PR}.0"
-
 require klibc.inc
 SUMMARY = "The klcc crosscompiler for klibc"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/armv4-fix-v4bx.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/armv4-fix-v4bx.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-config-eabi.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-config-eabi.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-linux-libc-dev.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-linux-libc-dev.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/staging.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/staging.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/use-env-for-perl.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/use-env-for-perl.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
similarity index 93%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
index a3f9ec3..36d4f12 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
@@ -1,5 +1,3 @@
-PR = "${INC_PR}.0"
-
 KLIBC_UTILS_VARIANT = "static"
 KLIBC_UTILS_PKGNAME = "klibc-static-utils"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
similarity index 92%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
index c77e041..d3cebad 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
@@ -1,5 +1,3 @@
-PR = "${INC_PR}.0"
-
 KLIBC_UTILS_VARIANT = "shared"
 KLIBC_UTILS_PKGNAME = "klibc-utils"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 24ece9c..9bcce2b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r1"
-
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_aarch64 = 'arm64'
 KLIBC_ARCH_armeb = 'arm'
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
similarity index 97%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
index 4244cf2..e97d2c7 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
@@ -1,5 +1,3 @@
-PR = "${INC_PR}.0"
-
 do_install() {
     oe_runmake install
 
-- 
1.8.1.5


