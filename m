Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.3513.1591695130914069582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,491,1583164800"; 
   d="scan'208";a="94160366"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 17:32:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 63DF550A9975
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 17:32:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 17:32:08 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-inflection: upgrade 0.3.1 -> 0.5.0
Date: Wed, 10 Jun 2020 02:32:08 +0800
Message-ID: <1591727528-3402-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 63DF550A9975.A6C53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-Enable ptest.

-Consolidate into a single file.

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-inflection.inc              | 14 ----------
 .../python/python3-inflection/run-ptest       |  4 +++
 .../python/python3-inflection_0.3.1.bb        |  2 --
 .../python/python3-inflection_0.5.0.bb        | 27 +++++++++++++++++++
 4 files changed, 31 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-inflection.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-inflection/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-inflection.inc b/meta-python/recipes-devtools/python/python-inflection.inc
deleted file mode 100644
index 556b26820..000000000
--- a/meta-python/recipes-devtools/python/python-inflection.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A port of Ruby on Rails' inflection to Python."
-HOMEPAGE = "https://pypi.org/project/inflection"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de7833d9c2ce0052a4073928c76a13d7"
-
-SRC_URI[md5sum] = "7941165e9f148e0520023941c0886b40"
-SRC_URI[sha256sum] = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pytest"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-inflection/run-ptest b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
new file mode 100644
index 000000000..0caffb794
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO test_inflection.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
deleted file mode 100644
index cc36a02a7..000000000
--- a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-inflection.inc
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
new file mode 100644
index 000000000..0a3b7734c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A port of Ruby on Rails' inflection to Python."
+HOMEPAGE = "https://pypi.org/project/inflection"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
+
+SRC_URI[md5sum] = "87b2ab6ffdd6e15aa31d109ce5ff10bb"
+SRC_URI[sha256sum] = "f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI +=" \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}_ptest +=" \
+	${PYTHON_PN}_pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
+}
+
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pytest"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



