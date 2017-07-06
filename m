Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Jul 2017 11:49:26 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFCF719E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:49:26 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.46])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id E9A07E00CD;
	Thu,  6 Jul 2017 13:43:58 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id C217E619F; Thu,  6 Jul 2017 13:43:58 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jul 2017 13:43:44 +0200
Message-Id: <20170706114344.1438-1-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <04322183-852a-d327-3706-845980657ac4@dresearch-fe.de>
References: <04322183-852a-d327-3706-845980657ac4@dresearch-fe.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] qtquickcontrols2: fix compilation of examples/texteditor
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
X-List-Received-Date: Thu, 06 Jul 2017 11:49:26 -0000

git/examples/quickcontrols2/texteditor/documenthandler.cpp:284:18: error: invalid use of incomplete type 'class QDebug'
          qWarning() << "load() called before DocumentHandler has QQmlEngine";

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 ...rols2-fix-compilation-of-examples-textedi.patch | 28 ++++++++++++++++++++++
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch

diff --git a/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch b/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch
new file mode 100644
index 0000000..d08c57e
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch
@@ -0,0 +1,28 @@
+From 3696a416bd594d3f280c281cb2a66bc837829238 Mon Sep 17 00:00:00 2001
+From: Steffen Sledz <sledz@dresearch-fe.de>
+Date: Thu, 6 Jul 2017 13:28:07 +0200
+Subject: [PATCH] qtquickcontrols2: fix compilation of examples/texteditor
+
+git/examples/quickcontrols2/texteditor/documenthandler.cpp:284:18: error: invalid use of incomplete type 'class QDebug'
+          qWarning() << "load() called before DocumentHandler has QQmlEngine";
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+---
+ examples/quickcontrols2/texteditor/documenthandler.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/quickcontrols2/texteditor/documenthandler.cpp b/examples/quickcontrols2/texteditor/documenthandler.cpp
+index e57946fd..94ca82ad 100644
+--- a/examples/quickcontrols2/texteditor/documenthandler.cpp
++++ b/examples/quickcontrols2/texteditor/documenthandler.cpp
+@@ -59,6 +59,7 @@
+ #include <QTextCharFormat>
+ #include <QTextCodec>
+ #include <QTextDocument>
++#include <QtCore/QDebug>
+ 
+ DocumentHandler::DocumentHandler(QObject *parent)
+     : QObject(parent)
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 42acb8a..371f4ae 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
+SRC_URI += " \
+    file://0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch \
+"
+
 SRCREV = "6f7852a307c7ebbdb3b6efa00cbf7626b072bbc1"
-- 
2.13.2


