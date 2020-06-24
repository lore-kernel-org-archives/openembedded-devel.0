Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15906.1593011822760545300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo795-00035d-1x; Wed, 24 Jun 2020 18:17:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-license-expression: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:26 +0300
Message-Id: <20200624151628.547-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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
 .../python/python-license-expression.inc      | 29 -----------------
 .../python/python3-license-expression_1.0.bb  | 31 +++++++++++++++++--
 2 files changed, 29 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-license-expression.inc

diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
deleted file mode 100644
index add25810d..000000000
--- a/meta-python/recipes-devtools/python/python-license-expression.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
-HOMEPAGE = "https://github.com/nexB/license-expression"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
-
-SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
-SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
-
-inherit pypi ptest
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-booleanpy \
-    "
-
-BBCLASSEXTEND = "native nativesdk"
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
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
index 10a702ca4..b1c38e95d 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
@@ -1,2 +1,29 @@
-inherit setuptools3
-require python-license-expression.inc
+SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
+HOMEPAGE = "https://github.com/nexB/license-expression"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
+SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
+
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-booleanpy \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
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
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

