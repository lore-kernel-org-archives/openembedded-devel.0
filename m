Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.11026.1594887404007568901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 01:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427966"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:16:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CCB94CE4BD9
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 16:16:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:16:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-requests-file: Enable ptest
Date: Fri, 17 Jul 2020 03:43:16 +0800
Message-ID: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0CCB94CE4BD9.A8853
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-requests-file/run-ptest        |  3 +++
 .../python/python3-requests-file_1.5.1.bb         | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-file/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
index 1c8bba40dd..88915b8fb4 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
@@ -6,7 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 SRC_URI[md5sum] = "c96daf6b0c56687556e8a52748fd896c"
 SRC_URI[sha256sum] = "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS_${PN} += " \
     python3-requests \
-- 
2.25.1



