Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3491.1591866585248490175
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJDT-0007qt-CZ; Thu, 11 Jun 2020 12:09:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-pluggy: Consolidate in a single file
Date: Thu, 11 Jun 2020 12:09:01 +0300
Message-Id: <20200611090904.29772-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-pluggy.inc | 27 -----------------
 .../python/python3-pluggy_0.13.1.bb           | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pluggy.inc

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
deleted file mode 100644
index 1198d5f74..000000000
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Plugin and hook calling mechanisms for python"
-HOMEPAGE = "https://github.com/pytest-dev/pluggy"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
-
-SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
-SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
-                   ${PYTHON_PN}-more-itertools \
-"
-
-inherit pypi ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testing
-	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
index 941e8e3d8..d3e0365ca 100644
--- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
@@ -1,2 +1,27 @@
-inherit setuptools3
-require python-pluggy.inc
+SUMMARY = "Plugin and hook calling mechanisms for python"
+HOMEPAGE = "https://github.com/pytest-dev/pluggy"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
+
+SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
+SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
+                   ${PYTHON_PN}-more-itertools \
+"
+
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/testing
+	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
+}
-- 
2.17.1

