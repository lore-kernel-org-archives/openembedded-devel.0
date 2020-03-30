Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.44442.1585547572057889616
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 22:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; 
   d="scan'208";a="87872054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:52:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BAC7D406AB15
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 13:42:31 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:52:46 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 13:52:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-scrypt: Enable ptest
Date: Mon, 30 Mar 2020 13:55:14 +0800
Message-ID: <20200330055514.18271-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BAC7D406AB15.A9D53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-scrypt.inc     | 15 ++++++++++++++-
 .../python/python3-scrypt/run-ptest               |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-scrypt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-python/recipes-devtools/python/python-scrypt.inc
index aff86a594..aa9d7b8d4 100644
--- a/meta-python/recipes-devtools/python/python-scrypt.inc
+++ b/meta-python/recipes-devtools/python/python-scrypt.inc
@@ -10,7 +10,20 @@ SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
 SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
 
-inherit pypi
+inherit pypi ptest
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
 
 RDEPENDS_${PN}_class-target += "\
 "
diff --git a/meta-python/recipes-devtools/python/python3-scrypt/run-ptest b/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
new file mode 100644
index 000000000..40c284799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest
-- 
2.20.1



