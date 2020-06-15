Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9332.1592188697710294106
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 19:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94484107"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 10:38:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 76EF94CE26F0
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 10:38:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 10:38:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ipy: Enable ptest
Date: Mon, 15 Jun 2020 22:38:05 +0800
Message-ID: <1592231885-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 76EF94CE26F0.A5748
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-Consolidate into a single file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-ipy.inc    | 19 -----------
 .../python/python3-ipy/run-ptest              |  3 ++
 .../python/python3-ipy_1.00.bb                | 34 +++++++++++++++++--
 3 files changed, 35 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ipy.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-ipy.inc b/meta-python/recipes-devtools/python/python-ipy.inc
deleted file mode 100644
index 46b2fad03..000000000
--- a/meta-python/recipes-devtools/python/python-ipy.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
-DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
-in a fashion similar to perl's Net::IP and friends. The IP class allows \
-a comfortable parsing and handling for most notations in use for IPv4 \
-and IPv6 Addresses and Networks."
-SECTION = "devel/python"
-HOMEPAGE = "https://github.com/autocracy/python-ipy"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
-
-SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
-SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
-
-inherit pypi
-
-PYPI_PACKAGE = "IPy"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
index ea6a1055a..14931546e 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
@@ -1,2 +1,32 @@
-inherit setuptools3
-require python-ipy.inc
+SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
+DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
+in a fashion similar to perl's Net::IP and friends. The IP class allows \
+a comfortable parsing and handling for most notations in use for IPv4 \
+and IPv6 Addresses and Networks."
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/autocracy/python-ipy"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
+
+SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
+SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
+
+inherit pypi setuptools3 ptest
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
+	install -d ${D}${PTEST_PATH}/test/
+	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
+}
+
+PYPI_PACKAGE = "IPy"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1



