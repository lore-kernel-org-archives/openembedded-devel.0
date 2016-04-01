Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Apr 2016 01:47:49 UTC
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 695586FF25
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 01:47:49 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00MSTJJ90P50@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	31 Mar 2016 19:47:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=kaKi1cb8OKsWBlUEdZQA:9
Received: by 100.15.86.14 with SMTP id 6d7acc08; Fri, 01 Apr 2016 00:47:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 158AA161F59;	Thu,
	31 Mar 2016 20:47:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 20:47:23 -0400
Message-id: <1459471643-7183-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459471643-7183-1-git-send-email-denis@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH 2/2] qtquickcontrols: fix compilation of examples/texteditor
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
X-List-Received-Date: Fri, 01 Apr 2016 01:47:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

git/examples/quick/controls/texteditor/src/documenthandler.cpp:136:12: error: invalid use of incomplete type 'class QDebug'
      qDebug() << "saved to" << localPath;

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...fix-invalid-use-of-incomplete-type-class-.patch | 27 ++++++++++++++++++++++
 recipes-qt/qt5/qtquickcontrols_git.bb              |  4 ++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch

diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
new file mode 100644
index 0000000..10793e6
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -0,0 +1,27 @@
+From c39a563984693efac577adb137115693634c038f Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 31 Mar 2016 19:57:01 -0400
+Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ examples/quick/controls/texteditor/src/documenthandler.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/quick/controls/texteditor/src/documenthandler.cpp b/examples/quick/controls/texteditor/src/documenthandler.cpp
+index 2e9987a..c8bf419 100644
+--- a/examples/quick/controls/texteditor/src/documenthandler.cpp
++++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
+@@ -44,6 +44,7 @@
+ #include <QtGui/QTextCursor>
+ #include <QtGui/QFontDatabase>
+ #include <QtCore/QFileInfo>
++#include <QtCore/QDebug>
+ 
+ DocumentHandler::DocumentHandler()
+     : m_target(0)
+-- 
+2.2.0
+
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 1e25d6e..6f0379e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,8 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
+SRC_URI += " \
+    file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
+"
+
 SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
-- 
2.2.0


