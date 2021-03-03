Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3469.1614753031717604853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 22:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MRF5eGHT;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e6so15594527pgk.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzDA/VfVYqjLbKOI/ZhwVuT+t8W9id9lO6nPb9wVGJ4=;
        b=MRF5eGHTJRPueP0IjkQeqkUvZC4V7v/XXrfboR/vDH8N/flUp4D/U+In59PXoIF1Qi
         WYvJu004fnP3esnHOx931dW7FxPdgHKcKLXUGScx8E/qxylLyr+ZtLWB+8kqzzQvHLO+
         C1D6knV8f80K+YcEcwCZJhB0boHrnaKjsXE8Rf+SY+VWwFundDKlwWKEKyL/NYAG44s8
         noNH7dAf2wj7UisJQX2CiEPgp3i2dNDc6kDezytutd9Khg71vAHiTzT6m7EoAQsBuHwf
         uEdHCqMIOxnjQjje7UHj0IkbKhyIOY2htyQMYTwz5iFvmN0jfcmqqAcRo0bNw2+AV2Gu
         hX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzDA/VfVYqjLbKOI/ZhwVuT+t8W9id9lO6nPb9wVGJ4=;
        b=Pd+Yl9lg6i9oVzDBiz48LsuykOtIsrDMwF8w9DbW1osaM1ghxuOrplGduEip4uM6fk
         LpDC2Aq3SSkCP162VzCE7XaKbkkp8X0xUA/asTovV2vXIR+Xd97m8IfFOeBkavPfIbcE
         4B4dHkjXPrcHUpH+KFWWB/BPkz0QYqsCZ3dsWv+1nT4VwIOfgXHg1CvIa0Yne4nyKFQT
         OubcGLT6XCuQ4dmtRIN+7AwguilO2oVnnPFP6St1W7U4CZrdyvAUk0awKebitwop960q
         oDtuvPZwDc+nSvwvm3rPtO+1Cfpy76XRjUextvf6OCyzcXH5ugIz2joZVBS/f5arBdNg
         gJWQ==
X-Gm-Message-State: AOAM531yOCkIdW4wPsZV/NwqbKfF2yfR3qZafWZ5C+vhNUxbsXT40cBz
	/Hutk2gEPBaGCjTtrCsTbnSnCGMz2cEbEw==
X-Google-Smtp-Source: ABdhPJw2dGBdxKm6FnFp7F61Qfs5VO/RYgqA1mPVlOb8gKg6EOYbpR/+lkz2XbqmErXt9csVAlJ9hA==
X-Received: by 2002:a05:6a00:1356:b029:1ca:9a78:b2ae with SMTP id k22-20020a056a001356b02901ca9a78b2aemr23141584pfu.64.1614753030599;
        Tue, 02 Mar 2021 22:30:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id q66sm4489860pja.27.2021.03.02.22.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 22:30:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH v2] opencv: Upgrade to 4.5.1
Date: Tue,  2 Mar 2021 22:30:27 -0800
Message-Id: <20210303063027.2502650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch
Add patches to support gcc 11 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
v2: Also use 4.5.1 release for contrib repo too
    Add patches for gcc 11 fixes

 .../opencv/0001-Add-missing-include.patch     | 28 +++++++++++++++++++
 ...building-opencv-using-gcc-11.x-19244.patch | 28 +++++++++++++++++++
 ...gits-needs-opencv_dnn-module-to-buil.patch | 28 -------------------
 .../{opencv_4.5.0.bb => opencv_4.5.1.bb}      |  7 +++--
 4 files changed, 60 insertions(+), 31 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.0.bb => opencv_4.5.1.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch
new file mode 100644
index 0000000000..432f3c83ee
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch
@@ -0,0 +1,28 @@
+From 4d984c65384e7d1f409f7e4cc56548a0924b09aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Mar 2021 21:53:21 -0800
+Subject: [PATCH] Add missing include
+
+this is highlighted by gcc-11
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/gapi/test/gapi_async_test.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/gapi/test/gapi_async_test.cpp b/modules/gapi/test/gapi_async_test.cpp
+index 66b8be4dd3..aa0c9c7cfb 100644
+--- a/modules/gapi/test/gapi_async_test.cpp
++++ b/modules/gapi/test/gapi_async_test.cpp
+@@ -13,6 +13,7 @@
+ 
+ #include <condition_variable>
+ #include <stdexcept>
++#include <thread>
+ 
+ namespace opencv_test
+ {
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch b/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
new file mode 100644
index 0000000000..ce6499bfce
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
@@ -0,0 +1,28 @@
+From 67e1a5400383543b28fc69eb09c9429cb9d8c026 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Sat, 2 Jan 2021 17:43:11 +0000
+Subject: [PATCH] Fix building opencv using gcc 11.x #19244
+
+Add missing `#include <thread>` in modules/gapi/test/test_precomp.hpp
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/pull/19247]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/gapi/test/test_precomp.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/gapi/test/test_precomp.hpp b/modules/gapi/test/test_precomp.hpp
+index 7b3c695443..e92b1d03bf 100644
+--- a/modules/gapi/test/test_precomp.hpp
++++ b/modules/gapi/test/test_precomp.hpp
+@@ -11,6 +11,7 @@
+ #define __OPENCV_GAPI_TEST_PRECOMP_HPP__
+ 
+ #include <cstdint>
++#include <thread>
+ #include <vector>
+ 
+ #include <opencv2/ts.hpp>
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch b/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
deleted file mode 100644
index 022680331a..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 114af1ca23ff9bf2e521b2969e343e74cdd8eac1 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 1 Nov 2020 12:29:56 +0000
-Subject: [PATCH] samples: cmake: digits needs opencv_dnn module to build
-
-Intrudeced in commit 397ba2d9aafb5312e777ce2f886d7b568109e931:
-add OpenCV sample for digit and text recongnition, and provide multiple OCR models.
-https://github.com/opencv/opencv/commit/397ba2d9aafb5312e777ce2f886d7b568109e931
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/commit/79a82013ad2af04269891ce15281c9fdc31d3f66]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- samples/cpp/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/samples/cpp/CMakeLists.txt b/samples/cpp/CMakeLists.txt
-index 617629df2e..14ab6141df 100644
---- a/samples/cpp/CMakeLists.txt
-+++ b/samples/cpp/CMakeLists.txt
-@@ -14,6 +14,7 @@ set(OPENCV_CPP_SAMPLES_REQUIRED_DEPS
-   opencv_features2d
-   opencv_calib3d
-   opencv_stitching
-+  opencv_dnn
-   ${OPENCV_MODULES_PUBLIC}
-   ${OpenCV_LIB_COMPONENTS})
- ocv_check_dependencies(${OPENCV_CPP_SAMPLES_REQUIRED_DEPS})
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_4.5.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.5.1.bb
index 5263ffc03b..a595e788a2 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "d5fd2f0155ffad366f9ac912dfd6d189a7a6a98e"
-SRCREV_contrib = "37315babf9984a5b6aa981644a20dd8df1a5ff02"
+SRCREV_opencv = "1363496c1106606684d40447f5d1149b2c66a9f8"
+SRCREV_contrib = "b91a781cbc1285d441aa682926d93d8c23678b0b"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
@@ -49,7 +49,8 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-samples-cmake-digits-needs-opencv_dnn-module-to-buil.patch \
+           file://0001-Add-missing-include.patch \
+           file://0001-Fix-building-opencv-using-gcc-11.x-19244.patch \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.30.1

