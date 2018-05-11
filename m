Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D726378434
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a8-v6so4203433wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h86Yf9+ztQRu2p2c4eiM8k0K6URWtRz2ZnW1AnQFZKg=;
	b=oQfbAAzKv8lsdomDiD05Oc2li3aYPbuZbC1AhW9OdaumrgjU13jl6iPmgyrUqjNFYk
	xiBQ2In3eYYmGphvnPFTG7w3qU7YSttB4Em8mYwsUqUCYGSgHO9cFJWM1JpPb8CG3vyu
	T25zLR/FrdA2RQ4tQD/4TXTkCnVpG82bOMLeOadjF4PCVnvmBqpHsuToB5ECyUqCCbYo
	putpATcSYgyktuyeuwotlgOg1QYb+aMPkV+WfQLCfMoGLpGsnbzvRmBpK743G76hRKBL
	tNR5n4ommSf1TFUcJFnG+QG6IYijazJskylnlABNAj0o82U0I4WI7XVZLQOsY4UJGlvA
	avUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h86Yf9+ztQRu2p2c4eiM8k0K6URWtRz2ZnW1AnQFZKg=;
	b=bGSEz5RJRwbw5izt3sYLeOrVM8fp4PQo+3rJJidXwgXZZYmbicicuBdcLIG4miv77A
	mdJ7d39nnaapExISY5coMxo66P6mTiJBWGWlhBf2i+kCy1tdD4prbGXlVZfsZKuAfkGx
	iimt2yLitKSDUenCUeNRRdAa1fDR0hLe2d6HxwtAhDy93LzcHXS4TgiaZGW99qrb5dJi
	YuQOkCdokIBsiegp7aJ1cdBPMz22Z3qTy7y6Jx1fffN3GF3ORabfFAsmxjwOaKATHyeJ
	1z5xgJ3fO4n0/rg+Rf9EEbeeSpaFs++SDEE3AKFoSURixY5Zw3VWzU3Z/z13q3S9Fp2T
	QKWQ==
X-Gm-Message-State: ALKqPwc1302E9KgjeUHepe2XVchZ257qucrb+cktgA5ql/qhM6BewHNd
	VLubECFhHsJo0CrztOUrGiLIbw==
X-Google-Smtp-Source: AB8JxZqSQ0zKo0cW4kfCyMPCvIrP7LTG1rGPnuGgN3pUv3YtcSPHXd4QEc2H8KSWyor0AF5r6ilFJQ==
X-Received: by 2002:a1c:d2c1:: with SMTP id
	j184-v6mr2620316wmg.14.1526066514533; 
	Fri, 11 May 2018 12:21:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r6-v6sm4259673wrg.73.2018.05.11.12.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:39 +0000
Message-Id: <20180511192145.7811-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 3/9] spice: fix build with FORTIFY_SOURCES already defined in native gcc
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
X-List-Received-Date: Fri, 11 May 2018 19:21:54 -0000

* e.g. on gentoo hosts
* use 4 spaces for indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...rnings.m4-don-t-define-FORITFY_SOURC.patch | 37 +++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        | 32 ++++++++--------
 2 files changed, 54 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-support/spice/files/0001-spice-compile-warnings.m4-don-t-define-FORITFY_SOURC.patch

diff --git a/meta-networking/recipes-support/spice/files/0001-spice-compile-warnings.m4-don-t-define-FORITFY_SOURC.patch b/meta-networking/recipes-support/spice/files/0001-spice-compile-warnings.m4-don-t-define-FORITFY_SOURC.patch
new file mode 100644
index 0000000000..666960566b
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/0001-spice-compile-warnings.m4-don-t-define-FORITFY_SOURC.patch
@@ -0,0 +1,37 @@
+From bf85d26f0326d4ea20429c29fd408703ee5bad54 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 13 Sep 2017 15:53:02 +0200
+Subject: [PATCH] spice-compile-warnings.m4: don't define FORITFY_SOURCES
+
+* otherwise fails when the native gcc already defines
+  FORTIFY_SOURCES (e.g. in gentoo).
+  | In file included from ../../git/server/inputs_channel.c:19:0:
+  | ../config.h:17:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
+  |  # define _FORTIFY_SOURCE 2
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ m4/spice-compile-warnings.m4 | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/m4/spice-compile-warnings.m4 b/m4/spice-compile-warnings.m4
+index 959971a2..55352ad6 100644
+--- a/m4/spice-compile-warnings.m4
++++ b/m4/spice-compile-warnings.m4
+@@ -109,13 +109,6 @@ AC_DEFUN([SPICE_COMPILE_WARNINGS],[
+     # This should be < 1024 really. pixman_utils is the blackspot
+     # preventing lower usage
+     gl_WARN_ADD([-Wframe-larger-than=20460])
+-
+-    # Use improved glibc headers
+-    AH_VERBATIM([FORTIFY_SOURCE],
+-    [/* Enable compile-time and run-time bounds-checking, and some warnings. */
+-#if __OPTIMIZE__
+-# define _FORTIFY_SOURCE 2
+-#endif
+ ])
+ 
+     # Extra special flags
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 2039841ddf..dfe4613641 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -25,19 +25,21 @@ SRCREV_spice-protocol = "784407f248e7f99d2bfcc9368f9acd1efb2b9617"
 
 SRCREV_FORMAT = "spice_spice-common_spice-protocol"
 
-SRC_URI = "git://anongit.freedesktop.org/spice/spice;name=spice \
-           git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
-           git://anongit.freedesktop.org/spice/spice-protocol;destsuffix=git/spice-common/spice-protocol;name=spice-protocol \
-          "
+SRC_URI = " \
+    git://anongit.freedesktop.org/spice/spice;name=spice \
+    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
+    git://anongit.freedesktop.org/spice/spice-protocol;destsuffix=git/spice-common/spice-protocol;name=spice-protocol \
+"
 
 SRC_URI += " \
-        file://spice-fix-CVE-2013-4282.patch \
-        file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
-        file://build-allow-separated-src-and-build-dirs.patch \
-        file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
-        file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
-        file://Fix-build-issues-with-gcc-7.patch \
-        "
+    file://spice-fix-CVE-2013-4282.patch \
+    file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
+    file://build-allow-separated-src-and-build-dirs.patch \
+    file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
+    file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
+    file://Fix-build-issues-with-gcc-7.patch \
+    file://0001-spice-compile-warnings.m4-don-t-define-FORITFY_SOURC.patch \
+"
 
 S = "${WORKDIR}/git"
 
@@ -66,13 +68,13 @@ FILES_${PN}-protocol += "${includedir}/spice-1"
 FILES_${PN}-protocol += "${datadir}/pkgconfig"
 
 do_configure_prepend() {
-	mkdir -p ${S}/spice-common/spice-protocol/m4
+    mkdir -p ${S}/spice-common/spice-protocol/m4
 }
 
 do_install_append() {
-	cd ${B}/spice-common/spice-protocol
-	oe_runmake DESTDIR="${D}" install
-	cd -
+    cd ${B}/spice-common/spice-protocol
+    oe_runmake DESTDIR="${D}" install
+    cd -
 }
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.17.0


