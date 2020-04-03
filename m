Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6935.1585903516848468717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,339,1580745600"; 
   d="scan'208";a="88445762"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Apr 2020 16:45:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AD33349DF138
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2020 16:34:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Apr 2020 16:45:14 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pint: Enable ptest
Date: Sat, 4 Apr 2020 01:45:07 +0800
Message-ID: <1585935907-41366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AD33349DF138.A7BD1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pint.inc       | 15 ++++++++++++++-
 .../python/python3-pint/run-ptest                 |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pint/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
index c58dc9076..5c3481008 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 PYPI_PACKAGE := "Pint"
 
-inherit pypi
+inherit pypi ptest
 
 SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
 SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
@@ -15,3 +15,16 @@ SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359
 DEPENDS += "python3-setuptools-scm-native"
 
 BBCLASSEXTEND = "native nativesdk"
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
+	install -d ${D}${PTEST_PATH}/testsuite
+	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
+}
diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/meta-python/recipes-devtools/python/python3-pint/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1



