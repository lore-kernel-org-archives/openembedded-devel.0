Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5985.1593479880313399479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95531987"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:17:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E8BA4CE4B21
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:07:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:17:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-blinker: Enable ptest
Date: Tue, 30 Jun 2020 09:17:29 +0800
Message-ID: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2E8BA4CE4B21.A4123
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-blinker/run-ptest             |  3 +++
 .../python/python3-blinker_1.4.bb                | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-blinker/run-ptest b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
new file mode 100644
index 000000000..15c3f6282
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-blinker/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh 
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
index e2f76c33d..18544b900 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
@@ -5,4 +5,18 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
 SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
 SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-nose \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1



