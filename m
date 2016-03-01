Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB8C3731DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 00:49:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 29 Feb 2016 16:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="913975601"
Received: from unknown (HELO rebeccas-iLBPG3.png.intel.com) ([10.88.227.80])
	by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2016 16:49:48 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-devel@lists.openembedded.org,
	Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Date: Tue,  1 Mar 2016 08:49:42 +0800
Message-Id: <1456793382-4567-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456793382-4567-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1456793382-4567-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [meta-oe] [PATCH v3] libvpx: upgrade to version 1.5.0
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
X-List-Received-Date: Tue, 01 Mar 2016 00:49:46 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This version had improved VP9 encoder and speeds up the encoding and
decoding process.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../recipes-multimedia/webm/{libvpx_1.4.0.bb => libvpx_1.5.0.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.4.0.bb => libvpx_1.5.0.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
index c963a9c..8ac178d 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
             file://libvpx-configure-support-blank-prefix.patch \
            "
-SRC_URI[md5sum] = "63b1d7f59636a42eeeee9225cc14e7de"
-SRC_URI[sha256sum] = "f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4"
+SRC_URI[md5sum] = "49e59dd184caa255886683facea56fca"
+SRC_URI[sha256sum] = "306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
 
-# ffmpeg links with this and fails 
+# ffmpeg links with this and fails
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
 ARM_INSTRUCTION_SET = "arm"
 
@@ -48,4 +48,3 @@ do_install() {
     oe_runmake install DESTDIR=${D}
     chown -R root:root ${D}
 }
-
-- 
1.9.1


