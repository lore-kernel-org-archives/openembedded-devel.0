Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.6860.1585948927771787803
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id k18so7481314oib.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 14:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b8QOyCp4NfB6GIp2zE0DKJM7brmmamwBHW7DaZLpMFQ=;
        b=ulF8kGYRQq4LHnDzUmgG68X/QRR8Aoqe7hak1aVN0NJwY5iA5RpC1k4sTPRb07AH/H
         Vw1ILGN5OcaJU9Um0/ruTZGiqNHrENA50FsKRqQr4zLsFP51H+UkFrKGGILg7n7g7/U3
         aw/59wRL6sln+DVzJjyot+f2In5YlN28nqWdXa4t0z4v719HcXC4Vi+RFzLRxqsgBRTw
         vU8dG5qQD0r61ew0P7jc6Xti0K/T2/mR9BWM0+kGUOT3l268tWUsui1qOFZDkD1kx43M
         45lj3VJGjTCiM/wMcx2AjtFoQ14MQ/R2wN941DzVuWSJ6vERCxbVXMSXicUl8a/0XW2b
         D6QQ==
X-Gm-Message-State: AGi0PubU5zLkee9NGb8JGYx+fj0zXokld1eN4jCb7vWN+ix4DFiFVngY
	67Xb1yZ8ZEeodokXoizKMaTrQafyEJk=
X-Google-Smtp-Source: APiQypKODehSfxjt9hgTo7c2zGmebvOicX8WTcSvTAEcB4oLBVppaaoyQi5g2FW7w26mxtxvB/ETLw==
X-Received: by 2002:aca:39c3:: with SMTP id g186mr4774709oia.168.1585948926795;
        Fri, 03 Apr 2020 14:22:06 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id a76sm2344771oob.5.2020.04.03.14.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:22:06 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/10] python-yappi: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 17:21:15 -0400
Message-Id: <20200403212120.23481-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403212120.23481-1-derek@asterius.io>
References: <20200403212120.23481-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-yappi.inc  | 32 -----------------
 .../python/python3-yappi_1.0.bb               | 34 +++++++++++++++++--
 2 files changed, 32 insertions(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-yappi.inc

diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
deleted file mode 100644
index d6e9d4ed6d..0000000000
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY  = "Yet Another Python Profiler"
-HOMEPAGE = "http://yappi.googlecode.com/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
-
-SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
-SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-inherit pypi setuptools3 ptest
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-multiprocessing \
-	${PYTHON_PN}-profile \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-	cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
index 07da5b6ebd..75de4dfbe0 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
@@ -1,2 +1,32 @@
-require python-yappi.inc
-inherit setuptools3
+SUMMARY  = "Yet Another Python Profiler"
+HOMEPAGE = "http://yappi.googlecode.com/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
+
+SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
+SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-profile \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
+}
-- 
2.17.1

