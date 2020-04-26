Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.7082.1587883687793507208
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 23:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2VBW6ye;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 18so7158444pfx.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 23:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5QWfZXRi2RN5vGtjlzRxI0jPGnQr2XMf4erVlEi3t0=;
        b=p2VBW6yerP/vBKrhb86i8WcgPE2Qbd4aNMcPdnV8FZePorFqZWwGKXX24a9xIskS/Z
         /0Jy9QyRDVU0y14co8oa4G/Pr8s2Cp1Ed1APPLVsCG1FJsc3j+WB4A0XTghKHKMjzBgz
         /sd2RUt/suRoeVNcU/+jWBcyPEFCxIUlumTphftqjr7XWZoQ3w/9IspVsNPCH84O7Fh/
         QGPjYnAelGFTy7JkZdYNPdQjiyfArCRsprxIIkisBZhDBYSewWTcY43BiTYpZ4A26T9Y
         2NBdrNfENm3IX3X+wvfprjwscokfK/Cvhi86f2AUbM3CM7y3EtErHmph9YyLj0ryn8y2
         z+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5QWfZXRi2RN5vGtjlzRxI0jPGnQr2XMf4erVlEi3t0=;
        b=SpwJKQ+BEMDIa7Wlseb/dfUW66rSrwWl9v0Vx1dlhvZDNZlr+SxdmVTmTq6pQnMC/p
         faIHTZxf9WF9IRq0+PfmYO9kZkEz2hQcMbjs+yU++Ew296+COqgRgYvjtBeTeuX4twKi
         M+KfPzmTKEG3G9s0Wgtt7IBpp054ggtPtDtoPg2KNqQFZHiLabRz9BpJbmITsUB6yYIh
         HH4yp4EefgAzRqcq8VOHGp63bApExD9w1t5OYLWMQwC8cm1DWuWvHiopCb800OZg9ENm
         qC0p7Obse5pMqi3JKMlHuWfiKUR1oZWDFrFcC9nNTma5PAKpFtJ0rYTcGgFaKlyk+1Js
         LASg==
X-Gm-Message-State: AGi0PuZ0Xuzkh3ZKXnlJzDuxjizYDl1cruquhoKl8R4EmZs2O7/nxv6P
	ddjwlkwQKYiLwFMJI7p2QBn+IabZ7sU=
X-Google-Smtp-Source: APiQypL0wForqxC/HP5drxTWD2v7ZXPSU02WoUqSnyX6owCsEXuJMGPe1F3Gxw09LMa5y0uC/IHJyg==
X-Received: by 2002:a63:555c:: with SMTP id f28mr259451pgm.80.1587883686861;
        Sat, 25 Apr 2020 23:48:06 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:b0b6:9555:1795:f958])
        by smtp.gmail.com with ESMTPSA id w2sm9390281pfc.194.2020.04.25.23.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 23:48:06 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-cryptography: merge bb and inc
Date: Sat, 25 Apr 2020 23:48:02 -0700
Message-Id: <20200426064803.31911-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Drop python-cryptography/ not used anywhere.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-cryptography.inc            | 58 ------------------
 .../python/python-cryptography/run-ptest      |  2 -
 .../python/python3-cryptography_2.8.bb        | 61 ++++++++++++++++++-
 3 files changed, 59 insertions(+), 62 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
deleted file mode 100644
index 5acd02d67d..0000000000
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "Provides cryptographic recipes and primitives to python developers"
-HOMEPAGE = "https://cryptography.io/"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
-
-LDSHARED += "-pthread"
-
-DEPENDS += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-six \
-"
-
-SRC_URI[md5sum] = "77730058b556c6d9838679a94c6229ce"
-SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-"
-
-RDEPENDS_${PN}-ptest += " \
-    ${PN} \
-    ${PYTHON_PN}-cryptography-vectors \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytz \
-"
-
-inherit ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-}
-
-FILES_${PN}-dbg += " \
-    ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cryptography/run-ptest b/meta-python/recipes-devtools/python/python-cryptography/run-ptest
deleted file mode 100644
index 0ba239c2a4..0000000000
--- a/meta-python/recipes-devtools/python/python-cryptography/run-ptest
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-py.test
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index 195923343b..c75dabb974 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -1,8 +1,65 @@
-inherit pypi setuptools3
-require python-cryptography.inc
+SUMMARY = "Provides cryptographic recipes and primitives to python developers"
+HOMEPAGE = "https://cryptography.io/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 LDSHARED += "-pthread"
 
+SRC_URI[md5sum] = "77730058b556c6d9838679a94c6229ce"
+SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
+
 SRC_URI += " \
     file://run-ptest \
 "
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-cffi-native \
+    ${PYTHON_PN}-asn1crypto \
+    ${PYTHON_PN}-six \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-asn1crypto \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+"
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-asn1crypto \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PN} \
+    ${PYTHON_PN}-cryptography-vectors \
+    ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytz \
+"
+
+inherit ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/hazmat
+    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
+}
+
+FILES_${PN}-dbg += " \
+    ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

