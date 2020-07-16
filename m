Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.11026.1594887404007568901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 01:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427978"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:16:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B11E4CE2808
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 16:16:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:16:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-soupsieve: Enable ptest
Date: Fri, 17 Jul 2020 03:43:19 +0800
Message-ID: <1594928600-4618-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5B11E4CE2808.A16F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-soupsieve/run-ptest           |  3 +++
 .../python/python3-soupsieve_2.0.1.bb            | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
index aa087c9200..ae242af562 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
@@ -7,6 +7,20 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
 SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
 SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-beautifulsoup4 \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



