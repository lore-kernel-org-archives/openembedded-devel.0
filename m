Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C2E336FFED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 06:49:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19004971"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2017 14:49:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 861CE47C7C63
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 14:49:29 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 18 May 2017 14:49:30 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 May 2017 14:49:11 +0800
Message-ID: <1495090151-7610-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 861CE47C7C63.A95BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH] qtquick1: add ptest
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
X-List-Received-Date: Thu, 18 May 2017 06:49:35 -0000
Content-Type: text/plain

Add ptest for qtquick1 by using provided testsuite.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qtquick1/run-ptest |  5 +++++
 recipes-qt/qt5/qtquick1_git.bb    | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquick1/run-ptest

diff --git a/recipes-qt/qt5/qtquick1/run-ptest b/recipes-qt/qt5/qtquick1/run-ptest
new file mode 100644
index 0000000..6c3f522
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+for x in ` awk '{print $1}' tst_list `;do
+    ./${x};
+done
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e9b6185..bbf9980 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -10,6 +10,10 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+SRC_URI += "file://run-ptest"
+
+inherit ptest
+
 DEPENDS += "qtscript qtsvg qtxmlpatterns"
 # qttools
 
@@ -18,9 +22,31 @@ PACKAGECONFIG[webkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'webkit', '', 'CONFIG+=noqtwebkit', d)}"
 
+addtask do_populate_sysroot after do_install before do_compile_ptest_base
+deltask do_compile_ptest_base
+addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
+addtask do_install_ptest after do_compile_ptest_base before do_package
+
 do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
+do_compile_ptest() {
+    cd ${S}/tests
+    qmake -o Makefile tests.pro
+    oe_runmake
+}
+
+fakeroot do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    t=${D}${PTEST_PATH}
+    for var in ` find ${S}/tests/auto/ -name tst_*`; do
+        if [ not ` echo ${var##*/} | grep '\.'` ]; then
+            echo ${var##*/} >> ${t}/tst_list
+            install -m 0644 ${var} ${t}
+        fi
+    done
+}
+
 QT_MODULE_BRANCH = "dev"
 SRCREV = "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
-- 
2.7.4




