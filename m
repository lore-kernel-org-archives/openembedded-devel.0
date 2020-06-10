Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10460.1591794954413998689
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0a9-0005hT-Bi; Wed, 10 Jun 2020 16:15:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-markupsafe: Consolidate in a single file
Date: Wed, 10 Jun 2020 16:15:32 +0300
Message-Id: <20200610131536.31426-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
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
 .../python/python-markupsafe.inc              | 27 -----------------
 .../python/python3-markupsafe_1.1.1.bb        | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-markupsafe.inc

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
deleted file mode 100644
index 480876268..000000000
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
-HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
-
-SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
-SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
-
-PYPI_PACKAGE = "MarkupSafe"
-inherit pypi ptest
-
-RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
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
-	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
index 765e3c906..7de57cbd6 100644
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
@@ -1,2 +1,27 @@
-inherit setuptools3
-require python-markupsafe.inc
+DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
+HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+
+SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
+SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
+
+PYPI_PACKAGE = "MarkupSafe"
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
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
+	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

