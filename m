Return-Path: <ee.peng.yeoh@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 01 Mar 2020 00:40:10 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56F8060B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 00:40:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Feb 2020 16:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,501,1574150400"; d="scan'208";a="232904904"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 29 Feb 2020 16:33:04 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2020 08:32:58 +0800
Message-Id: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 1/5] opencv: Enable pkg-config .pc file generation
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
X-List-Received-Date: Sun, 01 Mar 2020 00:40:10 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

In OpenCV 4, .pc file generation is disabled by default. Yet, other
software such as GStreamer and FFmpeg rely on the .pc files during build
time configuration. Explicitely enable .pc file generation to make sure
pkg-config can be used for getting information about OpenCV.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 77b5dd6..5e89db0 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -64,6 +64,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DCMAKE_SKIP_RPATH=ON \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
+    -DOPENCV_GENERATE_PKGCONFIG=ON \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.7.4


