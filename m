Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3398.1587447103313111359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89330119"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 13:30:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 007FF46B5FAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 13:19:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 13:30:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ordered-set: Enable ptest
Date: Tue, 21 Apr 2020 22:14:50 +0800
Message-ID: <1587478490-109748-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 007FF46B5FAC.A9C41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-ordered-set/run-ptest           |  3 +++
 .../python/python3-ordered-set_3.1.1.bb            | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ordered-set/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
new file mode 100644
index 000000000..f7b9d0907
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest test.py
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb b/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
index 013a2e755..d782e0109 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
@@ -6,6 +6,18 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
 SRC_URI[md5sum] = "6e12312c8dc4c90fe840e86e8a352644"
 SRC_URI[sha256sum] = "a7bfa858748c73b096e43db14eb23e2bc714a503f990c89fac8fab9b0ee79724"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 DEPENDS += "python3-pytest-runner-native"
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
+	cp -f ${S}/test.py ${D}${PTEST_PATH}/
+}
-- 
2.20.1



