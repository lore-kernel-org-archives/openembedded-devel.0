Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.1398.1587434478428938642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 19:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89315400"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 09:56:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CA6F846B5FAF
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 09:45:21 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 09:55:55 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 09:55:57 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-license-expression: Enable ptest
Date: Tue, 21 Apr 2020 09:58:52 +0800
Message-ID: <20200421015855.7687-4-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CA6F846B5FAF.AB94A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-license-expression.inc          | 15 ++++++++++++++-
 .../python/python3-license-expression/run-ptest   |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-license-expression/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
index 4c35e8dd7..add25810d 100644
--- a/meta-python/recipes-devtools/python/python-license-expression.inc
+++ b/meta-python/recipes-devtools/python/python-license-expression.inc
@@ -7,10 +7,23 @@ LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846
 SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
 SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
 
-inherit pypi
+inherit pypi ptest
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-booleanpy \
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
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-license-expression/run-ptest b/meta-python/recipes-devtools/python/python3-license-expression/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-license-expression/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1



