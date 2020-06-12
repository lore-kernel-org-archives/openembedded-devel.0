Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16570.1591955293598534972
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45372 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjgIF-0001HN-Nj; Fri, 12 Jun 2020 12:48:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-parse-type: Consolidate in a single file
Date: Fri, 12 Jun 2020 12:47:56 +0300
Message-Id: <20200612094757.22146-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612094757.22146-1-leon.anavi@konsulko.com>
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
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
 .../python/python-parse-type.inc              | 25 -----------------
 .../python/python3-parse-type_0.4.2.bb        | 27 +++++++++++++++++--
 2 files changed, 25 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc

diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
deleted file mode 100644
index 147ea6443..000000000
--- a/meta-python/recipes-devtools/python/python-parse-type.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Simplifies building parse types based on the parse module"
-HOMEPAGE = "https://github.com/jenisys/parse_type"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
-
-SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
-SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
-
-PYPI_PACKAGE = "parse_type"
-inherit pypi ptest
-
-RDEPENDS_${PN} += "${PYTHON_PN}-parse"
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
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
index 91d9ce2d4..a9e7a53ee 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
@@ -1,2 +1,25 @@
-inherit setuptools3
-require python-parse-type.inc
+SUMMARY = "Simplifies building parse types based on the parse module"
+HOMEPAGE = "https://github.com/jenisys/parse_type"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
+
+SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
+SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
+
+PYPI_PACKAGE = "parse_type"
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-parse"
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

