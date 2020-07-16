Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.11059.1594887405802879071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 01:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427968"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:16:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F7FC4CE5442
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 16:16:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:16:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-smpplib: Enable ptest
Date: Fri, 17 Jul 2020 03:43:18 +0800
Message-ID: <1594928600-4618-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3F7FC4CE5442.A7058
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-smpplib/run-ptest            |  3 +++
 .../python/python3-smpplib_2.1.0.bb             | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
index 948af58aab..15b326bad4 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
@@ -6,4 +6,19 @@ LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
 PYPI_PACKAGE = "smpplib"
 SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-unittest \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	sed -i 's/mock/unittest.mock/g' ${D}${PTEST_PATH}/tests/*
+}
-- 
2.17.1



