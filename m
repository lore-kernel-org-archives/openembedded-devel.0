Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.44484.1585547630820327278
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; 
   d="scan'208";a="87872093"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:53:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A698250A999D
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 13:43:03 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:53:21 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 13:53:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-serpent: Enable ptest
Date: Mon, 30 Mar 2020 13:55:49 +0800
Message-ID: <20200330055549.18347-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A698250A999D.AA037
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-serpent.inc   | 16 +++++++++++++++-
 .../python/python3-serpent/run-ptest             |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-serpent/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 1a3aac07f..676ea39de 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -5,7 +5,21 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5cd70632b6cdb96df9ddaf6a4ce619e6"
 SRC_URI[md5sum] = "15ef8b67c76a6d19bac9c16731a1e62a"
 SRC_URI[sha256sum] = "f306336ca09aa38e526f3b03cab58eb7e45af09981267233167bcf3bfd6436ab"
 
-inherit pypi
+inherit pypi ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-pytz \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netclient \
diff --git a/meta-python/recipes-devtools/python/python3-serpent/run-ptest b/meta-python/recipes-devtools/python/python3-serpent/run-ptest
new file mode 100644
index 000000000..40c284799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-serpent/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest
-- 
2.20.1



