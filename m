Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611A3CCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 18:51:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.11147.1760813516529458007
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 11:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TLuYi/2k;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1680802f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760813515; x=1761418315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FIc0LFinksJ55oQlSpAcnXH81Sk8lJ6lum3ww9D6rl8=;
        b=TLuYi/2kx7pNuCjdt1FjYVvReZXBVc4BAJZirYEAogzrXlga+gUjod0tDH7NhQJH0N
         WzDwnU9chl+ByVm3n6DCm8wmiVrz6X4EM3MP0OPt5HK34x3brDaCLvi1zVX59/DE3SU0
         36lSlRjA1tGYVvOVrE6ITxhYC+m3EbuC+WRpkZyzM5uqVjp/v6wR2sjMnzYGFPcQSvPH
         jZMAi33ZyG83JVz1EEcAguJKbuwxE8k+9um6FE5CafItN24USb/58I8FgzRSg9YOOfMy
         j99MuiAy1M/mOojuDeJRFYLwR71zdxR5lN0/bHLWadJzeV4/W/E5TDAZ6fdUm65yOi0q
         rFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760813515; x=1761418315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIc0LFinksJ55oQlSpAcnXH81Sk8lJ6lum3ww9D6rl8=;
        b=ulQNBCKGwOA2qUJ/QokAeKie0mMbS8cQySpePmU0Ei4WZLg863b7jittBQWrAC0Tya
         Dao/W/wjePHdu5EZngz8ij5m5QV0KuloGnFwpUnzRwiRrr9yHWkWDHN6yCArpQRZa2v8
         O7M6NLu572kGFtcZLzayib3zKJIvFAcsn9/PwbZvaC5IyNeBs9QzdqOXcaEdAIIjULmY
         vkx9F59S9bp3vmzDUlcc92NvdtLErl/W5yH3EfI/BCu/LTDVXoM5CK37kMSP/K7wW0DW
         NUIpSp4n4dOfHuaj4kEvyDiQNhqz4L7m96IAo7XqIIoTLZeI/BDYWqmGR/q3GLTHfQih
         AIPg==
X-Gm-Message-State: AOJu0YzIaJA5sNo+bhIxbWV6/+9ExX9n2GQEzfE2R49Y1OHXA2vEVDh2
	SI7nOQk80OhIBEKmNguA+zgu54qz+B0c/7yaeEwkT7zq7VQudwlZm8Iy3EGfqQ==
X-Gm-Gg: ASbGncvxXWzc4bE8DMZNC09rKzsIu210s5gBdxTqxasa1L6SP0z1XPoWG07BOwGxQgH
	6Hh/UckOz4evFDFvPdEsaS3O93VyPkPE3cL4IH79+PNfrz+7WZUEhVd5rFkj9kXw3bQsW1HmKOk
	CYCqfcmbTS7JBunRyzP2mHCa9GE3Cc7T48qfv451nMoUpPSq3zVkbai6GDaYjAjQ9nIZTrDYcEY
	ir/JaInWoKaoNzgnZ3sEMsDnZUlB9622RXqO/cbmZJDXqi8XWlfG7xZorlP6DUs5eVVoygP65gQ
	2HGMTBjF8I91EW6ElakkF21SYVlF5HnJhxoWI7BPba4415AQdOpBOPPOUyJARKm2QjSzb3pOIYO
	donKRdneR3sc7jvWwzKPO1aY1HdkcSTtVQ5NmBjyfnNSyHzjsKbyZkSseY+VtEbU+j6VEZDyuUw
	==
X-Google-Smtp-Source: AGHT+IHvzeaX6x5JVL/f0/Qab1hT/REWYzvoGe1pCkiJFrjaBRff/gV3dVCoD6edkYuGo/XNe8tNwg==
X-Received: by 2002:a05:6000:26d1:b0:3ec:de3c:c56 with SMTP id ffacd0b85a97d-42704d52397mr5942653f8f.16.1760813514455;
        Sat, 18 Oct 2025 11:51:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3affsm6342428f8f.12.2025.10.18.11.51.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 11:51:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] poco: fix some ptests
Date: Sat, 18 Oct 2025 20:51:50 +0200
Message-ID: <20251018185152.1642387-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 18:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120788

Remove a number of ignored tests from the ignore-list. They were missing
some files that weren't installed - after installing them, they pass.

The remaining mongodb test on the list hasn't been tested.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...nx-Ignore-PKCS12-and-testLaunch-test.patch | 53 ++-----------------
 meta-oe/recipes-support/poco/poco_1.14.2.bb   |  5 +-
 2 files changed, 9 insertions(+), 49 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index 1d4eb9b831..8575797e89 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -8,48 +8,14 @@ Content-Transfer-Encoding: 8bit
 
 These tests fail on Linux
 
-There were 4 failures:
- 1: N7CppUnit10TestCallerI11ProcessTestEE.testLaunch
-    "rc == 3"
-    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 79
- 2: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectIn
-    "rc == 100"
-    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 106
- 3: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchRedirectOut
-    "s == "Hello, world!""
-    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 134
- 4: N7CppUnit10TestCallerI11ProcessTestEE.testLaunchEnv
-    "s == "test""
-    in "/usr/src/debug/poco/1.12.4-r0/Foundation/testsuite/src/ProcessTest.cpp", line 166
-
- There were 4 errors:-
-   1: N7CppUnit10TestCallerI7EVPTestEE.testRSAEVPKeyFromPKCS12
-  │ │ "N4Poco17NotFoundExceptionE:
-  Not found: POCO_BASE"
-  │ │ in "<unknown>", line -1
-   2: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testFullPKCS12
-  │ │ "N4Poco17NotFoundExceptionE:
-  Not found: POCO_BASE"
-  │ │ in "<unknown>", line -1
-   3: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testCertsOnlyPKCS12
-  │ │ "N4Poco17NotFoundExceptionE:
-  Not found: POCO_BASE"
-  │ │ in "<unknown>", line -1
-   4: N7CppUnit10TestCallerI19PKCS12ContainerTestEE.testPEMReadWrite
-  │ │ "N4Poco17NotFoundExceptionE:
-  Not found: POCO_BASE"
-  │ │ in "<unknown>", line -1
-
-There was 1 error:
- 1: CppUnit::TestCaller<ProcessRunnerTest>.testProcessRunner
-    "Poco::TimeoutException:
-Timeout: ProcessRunner::checkTimeout(): waiting for PID file"
-    in "<unknown>", line -1
-
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+Updated comment and content after fixing some tests.
+Left only MongoDBTest.testArray on ignore list, untested.
+
 ---
  cppignore.lnx | 9 +++++++++
  1 file changed, 9 insertions(+)
@@ -58,17 +24,8 @@ diff --git a/cppignore.lnx b/cppignore.lnx
 index b3288d474..9aad48ca5 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -30,3 +30,13 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+@@ -30,3 +30,4 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
  CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
  CppUnit::TestCaller<DNSTest>.testHostByAddress
  CppUnit::TestCaller<DNSTest>.testHostByName
-+CppUnit::TestCaller<ProcessTest>.testLaunch
-+CppUnit::TestCaller<ProcessTest>.testLaunchRedirectIn
-+CppUnit::TestCaller<ProcessTest>.testLaunchRedirectOut
-+CppUnit::TestCaller<ProcessTest>.testLaunchEnv
-+CppUnit::TestCaller<EVPTest>.testRSAEVPKeyFromPKCS12
-+CppUnit::TestCaller<PKCS12ContainerTest>.testFullPKCS12
-+CppUnit::TestCaller<PKCS12ContainerTest>.testCertsOnlyPKCS12
-+CppUnit::TestCaller<PKCS12ContainerTest>.testPEMReadWrite
 +CppUnit::TestCaller<MongoDBTest>.testArray
-+CppUnit::TestCaller<ProcessRunnerTest>.testProcessRunner
diff --git a/meta-oe/recipes-support/poco/poco_1.14.2.bb b/meta-oe/recipes-support/poco/poco_1.14.2.bb
index 9cdc9e325c..8f81fac77b 100644
--- a/meta-oe/recipes-support/poco/poco_1.14.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.14.2.bb
@@ -108,13 +108,15 @@ do_install_ptest () {
        if ${@bb.utils.contains('PACKAGECONFIG', 'DataPostgreSQL', 'true', 'false', d)}; then
             cp -f ${B}/lib/libPocoDataTest.so* ${D}${libdir}
        fi
-       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
+       cp -rf ${S}/*/testsuite/data ${D}${PTEST_PATH}/bin/
        find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
        rm -f ${D}${PTEST_PATH}/testrunners
        for f in ${D}${PTEST_PATH}/bin/*-testrunner; do
             echo `basename $f` >> ${D}${PTEST_PATH}/testrunners
        done
        install -Dm 0644 ${S}/cppignore.lnx ${D}${PTEST_PATH}/cppignore.lnx
+       install ${B}/bin/TestLibrary.so ${D}${libdir}
+       install -D ${B}/bin/TestApp ${D}${bindir}/TestApp
 }
 
 PACKAGES_DYNAMIC = "poco-.*"
@@ -128,6 +130,7 @@ FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 FILES:${PN}-datatest += "${libdir}/libPocoDataTest.so*"
 ALLOW_EMPTY:${PN}-datatest = "1"
+FILES:${PN}-ptest += "${bindir}/TestApp ${libdir}/TestLibrary.so"
 
 RDEPENDS:${PN}-ptest += "${PN}-cppunit ${PN}-datatest"
 RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'MongoDB', 'mongodb', '', d)}"

