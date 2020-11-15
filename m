Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.17466.1605432222351998664
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 01:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pYMHHf3S;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id p19so10130375wmg.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKd+4lzRBlnSLKbMb3I/qkdOSQN5cQ8ePip/GsyP7k4=;
        b=pYMHHf3SZfcAUfxUJu1BrZXA/D47uXhMRQbPD+g4RTMGBbme+L/cw5DWwLtnXbQsEy
         cp7BPAilEifQH3144PbrYyc4Yi7oU8IoUkmNKedvhVlmRgVff3xt19Q+Uuam05kyUajF
         6C2Y/lnPOg+qqnSDw7WlqbyFESTuradEQa89vpgif6d+7IYOpsOwUgHy6E/ppwivrJPn
         AgeVImsW+75iBiVg2uX7u9/lGhbQKJJmQP011ro45LZq3omd+0SiyKJyJQ9CMDJe6r9A
         dJUgsQ+qxER+muhyBYJ1fIrR2RRpl7vbd3ZFb8p5J7UCqzb98SjIQ7oSPf6lIz2ZqcUT
         JACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKd+4lzRBlnSLKbMb3I/qkdOSQN5cQ8ePip/GsyP7k4=;
        b=PZEQqkQjA6to2erDuHt9VzOP8mXeFkAkOrUOIHvIWHXztSNDdc43q4AjbYMiy2NlFo
         hTkiD5pgh3g1BAgQso5LynDra8okEqNg/B+WJlMflbCXLRtUHrbdMUCMPUQT3TmO23cf
         KUE/vfQTpwl0xciJw4pknfr9xiQ3me2I1A2R48087BqHBKk7ec/lRmIcS4mtHB0qHc3l
         Yfq9UHxvsh2DxZzBe4r2nWtVrAjvZuqga+Rv6KKiJgotvsU3UFtSZyaFfSZW0XKd7J9z
         WX3MueTvso1l8prISG0GwitUMg6sR+Dg6/xk9ZwfWVdAmEMgNKRGkyd9tXk/dqt4MaAU
         T5Ng==
X-Gm-Message-State: AOAM532pVEzDhLIelMn08gvReVkCLpNFWybOM7nIkXXWtK4t11QfJO3d
	iv9G7HLPsmAH5sBm9wq56Wd5MQ4Mi7HvHQ==
X-Google-Smtp-Source: ABdhPJwPCE1I/201EOgyZMOIh3UWfqN+hMvij1Y2LZIxVADBdBajJn8EQgZQP8+oGZ4QmzoCuYdKAA==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr10481610wmk.131.1605432220359;
        Sun, 15 Nov 2020 01:23:40 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 109sm18453417wra.29.2020.11.15.01.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 01:23:39 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH v2] opencv: Update 4.4.0 -> 4.5.0
Date: Sun, 15 Nov 2020 09:23:30 +0000
Message-Id: <20201115092330.126133-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OpenCV licence has been changed to Apache 2

    * 0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
      Upstream-Status: Backport [https://github.com/opencv/opencv/commit/79a82013ad2af04269891ce15281c9fdc31d3f66]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...gits-needs-opencv_dnn-module-to-buil.patch | 28 +++++++++++++++++++
 .../{opencv_4.4.0.bb => opencv_4.5.0.bb}      |  9 +++---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.4.0.bb => opencv_4.5.0.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch b/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
new file mode 100644
index 0000000000..022680331a
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
@@ -0,0 +1,28 @@
+From 114af1ca23ff9bf2e521b2969e343e74cdd8eac1 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 1 Nov 2020 12:29:56 +0000
+Subject: [PATCH] samples: cmake: digits needs opencv_dnn module to build
+
+Intrudeced in commit 397ba2d9aafb5312e777ce2f886d7b568109e931:
+add OpenCV sample for digit and text recongnition, and provide multiple OCR models.
+https://github.com/opencv/opencv/commit/397ba2d9aafb5312e777ce2f886d7b568109e931
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/79a82013ad2af04269891ce15281c9fdc31d3f66]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ samples/cpp/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/samples/cpp/CMakeLists.txt b/samples/cpp/CMakeLists.txt
+index 617629df2e..14ab6141df 100644
+--- a/samples/cpp/CMakeLists.txt
++++ b/samples/cpp/CMakeLists.txt
+@@ -14,6 +14,7 @@ set(OPENCV_CPP_SAMPLES_REQUIRED_DEPS
+   opencv_features2d
+   opencv_calib3d
+   opencv_stitching
++  opencv_dnn
+   ${OPENCV_MODULES_PUBLIC}
+   ${OpenCV_LIB_COMPONENTS})
+ ocv_check_dependencies(${OPENCV_CPP_SAMPLES_REQUIRED_DEPS})
diff --git a/meta-oe/recipes-support/opencv/opencv_4.4.0.bb b/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_4.4.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.5.0.bb
index c83186de07..b223334a58 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
@@ -2,16 +2,16 @@ SUMMARY = "Opencv : The Open Computer Vision Library"
 HOMEPAGE = "http://opencv.org/"
 SECTION = "libs"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19598330421859a6dd353a4318091ac7"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "c3bb57afeaf030f10939204d48d7c2a3842f4293"
-SRCREV_contrib = "5fae4082cc493efa5cb7a7486f9e009618a5198b"
+SRCREV_opencv = "d5fd2f0155ffad366f9ac912dfd6d189a7a6a98e"
+SRCREV_contrib = "37315babf9984a5b6aa981644a20dd8df1a5ff02"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
+           file://0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.29.2

