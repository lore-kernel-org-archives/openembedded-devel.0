Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.7143.1605366184924515397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 07:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e//lYoez;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id m125so7671576wmm.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZzYhw98tUdJ2syGFFYWx3aN2VrwtkS1IOJb//OjBJdo=;
        b=e//lYoez/mE8THJbL3fEAVRWHOhS8CjNeoum3EngIVAVN4hN8WXan1UKb1hxhvoNRR
         oy0L292quHt7wscTF7MV+lkSbthg6R6tOtv66FKI79FsPHdbOc+Tii5yPS1VjQvRl93l
         4/4lwpvnynsht1ioj7Uv7gEPEercHDnJ9Nz8gCvuVIHhK3PpsWG9bZQ2PFftL+1lAyEh
         zbGZc4v26U/wxeOoLrZg5U9VG/Kw/WErqfcMsAYN6IuLljODJ81f06yaoJZZNxcd7gUZ
         8KVma3JfGB4VZGICBTdgT/h8gUCV1QrbG5Lb5oj8Zkal+7aqTAmM+MaL2qLp4CXKZ97J
         KLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZzYhw98tUdJ2syGFFYWx3aN2VrwtkS1IOJb//OjBJdo=;
        b=JXngxCv2EJKNelTE63BGAGZUWjjEWhySOEOxPzzEOuc6T51/TT5D58ynhaofSWp7oC
         S4fmhq5g2xZfwQDcs0ydXcQgf6DgcMzCinlC0YhG0e9gNWcqFUuIbk70jCzbHLNT53/L
         JfDwXRimfi+CI08zlRLhqKYdkHbXvsFnKnVQVow5raljSb99sQugGDzZhbSXmv0cEo/z
         jCPWqCODUxxZOkFcdnyQfCRmFTK4uemVcPzdWSuN7KiJkuWJWbwuOji/0G4QEG19GxS8
         dZppj1ixz3Or/a2EmzpzGGK4Zqhx4TzI4TsMX3rhGcLZeZQeftDnQgkF7CpHf1E3BWOf
         8loA==
X-Gm-Message-State: AOAM530BSuH5YYPVOiahTDtSlW7mVwnlwPmV/XT6qohHVq3Y76dDfKaB
	lfxlYbz3dLpYeLRuhOpGrQcG3LQR207OQA==
X-Google-Smtp-Source: ABdhPJxxzmY9IM2rXyRpOj3KcrDiwk6ii6pXkLlkHAM6MMSy2sX7Nefo8PXVd8rRCV85J/X7xmGcmA==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr7101404wmi.156.1605366183023;
        Sat, 14 Nov 2020 07:03:03 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 60sm12370245wrs.69.2020.11.14.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:03:02 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] opencv: Update 4.4.0 -> 4.5.0
Date: Sat, 14 Nov 2020 15:02:50 +0000
Message-Id: <20201114150250.2647037-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OpenCV licence has been changed to Apache 2

    * 0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
      Upstream-Status: Submited [https://github.com/opencv/opencv/pull/18806]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...gits-needs-opencv_dnn-module-to-buil.patch | 28 +++++++++++++++++++
 .../{opencv_4.4.0.bb => opencv_4.5.0.bb}      |  9 +++---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.4.0.bb => opencv_4.5.0.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch b/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
new file mode 100644
index 0000000000..e52135fd87
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
+Upstream-Status: Submited [https://github.com/opencv/opencv/pull/18806]
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

