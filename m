Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.5985.1593479880313399479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95531991"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:17:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D6E94CE4B1B
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:07:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:17:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: Enable ptest
Date: Tue, 30 Jun 2020 09:17:30 +0800
Message-ID: <1593479853-4475-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4D6E94CE4B1B.A4D38
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-cbor2/run-ptest               |  3 +++
 .../python/python3-cbor2_5.1.0.bb                | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
index b42516b7d..812539941 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
@@ -6,7 +6,21 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+       ${PYTHON_PN}-pytest \
+       ${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+      install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
-- 
2.17.1



