Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F71860125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:54:30 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so137528167wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9jQTK4oxyxBYrBvoJznnH4sCpIJDLfPWDiCPUdHwiYs=;
	b=xlQy4bdAZ7EbfHs6laXVkB9xPD1vkl6XWeAbazEj1I1Pt9ud1ydi+NOM0pChZefL6m
	BnyqjzV05mLDCVBupweZAlYnFhgsGoPPWwY7j8NzQtpu+Rueye+6z/2eC0mP//EZsDjw
	UDByeIzCvQewYpjHr7nYpra+CZzy3sZ5lZtJ+qgIMPz2Xabtr7g7iqVtCMeLjTMz6MU5
	Gs3Hj1jTpKMpKqsDY7keCCAQB/98EALEEHY1AAsJTzMudzVQAPIHGXP8lQlMID2CHqS8
	lRLPg06Xtzm16CVsRL5JHAwLIdpn8z+uqdBiLnUIXrbfSAFGTelcA4JGosbNr4msij0m
	2mSQ==
X-Received: by 10.180.35.163 with SMTP id i3mr11653431wij.80.1442829270561;
	Mon, 21 Sep 2015 02:54:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cm6sm12558279wib.22.2015.09.21.02.54.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 02:54:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 11:54:34 +0200
Message-Id: <1442829274-9427-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [PATCH][meta-qt5] maliit-framework-qt5: bump to latest commit for getting Qt 5.5 compatibility
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
X-List-Received-Date: Mon, 21 Sep 2015 09:54:32 -0000

From: Christophe Chapuis <chris.chapuis@gmail.com>

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 .../maliit/maliit-framework-qt5/qt5.3-fix.patch    | 43 ----------------------
 recipes-qt/maliit/maliit-framework-qt5_git.bb      |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch

diff --git a/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch b/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch
deleted file mode 100644
index 4f8890f..0000000
--- a/recipes-qt/maliit/maliit-framework-qt5/qt5.3-fix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Fix compatibility with qt-5.3
-
-https://bugs.launchpad.net/ubuntu/+source/maliit-framework/+bug/1323962
-
-Upstream-Status: Pending
-
-diff --git a/src/maliit/plugins/updateevent.cpp b/src/maliit/plugins/updateevent.cpp
-index 06a5228..85b7166 100644
---- a/src/maliit/plugins/updateevent.cpp
-+++ b/src/maliit/plugins/updateevent.cpp
-@@ -38,7 +38,7 @@ bool MImUpdateEventPrivate::isFlagSet(Qt::InputMethodHint hint,
-     bool result = false;
- 
-     if (update.contains(Maliit::Internal::inputMethodHints)) {
--        const Qt::InputMethodHints hints(static_cast<Qt::InputMethodHints>(
-+        const Qt::InputMethodHints hints(static_cast<int>(
-                                              update.value(Maliit::Internal::inputMethodHints).toLongLong()));
- 
-         result = (hints & hint);
-@@ -89,8 +89,8 @@ QStringList MImUpdateEvent::propertiesChanged() const
- Qt::InputMethodHints MImUpdateEvent::hints(bool *changed) const
- {
-     Q_D(const MImUpdateEvent);
--    return static_cast<Qt::InputMethodHints>(
--        d->extractProperty(Maliit::Internal::inputMethodHints, changed).toLongLong());
-+    return Qt::InputMethodHints(static_cast<int>(
-+        d->extractProperty(Maliit::Internal::inputMethodHints, changed).toLongLong()));
- }
- 
- bool MImUpdateEvent::westernNumericInputEnforced(bool *changed) const
-diff --git a/src/mimpluginmanager.cpp b/src/mimpluginmanager.cpp
-index 02788a4..3c5c99a 100644
---- a/src/mimpluginmanager.cpp
-+++ b/src/mimpluginmanager.cpp
-@@ -1493,7 +1493,7 @@ void MIMPluginManager::handleWidgetStateChanged(unsigned int clientId,
-         }
-     }
- 
--    const Qt::InputMethodHints lastHints = static_cast<Qt::InputMethodHints>(newState.value(Maliit::Internal::inputMethodHints).toLongLong());
-+    const Qt::InputMethodHints lastHints(static_cast<int>(newState.value(Maliit::Internal::inputMethodHints).toLongLong()));
-     MImUpdateEvent ev(newState, changedProperties, lastHints);
- 
-     // general notification last
diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 83da8ca..975892d 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -9,10 +9,9 @@ inherit qmake5
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://maliit-server.desktop \
-    file://qt5.3-fix.patch \
 "
 
-SRCREV = "17fdf8699c53ddfb2c15df8e11d46804e782fec5"
+SRCREV = "60b1b10de14f932420313c547ab801daf522d539"
 PV = "0.99.0+git${SRCPV}"
 
 
-- 
2.5.1


