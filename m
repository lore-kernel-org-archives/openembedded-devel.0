Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5221.1585791404085200891
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363245"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:36:43 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id BB22C406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:26:20 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:36:38 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:36:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-polyline: Enable ptest
Date: Thu, 2 Apr 2020 09:39:10 +0800
Message-ID: <20200402013910.2135-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BB22C406AB15.A89C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-polyline/run-ptest             |  3 +++
 .../python/python3-polyline_1.4.0.bb              | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-polyline/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-polyline/run-ptest b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb b/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
index 3b3e2071f..d81ee5445 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
@@ -6,8 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fbd13500cabd06dd751ba6b2be304c6"
 SRC_URI[md5sum] = "b97c57378605c4a856c437569f95a0cb"
 SRC_URI[sha256sum] = "7c7f89d09a09c7b6161bdbfb4fd304b186fc7a2060fa4f31cb3f61c646a5c074"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN} += "python3-six"
 
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
+	install -d ${D}${PTEST_PATH}/test
+	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
-- 
2.20.1



