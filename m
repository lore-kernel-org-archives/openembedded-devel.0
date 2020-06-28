Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.24838.1593333937018893778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 01:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,291,1589212800"; 
   d="scan'208";a="95416196"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 16:45:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DC314CE49B5
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 16:35:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 16:45:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-atomicwrites: upgrade 1.3.0 -> 1.4.0
Date: Sun, 28 Jun 2020 16:45:17 +0800
Message-ID: <1593333924-4040-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6DC314CE49B5.A1E48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-Enable ptest.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-atomicwrites/run-ptest     |  3 +++
 .../python/python3-atomicwrites_1.3.0.bb      | 11 --------
 .../python/python3-atomicwrites_1.4.0.bb      | 25 +++++++++++++++++++
 3 files changed, 28 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
deleted file mode 100644
index e43bf0884..000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Powerful Python library for atomic file writes"
-HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
-
-SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
-SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} = "${PYTHON_PN}-misc"
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
new file mode 100644
index 000000000..7edd41030
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Powerful Python library for atomic file writes"
+HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
+
+SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
+SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN} = "${PYTHON_PN}-misc"
-- 
2.17.1



