Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.1398.1587434478428938642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 19:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89315397"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 09:56:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0B2A749DF12C
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 09:45:23 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 09:55:56 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 09:55:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-markupsafe: Enable ptest
Date: Tue, 21 Apr 2020 09:58:53 +0800
Message-ID: <20200421015855.7687-5-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0B2A749DF12C.AC794
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-markupsafe.inc | 15 ++++++++++++++-
 .../python/python3-markupsafe/run-ptest           |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-markupsafe/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index 33d63b3e5..480876268 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -7,8 +7,21 @@ SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
 SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
 
 PYPI_PACKAGE = "MarkupSafe"
-inherit pypi
+inherit pypi ptest
 
 RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
 
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
+	install -d ${D}${PTEST_PATH}/tests
+	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1



