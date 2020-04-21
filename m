Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.3540.1587448418129585285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89329955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 13:28:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2106746B5FAF
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 13:17:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 13:28:22 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-jsmin: Enable ptest
Date: Tue, 21 Apr 2020 22:12:33 +0800
Message-ID: <1587478353-109692-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2106746B5FAF.A737C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-jsmin/run-ptest                 |  3 +++
 .../recipes-devtools/python/python3-jsmin_2.2.2.bb | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsmin/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
new file mode 100644
index 000000000..cbcfffda5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 test.py
diff --git a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb b/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
index ab657e6f0..9b7a82408 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
@@ -4,8 +4,20 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
 
-inherit setuptools3 pypi
+inherit setuptools3 pypi ptest
 SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
 SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
 
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
+	cp -f ${S}/jsmin/test.py ${D}${PTEST_PATH}/
+}
-- 
2.20.1



