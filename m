Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.726.1586565554166311534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 17:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,368,1580745600"; 
   d="scan'208";a="88837615"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Apr 2020 08:39:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0EF7F50A999E
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2020 08:28:44 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 11 Apr 2020 08:39:11 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sat, 11 Apr 2020 08:39:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ptyprocess: Enable ptest
Date: Sat, 11 Apr 2020 08:42:02 +0800
Message-ID: <20200411004205.23402-2-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411004205.23402-1-zangrc.fnst@cn.fujitsu.com>
References: <20200411004205.23402-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0EF7F50A999E.AE695
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-ptyprocess.inc               | 18 ++++++++++++++++++
 .../python/python3-ptyprocess/run-ptest        |  3 +++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
index 49cc5a432..0cc911475 100644
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
+++ b/meta-python/recipes-devtools/python/python-ptyprocess.inc
@@ -18,3 +18,21 @@ RDEPENDS_${PN} = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-fcntl \
+	${PYTHON_PN}-terminal \
+	${PYTHON_PN}-resource \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
new file mode 100644
index 000000000..27c9e59c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh 
+
+pytest
-- 
2.20.1



