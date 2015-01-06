Return-Path: <kaneda18@hotmail.com>
Received: from BLU004-OMC4S13.hotmail.com (blu004-omc4s13.hotmail.com
	[65.55.111.152])
	by mail.openembedded.org (Postfix) with ESMTP id 92644728B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 17:29:45 +0000 (UTC)
Received: from BLU436-SMTP224 ([65.55.111.136]) by BLU004-OMC4S13.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Tue, 6 Jan 2015 09:29:46 -0800
X-TMN: [sEIhtqWFLi6rLro5bNvxFFLainPn2Oj2]
X-Originating-Email: [kaneda18@hotmail.com]
Message-ID: <BLU436-SMTP224A703B53ECF80B0D6067DC2590@phx.gbl>
From: kkelly87 <kaneda18@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 6 Jan 2015 12:29:30 -0500
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 06 Jan 2015 17:29:43.0275 (UTC)
	FILETIME=[5BBF53B0:01D029D6]
MIME-Version: 1.0
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: [meta-qt5][dizzy][PATCH] qttranslations: adding recipe for various qt translation ipks
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
X-List-Received-Date: Tue, 06 Jan 2015 17:29:55 -0000
Content-Type: text/plain

Since the layer does not have a specific recipe for the qttranslation submodule it was never being built
and ui elements like the OK and Cancel buttons had no translations.

Signed-off-by: Kevin Kelly <kaneda18@hotmail.com>
---
 recipes-qt/qt5/qttranslations.inc      | 85 ++++++++++++++++++++++++++++++++++
 recipes-qt/qt5/qttranslations_5.3.2.bb |  5 ++
 recipes-qt/qt5/qttranslations_git.bb   |  4 ++
 3 files changed, 94 insertions(+)
 create mode 100644 recipes-qt/qt5/qttranslations.inc
 create mode 100644 recipes-qt/qt5/qttranslations_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qttranslations_git.bb

diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
new file mode 100644
index 0000000..1fb242f
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations.inc
@@ -0,0 +1,85 @@
+require qt5.inc
+
+DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
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
diff --git a/recipes-qt/qt5/qttranslations_5.3.2.bb b/recipes-qt/qt5/qttranslations_5.3.2.bb
new file mode 100644
index 0000000..01a1d87
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "f2332bedc9c1ac8e762c62cfa71aa640"
+SRC_URI[sha256sum] = "29b648f005e9e588714c8e3c2115db65c7a944a6ba84baafb84091d73213c5cd"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
new file mode 100644
index 0000000..6f1e0e4
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "b9a22c997c1a988ff8e6b52893e4673e9ac69a2b"
-- 
1.9.1


