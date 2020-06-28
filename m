Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.24839.1593333943343945335
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 01:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,291,1589212800"; 
   d="scan'208";a="95416201"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 16:45:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E1CE4CE49B8
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 16:35:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 16:45:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-backports-functools-lru-cache: Enable ptest
Date: Sun, 28 Jun 2020 16:45:18 +0800
Message-ID: <1593333924-4040-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0E1CE4CE49B8.A20CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../run-ptest                                     |  3 +++
 ...python3-backports-functools-lru-cache_1.6.1.bb | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
index c95a759ab..e967958c0 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
@@ -11,7 +11,20 @@ SRC_URI[sha256sum] = "8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
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
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-pickle \
-- 
2.17.1



