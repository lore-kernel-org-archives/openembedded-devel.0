Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6233F61B02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 02:19:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,282,1580745600"; d="scan'208";a="86640563"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 10:19:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1343C4BCC880
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:09:33 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 10:19:39 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 10:19:37 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 10:22:05 +0800
Message-ID: <20200320022205.29037-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1343C4BCC880.AC7F5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-xxhash: Enable ptest
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
X-List-Received-Date: Fri, 20 Mar 2020 02:19:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-xxhash.inc     | 15 +++++++++++++++
 .../python/python3-xxhash/run-ptest               |  3 +++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-xxhash/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-xxhash.inc b/meta-python/recipes-devtools/python/python-xxhash.inc
index 80f5e9c7f..c02c29eb7 100644
--- a/meta-python/recipes-devtools/python/python-xxhash.inc
+++ b/meta-python/recipes-devtools/python/python-xxhash.inc
@@ -5,3 +5,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
 SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
 SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+inherit ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-xxhash/run-ptest b/meta-python/recipes-devtools/python/python3-xxhash/run-ptest
new file mode 100644
index 000000000..6a26348b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xxhash/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest tests/test.py
-- 
2.20.1




