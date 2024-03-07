Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D071AC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:30:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.25989.1709825446418516226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwgFOrvt;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d382a78c38so11150171fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709825444; x=1710430244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9aR9z8CPtmQe6aS9mwWikhUOrWRdkTSiCVkQMG1u/D8=;
        b=LwgFOrvtMP/RF5DaHOgOpIdbrRLC/N3j3AtDDDyrbsKoGh+alQrmSq5rAxYlVM80Wt
         pn/Ufw43adHxkOLCwhg6ooFE1RE+cBZQ4qo62qWmPAuje16mFGLIazLKYNWpGgWByPFZ
         wV0fLltUGWgbjGaOaWaVg10thGm3L4TRVn+6bJY3CJ+yEKggQax1VHZltkznBn3KOHdZ
         QokdkEcoMYbZDMQpeN5uUgvVUGa9JrOQ5DZX806flkULiE2A8Ch3fiBveqDBMi37siBw
         fv/jf0/Kd7VyYhGDjMDpDHt6jTewCoplOZANv9B/wQ9HVOzVpt00TqNPor3c6+AVCWmN
         UmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825444; x=1710430244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9aR9z8CPtmQe6aS9mwWikhUOrWRdkTSiCVkQMG1u/D8=;
        b=vSTETcX8Pfj13f2Ra/fn0A0J9F3MRT8XWapI3CeJZjaN1Oczm57dkIY686YXFs6duN
         O2+HZWMGX2IoIbcrzWqHSXtINxa2UcNpjCCEqVjaGEZZ/TzrSsQsad5YpKhQTxSDOgrT
         maAHu2BDMqTtRTCzEY4nnuscFF9/XCCboIrbv3ncGjsWJzMnC1l/EBl6xvsVi+BfwPvr
         WW3s4p4SOyR8wZkMapGx0ziH2OAtF/5UjBHHaX8NSRHrqv1+B3GAM3cIFy3MdeHHMeAp
         4FSS48glVAVd3q28wlOd1HNVUd+KjTQUCZaNbAO+v4H4foWBj6Ug98GyRpngl+xtOAU0
         Rh4g==
X-Gm-Message-State: AOJu0YyVpecnJtnl99HFzFL70cTaFcqfY5nrtGZykURZhCb0HHY2Thie
	0xvMq9kDao5FNNYCAD2S59kCx5lCwZP726mI8X9ElHNROzEEHadn6whR+NVT
X-Google-Smtp-Source: AGHT+IGr8xzUCOsw42b8Mx2FXyuzb5PygmicSxSXBk05EXZsZnh9S0znHdDeZ4ii/sVO+ZZAKHGzkA==
X-Received: by 2002:a05:651c:2ca:b0:2d2:b929:9388 with SMTP id f10-20020a05651c02ca00b002d2b9299388mr1531995ljo.22.1709825444218;
        Thu, 07 Mar 2024 07:30:44 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u23-20020a50c057000000b00565af2ea649sm8493806edd.14.2024.03.07.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 07:30:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Anuj Mittal <anuj.mittal@intel.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] opencv: fix reproducibility issues
Date: Thu,  7 Mar 2024 16:30:35 +0100
Message-ID: <20240307153035.2433958-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 15:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109197

From: Anuj Mittal <anuj.mittal@intel.com>

Download and unpack contrib modules and other repositories in S instead
of WORKDIR so they don't escape file-prefix-map substitutions.

Fixes a number of reproducibility problems because of OpenCV check
macros that were embedding path to files in contrib/.

MJ: this is backport from langdale and fixes not only reproducibility
    issues but also pseudo aborts in do_install when do_install
    is executed again after do_package (in incremental builds):

  | DEBUG: Executing shell function do_install
  | NOTE: DESTDIR=opencv/4.5.5-r0/image VERBOSE=1 cmake --build opencv/4.5.5-r0/build --target install --
  | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
  | Check logfile: opencv/4.5.5-r0/pseudo//pseudo.log
  | Subprocess aborted

  and pseudo.log file shows:
  path mismatch [3 links]: ino 214373575 db 'opencv/4.5.5-r0/package/usr/src/debug/lib32-opencv/4.5.5-r0/contrib/modules/intensity_transform/src/bimef.cpp' req 'opencv/4.5.5-r0/contrib/modules/intensity_transform/src/bimef.cpp'.

  easily reproducible with:
  bitbake -c cleansstate opencv; bitbake -c package opencv; bitbake -c install -f opencv

  unlike ${S} ${WORKDIR}/contrib isn't in default PSEUDO_IGNORE_PATHS

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-support/opencv/opencv_4.5.5.bb    | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index a7700a3743..5b5685f990 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
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
@@ -52,10 +52,10 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
-           file://CVE-2023-2617.patch;patchdir=../contrib \
-           file://CVE-2023-2618.patch;patchdir=../contrib \
+           file://CVE-2023-2617.patch;patchdir=contrib \
+           file://CVE-2023-2618.patch;patchdir=contrib \
            "
-SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
+SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
 S = "${WORKDIR}/git"
 
@@ -64,7 +64,7 @@ S = "${WORKDIR}/git"
 OPENCV_DLDIR = "${WORKDIR}/downloads"
 
 do_unpack_extra() {
-    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
+    tar xzf ${S}/ipp/ippicv/${IPP_FILENAME} -C ${S}
 
     md5() {
         # Return the MD5 of $1
@@ -79,22 +79,22 @@ do_unpack_extra() {
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
2.44.0


