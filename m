Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9321.1592188663372453691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 19:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94484074"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 10:37:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B5E9C4CE26F0
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 10:37:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 10:37:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-intervals: Enable ptest
Date: Mon, 15 Jun 2020 22:37:24 +0800
Message-ID: <1592231844-3955-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B5E9C4CE26F0.A5AE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-Consolidate into a single file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-intervals.inc               | 15 ----------
 .../python/python3-intervals/run-ptest        |  3 ++
 .../python/python3-intervals_1.10.0.bb        | 30 +++++++++++++++++--
 3 files changed, 31 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-intervals.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-intervals/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
deleted file mode 100644
index 4489aa59d..000000000
--- a/meta-python/recipes-devtools/python/python-intervals.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Interval arithmetic for Python"
-HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
-SECTION = "devel/python"
-
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
-
-PYPI_PACKAGE := "python-intervals"
-
-inherit pypi
-
-SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
-SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-intervals/run-ptest b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
new file mode 100644
index 000000000..357d8cb98
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO test_intervals.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index 8cbe1090f..2e8276ec7 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -1,2 +1,28 @@
-inherit setuptools3
-require python-intervals.inc
+DESCRIPTION = "Interval arithmetic for Python"
+HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
+SECTION = "devel/python"
+
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
+
+PYPI_PACKAGE := "python-intervals"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/test_intervals.py ${D}${PTEST_PATH}
+	cp -f ${S}/README.md ${D}${PTEST_PATH}
+}
+
+SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
+SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1



