Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D949377264
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:08:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 00:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,519,1449561600"; d="scan'208";a="661016206"
Received: from rebeccas-ilbpg3.png.intel.com ([10.88.227.80])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Feb 2016 00:08:43 -0800
From: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org,
	Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Date: Mon, 29 Feb 2016 16:08:27 +0800
Message-Id: <1456733307-8500-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456733307-8500-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1456733307-8500-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [meta-oe] [PATCH] libvpx: upgrade to version 1.5.0
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
X-List-Received-Date: Mon, 29 Feb 2016 08:08:49 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This version had improved VP9 encoder and speeds up the encoding and
decoding process.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 51 -------------------------
 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb | 50 ++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
deleted file mode 100644
index c963a9c..0000000
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "VPX multi-format codec"
-DESCRIPTION = "The BSD-licensed libvpx reference implementation provides en- and decoders for VP8 and VP9 bitstreams."
-HOMEPAGE = "http://www.webmproject.org/code/"
-BUGTRACKER = "http://code.google.com/p/webm/issues/list"
-SECTION = "libs/multimedia"
-LICENSE = "BSD"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
-
-SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
-            file://libvpx-configure-support-blank-prefix.patch \
-           "
-SRC_URI[md5sum] = "63b1d7f59636a42eeeee9225cc14e7de"
-SRC_URI[sha256sum] = "f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4"
-
-# ffmpeg links with this and fails 
-# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
-ARM_INSTRUCTION_SET = "arm"
-
-CFLAGS += "-fPIC"
-
-export CC
-export LD = "${CC}"
-
-VPXTARGET_armv5te = "armv5te-linux-gcc"
-VPXTARGET_armv6 = "armv6-linux-gcc"
-VPXTARGET_armv7a = "armv7-linux-gcc"
-VPXTARGET ?= "generic-gnu"
-
-CONFIGUREOPTS = " \
-    --target=${VPXTARGET} \
-    --enable-vp8 \
-    --enable-vp9 \
-    --enable-libs \
-    --disable-install-docs \
-    --disable-static \
-    --enable-shared \
-    --prefix=${prefix} \
-    --libdir=${libdir} \
-    --size-limit=16384x16384 \
-"
-
-do_configure() {
-    ${S}/configure ${CONFIGUREOPTS}
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-    chown -R root:root ${D}
-}
-
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
new file mode 100644
index 0000000..8ac178d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
@@ -0,0 +1,50 @@
+SUMMARY = "VPX multi-format codec"
+DESCRIPTION = "The BSD-licensed libvpx reference implementation provides en- and decoders for VP8 and VP9 bitstreams."
+HOMEPAGE = "http://www.webmproject.org/code/"
+BUGTRACKER = "http://code.google.com/p/webm/issues/list"
+SECTION = "libs/multimedia"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
+
+SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
+            file://libvpx-configure-support-blank-prefix.patch \
+           "
+SRC_URI[md5sum] = "49e59dd184caa255886683facea56fca"
+SRC_URI[sha256sum] = "306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
+
+# ffmpeg links with this and fails
+# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
+ARM_INSTRUCTION_SET = "arm"
+
+CFLAGS += "-fPIC"
+
+export CC
+export LD = "${CC}"
+
+VPXTARGET_armv5te = "armv5te-linux-gcc"
+VPXTARGET_armv6 = "armv6-linux-gcc"
+VPXTARGET_armv7a = "armv7-linux-gcc"
+VPXTARGET ?= "generic-gnu"
+
+CONFIGUREOPTS = " \
+    --target=${VPXTARGET} \
+    --enable-vp8 \
+    --enable-vp9 \
+    --enable-libs \
+    --disable-install-docs \
+    --disable-static \
+    --enable-shared \
+    --prefix=${prefix} \
+    --libdir=${libdir} \
+    --size-limit=16384x16384 \
+"
+
+do_configure() {
+    ${S}/configure ${CONFIGUREOPTS}
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+    chown -R root:root ${D}
+}
-- 
1.9.1


