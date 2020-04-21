Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.1398.1587434478428938642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 19:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89315410"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 09:56:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D94C44BCC880
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 09:45:26 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 09:55:59 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 09:56:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-msgpack: Enable ptest
Date: Tue, 21 Apr 2020 09:58:55 +0800
Message-ID: <20200421015855.7687-7-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
References: <20200421015855.7687-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D94C44BCC880.A981F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-msgpack/run-ptest              |  3 +++
 .../python/python3-msgpack_0.6.2.bb               | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-msgpack/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-msgpack/run-ptest b/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
index 7cfaf1c51..6d7e7a0dc 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
@@ -3,7 +3,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
 PYPI_PACKAGE = "msgpack"
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 SRC_URI[md5sum] = "ba46fdee995565f40e332bd7eea882f1"
 SRC_URI[sha256sum] = "ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830"
@@ -13,3 +13,16 @@ RDEPENDS_${PN}_class-target += "\
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
+	install -d ${D}${PTEST_PATH}/test
+	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
-- 
2.20.1



