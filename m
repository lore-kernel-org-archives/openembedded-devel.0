Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.44493.1585547680247412826
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; 
   d="scan'208";a="87872153"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:54:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F087E406AB15
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 13:44:18 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:54:36 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 13:54:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ujson: Enable ptest
Date: Mon, 30 Mar 2020 13:57:04 +0800
Message-ID: <20200330055704.18537-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F087E406AB15.A8E06
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-ujson.inc      | 15 ++++++++++++++-
 .../python/python3-ujson/run-ptest                |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-ujson.inc b/meta-python/recipes-devtools/python/python-ujson.inc
index 018ddf418..3196b02f3 100644
--- a/meta-python/recipes-devtools/python/python-ujson.inc
+++ b/meta-python/recipes-devtools/python/python-ujson.inc
@@ -7,7 +7,20 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd7449
 SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
 SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
 
-inherit pypi
+inherit pypi ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytz \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
new file mode 100644
index 000000000..1b3914647
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 tests/tests.py
-- 
2.20.1



