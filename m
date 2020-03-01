Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E3C7A60B2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 00:40:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Feb 2020 16:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,501,1574150400"; d="scan'208";a="232904914"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 29 Feb 2020 16:33:09 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2020 08:33:00 +0800
Message-Id: <1583022782-6527-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
Cc: Ross Burton <ross.burton@intel.com>, Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 3/5] opencv: also download face alignment data in do_fetch()
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
X-List-Received-Date: Sun, 01 Mar 2020 00:40:13 -0000

From: Ross Burton <ross.burton@intel.com>

The face alignment data is downloaded in do_configure, so download it in
do_fetch and add it to the cache.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index cfc7854..487393f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -15,6 +15,7 @@ SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
 SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
+SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 
 def ipp_filename(d):
     import re
@@ -41,6 +42,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face \
            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
            file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
            file://0003-To-fix-errors-as-following.patch \
@@ -73,6 +75,7 @@ do_unpack_extra() {
     }
     cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
     cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
+    cache data ${WORKDIR}/face/*.dat
 }
 addtask unpack_extra after do_unpack before do_patch
 
-- 
2.7.4


