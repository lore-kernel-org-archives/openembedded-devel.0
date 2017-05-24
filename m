Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18D0877E71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 01:03:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19229514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 May 2017 09:03:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6272C47C6D29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 09:03:09 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 24 May 2017 09:03:09 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 May 2017 09:02:46 +0800
Message-ID: <1495587769-60248-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495587769-60248-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495587769-60248-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 6272C47C6D29.A768A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH v2 1/4] Add 'qt5-ptest.inc' for qt5 ptest
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
X-List-Received-Date: Wed, 24 May 2017 01:03:15 -0000
Content-Type: text/plain

Since the ptest code for qtdeclarative,qtquick1 and qtxmlpatterns is similar, moved the same functions to include file "qt5-ptest.inc".

qt5-ptest.inc: 

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qt5-ptest.inc | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-ptest.inc

diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
new file mode 100644
index 0000000..35bd9ac
--- /dev/null
+++ b/recipes-qt/qt5/qt5-ptest.inc
@@ -0,0 +1,25 @@
+SRC_URI += "file://run-ptest"
+
+inherit ptest
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
+            install -m 0644  ${var} ${t}
+        fi
+    done
+}
-- 
2.7.4




