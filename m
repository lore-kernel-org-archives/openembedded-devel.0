Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B63CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:53:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.14298.1761771222850169927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYrLXkd1;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso2370915e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761771221; x=1762376021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaMN1CIVr5fEY9p8xPnaORsbgpXhiENL2Vrr+5z/syo=;
        b=OYrLXkd1TZk63QXNKI0vtS65lmdXiGO/TS1iY15j5uH0dAeNQB5SbsFrCtHT5qawou
         Bdwi/Hb/0FThRAOC+YZs8iCbMv12cFPqFy9tCbM1CTWPs2tXIkcBr67Kr/ptrk0KbYlv
         eZmoZ8LOrA5BKbzkAE1eMabiAL5lTg7Nn/kGyKpYF5PhcxYNqvIUXnbN/EWJjWC/0VIu
         MOR4f00cDVW2G5lsCTByTKll0MK5tgOS0XzwtDX1QTWYr3Q3FpEvoHKT2H7UtQJ5pjY5
         gq/CeP11FjEjsmOEiIuVxNWgzscnqt7RFEq9uMsypanB9T2JwL6Ehm7atesR8tUmrN1a
         zNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771221; x=1762376021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaMN1CIVr5fEY9p8xPnaORsbgpXhiENL2Vrr+5z/syo=;
        b=q0nYCzxroS1ojEdoGk7tUc7onnWHWrq+wiQP6Dbba1SoNCOQMtsfGRQQ6uRbmaPyF/
         pXNl8J8/odf/XHUR+z2YmHGZcloCQ+RZh6nk/+alyxipOvvxQwYjAYY2ltQg8g9kNklK
         c2U7TIMqiWES3OkbN6Nx4dVNaz3Q4lqs6A/rl5zOCtJ7S4Mhpkrf/xzDCjgXqNX49wiO
         d8y9iE61Khub7OudfaxWO4n9sIXVmPLCdLXPFssUZYP16o5QtDXiEtXPJ4XVONN8ufR1
         iMa5rCuJKF2IeVNl7HbH2/Ajhl1jqAuWprK4ijkr59MPgg/lI3ZhsBtOi7zAfW5fjwvw
         t4nA==
X-Gm-Message-State: AOJu0Yx8rKMYI3I7oQUqpCgvW6jXU35OgXOcJLXlcAn4qVy+bBX7MVAD
	34C/qGjyy1oCwlwSxkKkg92ElOSDSQmxLmQ/58LszcsBX9fw+K0aGcXTKbMl89wNExM=
X-Gm-Gg: ASbGncuU5krs/ZbqIAjRD0yGQ9ft5RUsF0jrTlEJ4RV+EGP8x3fSjTUMWm34/9hBYWs
	UYPB4Wy34fW0PVj3qIhnpSaTYuH0UlU48MDOIBEWfKtIDvDfPbm+J8xGdsJneKwsbqlao+ppt5M
	4nKc5/ItOznMmqWR+lxAF/AonjDDQYVD9QByqT34U9C7PelYx2sd24NbmVxNo0R5vH1tQ+OB9V6
	r/IDj8SNv40dwFs9a+caJDe6hZa9D4OLTFSW2YdqxLyu0YKdYNJA9xaxli3Kb4fXD6iHIc2MpXa
	MjGVAcUninHIC6PDoQiaoRG7F+EZhOE27CIXZkdfqARQ3r70ekC/MDAgr0rHcYhb6NsxtlQppAW
	zld/qGhSVlKQQMwhHOCEN9lfQxq79WiLdFn7hRdXOi95KWSVf+zPDji0yqF1995YR/IpptcnIiC
	0wIo6Ahy1n
X-Google-Smtp-Source: AGHT+IEfENoztuT/d/gYQDqQa+46vGOhdJKeE34BdZa3VkmHk7gYhyO3Qu7tKjV7HRBWx8gIOe4sAw==
X-Received: by 2002:a05:600c:37c6:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4771e180a28mr41541845e9.12.1761771221078;
        Wed, 29 Oct 2025 13:53:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772899fdfbsm2700825e9.4.2025.10.29.13.53.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:53:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] poco: fix ptests
Date: Wed, 29 Oct 2025 21:53:39 +0100
Message-ID: <20251029205339.3826693-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029205339.3826693-1-skandigraun@gmail.com>
References: <20251029205339.3826693-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 20:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121171

1. Add a patch to fix an incorrect and failing test
2. Add missing dependencies and test files
3. Enable network in run-ptest script by adding a nameserver
4. Start mongodb from run-ptest script, if it wouldn't be running.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-bit-IV-with-aes-256-gcm-to-fix-4347.patch | 26 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco/run-ptest   | 18 ++++++++++++-
 meta-oe/recipes-support/poco/poco_1.11.2.bb   | 17 +++++++-----
 3 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch b/meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch
new file mode 100644
index 0000000000..54d005d0c1
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch
@@ -0,0 +1,26 @@
+From aa202b4eedfef259718b74a66cf0abfe7b49bb6f Mon Sep 17 00:00:00 2001
+From: Matej Kenda <matejken@gmail.com>
+Date: Wed, 3 Jan 2024 20:13:57 +0100
+Subject: [PATCH] fix(test): Use 96-bit IV with aes-256-gcm to fix (#4347):
+
+I/O error: error:1C800066:Provider routines::cipher operation failed
+
+Upstream-Status: Backport [https://github.com/pocoproject/poco/commit/0f25b4c114f23c22681a981d8aed3464530fa6b1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Crypto/testsuite/src/CryptoTest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Crypto/testsuite/src/CryptoTest.cpp b/Crypto/testsuite/src/CryptoTest.cpp
+index d60f1988e..fd798e72b 100644
+--- a/Crypto/testsuite/src/CryptoTest.cpp
++++ b/Crypto/testsuite/src/CryptoTest.cpp
+@@ -214,7 +214,7 @@ void CryptoTest::testEncryptDecryptGCM()
+ {
+ 	CipherKey key("aes-256-gcm");
+ 
+-	CipherKey::ByteVec iv(20, 213);
++	CipherKey::ByteVec iv(12, 213);
+ 	key.setIV(iv);
+ 
+ 	Cipher::Ptr pCipher = CipherFactory::defaultFactory().createCipher(key);
diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index 521cc08a75..fc34e86389 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,8 +1,24 @@
 #!/bin/sh
+
+KILL_MONGODB=false
+
+if ! pidof mongod; then
+    /usr/bin/mongod --config /etc/mongod.conf &
+    KILL_MONGODB=true
+fi
+
+if ! nslookup example.com; then
+  mv /etc/resolv.conf /etc/resolv.conf.bak
+  echo "nameserver 8.8.8.8" > /etc/resolv.conf
+  trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
 while read runner; do
   oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
-  ./$runner -ignore $oldpath/cppignore.lnx -all
+  ./$runner -ignore $oldpath/cppignore.lnx -all && echo PASS: $runner || echo FAIL: $runner
   cd $oldpath >/dev/null
 done < testrunners
+
+[ "$KILL_MONGODB" = "true" ] && killall mongod
diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index 4711c6bb92..53ea13a480 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre zlib"
 
-SRC_URI = " \
-    git://github.com/pocoproject/poco.git;branch=main;protocol=https \
-    file://run-ptest \
-    file://CVE-2025-6375.patch \
-   "
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=main;protocol=https \
+           file://run-ptest \
+           file://CVE-2025-6375.patch \
+           file://0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch \
+           "
 SRCREV = "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
@@ -79,13 +79,15 @@ python populate_packages:prepend () {
 do_install_ptest () {
        cp -rf ${B}/bin/ ${D}${PTEST_PATH}
        cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
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
@@ -97,7 +99,8 @@ ALLOW_EMPTY:${PN} = "1"
 PACKAGES =+ "${PN}-cppunit"
 FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
+FILES:${PN}-ptest += "${bindir}/TestApp ${libdir}/TestLibrary.so"
 
-RDEPENDS:${PN}-ptest += "${PN}-cppunit"
+RDEPENDS:${PN}-ptest += "${PN}-cppunit redis mongodb"
 
 BBCLASSEXTEND = "native"

