Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 745F071A36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:21:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17654966"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2017 18:21:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EAA8B47CE241
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:21:02 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 12 Apr 2017 18:21:02 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Apr 2017 18:20:44 +0800
Message-ID: <1491992444-1300-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: EAA8B47CE241.A9413
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH] qttools: add ptest
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
X-List-Received-Date: Wed, 12 Apr 2017 10:21:13 -0000
Content-Type: text/plain

Add ptest for qttools by using provided testsuite.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qttools/run-ptest |  4 ++++
 recipes-qt/qt5/qttools_git.bb    | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 recipes-qt/qt5/qttools/run-ptest

diff --git a/recipes-qt/qt5/qttools/run-ptest b/recipes-qt/qt5/qttools/run-ptest
new file mode 100644
index 0000000..5cd5e27
--- /dev/null
+++ b/recipes-qt/qt5/qttools/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+./tst_qtdiag
+./tst_qtattributionsscanner
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a2b01be..5c0f51c 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -14,9 +14,12 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+inherit ptest
+
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
+    file://run-ptest \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
     file://0003-add-noqtwebkit-configuration.patch \
     file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
@@ -33,3 +36,17 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'C
 SRCREV = "30c10900adecca55faa1d59c2f0caac74b1f9df6"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest() {
+    export PATH=${STAGING_DIR_NATIVE}/usr/include/qt5:$PATH
+    cd ${S}/tests
+    qmake -o Makefile tests.pro
+    oe_runmake
+}
+
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    t=${D}${PTEST_PATH}
+    cp ${S}/tests/auto/qtdiag/tst_tdiag $t
+    cp ${S}/tests/auto/qtattributionsscanner/tst_qtattributionsscanner $t
+}
-- 
2.7.4




