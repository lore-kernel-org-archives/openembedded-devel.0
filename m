Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3FE6FF60
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 00:47:48 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00MNGJJ96020@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	31 Mar 2016 19:47:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Sa2kaFFEjJH7jJ1Niy4A:9
Received: by 100.15.86.14 with SMTP id 19061741; Fri, 01 Apr 2016 00:47:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1340D161F56;	Thu,
	31 Mar 2016 20:47:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 20:47:22 -0400
Message-id: <1459471643-7183-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 1/2] qtdeclarative: fix compilation of examples/qquickviewcomparison
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
X-List-Received-Date: Fri, 01 Apr 2016 00:47:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

git/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.cpp:180:14: error: 'QCoreApplication' has not been declared
          if (!QCoreApplication::arguments().contains(QStringLiteral("--no_render_alpha")))

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...omparison-fix-QCoreApplication-has-not-be.patch | 28 ++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
new file mode 100644
index 0000000..1687fbe
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -0,0 +1,28 @@
+From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 31 Mar 2016 19:38:58 -0400
+Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
+ declared error
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
+index 5b86c93..e77514e 100644
+--- a/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
++++ b/examples/quick/quickwidgets/qquickviewcomparison/mainwindow.h
+@@ -44,6 +44,7 @@
+ #include <QWidget>
+ #include <QQuickWidget>
+ #include <QQuickView>
++#include <QCoreApplication>
+ 
+ QT_FORWARD_DECLARE_CLASS(QRadioButton)
+ QT_FORWARD_DECLARE_CLASS(QCheckBox)
+-- 
+2.2.0
+
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 93442fb..9274d00 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -15,6 +15,7 @@ DEPENDS += "qtbase"
 
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
+    file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
-- 
2.2.0


