Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6951.1585903581984496547
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 01:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,339,1580745600"; 
   d="scan'208";a="88445835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Apr 2020 16:46:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7101E50A999E
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2020 16:36:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Apr 2020 16:46:19 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-precise-runner: Enable ptest
Date: Sat, 4 Apr 2020 01:46:15 +0800
Message-ID: <1585935975-41415-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7101E50A999E.A6E21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-precise-runner/run-ptest       |  3 +++
 .../python/python3-precise-runner_0.3.1.bb        | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-precise-runner/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-precise-runner/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
index 98b62d899..6155b7981 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -6,4 +6,17 @@ LIC_FILES_CHKSUM = "file://README.md;md5=2ad29e930f3107d52d2a55728bf62116"
 SRC_URI[md5sum] = "a2434be110444192e804f4dada0ccecf"
 SRC_URI[sha256sum] = "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
 
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
+	install -d ${D}${PTEST_PATH}/test
+	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
-- 
2.20.1



