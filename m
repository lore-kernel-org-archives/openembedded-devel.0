Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.44452.1585547656507394933
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; 
   d="scan'208";a="87872138"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:54:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D356C50A999A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 13:43:59 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:54:15 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 13:54:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-test-generator: Enable ptest
Date: Mon, 30 Mar 2020 13:56:45 +0800
Message-ID: <20200330055645.18477-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D356C50A999A.A91EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-test-generator/run-ptest      |  3 +++
 .../python/python3-test-generator_0.1.2.bb       | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
index 14943a4bd..a83ee5efc 100644
--- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
@@ -5,10 +5,24 @@ parsers that prevent any potentially malicious operation."
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
 
+SRC_URI += " \
+	file://run-ptest \
+"
+
 SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
 SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-mock \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 DEPENDS += "python3-nose-native"
 
-- 
2.20.1



