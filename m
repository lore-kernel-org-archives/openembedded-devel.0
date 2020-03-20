Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 626A961B02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 02:20:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,282,1580745600"; d="scan'208";a="86640618"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 10:20:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 15F7C49DF129
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:10:29 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 10:20:35 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 10:20:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 10:23:01 +0800
Message-ID: <20200320022301.9838-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 15F7C49DF129.ACFAA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-yarl: Enable ptest
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
X-List-Received-Date: Fri, 20 Mar 2020 02:20:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-yarl.inc       | 15 ++++++++++++++-
 .../python/python3-yarl/run-ptest                 |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yarl/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-yarl.inc b/meta-python/recipes-devtools/python/python-yarl.inc
index 98066d73b..911c79d66 100644
--- a/meta-python/recipes-devtools/python/python-yarl.inc
+++ b/meta-python/recipes-devtools/python/python-yarl.inc
@@ -6,9 +6,22 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
 SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
 
+SRC_URI += " \
+	file://run-ptest \
+"
+
 PYPI_PACKAGE = "yarl"
-inherit pypi
+inherit pypi ptest
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-multidict \
     ${PYTHON_PN}-idna \
 "
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-yarl/run-ptest b/meta-python/recipes-devtools/python/python3-yarl/run-ptest
new file mode 100644
index 000000000..f82f6ea1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yarl/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest 
-- 
2.20.1




