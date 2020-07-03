Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1741.1593791751967861723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 08:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 063FtUw6007575
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jul 2020 08:55:40 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Jul 2020
 08:55:20 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 9034C20131;
 Fri,  3 Jul 2020 11:55:19 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-python][PATCH] python3-requests-toolbelt: add ptest
Date: Fri, 3 Jul 2020 11:55:14 -0400
Message-ID: <20200703155514.39291-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-requests-toolbelt/run-ptest  |  3 +++
 .../python/python3-requests-toolbelt_0.9.1.bb   | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
index 3beb39718..e075c019d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -5,12 +5,25 @@ AUTHOR = "Ian Cordasco, Cory Benfield"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
 
+SRC_URI = "file://run-ptest \
+          "
+
 SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
 SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
 
-inherit setuptools3
-inherit pypi
+inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-requests (>=2.0.1) \
 "
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-betamax \
+	${PYTHON_PN}-mock \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.27.0

