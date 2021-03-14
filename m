Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.6787.1615733593594492091
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Mar 2021 07:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12EEqtUG024718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Mar 2021 07:53:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 14 Mar 2021 07:52:41 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sun, 14 Mar 2021 07:52:41 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] zstd: remove the recipe since it moved to oe-core
Date: Sun, 14 Mar 2021 10:52:41 -0400
Message-ID: <20210314145241.411043-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-Fix-legacy-build-after-2103.patch    | 27 -------------
 meta-oe/recipes-extended/zstd/zstd_1.4.5.bb   | 39 -------------------
 2 files changed, 66 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 delete mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.5.bb

diff --git a/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch b/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
deleted file mode 100644
index c701554b8..000000000
--- a/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 93cec0c1d6d0be8dd3a9d01d3e7f2099f1728df7 Mon Sep 17 00:00:00 2001
-From: Orivej Desh <orivej@gmx.fr>
-Date: Fri, 22 May 2020 12:48:02 +0000
-Subject: [PATCH] Fix legacy build after #2103
-
-Upstream-Status: Backport
-Signed-of-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- lib/legacy/zstd_v04.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/legacy/zstd_v04.c b/lib/legacy/zstd_v04.c
-index 56bf45222498..19fda8980abf 100644
---- a/lib/legacy/zstd_v04.c
-+++ b/lib/legacy/zstd_v04.c
-@@ -74,7 +74,7 @@ extern "C" {
- /*-*************************************
- *  Debug
- ***************************************/
--#include "debug.h"
-+#include "../common/debug.h"
- #ifndef assert
- #  define assert(condition) ((void)0)
- #endif
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
deleted file mode 100644
index d0cc625aa..000000000
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Zstandard - Fast real-time compression algorithm"
-DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
-real-time compression scenarios at zlib-level and better compression ratios. \
-It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
-HOMEPAGE = "http://www.zstd.net/"
-SECTION = "console/utils"
-
-LICENSE = "BSD-3-Clause & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
-                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
-
-inherit lib_package
-
-SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
-           file://0001-Fix-legacy-build-after-2103.patch \
-           "
-
-SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
-PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
-PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
-
-# See programs/README.md for how to use this
-ZSTD_LEGACY_SUPPORT ??= "4"
-
-do_compile () {
-    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
-}
-
-do_install () {
-    oe_runmake install 'DESTDIR=${D}'
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

