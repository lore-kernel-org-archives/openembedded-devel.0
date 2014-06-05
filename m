Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EBC3460030
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:58 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so1868595wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ox/tpsGqheZXdY7Ea6GvEGO7lmC1VAhdPrYnG2SFbWw=;
	b=Wc1ZYLPmgHBtTyn9pj53q7JaQGtRol7CkG6RSaHcc3E7j9LraNH7mOwIJRIIR7KYHu
	AZkJAjtV3PXug2yF21u/la8QhgOH8uhdfdiMJvjHlae3yBhktuWl/sJW9Qhm4kHc7RGF
	SV0amMNDIBSTEXmSZT/RonnYWtt8MVTbq3EMDVvlwYiO/pVSoZ8bH58Lkl9SLnmZ0Rsm
	iyTx3dNRXjFbK3eTuM+AivQWtwpOeQbzPipkSNRUakX4jUrYRCPBRhI+58DFAidjpRx8
	ZIckjinMSS9gnR/J190C1u1ZPz0+pFevG6mHNAbgX3b708ZW7CpIfofhX9mBm4ZHBqqo
	Ac2Q==
X-Received: by 10.14.177.195 with SMTP id d43mr228048eem.105.1402006139033;
	Thu, 05 Jun 2014 15:08:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z44sm17725437eep.39.2014.06.05.15.08.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:59 +0200
Message-Id: <1402006139-27614-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 10/10] maliit-framework-qt5: Add patch to fix build with qt-5.3, remove unused files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jun 2014 22:08:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...LUGIN_PATH-to-allow-openembedded-to-build.patch | 34 -----------------
 ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch | 23 ------------
 .../maliit/maliit-framework-qt5/qt5.3-fix.patch    | 43 ++++++++++++++++++++++
 recipes-qt/maliit/maliit-framework-qt5_git.bb      |  1 +
 4 files changed, 44 insertions(+), 57 deletions(-)
 delete mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
 delete mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
 create mode 100644 recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch

diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
deleted file mode 100644
index 830e6de..0000000
--- a/recipes-qt/maliit/maliit-framework-qt5/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fb6acbd2af9ed288c1c4f4200fc73d8d9955486a Mon Sep 17 00:00:00 2001
-From: Samuel Stirtzel <s.stirtzel@googlemail.com>
-Date: Wed, 1 Aug 2012 13:33:10 +0200
-Subject: [PATCH] Fix QT_IM_PLUGIN_PATH to allow openembedded to build Maliit
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
----
- input-context/input-context.pri |   10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/input-context/input-context.pri b/input-context/input-context.pri
-index d94e6a3..d460e70 100644
---- a/input-context/input-context.pri
-+++ b/input-context/input-context.pri
-@@ -25,8 +25,10 @@ for(OPTION,$$list($$lower($$COV_OPTION))){
- 
- QMAKE_CLEAN += $$OBJECTS_DIR/*.gcno $$OBJECTS_DIR/*.gcda
- 
--QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
--QT_PREFIX = $$[QT_INSTALL_PREFIX]
--local-install {
--    QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
-+isEmpty(QT_IM_PLUGIN_PATH) {
-+    QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
-+    QT_PREFIX = $$[QT_INSTALL_PREFIX]
-+    local-install {
-+        QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
-+    }
- }
--- 
-1.7.9.5
-
diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
deleted file mode 100644
index c2291c6..0000000
--- a/recipes-qt/maliit/maliit-framework-qt5/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From cc33efdedbec9e9a55e9a0c6756516fd84d42e53 Mon Sep 17 00:00:00 2001
-From: Samuel Stirtzel <s.stirtzel@googlemail.com>
-Date: Fri, 1 Mar 2013 11:31:41 +0100
-Subject: [PATCH] Link to libmaliit-1,0 in inputcontext plugin
-
-Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
----
- .../input-context-plugin/input-context-plugin.pro  |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/input-context/input-context-plugin/input-context-plugin.pro b/input-context/input-context-plugin/input-context-plugin.pro
-index eefbe93..296e2fa 100644
---- a/input-context/input-context-plugin/input-context-plugin.pro
-+++ b/input-context/input-context-plugin/input-context-plugin.pro
-@@ -15,3 +15,5 @@ CONFIG += plugin
-
- INSTALLS    += target
- target.path += $$QT_IM_PLUGIN_PATH
-+
-+LIBS += -L../../lib -l"maliit-1.0"
---
-1.7.9.5
-
diff --git a/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch b/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch
new file mode 100644
index 0000000..4f8890f
--- /dev/null
+++ b/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch
@@ -0,0 +1,43 @@
+Fix compatibility with qt-5.3
+
+https://bugs.launchpad.net/ubuntu/+source/maliit-framework/+bug/1323962
+
+Upstream-Status: Pending
+
+diff --git a/src/maliit/plugins/updateevent.cpp b/src/maliit/plugins/updateevent.cpp
+index 06a5228..85b7166 100644
+--- a/src/maliit/plugins/updateevent.cpp
++++ b/src/maliit/plugins/updateevent.cpp
+@@ -38,7 +38,7 @@ bool MImUpdateEventPrivate::isFlagSet(Qt::InputMethodHint hint,
+     bool result = false;
+ 
+     if (update.contains(Maliit::Internal::inputMethodHints)) {
+-        const Qt::InputMethodHints hints(static_cast<Qt::InputMethodHints>(
++        const Qt::InputMethodHints hints(static_cast<int>(
+                                              update.value(Maliit::Internal::inputMethodHints).toLongLong()));
+ 
+         result = (hints & hint);
+@@ -89,8 +89,8 @@ QStringList MImUpdateEvent::propertiesChanged() const
+ Qt::InputMethodHints MImUpdateEvent::hints(bool *changed) const
+ {
+     Q_D(const MImUpdateEvent);
+-    return static_cast<Qt::InputMethodHints>(
+-        d->extractProperty(Maliit::Internal::inputMethodHints, changed).toLongLong());
++    return Qt::InputMethodHints(static_cast<int>(
++        d->extractProperty(Maliit::Internal::inputMethodHints, changed).toLongLong()));
+ }
+ 
+ bool MImUpdateEvent::westernNumericInputEnforced(bool *changed) const
+diff --git a/src/mimpluginmanager.cpp b/src/mimpluginmanager.cpp
+index 02788a4..3c5c99a 100644
+--- a/src/mimpluginmanager.cpp
++++ b/src/mimpluginmanager.cpp
+@@ -1493,7 +1493,7 @@ void MIMPluginManager::handleWidgetStateChanged(unsigned int clientId,
+         }
+     }
+ 
+-    const Qt::InputMethodHints lastHints = static_cast<Qt::InputMethodHints>(newState.value(Maliit::Internal::inputMethodHints).toLongLong());
++    const Qt::InputMethodHints lastHints(static_cast<int>(newState.value(Maliit::Internal::inputMethodHints).toLongLong()));
+     MImUpdateEvent ev(newState, changedProperties, lastHints);
+ 
+     // general notification last
diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 633bf6e..3ef56ec 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -9,6 +9,7 @@ inherit qmake5
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://maliit-server.desktop \
+    file://qt5.3-fix.patch \
 "
 
 SRCREV = "dbc0403f329d7f6ce2f5a09e6ff5adbd2548a8c9"
-- 
2.0.0


