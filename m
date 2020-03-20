Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB2E260FDB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 02:17:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,282,1580745600"; d="scan'208";a="86640489"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 10:17:52 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E41A24BCC880
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 10:07:43 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 10:17:47 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 10:17:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 10:20:10 +0800
Message-ID: <20200320022010.11690-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E41A24BCC880.A7F1C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-webcolors: Enable ptest
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
X-List-Received-Date: Fri, 20 Mar 2020 02:17:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-webcolors.inc   | 14 ++++++++++++++
 .../python/python3-webcolors/run-ptest             |  2 ++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-webcolors/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
index ef254e33b..ad012c979 100644
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -10,3 +10,17 @@ RDEPENDS_${PN}_class-target = "\
 "
 
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
+}
diff --git a/meta-python/recipes-devtools/python/python3-webcolors/run-ptest b/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
new file mode 100644
index 000000000..40c284799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest
-- 
2.20.1




