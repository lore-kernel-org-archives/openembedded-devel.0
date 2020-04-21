Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3535.1587447465975817195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89330601"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 13:37:16 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E4E5150A997C
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 13:26:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 13:37:12 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pytz: Enable ptest
Date: Tue, 21 Apr 2020 13:37:35 +0800
Message-ID: <1587447455-109912-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E4E5150A997C.A9F1A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-pytz/run-ptest              |  3 +++
 .../python/python3-pytz_2019.3.bb              | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytz/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pytz/run-ptest b/meta-python/recipes-devtools/python/python3-pytz/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytz/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
index ffe336d2c..cc75111c8 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pythonhosted.org/pytz"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
 SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
@@ -18,3 +18,19 @@ RDEPENDS_${PN}_class-target += "\
 "
 
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
+	install -d ${D}${PTEST_PATH}/pytz
+	install -d ${D}${PTEST_PATH}/pytz/tests
+	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
+	cp -f ${S}/README.txt ${D}${PTEST_PATH}/
+
+}
-- 
2.20.1



