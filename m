Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5839.1593479883745291203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532004"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:18:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DE9B84CE4B1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:07:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:17:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-u-msgpack-python: Enable ptest
Date: Tue, 30 Jun 2020 09:17:32 +0800
Message-ID: <1593479853-4475-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DE9B84CE4B1D.A5BB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-u-msgpack-python/run-ptest      |  3 +++
 .../python/python3-u-msgpack-python_2.6.0.bb       | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
new file mode 100644
index 000000000..7110f6bc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO test_umsgpack.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
index 6d2e0e0c3..f3f321e18 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
@@ -5,7 +5,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
 
 SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+       ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+       cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
+}
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
-- 
2.17.1



