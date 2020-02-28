Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE00C61873
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 03:26:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="84617536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 11:26:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4FC0B406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 11:16:55 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 11:26:42 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 28 Feb 2020 11:26:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2020 11:28:48 +0800
Message-ID: <20200228032848.3669-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 4FC0B406AB15.A950F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python] [PATCH] python3-appdirs: enable ptest
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
X-List-Received-Date: Fri, 28 Feb 2020 03:26:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-appdirs/run-ptest              |  3 +++
 .../python/python3-appdirs_1.4.3.bb               | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-appdirs/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
new file mode 100644
index 000000000..5287f3e03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest | sed -e 's/\[100%\]//g' | sed -e 's/\.\.F/: FAIL/g' | sed -e 's/\.\.\./: PASS/g'
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
index 6c0158072..2e183d888 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
@@ -2,7 +2,20 @@ SUMMARY = "A small Python module for determining appropriate + platform-specific
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
 
+SRC_URI += " \
+	file://run-ptest \
+"
+
 SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
 SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
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




