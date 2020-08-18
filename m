Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.61342.1597736714635997610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 00:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U/nDcgjh;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id s15so9372230pgc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8K13Gh0AzWlDlBTCIm41kJM0GRzhbMoKPjdvfq/OzoU=;
        b=U/nDcgjh+DscAqwIcgjZuksahjWdcaTY/1x1P6MP+p4tMIM1K0Sdslyi4fWmEKrtJq
         A6oOq98aAbh1JqCQpnIR86qAMX5xjokw6grhR6MeNaoFJUSiqOQwqBzY1k//BsMfFT2K
         tTUMDz1IZWewiv7zwg24awBAiV9pvTRw+Sxa/doUL/lLNXVnPrdc6tQVkdxQXVIki3zM
         iqd5PQSpR64/HIMZgnMjclgKF+YzE1cHcQmeAbJRbwASCNbD0lyP86X/C+4quUVySTyO
         l/IyiL4clwN0HGslamAjAHBFIGe2Tj1mQ0VMaekwizUGzvXbeWBLPt7kB1+Dq969LJB/
         j0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8K13Gh0AzWlDlBTCIm41kJM0GRzhbMoKPjdvfq/OzoU=;
        b=Co6gGLdhZVesFS9/mUdFNuTuIhh0IJ/po32jQlPZtJHh0ahpQEL4RAIPaY+3q7dDl0
         kVNAD5DUGc6dXPBwR+yJZO8MGXc1nkaphKlqKkl/Pfb2E5RN+naozfMJdmEKQs9m2qTY
         VQgo2bX7umNcX9yfFI0CgW6K9LkLESd7tA1Xyge/BtX2nVgLhRGIqkfuJgzL5CHpCKWY
         zQBpH2AnIh1qmMRAIsTZh7+JQMUt5QfTOkcVED8OZLQ5SSnhqIqJTzbvrShsjOVFZYFc
         58IzgwhACd/000LfGVkuUjUim69fWDTn/O5jluJMnhk6wFVzFJCdkRGNWrbDnU2GJfUj
         qn2Q==
X-Gm-Message-State: AOAM532cTUnuDiUN+2Nzfyua5ameZ3TU6InqhhcgbPhSFJ1JsTtSSXKv
	iT8gf0kR/xej+RlCHS6wwT/mjJLi0COrKg==
X-Google-Smtp-Source: ABdhPJwsCNv9DRLVp7E8GojuBY2nXNrLImfjNZsFDei4LXR/ZjIpFTiJwRQRiQMvDGjA3HZfQS00zA==
X-Received: by 2002:a65:5a8d:: with SMTP id c13mr12944326pgt.268.1597736713742;
        Tue, 18 Aug 2020 00:45:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id w16sm21343188pjd.50.2020.08.18.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 00:45:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Upgrade to 4.4.0
Date: Tue, 18 Aug 2020 00:45:09 -0700
Message-Id: <20200818074509.1113934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to workaround a gcc bug on rv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-Os-to-compile-tinyxml2.cpp.patch | 31 +++++++++++++++++++
 .../{opencv_4.3.0.bb => opencv_4.4.0.bb}      | 10 ++++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Use-Os-to-compile-tinyxml2.cpp.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.3.0.bb => opencv_4.4.0.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Use-Os-to-compile-tinyxml2.cpp.patch b/meta-oe/recipes-support/opencv/opencv/0001-Use-Os-to-compile-tinyxml2.cpp.patch
new file mode 100644
index 0000000000..c5a64387f5
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Use-Os-to-compile-tinyxml2.cpp.patch
@@ -0,0 +1,31 @@
+From 59fafe6e39759e193b5764b36b4c5a93da352123 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Aug 2020 00:36:49 -0700
+Subject: [PATCH] Use -Os to compile tinyxml2.cpp
+
+This workarounds issue [1] seen on riscv with gcc
+
+[1] https://github.com/riscv/riscv-gnu-toolchain/issues/624
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/datasets/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/datasets/CMakeLists.txt b/modules/datasets/CMakeLists.txt
+index 56ca9e310..99b7a33f6 100644
+--- a/modules/datasets/CMakeLists.txt
++++ b/modules/datasets/CMakeLists.txt
+@@ -2,7 +2,7 @@ set(the_description "datasets framework")
+ 
+ set(filter_srcs "${CMAKE_CURRENT_LIST_DIR}/src/tinyxml2/tinyxml2.cpp")
+ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
+-  ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-suggest-override")  # GCC
++  ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-suggest-override -Os")  # GCC
+ elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
+   ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-inconsistent-missing-override")  # Clang
+ endif()
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.3.0.bb b/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_4.3.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.4.0.bb
index 7927ce25f7..372e15cd00 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.4.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "01b2c5a77ca6dbef3baef24ebc0a5984579231d9"
-SRCREV_contrib = "e6f32c6a69043456a806a4e802ee3ce7b7059c93"
+SRCREV_opencv = "c3bb57afeaf030f10939204d48d7c2a3842f4293"
+SRCREV_contrib = "5fae4082cc493efa5cb7a7486f9e009618a5198b"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
@@ -50,7 +50,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            "
-PV = "4.3.0"
+SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
 S = "${WORKDIR}/git"
 
@@ -80,6 +80,8 @@ do_unpack_extra() {
 }
 addtask unpack_extra after do_unpack before do_patch
 
+CMAKE_VERBOSE = "VERBOSE=1"
+
 EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DWITH_1394=OFF \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
@@ -204,3 +206,5 @@ do_install_append() {
         rm -rf ${D}/usr/lib
     fi
 }
+
+TOOLCHAIN = "gcc"
-- 
2.28.0

