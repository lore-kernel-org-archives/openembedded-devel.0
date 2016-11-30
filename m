Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id ABCD171A8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:19:02 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 0B586B81614; Wed, 30 Nov 2016 12:11:58 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:11:57 +0100
Message-Id: <1480504318-6582-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Always enable icu in QT_CONFIG
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
X-List-Received-Date: Wed, 30 Nov 2016 11:19:03 -0000

Allow qtwebkit to be built even if qtbase was configured without icu.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtwebkit_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 78ca1f5..d0d7ee8 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -64,6 +64,9 @@ do_configure_prepend() {
     sed -e 's/\s\(config_fontconfig: \)/ OE_FONTCONFIG_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
 
+# Forcibly enable ICU, so qtbase doesn't need it.
+EXTRA_QMAKEVARS_PRE += "QT_CONFIG+=icu"
+
 # qtwebkit gets terribly big when linking with all debug info, disable by default
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
 EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
-- 
2.7.4


