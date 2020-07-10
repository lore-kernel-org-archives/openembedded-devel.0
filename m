Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2040.1594404997212468126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06AIGFM5014812
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:16:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 11:16:09 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 3F51B20208;
 Fri, 10 Jul 2020 14:16:09 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 4/4] python3-requests-toolbelt: add ptest
Date: Fri, 10 Jul 2020 14:15:55 -0400
Message-ID: <20200710181555.29809-5-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710181555.29809-1-sakib.sajal@windriver.com>
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python3-requests-toolbelt/run-ptest       |  3 +++
 .../python/python3-requests-toolbelt_0.9.1.bb | 22 +++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
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
index 3beb39718..cb1bc607b 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -5,12 +5,30 @@ AUTHOR = "Ian Cordasco, Cory Benfield"
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
+	${PYTHON_PN}-multiprocessing \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
+	# remove test test_multipart_encoder.py as it fails,
+	# downloaded file is not supported
+	rm -f ${D}${PTEST_PATH}/tests/test_multipart_encoder.py
+}
-- 
2.27.0

