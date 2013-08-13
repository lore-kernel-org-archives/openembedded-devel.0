Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9D10B6B6EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 22:30:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Aug 2013 15:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,873,1367996400"; d="scan'208";a="281576360"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 15:30:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2013 23:30:04 +0100
Message-Id: <5e217d696fba7b9a3cb6667040f50209c68e4f93.1376432969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/3] x264: remove
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
X-List-Received-Date: Tue, 13 Aug 2013 22:30:12 -0000

This is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../don-t-default-to-cortex-a9-with-neon.patch     | 20 ---------
 meta-oe/recipes-multimedia/x264/x264_git.bb        | 47 ----------------------
 2 files changed, 67 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
 delete mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb

diff --git a/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
deleted file mode 100644
index b844d88..0000000
--- a/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
+++ /dev/null
@@ -1,20 +0,0 @@
--march flag is not in CFLAGS so this will always default to -mcpu=cortex-a8
--mfpu=neon.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: git/configure
-===================================================================
---- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
-+++ git/configure	2013-02-10 16:27:49.198341677 +0200
-@@ -703,9 +703,6 @@
- fi
-
- if [ $asm = auto -a $ARCH = ARM ] ; then
--    # set flags so neon is built by default
--    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
--
-     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
-         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
-         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
deleted file mode 100644
index c767ffd..0000000
--- a/meta-oe/recipes-multimedia/x264/x264_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "x264 is a free software library and application for encoding video streams into the H.264/MPEG-4 AVC format"
-HOMEPAGE = "http://www.videolan.org/developers/x264.html"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-PR = "r1"
-
-DEPENDS = "yasm-native"
-
-SRC_URI = "git://git.videolan.org/x264.git \
-    file://don-t-default-to-cortex-a9-with-neon.patch \
-"
-SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
-
-PV = "r2230+git"
-
-S = "${WORKDIR}/git"
-
-inherit lib_package pkgconfig
-
-X264_DISABLE_ASM = ""
-X264_DISABLE_ASM_armv4 = "--disable-asm"
-X264_DISABLE_ASM_armv5 = "--disable-asm"
-
-EXTRA_OECONF = '--prefix=${prefix} \
-                --host=${HOST_SYS} \
-                --cross-prefix=${TARGET_PREFIX} \
-                --sysroot=${STAGING_DIR_TARGET} \
-                --enable-shared \
-                --enable-static \
-                --disable-lavf \
-                --disable-swscale \
-                ${X264_DISABLE_ASM} \
-               '
-
-do_configure() {
-    ./configure ${EXTRA_OECONF}
-}
-
-# Get rid of -e
-EXTRA_OEMAKE = ""
-AS = "${TARGET_PREFIX}gcc"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-- 
1.8.1.2


