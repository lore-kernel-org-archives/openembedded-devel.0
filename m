Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1791.1593791705805266804
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 08:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 063Ft40J004693
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Jul 2020 08:55:04 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Jul 2020
 08:55:03 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id A2FFF20131;
 Fri,  3 Jul 2020 11:55:02 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-python][PATCH] python3-betamax: add recipe
Date: Fri, 3 Jul 2020 11:54:51 -0400
Message-ID: <20200703155451.27829-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

betamax is required for enabling ptest
in python3-requests-toolbelt

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-betamax/run-ptest          |  3 +++
 .../python/python3-betamax_0.8.1.bb           | 23 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
new file mode 100644
index 000000000..ef654e917
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "VCR imitation for python requests"
+HOMEPAGE = "https://github.com/betamaxpy/betamax"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+SRC_URI[md5sum] = "b8182d43a200fc126a3bf7555626f964"
+SRC_URI[sha256sum] = "5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd050b71c2"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-requests \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.27.0

