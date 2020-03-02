Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C329861931
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 01:27:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 17:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,505,1574150400"; d="scan'208";a="228257682"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 01 Mar 2020 17:27:39 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Mar 2020 09:27:32 +0800
Message-Id: <1583112455-26910-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583112455-26910-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1583112455-26910-1-git-send-email-ee.peng.yeoh@intel.com>
Cc: Ross Burton <ross.burton@intel.com>, Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [zeus][[PATCH 2/5] opencv: don't download during configure
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
X-List-Received-Date: Mon, 02 Mar 2020 01:27:39 -0000

From: Ross Burton <ross.burton@intel.com>

OpenCV downloads data files during the CMake configure phase, which
is bad because fetching should only happen in do_fetch (and if proxies
are needed, won't be set in do_configure).

The recipe attempts to solve this already by having the repositories in
SRC_URI and moving the files to the correct place before do_configure().
However they are written to ${B} which is then wiped in do_configure so
they're not used.

The OpenCV download logic has a download cache with specially formatted
filenames, so take the downloaded files and populate the cache.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 5e89db0..cfc7854 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -51,10 +51,28 @@ PV = "4.1.0"
 
 S = "${WORKDIR}/git"
 
+# OpenCV wants to download more files during configure.  We download these in
+# do_fetch and construct a source cache in the format it expects
+OPENCV_DLDIR = "${WORKDIR}/downloads"
+
 do_unpack_extra() {
     tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
-    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+
+    md5() {
+        # Return the MD5 of $1
+        echo $(md5sum $1 | cut -d' ' -f1)
+    }
+    cache() {
+        TAG=$1
+        shift
+        mkdir --parents ${OPENCV_DLDIR}/$TAG
+        for F in $*; do
+            DEST=${OPENCV_DLDIR}/$TAG/$(md5 $F)-$(basename $F)
+            test -e $DEST || ln -s $F $DEST
+        done
+    }
+    cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
+    cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -65,6 +83,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
+    -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.7.4


