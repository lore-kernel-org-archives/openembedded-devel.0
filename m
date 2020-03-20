Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46B0261B0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 02:20:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,282,1580745600"; d="scan'208";a="86640588"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 10:20:08 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CCA5406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:10:00 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 10:20:07 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 10:20:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 10:22:33 +0800
Message-ID: <20200320022233.5235-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9CCA5406AB15.A78EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python] [PATCH] python3-yappi: Enable ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2020 02:20:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-yappi.inc   | 18 +++++++++++++++++-
 .../python/python3-yappi/run-ptest             |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
index b3718d7d1..d6e9d4ed6 100644
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -7,10 +7,26 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
 SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
 SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
 
-inherit pypi setuptools3
+SRC_URI += " \
+	file://run-ptest \
+"
+
+inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
     "
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-multiprocessing \
+	${PYTHON_PN}-profile \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
+}
diff --git a/meta-python/recipes-devtools/python/python3-yappi/run-ptest b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1




