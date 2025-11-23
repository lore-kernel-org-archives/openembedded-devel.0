Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA51CFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 11:09:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11708.1763896178084155872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 03:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKVt1OTN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477aa218f20so20946205e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 03:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763896176; x=1764500976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K3V21sqSvsSpOYYm5bRnSLBTDz3XH53RYy8Gw4hCa4Y=;
        b=LKVt1OTN5mB5UcmE2YSXlY0hrj/updQSlpqkrP+CdNPhRS+4edG/ppZPB5TFBCHmNh
         Y0YNCTv2oSDzpIBwNDcJkMGOaaCm1/fjYaEiBE5zUwxb9Zh05A62hjMpDIYy2ph36ov1
         ccf1vOKTrTiuvQYcz2LZbG91Pe+HOMBOc3x72i2YzFUp8fHB//4cXBfwpseJVGeTwvN2
         DyiwPSoWQN/HrLxRQeCx6NXiRqjn+RTJ2RzPlkpqFqPz4LzlhJAkF1bk2YB/CeCUW6YU
         zCoiXbscQjjYwxc984JhWnMenthxCEJwirHw0AlOWiijXPS4Ep/JkHSTTbmX2bJtBDU6
         EV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763896176; x=1764500976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3V21sqSvsSpOYYm5bRnSLBTDz3XH53RYy8Gw4hCa4Y=;
        b=naGVB2I3hs6Xd98hqj+C6X3RGGhgRNusssaBmbKYrSUzNUqWh25DA13HqYHxvB4PFt
         9/BhbzZ61DwHp7WhWhBcUrWPkC3LWU3uU6shLGmNx72LeYQznbtKbP8JH3tLEc9J2egq
         quiQMy74FEMgbibLGaBFkS3ejD/Dkfo4GX3cgYKMnyckupZpXFWKFn1zdyfOk0bWNk0U
         HJxkd2ALhoz6Z+tMJCr6GpgHr8LPJRZloumECIruqCEI61IPDhzVFCAOS4qtOUoaOUHT
         bhLqTFh4aM2aoUushnHRt3VHcVDjD1qrdDeLj11o9lV0zxdHohdhGjvKG0yd1Cfb39DH
         qgHQ==
X-Gm-Message-State: AOJu0Yx8tW2KTfRNNYD0k8hhJ94bhkFZrTYEzc0y8nLB+cye5ITEpPYQ
	jaVcFMK4P/5EVpU6wA5RINEVGTfmP+OlhcQmfgkxIoelThqaqMPkPg5QwOyOOCii
X-Gm-Gg: ASbGncsvs3GsvTsvcL0WM91iKKZtpySR4aqK3hV0BtveXr51vvXxuFlKz+CO4UEy8ny
	J8wLJkXIfMDZwJVfmXyesza9xkKaP78YIXxT3lT+0gTayQYUwiNvrfTMJ2RkHHUEXrdJ8cVkQXP
	XEaJMPG7NAWPyF6krPPj/PjtJLEd5qrUwTuQemJQzPvDYoay6qNLN4FovLwgzG251+9sMycOgxJ
	ax3TX1nIdNPRBeeu9gCGC7rZxFMYxXzgZF6ksM6k6KDVacu67QOW4GPd6mJE+/YmzyplPzIebfd
	RUorlGvHkHoKnpL0zi8wikBfW3+Q/pOdNUTWA2+t28mxrj0BLKaDL6J67NhZ4yKBrRu8UOhgcGq
	fX1/GTBgrEWSKtjfCeRG5UfhhZEF+CylzpehRaiPj5iTZpIr6ITpSANZ/Mq/12wDHbgGydr2nZR
	XIvJ4ByuiHdsQ1bUKXydY=
X-Google-Smtp-Source: AGHT+IGEyekk01UOMVh7ltBbtXxsJ8kJSmHAvC420humuEhmIe0KYvtycCyCIC5XcdWpFyKoKUHEgg==
X-Received: by 2002:a05:600c:840f:b0:477:952d:fc00 with SMTP id 5b1f17b1804b1-477c0176752mr92763305e9.12.1763896176343;
        Sun, 23 Nov 2025 03:09:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4fafsm141817355e9.14.2025.11.23.03.09.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 03:09:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] exiv2: add ptest support
Date: Sun, 23 Nov 2025 12:09:35 +0100
Message-ID: <20251123110935.151829-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121992

The project has extensive runtime- and unittest suite - make use of it.

It takes around 10 seconds to run both suites.

Added two patches:
One is needed to convert python unittest output into automake output.

The other is required to be able to configure test data folder at
compile time - otherwise the tests are looking for the test-data
with absolute paths from the build machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index 25db9fe5cc..bf3f92057f 100644
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

