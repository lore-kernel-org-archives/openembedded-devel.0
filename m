Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBC0277F7A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 05:26:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19141396"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 May 2017 13:26:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EB2D47C654F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 13:26:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 22 May 2017 13:26:05 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 May 2017 13:25:48 +0800
Message-ID: <1495430748-34054-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 4EB2D47C654F.A7075
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH] qtxmlpatterns: add ptest
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
X-List-Received-Date: Mon, 22 May 2017 05:26:21 -0000
Content-Type: text/plain

Add ptest for qtxmlpatterns by using provided testsuite.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qtxmlpatterns/run-ptest |  5 +++++
 recipes-qt/qt5/qtxmlpatterns_git.bb    | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-qt/qt5/qtxmlpatterns/run-ptest

diff --git a/recipes-qt/qt5/qtxmlpatterns/run-ptest b/recipes-qt/qt5/qtxmlpatterns/run-ptest
new file mode 100644
index 0000000..6c3f522
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+for x in ` awk '{print $1}' tst_list `;do
+    ./${x};
+done
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c7efaf3..bc863de 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -14,8 +14,32 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+inherit ptest
+
 DEPENDS += "qtbase"
 
 SRCREV = "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
 
 BBCLASSEXTEND =+ "native nativesdk"
+
+addtask do_populate_sysroot after do_install before do_compile_ptest_base
+deltask do_compile_ptest_base
+addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
+addtask do_install_ptest after do_compile_ptest_base before do_package
+
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
-- 
2.7.4




