Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411A0C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 08:40:57 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.3458.1665045656459640941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LhU+1nC4;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665045656; x=1696581656;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4hKqakvnfiMRpdNA9qgVKGQXovB8bNkbclob3rc1tw=;
  b=LhU+1nC4ROu6gaFC0UCmtErVk+aOaCEW94rSjUBHW0xh+dxItUxN8nAZ
   Q4UOo2rbFbvo8EWHQDSE97Clj9l5Oj9BSp+VA/ITLAKWZcIMmsw/VUemi
   kOM4wr1Tp02viL6C61vPWJAUyZqYvj1gChD1OruAV5jXsWJJwW20aRQu4
   cjyObymMJiqJx1w5v9gKssvlATo9WEbI2eYgZPOVLhnAkk3Bx8DE1PpAK
   49NisFdF5Gm5q+x6YOe4xiqV5R8uCgTW0E4nSrU8v/eKEWkmFsRrie4cx
   jL1+lvJlVCL6ZAAhZNmGLlwx9ssdP83+6G6HMY+Xm1cOQ4Ipc2t/0WqsI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="367513102"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800";
   d="scan'208";a="367513102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 01:40:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="767067660"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800";
   d="scan'208";a="767067660"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.155.99])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 01:40:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] opencv: fix reproducibility issues
Date: Thu,  6 Oct 2022 16:40:48 +0800
Message-Id: <20221006084048.154710-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 08:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99078

Download and unpack contrib modules and other repositories in S instead
of WORKDIR so they don't escape file-prefix-map substitutions.

Fixes a number of reproducibility problems because of OpenCV check
macros that were embedding path to files in contrib/.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-support/opencv/opencv_4.6.0.bb    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index f6c10054c..da1e659a4 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -39,12 +39,12 @@ IPP_MD5 = "${@ipp_md5sum(d)}"
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol=https \
-           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib;branch=master;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=ipp;name=ipp;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face;protocol=https \
-           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=wechat_qrcode;name=wechat-qrcode;protocol=https \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=master;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=git/ipp;name=ipp;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
+           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
@@ -52,7 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            "
-SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
+SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
 S = "${WORKDIR}/git"
 
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 OPENCV_DLDIR = "${WORKDIR}/downloads"
 
 do_unpack_extra() {
-    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
+    tar xzf ${S}/ipp/ippicv/${IPP_FILENAME} -C ${S}
 
     md5() {
         # Return the MD5 of $1
@@ -76,22 +76,22 @@ do_unpack_extra() {
             test -e $DEST || ln -s $F $DEST
         done
     }
-    cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
-    cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
-    cache data ${WORKDIR}/face/*.dat
-    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.caffemodel
-    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.prototxt
+    cache xfeatures2d/boostdesc ${S}/boostdesc/*.i
+    cache xfeatures2d/vgg ${S}/vgg/*.i
+    cache data ${S}/face/*.dat
+    cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
+    cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
 }
 addtask unpack_extra after do_unpack before do_patch
 
 CMAKE_VERBOSE = "VERBOSE=1"
 
-EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DWITH_1394=OFF \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
-    -DIPPROOT=${WORKDIR}/ippicv_lnx \
+    -DIPPROOT=${S}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
-- 
2.37.3


