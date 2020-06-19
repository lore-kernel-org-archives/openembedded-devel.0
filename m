Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2148.1592554318426090950
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCMU-0007GG-J6; Fri, 19 Jun 2020 11:27:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-ptyprocess: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:11 +0300
Message-Id: <20200619081011.25051-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
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
 .../python/python-ptyprocess.inc              | 41 ------------------
 .../python/python3-ptyprocess_0.6.0.bb        | 43 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ptyprocess.inc

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
deleted file mode 100644
index a6dc21cf1..000000000
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Run a subprocess in a pseudo terminal"
-HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
-
-SRCNAME = "ptyprocess"
-
-SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
-SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
-"
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
-	${PYTHON_PN}-fcntl \
-	${PYTHON_PN}-terminal \
-	${PYTHON_PN}-resource \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
index bdcd0e253..87911e02e 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
@@ -1,2 +1,43 @@
-require python-ptyprocess.inc
+SUMMARY = "Run a subprocess in a pseudo terminal"
+HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
+
+SRCNAME = "ptyprocess"
+
+SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
+SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
+
 inherit pypi setuptools3
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-resource \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-fcntl \
+	${PYTHON_PN}-terminal \
+	${PYTHON_PN}-resource \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

