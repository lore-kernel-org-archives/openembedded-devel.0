Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.24838.1593333937018893778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 01:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,291,1589212800"; 
   d="scan'208";a="95416197"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 16:45:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 65D1049B10FE
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 16:34:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 16:45:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ansicolors: Enable ptest
Date: Sun, 28 Jun 2020 16:45:15 +0800
Message-ID: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 65D1049B10FE.A353E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-ansicolors/run-ptest            |  3 +++
 .../python/python3-ansicolors_1.1.8.bb             | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
new file mode 100644
index 000000000..7dc3ef32b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO test.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
index 9ba710cb7..a9ebebeef 100644
--- a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -7,6 +7,18 @@ SRC_URI[sha256sum] = "99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9
 
 PYPI_PACKAGE_EXT = "zip"
 
-inherit pypi setuptools3
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
+	cp -f ${S}/test/test.py ${D}${PTEST_PATH}/
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



