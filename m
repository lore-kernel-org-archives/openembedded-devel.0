Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8583E61B02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 02:18:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,282,1580745600"; d="scan'208";a="86640526"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 10:18:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A29B74BCC881
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:08:27 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 10:18:34 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 10:18:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 10:21:00 +0800
Message-ID: <20200320022100.3489-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A29B74BCC881.A9B42
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python] [PATCH] python3-xlrd: Enable ptest
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
X-List-Received-Date: Fri, 20 Mar 2020 02:18:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-xlrd.inc      | 16 ++++++++++++++++
 .../python/python3-xlrd/run-ptest                |  3 +++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-xlrd/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index f87d2ab7c..ee73e76b9 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -12,3 +12,19 @@ SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
 BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+inherit ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	install -d ${D}${PTEST_PATH}/examples
+	cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
+}
diff --git a/meta-python/recipes-devtools/python/python3-xlrd/run-ptest b/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
new file mode 100644
index 000000000..5cec71169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xlrd/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
-- 
2.20.1




