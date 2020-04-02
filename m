Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5778.1585794035850840816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 19:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,334,1580745600"; 
   d="scan'208";a="88365661"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 10:20:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D973450A9999
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 10:10:13 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 10:20:32 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 10:20:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-parse-type: Enable ptest
Date: Thu, 2 Apr 2020 10:23:03 +0800
Message-ID: <20200402022303.29984-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D973450A9999.A8B39
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-parse-type.inc | 15 ++++++++++++++-
 .../python/python3-parse-type/run-ptest           |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-parse-type/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
index 4549ec98b..147ea6443 100644
--- a/meta-python/recipes-devtools/python/python-parse-type.inc
+++ b/meta-python/recipes-devtools/python/python-parse-type.inc
@@ -7,6 +7,19 @@ SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
 SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
 
 PYPI_PACKAGE = "parse_type"
-inherit pypi
+inherit pypi ptest
 
 RDEPENDS_${PN} += "${PYTHON_PN}-parse"
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
diff --git a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1



