Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10463.1591794957500637295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0aC-0005hT-B8; Wed, 10 Jun 2020 16:15:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-more-itertools: Consolidate in a single file
Date: Wed, 10 Jun 2020 16:15:33 +0300
Message-Id: <20200610131536.31426-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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
 .../python/python-more-itertools.inc          | 21 -----------------
 .../python/python3-more-itertools_8.2.0.bb    | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools.inc

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
deleted file mode 100644
index 0b684c1b1..000000000
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "More routines for operating on iterables, beyond itertools"
-HOMEPAGE = "https://github.com/erikrose/more-itertools"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
-
-BBCLASSEXTEND = "native nativesdk"
-
-inherit ptest
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
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
index c3b34d364..1718fdf93 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
@@ -1,5 +1,24 @@
-inherit pypi setuptools3
-require python-more-itertools.inc
+DESCRIPTION = "More routines for operating on iterables, beyond itertools"
+HOMEPAGE = "https://github.com/erikrose/more-itertools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
 SRC_URI[md5sum] = "55e7e0a5eabc5a57bc8353c65c6f9965"
 SRC_URI[sha256sum] = "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
+
+inherit pypi setuptools3 ptest
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

