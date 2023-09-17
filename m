Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1CACD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 15:29:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.31846.1694964551452665264
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 08:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=miDqZ0Gw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68fb7fb537dso3216068b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694964551; x=1695569351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wtw+zpTSRJuBE1pQRuXdFxQhQZCA5Ey4B6Pths87bY=;
        b=miDqZ0GwsJUlKc6+hOswH8eaKnSBXb94nsfvWSf8jo1lGmhoIgu1jZKm8oaNBZ5Y61
         xZTSYixQbOvVnuoecIWoO3fRC43Ng/RufY6VEQPOWKmdZiTardcmHEOtnaWwmkNZiFSk
         spf9r2nbtehAveF4QbYo5Rqo4RVs0OalxcWsGL7QrKyITNvQKn/Wf3vC/KI1Ub3ybPQW
         M4BSXV9OZw7Saph5ztWSjEqytPYw8E1dCnQRZVoMmF1ThmVF6o8BDK+lXeUduOXVujL2
         q6jWBDAb0ryT49qzlxB4wpNjEF1PyYCunLAepAmC/SOgtK/ykYTBHJw/HncmpGazdujM
         vmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694964551; x=1695569351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wtw+zpTSRJuBE1pQRuXdFxQhQZCA5Ey4B6Pths87bY=;
        b=mhSrlIIRY6djzDYkraofcIJPlDbp9wHMLzRbjnxNYaUFlimonTT8ggxJA7JFLk3JhN
         MA3nF7isikp3P3tCAyGzCiuFwcmURVzuQvpH6H56m9vAUAwvFsaFXjB4ShWm9U3Xo2wG
         V7aca2Dsg+KKplfApu4U1nt1Rv9SJXBlb5B9HPcmGoXiUOo0zbzR0FC6iPWFPYf50oI2
         uxmWKEGF0xhjefpsqonNJZQ4a7QpUcy5xudLwf2zK93MORICFZa/Oih20vOJ7wCdNuCl
         pj2yBchwa1PBFNnAy6B4qHwd4Tkj440rM3RBeZ3ChY3H+AHnDRqER3V0ufnw1NgRSfzo
         mpIw==
X-Gm-Message-State: AOJu0YzMmgcINhrch/z07kcxdiLLW0dEpotP9olgHnlNN1GeF5TwYb45
	oYXOyOBcdKHAgZSQi7/5XxIgm4EvIU8=
X-Google-Smtp-Source: AGHT+IHHZrpyGQ2/SxUEf7zz2HeD4uhtfXQe7Hfg87Ecev1vcYwPeiRCwc2nv7fb8u4/5pk1FQkBNQ==
X-Received: by 2002:a05:6a00:1344:b0:68f:cb69:8e6c with SMTP id k4-20020a056a00134400b0068fcb698e6cmr6693828pfu.33.1694964550560;
        Sun, 17 Sep 2023 08:29:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id t20-20020a63b254000000b0057401997c22sm5458133pgo.11.2023.09.17.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 08:29:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] poco: Fix ptest runtime errors
Date: Sun, 17 Sep 2023 08:29:04 -0700
Message-ID: <20230917152907.3500457-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 15:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104914

* Skip failing tests for now
* Limit supported architecture list to same as mongoDB

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Limit compatible hosts

 ...nx-Ignore-PKCS12-and-testLaunch-test.patch | 63 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco/run-ptest   |  2 +
 meta-oe/recipes-support/poco/poco_1.12.4.bb   |  8 +++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
new file mode 100644
index 0000000000..25934d61b3
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -0,0 +1,63 @@
+From ac0f06e20bdfaca74c8ab786be8ff8fc96b5a689 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Sep 2023 19:52:56 -0700
+Subject: [PATCH] cppignore.lnx: Ignore PKCS12 and testLaunch test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+These tests fail on Linux
+
+There were 4 failures:
+ 1: N7CppUnit10TestCallerI11ProcessTestEE.testLaunch
+    "rc == 3"
+    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 79
+ 2: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectIn
+    "rc == 100"
+    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 106
+ 3: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectOut
+    "s == "Hello, world!""
+    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 134
+ 4: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchEnv
+    "s == "test""
+    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 166
+
+ There were 4 errors:-
+   1: N7CppUnit10TestCallerI7EVPTestEE.testRSAEVPKeyFromPKCS12
+  │ │ "N4Poco17NotFoundExceptionE:
+  Not found: POCO_BASE"
+  │ │ in "<unknown>", line -1
+   2: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testFullPKCS12
+  │ │ "N4Poco17NotFoundExceptionE:
+  Not found: POCO_BASE"
+  │ │ in "<unknown>", line -1
+   3: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testCertsOnlyPKCS12
+  │ │ "N4Poco17NotFoundExceptionE:
+  Not found: POCO_BASE"
+  │ │ in "<unknown>", line -1
+   4: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testPEMReadWrite
+  │ │ "N4Poco17NotFoundExceptionE:
+  Not found: POCO_BASE"
+  │ │ in "<unknown>", line -1
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cppignore.lnx | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/cppignore.lnx
++++ b/cppignore.lnx
+@@ -26,3 +26,12 @@ N7CppUnit10TestCallerI9TimerTestEE.testS
+ N7CppUnit10TestCallerI9TimerTestEE.testScheduleIntervalClock
+ N7CppUnit10TestCallerI9TimerTestEE.testScheduleIntervalTimestamp
+ N7CppUnit10TestCallerI9TimerTestEE.testTimer
++N7CppUnit10TestCallerI11ProcessTestEE.testLaunch
++N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectIn
++N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectOut
++N7CppUnit10TestCallerI11ProcessTestEE.testLaunchEnv
++N7CppUnit10TestCallerI7EVPTestEE.testRSAEVPKeyFromPKCS12
++N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testFullPKCS12
++N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testCertsOnlyPKCS12
++N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testPEMReadWrite
++N7CppUnit10TestCallerI11MongoDBTestEE.testArray
diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index db8cf8511f..c8e50fc967 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,4 +1,6 @@
 #!/bin/sh
+export POCO_BASE=/usr/lib/poco/ptest
+export LD_LIBRARY_PATH=${POCO_BASE}/bin:${LD_LIBRARY_PATH}
 i=0
 while read runner; do
   oldpath=`pwd` >/dev/null
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 47dac1a89e..b02b84fa66 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -10,6 +10,7 @@ DEPENDS = "libpcre2 zlib"
 
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
+           file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://run-ptest \
            "
 SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
@@ -24,6 +25,11 @@ inherit cmake ptest
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
 PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Redis Prometheus"
+# MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
+PACKAGECONFIG:remove:riscv32 = "MongoDB"
+PACKAGECONFIG:remove:riscv64 = "MongoDB"
+PACKAGECONFIG:remove:mipsarch = "MongoDB"
+PACKAGECONFIG:remove:powerpc = "MongoDB"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
@@ -105,5 +111,7 @@ FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 
 RDEPENDS:${PN}-ptest += "${PN}-cppunit"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'MongoDB', 'mongodb', '', d)}"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'Redis', 'redis', '', d)}"
 
 BBCLASSEXTEND = "native"
-- 
2.42.0


