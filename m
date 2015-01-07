Return-Path: <kaneda18@hotmail.com>
Received: from BLU004-OMC4S31.hotmail.com (blu004-omc4s31.hotmail.com
	[65.55.111.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0837C7169F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 20:05:33 +0000 (UTC)
Received: from BLU437-SMTP29 ([65.55.111.135]) by BLU004-OMC4S31.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Wed, 7 Jan 2015 12:05:33 -0800
X-TMN: [piLInbYEsWtLy6GPE3AvIg2ByC5R4tN1]
X-Originating-Email: [kaneda18@hotmail.com]
Message-ID: <BLU437-SMTP294FCF66D64C1A0B462E0AC2460@phx.gbl>
From: kkelly87 <kaneda18@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Jan 2015 15:05:15 -0500
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 07 Jan 2015 20:05:31.0480 (UTC)
	FILETIME=[4A1FF580:01D02AB5]
MIME-Version: 1.0
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: [meta-qt5][PATCH] qttranslations: adding recipes for qt specific translations
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
X-List-Received-Date: Wed, 07 Jan 2015 20:05:39 -0000
Content-Type: text/plain

The meta-qt5 layer is missing a recipe for the qttranslation submodule so qt specific items like
the OK or Cancel button had no associated translations. This submission is for master while my previous patch
 will work as a backport to dizzy.

Signed-off-by: Kevin Kelly <kaneda18@hotmail.com>
---
 recipes-qt/qt5/qttranslations.inc      | 85 ++++++++++++++++++++++++++++++++++
 recipes-qt/qt5/qttranslations_5.4.0.bb |  5 ++
 recipes-qt/qt5/qttranslations_git.bb   |  4 ++
 3 files changed, 94 insertions(+)
 create mode 100644 recipes-qt/qt5/qttranslations.inc
 create mode 100644 recipes-qt/qt5/qttranslations_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qttranslations_git.bb

diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
new file mode 100644
index 0000000..1aca7e2
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations.inc
@@ -0,0 +1,85 @@
+require qt5.inc
+
+DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6" 
+
+PACKAGES =. "${PN}-assistant \
+             ${PN}-designer \
+             ${PN}-linguist \
+             ${PN}-qmlviewer \
+             ${PN}-qtconnectivity \
+             ${PN}-qtmultimedia \
+             ${PN}-qtlocation \
+             ${PN}-qtdeclarative \
+             ${PN}-qtxmlpatterns \
+             ${PN}-qtconfig \
+             ${PN}-qtquick1 \
+             ${PN}-qtscript \
+             ${PN}-qtbase \
+             ${PN}-qthelp \
+             ${PN}-qt \
+             "
+
+FILES_${PN}-assistant = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/assistant_*.qm \
+            "
+
+FILES_${PN}-designer = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/designer_*.qm \
+            "
+
+FILES_${PN}-linguist = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/linguist_*.qm \
+            "
+
+FILES_${PN}-qmlviewer = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qmlviewer_*.qm \
+            "
+
+FILES_${PN}-qtconnectivity = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtconnectivity_*.qm \
+            "
+
+FILES_${PN}-qtmultimedia = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtmultimedia_*.qm \
+            "
+
+FILES_${PN}-qtlocation = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtlocation_*.qm \
+            "
+
+FILES_${PN}-qtdeclarative = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtdeclarative_*.qm \
+            "
+
+FILES_${PN}-qtxmlpatterns = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
+            "
+
+FILES_${PN}-qtconfig = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
+            "
+
+FILES_${PN}-qtquick1 = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
+            "
+
+FILES_${PN}-qtscript = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
+            "
+
+FILES_${PN}-qtbase = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qtbase_*.qm \
+            "
+
+FILES_${PN}-qthelp = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_help_*.qm \
+            "
+
+FILES_${PN}-qt = " \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
+            "
diff --git a/recipes-qt/qt5/qttranslations_5.4.0.bb b/recipes-qt/qt5/qttranslations_5.4.0.bb
new file mode 100644
index 0000000..2e3a284
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6462eeefae00f048418ed6e4571c4cc9"
+SRC_URI[sha256sum] = "aca78d9178481a21a7af8571beb9109b38f0f71ba75cf3b89ddf705962a3f98b"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
new file mode 100644
index 0000000..211b211
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "3aad4ab4718d4bf952275a07e406e93eb6a22eed"
-- 
1.9.1


