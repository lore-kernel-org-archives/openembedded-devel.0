Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3540.1587448418129585285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89330550"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 13:36:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C174B50A9984
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 13:25:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 13:36:26 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-multidict: Enable ptest
Date: Tue, 21 Apr 2020 13:36:49 +0800
Message-ID: <1587447409-109868-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C174B50A9984.A6EE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-multidict/run-ptest            |  3 +++
 .../python/python3-multidict_4.7.4.bb             | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-multidict/run-ptest b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
index f16a7be7a..0636972ec 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
@@ -3,7 +3,20 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 SRC_URI[md5sum] = "22b46f759cf2cc3ca1d2c9f82cc9bb79"
 SRC_URI[sha256sum] = "d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4"
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
-- 
2.20.1



