Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 282656DBF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 23:37:56 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2561450eak.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 15:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2HfYLjKfrO0o7qQzdwRTq1+aK0xZmbQXrXY8WOtiug0=;
	b=ZrQ9Lq5d31MKXzZPmDfH/jEJmu9OaXV6RqGfFA8n0bHzjT30uvM86fF9uMQOJ9o7tF
	sipJyDPnb08v1f17HNLMmeBiTr4C/6t1u4DWCJrcio8Tgs2+cvn09bcrc+5G/cN08t/R
	RodpvoTVbm4V6hm4S4NB+tayLlWW0XILkRcF01PwUdefmk7L4gigvheRIPtrlMhGFatO
	D2QzHDPPxsbUx1p4kUjF6EzSLaHeOGZ9dGDnZ3F0hKSCkJBdOdkhaERw9MYQu92UszUz
	U2kN2JSYIEsMCLyl/RnJCxouljIXyxAh8UdCu94mEEL5PEI3xSpMVdONvbzAQmmxPqDb
	Ak1Q==
X-Received: by 10.15.33.133 with SMTP id c5mr30977eev.114.1387237074900;
	Mon, 16 Dec 2013 15:37:54 -0800 (PST)
Received: from mizar.localdomain
	(host155-43-dynamic.54-79-r.retail.telecomitalia.it. [79.54.43.155])
	by mx.google.com with ESMTPSA id
	o47sm47776978eem.21.2013.12.16.15.37.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 15:37:54 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2013 00:37:40 +0100
Message-Id: <1387237060-28497-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH v2] klibc: upgrade from 2.0.2 to release 2.0.3
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
X-List-Received-Date: Mon, 16 Dec 2013 23:37:58 -0000

Klibc now supports aarch64 / arm64
While there, remove PR/INC_PR from the recipes

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/{klcc-cross_2.0.2.bb => klcc-cross_2.0.3.bb}                | 2 --
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/armv4-fix-v4bx.patch           | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-config-eabi.patch        | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/klibc-linux-libc-dev.patch     | 0
 .../recipes-devtools/klibc/{klibc-2.0.2 => klibc-2.0.3}/staging.patch | 0
 .../klibc/{klibc-2.0.2 => klibc-2.0.3}/use-env-for-perl.patch         | 0
 .../{klibc-static-utils_2.0.2.bb => klibc-static-utils_2.0.3.bb}      | 2 --
 .../klibc/{klibc-utils_2.0.2.bb => klibc-utils_2.0.3.bb}              | 2 --
 meta-initramfs/recipes-devtools/klibc/klibc.inc                       | 4 +---
 .../recipes-devtools/klibc/{klibc_2.0.2.bb => klibc_2.0.3.bb}         | 2 --
 10 files changed, 1 insertion(+), 11 deletions(-)
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
index 24ece9c..bf37c0e 100644
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
@@ -27,7 +25,7 @@ KLIBC_ARCH_powerpc64 = 'ppc64'
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 
-SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
+SRCREV = "f0440baf7f2dc1d9a25863c184d0a8fb73c4ee6c"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
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


