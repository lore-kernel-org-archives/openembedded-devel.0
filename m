Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.1398.1587434478428938642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 19:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89315398"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 09:56:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9F11746B5FA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 09:45:20 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 09:55:53 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 09:55:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-jsonpointer: Enable ptest
Date: Tue, 21 Apr 2020 09:58:51 +0800
Message-ID: <20200421015855.7687-3-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9F11746B5FA1.A7EBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonpointer.inc | 14 +++++++++++++-
 .../python/python3-jsonpointer/run-ptest           |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
index b6e4836ef..3e41b70b8 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
-inherit pypi
+inherit pypi ptest
 
 SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
 SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
@@ -13,3 +13,15 @@ RDEPENDS_${PN} += " \
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
+	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+}
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest b/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
new file mode 100644
index 000000000..51e609f4b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 tests.py
-- 
2.20.1



