Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.8885.1585955006633732546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id d63so7658565oig.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 16:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HL5JMirpWoDSlGuKoc4o+4tgbSzxadj3pdh0g/NmFP8=;
        b=iXPfkt0KTz7DxLnG9yz8FPzOQfsbXHoBmif7XwQuTqhI0ZjvCEu7va89wcS15VkM45
         5HRFmXAI8QRTktsX8Kx9Uc9OklDwIXG5vSeQuL5uFVG+fHksGT9K120s5iV/g3RfT35x
         9LermuwwwtR2snQxQUaImqil3AZ718iukKURfDBYxmp/gCzYX5MCUEYL957mv5HwzOSW
         ByvU0TPqfoNXnb7sNmnyMcVzj4SaSchrKZO82h4JschzSx3UPVX3mUBmRiAvGDDxo54H
         i0Y06PFg9yqxVKQtpMWQUMoUK3/CK9Vaqtx//vrFfT/CBI6weDTl+bRTozjbeREuT/BB
         8qNA==
X-Gm-Message-State: AGi0PuZ3DMsc+VdMwQ3X/2ntphPsgeGiA98CNpaqxaw/z/j00aclf+mt
	meYgNCulTJ/clW0xRNRzUR1Cc9guDE0=
X-Google-Smtp-Source: APiQypIn+PQvv75NXxJxcxsYuBQ2eXMBtZ3HbLvDDOF/VrfqN8YILil3LY5o3uO0C3Wq3q5beqvRjw==
X-Received: by 2002:aca:de84:: with SMTP id v126mr5188385oig.137.1585955005643;
        Fri, 03 Apr 2020 16:03:25 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id 68sm2464665oon.14.2020.04.03.16.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:03:25 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/5] python-whoosh: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 19:03:07 -0400
Message-Id: <20200403230311.29817-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-whoosh.inc | 40 ------------------
 .../python/python3-whoosh_2.7.4.bb            | 42 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-whoosh.inc

diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
deleted file mode 100644
index b059b8d38c..0000000000
--- a/meta-python/recipes-devtools/python/python-whoosh.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Fast, pure-Python full text indexing, search, and spell checking library."
-DESCRIPTION = "\
-Whoosh is a fast, featureful full-text indexing and searching library \
-implemented in pure Python. Programmers can use it to easily add search \
-functionality to their applications and websites. Every part of how \
-Whoosh works can be extended or replaced to meet your needs exactly."
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
-
-SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
-SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
-
-PYPI_PACKAGE = "Whoosh"
-PYPI_PACKAGE_EXT = "zip"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-inherit ptest
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-fcntl \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 5d8af303c7..3ae4f91e38 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -1,2 +1,40 @@
-inherit pypi setuptools3
-require python-whoosh.inc
+SUMMARY = "Fast, pure-Python full text indexing, search, and spell checking library."
+DESCRIPTION = "\
+Whoosh is a fast, featureful full-text indexing and searching library \
+implemented in pure Python. Programmers can use it to easily add search \
+functionality to their applications and websites. Every part of how \
+Whoosh works can be extended or replaced to meet your needs exactly."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
+
+SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
+SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
+
+PYPI_PACKAGE = "Whoosh"
+PYPI_PACKAGE_EXT = "zip"
+
+inherit ptest pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-fcntl \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

