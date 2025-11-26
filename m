Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6520D1119D
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:21 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3902.1764190157131180806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWUc0V0J;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2953ad5517dso1976515ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190156; x=1764794956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VY++D9VgByqyJoPvOlRzH1HBGhUujvi1YozwV5/Vjz0=;
        b=HWUc0V0JlWLD2XxmNIUDA8bOmd8+qnUQ7QpSqjKuHAbNQs0OEt9BC02CeszNgajLTw
         xCyk9t5b1lhaXdNLRz97KEqRJOIjnAjYXfhmMLsaly8UO/xjDHxWJabHTJEjXviLEyF9
         CJjBVVeX9vs+Nfp6CW7EitgExBQ4uKq3F9f8I4L5Q6cmgJlPUoVWXW8R/gybCbOxLQQD
         dXzHyIOuazuW07OsXu72Xg+O2wHlN9IhnDRO1eUTiaVm9JolwVUl7r+uotVBELwmKgRt
         AoYXl61xvFe9EnKjFWasShELfNlNX6voKVhB2dowzCtSxG7ufYy+iliQpbGjbtltF3jT
         F+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190156; x=1764794956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY++D9VgByqyJoPvOlRzH1HBGhUujvi1YozwV5/Vjz0=;
        b=brGiMWKzryShc2DkrPoK9USx+2a9tHKMORoOs3SiVe1wZaX1Gw0geNX4BK4mD/B8F2
         iBO2HuCA+/JD6ofS2db8DeUVixAp/kNXQZzrM5qdmlB3fPBgVXUlQ6dTD9kxrf3gIwF0
         vKMH5Ov5btIH76OsHGBEYJx25PN6vhUHsBz5a9S+YmdihhOqLlhekhumKTu9SZqxjM3O
         zUMO8lXPStf8Uuh9rbXERXqdr4QgXEI86lDlH1sK2XgrXqY04iK8Jg2JDzNg0FumGI1T
         I1tlDv/bZN87cVWD4YSZ46yf60/HC/iJF/4bR3M20mmAzsAO1q+GdZvzp+AggrTwWxEn
         CdwA==
X-Gm-Message-State: AOJu0YxnnM/UC+4yd1/jCgr71PGgRPKu+ERynCKLN2dheGYubSpYZ3XX
	9zCEnzQJUrGgIu+ZgmsSM/Da2X5zvypyLWc6DxnUfWE06UQQkZmVyPNsW8zEHA==
X-Gm-Gg: ASbGncvkJp4jjyN2QMr4s8+J3663q4kGpYVIW7MKa6WafJYKFem3HwoXzNVdaOibFeb
	X9sNxa2cwp+WCsnBYNy1UmIMIpIo9NBN6d+8ZfcGvxTZbF+eG4KLlfVHGnytvYvGOZkItU4I02T
	MQFSZ6Sloh5AMqHXKv3dKuI8WpFGx5cTO5hu6JWKxWR/sZ5p9C93nDQSRwdfUcdNSPGwYiLSkIX
	fEgxGWDnHcG9VbkDoJ0jnKrXlt5BWlR5opGLh0vmJeGuzU2R4q5mnSyq/+Xru4BD+bi+YDflpW6
	8vh1/3ecV31041r/Yy2/RT7STHgee+rUExK2LpZpBkU6lXjV9rzB6UjdIEGA/PcTRIA26mDh+Ug
	448Uu4zKw59yvXLoo+h99YvjoZDy5NhfTmuOQuUGKMPsEqt4V4BBs+pIF9yUHmaSSBxjwMWPpQm
	geRZKalVGvXKGTSWzKN89iNtE=
X-Google-Smtp-Source: AGHT+IH8+29tSR1S0/IiaNJh1lrEM8PuiOVw/h0tnubbhac5q1RS43jKn+3nklQM20gTocpV8ZXs4Q==
X-Received: by 2002:a17:902:ebca:b0:295:3f35:a312 with SMTP id d9443c01a7336-29baaf9595cmr84853775ad.20.1764190156267;
        Wed, 26 Nov 2025 12:49:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 1/9] exiv2: add ptest support
Date: Thu, 27 Nov 2025 09:48:38 +1300
Message-ID: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122083

From: Gyorgy Sarvari <skandigraun@gmail.com>

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
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...1-Allow-test-data-path-configuration.patch | 30 ++++++++++++++++
 .../0001-Use-automake-output-for-tests.patch  | 35 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2/run-ptest |  6 ++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb | 31 ++++++++++++++--
 5 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-automake-output-for-tests.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index ea336f1058..0473b60504 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_OE = "\
     cmocka \
     cunit \
     duktape \
+    exiv2 \
     fuse3 \
     function2 \
     fwupd \
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
new file mode 100644
index 0000000000..a5345733fb
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
+@@ -42,7 +42,7 @@ add_executable(unit_tests
+ target_compile_definitions(unit_tests
+   PRIVATE
+     exiv2lib_STATIC
+-    TESTDATA_PATH="${PROJECT_SOURCE_DIR}/test/data"
++    TESTDATA_PATH="${TEST_FOLDER}/test/data"
+ )
+ 
+ target_link_libraries(unit_tests
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Use-automake-output-for-tests.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-automake-output-for-tests.patch
new file mode 100644
index 0000000000..6514ac07a3
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-automake-output-for-tests.patch
@@ -0,0 +1,35 @@
+From 09e5f783b3d1dcb7db6e975e9662c8401a614539 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 23 Nov 2025 11:35:50 +0100
+Subject: [PATCH] Use automake output for tests
+
+Convert the Python unittest output to automake output so ptest can
+ingest it.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/runner.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/runner.py b/tests/runner.py
+index adebf83ba..9800cf971 100755
+--- a/tests/runner.py
++++ b/tests/runner.py
+@@ -4,6 +4,7 @@
+ import argparse
+ import functools
+ import os
++import putao.unittest
+ import sys
+ import unittest
+ from fnmatch import fnmatchcase
+@@ -93,7 +94,7 @@ if __name__ == '__main__':
+             DEFAULT_ROOT
+         )
+ 
+-    test_res = unittest.runner.TextTestRunner(verbosity=args.verbose)\
++    test_res = putao.unittest.TestRunner()\
+                               .run(discovered_tests)
+ 
+     sys.exit(0 if len(test_res.failures) + len(test_res.errors) == 0 else 1)
diff --git a/meta-oe/recipes-support/exiv2/exiv2/run-ptest b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
new file mode 100644
index 0000000000..6c50a12fc1
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+cd tests
+python3 ./runner.py
+
+cd ..
+./build/bin/unit_tests --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
index e1f57ae8c7..82ee232fdc 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
@@ -4,7 +4,34 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat brotli libinih"
 
-SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV}"
+SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV} \
+           file://run-ptest \
+           file://0001-Use-automake-output-for-tests.patch \
+           file://0001-Allow-test-data-path-configuration.patch \
+           "
 SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
 
-inherit cmake gettext
+inherit cmake gettext ptest
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'test unittest', '', d)}"
+PACKAGECONFIG[test] = "-DEXIV2_BUILD_SAMPLES=ON -DEXIV2_ENABLE_WEBREADY=ON"
+PACKAGECONFIG[unittest] = "-DEXIV2_BUILD_UNIT_TESTS=ON -DTEST_FOLDER=${PTEST_PATH},,googletest"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-html \
+    python3-lxml \
+    python3-multiprocessing \
+    python3-shell \
+    python3-unittest \
+    python3-unittest-automake-output"
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

