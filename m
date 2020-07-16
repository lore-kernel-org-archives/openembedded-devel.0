Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.11026.1594887404007568901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427967"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:16:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 291D14CE5059
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 16:16:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:16:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-semver: Enable ptest
Date: Fri, 17 Jul 2020 03:43:17 +0800
Message-ID: <1594928600-4618-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 291D14CE5059.A39E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-semver/run-ptest                |  3 +++
 .../python/python3-semver_2.10.2.bb                | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-semver/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
new file mode 100644
index 0000000000..43c03b594b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-semver/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
index b41ef5ddc7..71cb1acec3 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
@@ -7,6 +7,18 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
 SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
 SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 BBCLASSEXTEND = "native nativesdk"
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
+        cp -f ${S}/test_semver.py ${D}${PTEST_PATH}/
+}
-- 
2.17.1



