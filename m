Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3518.1591866567776169741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJDB-0007qt-Ra; Thu, 11 Jun 2020 12:09:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-pint: Consolidate in a single file
Date: Thu, 11 Jun 2020 12:08:59 +0300
Message-Id: <20200611090904.29772-2-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-pint.inc   | 30 -----------------
 .../python/python3-pint_0.11.bb               | 32 +++++++++++++++++--
 2 files changed, 30 insertions(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pint.inc

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
deleted file mode 100644
index 5c3481008..000000000
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Interval arithmetic for Python"
-HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
-SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
-
-PYPI_PACKAGE := "Pint"
-
-inherit pypi ptest
-
-SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
-SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
-
-DEPENDS += "python3-setuptools-scm-native"
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
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
index f793ac4ac..d37da7c6a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
@@ -1,2 +1,30 @@
-inherit setuptools3
-require python-pint.inc
+DESCRIPTION = "Interval arithmetic for Python"
+HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
+
+PYPI_PACKAGE := "Pint"
+
+inherit pypi ptest setuptools3
+
+SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
+SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
+
+DEPENDS += "python3-setuptools-scm-native"
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
+	install -d ${D}${PTEST_PATH}/testsuite
+	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
+}
-- 
2.17.1

