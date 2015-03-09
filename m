Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECEF7397E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 23:13:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2015 16:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,370,1422950400"; d="scan'208";a="538345613"
Received: from kmsywula-mobl5.ger.corp.intel.com (HELO vm64) ([10.232.83.98])
	by orsmga003.jf.intel.com with SMTP; 09 Mar 2015 16:13:29 -0700
Received: by vm64 (sSMTP sendmail emulation); Mon, 09 Mar 2015 16:13:59 -0700
From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2015 16:12:41 -0700
Message-Id: <1425942761-8314-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][dylan][PATCH] opencv: Update SRC_URI to use git
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
X-List-Received-Date: Mon, 09 Mar 2015 23:14:01 -0000

From: Khem Raj <raj.khem@gmail.com>

opencv now has moved to using git. Lets use the git
version to fetch SRCs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{opencv-samples_2.4.3.bb => opencv-samples_2.4.bb}     |   12 +++++-------
 .../opencv/{opencv_2.4.3.bb => opencv_2.4.bb}              |   10 ++++------
 2 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv-samples_2.4.3.bb => opencv-samples_2.4.bb} (82%)
 rename meta-oe/recipes-support/opencv/{opencv_2.4.3.bb => opencv_2.4.bb} (91%)

diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
similarity index 82%
rename from meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index 50efd77..e00a5e6 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -7,14 +7,12 @@ DEPENDS = "opencv"
 
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
 "
+SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
+          "
+PV = "2.4.3+git${SRCPV}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
-
-S = "${WORKDIR}/OpenCV-${PV}"
+S = "${WORKDIR}/git"
 
 do_install() {
     cd samples/c
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
similarity index 91%
rename from meta-oe/recipes-support/opencv/opencv_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv_2.4.bb
index 39b608a..3ca32f9 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,16 +9,14 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
+SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
 
-SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
+PV = "2.4.3+git${SRCPV}"
 
-PR = "r2"
-
-S = "${WORKDIR}/OpenCV-${PV}"
+S = "${WORKDIR}/git"
 
 # Do an out-of-tree build
 OECMAKE_SOURCEPATH = "${S}"
-- 
1.7.10.4


