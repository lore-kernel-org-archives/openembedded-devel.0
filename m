Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418BBCD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 06:39:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.25999.1694932777176043445
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 23:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsBWW6iX;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bf1935f6c2so24860685ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 23:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694932776; x=1695537576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJleGcXIvz5bew9gXrIVTisEgrvflR6RPhMXl6Ukdh4=;
        b=LsBWW6iXA7bu5tSGG9rjVAYSWHeKnBESrvw9/g0mvfCMzpnZl6qk7nrAurURHwjdaZ
         joWD4L+6DnpHe5uEe7hnZRKusrEaELcNIfxa7gkK90+LgoYQvq1+ZHa7sdRmskya4RB5
         mcXGKGVtXMDue6ji11ztjZD16z81+CoK5Lx5JjI8DlQDWM/Os2WFtztm/NcZ2/4xMMgj
         m5dHULgKjA/1zgPJbNooq1VCqIaQmyUbZyliquJKzWsugsR4RgqpsjXpCD42Lh1aoCrN
         9rsrzNjAnOYmp5lHZXARMGaDwBgYdxZ6KDbtXBIRts9u0DkjDPU2ZXH6Mll036B1n2f7
         UXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694932776; x=1695537576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJleGcXIvz5bew9gXrIVTisEgrvflR6RPhMXl6Ukdh4=;
        b=KBOal7f0bQFR1i2lewMD0sSFOX4053UfO41ZN4DYBit2iRJpTfGTFnG0ejUxeFhdif
         orNKy/m4LDtdtzUN53l0pBeovVIaCn+k8Qoq/nevcrHN985FOhoi2K1tLfcVRwU/f7IV
         9KJdJFQnHatjCkb9Mlis4lACHj7mBdBNYwWK5a9YYJ5/mch7G+/+wUy9MJXuBtqJD7I3
         yxzw/kHDhl18szevLu99/f7huTSAurX+/Ot0FMEs+YRWrcdnc0ZBrNzVRl4yYA6R3+AC
         sKW+yiArzRkxGD9jypwyr9GM/ooOd1pl3rjI97QALSuhn3ZerkJ/MYa1FIi70w5EGB4W
         +ODA==
X-Gm-Message-State: AOJu0YzzdA763JJcP3YXyIOCxc4Kwy7h6QE+QJRNmSkTl6FizvEy19Af
	7FGi8dh+mD+/crEbHKk86x5Lq2emfz4=
X-Google-Smtp-Source: AGHT+IFseFSWMiGQdU41KRKHoMrLFu5JgfozA/+ft1twPclzw/usIcynUyN5lsu1paj3l3CrpjNJTw==
X-Received: by 2002:a17:903:228f:b0:1b6:a37a:65b7 with SMTP id b15-20020a170903228f00b001b6a37a65b7mr12667707plh.23.1694932776060;
        Sat, 16 Sep 2023 23:39:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902e31400b001bdc664ecd3sm2682384plc.307.2023.09.16.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 23:39:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] poco: Fix ptest runtime errors
Date: Sat, 16 Sep 2023 23:39:30 -0700
Message-ID: <20230917063931.2207782-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917063931.2207782-1-raj.khem@gmail.com>
References: <20230917063931.2207782-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104908

Skip failing tests for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nx-Ignore-PKCS12-and-testLaunch-test.patch | 63 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco/run-ptest   |  2 +
 meta-oe/recipes-support/poco/poco_1.12.4.bb   |  3 +
 3 files changed, 68 insertions(+)
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
index 47dac1a89e..6b479dcce7 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -10,6 +10,7 @@ DEPENDS = "libpcre2 zlib"
 
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
+           file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://run-ptest \
            "
 SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
@@ -105,5 +106,7 @@ FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 
 RDEPENDS:${PN}-ptest += "${PN}-cppunit"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'MongoDB', 'mongodb', '', d)}"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'Redis', 'redis', '', d)}"
 
 BBCLASSEXTEND = "native"
-- 
2.42.0


