Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E7D7561A67
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 00:40:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Feb 2020 16:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,501,1574150400"; d="scan'208";a="232904918"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 29 Feb 2020 16:33:12 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2020 08:33:01 +0800
Message-Id: <1583022782-6527-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
Cc: Ross Burton <ross.burton@intel.com>, Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 4/5] opencv: PACKAGECONFIG for G-API, use system ADE
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
X-List-Received-Date: Sun, 01 Mar 2020 00:40:16 -0000

From: Ross Burton <ross.burton@intel.com>

The Graph API is enabled by default, and if ADE isn't present it will
download a copy of the source during do_configure.

Add a PACKAGECONFIG for the Graph API, and depend on the ADE that we
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 487393f..03e4f58 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -93,10 +93,11 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
+PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
-- 
2.7.4


