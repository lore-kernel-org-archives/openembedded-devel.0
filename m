Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.726.1586565554166311534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 17:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,368,1580745600"; 
   d="scan'208";a="88837621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Apr 2020 08:39:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 08BC7406AB15
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2020 08:28:45 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 11 Apr 2020 08:39:12 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sat, 11 Apr 2020 08:39:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyroute2: Enable ptest
Date: Sat, 11 Apr 2020 08:42:03 +0800
Message-ID: <20200411004205.23402-3-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411004205.23402-1-zangrc.fnst@cn.fujitsu.com>
References: <20200411004205.23402-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 08BC7406AB15.AD588
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-pyroute2/run-ptest            |  3 +++
 .../python/python3-pyroute2_0.5.11.bb            | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyroute2/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
index 58b538a45..a4b8aa398 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI[md5sum] = "7005db01604663fc2ecc089925980e05"
 SRC_URI[sha256sum] = "05e959f1a89d715158b91fe83b67946a4441e5e098cc225f4df78a3765ac4af2"
 
-inherit setuptools3 pypi
+inherit setuptools3 pypi ptest
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ctypes \
@@ -21,3 +21,17 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-unixadmin \
 "
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-fcntl \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.20.1



