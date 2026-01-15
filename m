Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF1FD33A08
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:29:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31222.1768465759118358319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eyJlyQ0d;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305914so374016f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768465757; x=1769070557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZDUDvXPvhB1DnqY6it35KhtY48RsEmXT0/cs3MxuXU=;
        b=eyJlyQ0dBD0TD7LMjNx96IXnVF1tUgMAjQLLSe9PqG84a7BttFvO5D3+p5PlK+F6/X
         GPgFXtmmrqG91JiUDeo4SUwF6yhSNfFKyVDR6NPLt3suujtP7U4Q+lSg/L3qu8LkdZ3f
         sg8kIiWX7H2HyaRV+wfrgYsHh4xYo2ity1IpTjWvQ/qGzDRavg/oNZlAjzN9veqZtJzC
         Lik3R0Ah5HHfXPG1RMHb53/vxkbZJVFni/fsigDBabR+/law/vrDBOkYIFCFW8aihVMM
         Ts/Z1zNwin6El5itoywUp1pSOHQsKcLbQo9ujuSMdUD1zHjD/9Wqd5wmvGd4BmPb874V
         TpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465757; x=1769070557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZDUDvXPvhB1DnqY6it35KhtY48RsEmXT0/cs3MxuXU=;
        b=EuH92mOVUwr/XXlZNStIi8z+/duLyV4zYFZAI+9SlyXiwx4yUkfp9IEiF4SFd4Ss3f
         Lzacbjd9ldB7lszpJ7lEnGN99+yuXlAXVX2kfCzChxqKx+QDgTYYFIvZDGsu+f3XCU51
         b2ofUGLBSl5mt+5zyFjtrOSCGuvo6VWpaxUmU08zLmU4XVhYSXx/HXeZrxaV+Zd2/7Fw
         r3zDbK1Q6MvYQrd+CEnq+Fw9wXDuxoOJisOgodb6MpxWol/H9LCtGwaOxX/a/Onj9x8Q
         f3ahZIlfE5T4m+UW1yoP8nGO2q1KmS2RrkMelRmE7EI2JEj+SNtdn7s48iZuix10cd+t
         MbMg==
X-Gm-Message-State: AOJu0YxUeXyEW+tXXXYFS8FV8ZXwKxmE2nOQ5/r+8lxV5YtrMH1mLKvs
	3kLpAglQBqYS1WD4OoNDrN4r51VRk0wdgpOp4jBFHekyjJuqfBgkH8rVipckCQ==
X-Gm-Gg: AY/fxX6aF6GSB/CWlko2Wj5BD1L6Esx414GjX90gWWFhGnaUbP0RzSsm69gA/ok9wbn
	nuKRSwi9NMVogRpXpe3dfYCN8ze2w/5KWSToPezA2P1t3zJgjY60+9yk2aDESnYO7PswE2nar4v
	HG+P9BgHdAGBQod89mw/8n9H7TiE4s9+0PgChpDplAs9iB7FujORV4DFzDtMyE7W8ocmCzF4wkA
	2B+/ZAxZ0l94w88yg0JEWJQOxgJARrL7sqfRCX2ObBXj4MMbtjlC7yvpTpvnlOdnTp7Hlf2MYIW
	9J2Kd5ao4k0313aJzmLm6lBHejiWP1jIQaYNOCX4tdfp7HkbbcGEqWjuM5d1M+AsIUM6GsfGwlu
	JWvLcJOwuLtymQXF4YgsRiaW62De3//HPSIp03w3NhRugJLrOBiRQoAY0aM2DIXVq9c/B3GlapR
	jvyx1wT3nY
X-Received: by 2002:a05:6000:2389:b0:430:f463:b6ac with SMTP id ffacd0b85a97d-4342c56caadmr6160842f8f.44.1768465757190;
        Thu, 15 Jan 2026 00:29:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4310083f8f.29.2026.01.15.00.29.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] exiv2: add ptest support
Date: Thu, 15 Jan 2026 09:29:09 +0100
Message-ID: <20260115082915.2357544-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123493

The project has extensive runtime- and unittest suite - make use of it.

It takes around 10 seconds to run both suites.

Added two patches:
One is needed to convert python unittest output into automake output.

The other is required to be able to configure test data folder at
compile time - otherwise the tests are looking for the test-data
with absolute paths from the build machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 35bc4860f18cd56a80ee29d492540acfcb620b59)

Adapted to Kirkstone. (It also required an extra patch to be able to
compile with the current googletest library)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...1-Allow-test-data-path-configuration.patch | 30 ++++++++++++++++
 .../0001-Fix-build-with-gtest-1.11.patch      | 35 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2/run-ptest |  6 ++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 33 +++++++++++++++--
 4 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/run-ptest

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
new file mode 100644
index 0000000000..9d6072a799
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
@@ -0,0 +1,30 @@
+From 2483e51df6e02ad0ad5ae636767279fa230da44f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 23 Nov 2025 11:52:24 +0100
+Subject: [PATCH] Allow test data path configuration
+
+The unittests expect to the executed in the source folder before/after build,
+and they expect the test data to be in the source folder. However for ptests
+these folders are not available.
+
+This patch allows the test data folders to be configuration during build time.
+
+Upstream-Status: Inappropriate [ptest-specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unitTests/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unitTests/CMakeLists.txt b/unitTests/CMakeLists.txt
+index 51040c0e2..e2604d4a7 100644
+--- a/unitTests/CMakeLists.txt
++++ b/unitTests/CMakeLists.txt
+@@ -40,7 +40,7 @@ add_executable(unit_tests
+ target_compile_definitions(unit_tests
+   PRIVATE
+     exiv2lib_STATIC
+-    TESTDATA_PATH="${PROJECT_SOURCE_DIR}/test/data"
++    TESTDATA_PATH="${TEST_FOLDER}/test/data"
+ )
+ 
+ if (exiv2lib_COMPILE_DEFINITIONS)
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
new file mode 100644
index 0000000000..fd4c88f062
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
@@ -0,0 +1,35 @@
+From 14d482f9e2353e195149fff196e65cb3a6b46e25 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 18 Jun 2021 18:53:46 +0200
+Subject: [PATCH] Fix build with gtest 1.11
+
+From: Antonio Rojas <arojas@archlinux.org>
+
+INSTANTIATE_TYPED_TEST_CASE_P requires a non-empty prefix now
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/c069e36605f05e8e58bf964e5ecbde04efb90a20]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unitTests/test_slice.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/unitTests/test_slice.cpp b/unitTests/test_slice.cpp
+index bbc6785..ab51cda 100644
+--- a/unitTests/test_slice.cpp
++++ b/unitTests/test_slice.cpp
+@@ -422,12 +422,12 @@ REGISTER_TYPED_TEST_CASE_P(slice, atAccess, iteratorAccess, constructionFailsFro
+                            constMethodsPreserveConst);
+ 
+ typedef ::testing::Types<const std::vector<int>, std::vector<int>, int*, const int*> test_types_t;
+-INSTANTIATE_TYPED_TEST_CASE_P(, slice, test_types_t);
++INSTANTIATE_TYPED_TEST_CASE_P(slice, slice, test_types_t);
+ 
+ REGISTER_TYPED_TEST_CASE_P(mutableSlice, iterators, at);
+ typedef ::testing::Types<std::vector<int>, int*> mut_test_types_t;
+-INSTANTIATE_TYPED_TEST_CASE_P(, mutableSlice, mut_test_types_t);
++INSTANTIATE_TYPED_TEST_CASE_P(slice, mutableSlice, mut_test_types_t);
+ 
+ REGISTER_TYPED_TEST_CASE_P(dataBufSlice, successfulConstruction, failedConstruction);
+ typedef ::testing::Types<DataBuf&, const DataBuf&> data_buf_types_t;
+-INSTANTIATE_TYPED_TEST_CASE_P(, dataBufSlice, data_buf_types_t);
++INSTANTIATE_TYPED_TEST_CASE_P(slice, dataBufSlice, data_buf_types_t);
diff --git a/meta-oe/recipes-support/exiv2/exiv2/run-ptest b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
new file mode 100644
index 0000000000..d7ed07d7c9
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+cd tests
+python3 ./runner.py -v 2>&1 | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+
+cd ..
+./build/bin/unit_tests --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 1c1c05dfaa..0b70c3b235 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -2,10 +2,13 @@ SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
-DEPENDS = "zlib expat"
+DEPENDS = "zlib expat ${@bb.utils.contains('PTEST_ENABLED', '1', 'googletest', '', d)}"
 
 SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz \
+           file://run-ptest \
+           file://0001-Allow-test-data-path-configuration.patch \
            file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
+           file://0001-Fix-build-with-gtest-1.11.patch \
            file://CVE-2021-29457.patch \
            file://CVE-2021-29458.patch \
            file://CVE-2021-29463.patch \
@@ -26,8 +29,34 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-inherit dos2unix
+inherit dos2unix ptest
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
 inherit cmake gettext
+
+RDEPENDS:${PN}-ptest += " \
+    python3-html \
+    python3-lxml \
+    python3-multiprocessing \
+    python3-shell \
+    python3-unittest"
+
+EXTRA_OECMAKE = "\
+    ${@bb.utils.contains('PTEST_ENABLED', \
+    '1', \
+    '-DEXIV2_BUILD_SAMPLES=ON -DEXIV2_ENABLE_WEBREADY=ON -DEXIV2_BUILD_UNIT_TESTS=ON -DTEST_FOLDER=${PTEST_PATH}', \
+    '', \
+    d)} \
+"
+
+do_install_ptest(){
+    cp -r ${S}/tests ${D}${PTEST_PATH}/
+    cp -r ${S}/test ${D}${PTEST_PATH}/
+
+    install -d ${D}${PTEST_PATH}/build/bin
+    install ${B}/bin/* ${D}${PTEST_PATH}/build/bin
+
+    install -d ${D}${PTEST_PATH}/src
+    install ${S}/src/canonmn_int.cpp ${D}${PTEST_PATH}/src
+}

