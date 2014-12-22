Return-Path: <kaneda18@hotmail.com>
Received: from BLU004-OMC4S29.hotmail.com (blu004-omc4s29.hotmail.com
	[65.55.111.168])
	by mail.openembedded.org (Postfix) with ESMTP id 0484272378
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:08:48 +0000 (UTC)
Received: from BLU436-SMTP230 ([65.55.111.137]) by BLU004-OMC4S29.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Mon, 22 Dec 2014 13:08:49 -0800
X-TMN: [RI9TrurfY47noMQbwSn8qZzVi+CYTPie]
X-Originating-Email: [kaneda18@hotmail.com]
Message-ID: <BLU436-SMTP2303FC3EF333D565F829F9FC2560@phx.gbl>
From: kkelly87 <kaneda18@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Dec 2014 16:08:39 -0500
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 22 Dec 2014 21:08:47.0155 (UTC)
	FILETIME=[79EA0030:01D01E2B]
MIME-Version: 1.0
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: [meta-qt5][dizzy][PATCH] adding qttranslations for 5.3.2
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
X-List-Received-Date: Mon, 22 Dec 2014 21:08:56 -0000
Content-Type: text/plain

---
 recipes-qt/qt5/qttranslations.inc      | 108 +++++++++++++++++++++++++++++++++
 recipes-qt/qt5/qttranslations_5.3.2.bb |   7 +++
 recipes-qt/qt5/qttranslations_git.bb   |   4 ++
 3 files changed, 119 insertions(+)
 create mode 100644 recipes-qt/qt5/qttranslations.inc
 create mode 100644 recipes-qt/qt5/qttranslations_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qttranslations_git.bb

diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
new file mode 100644
index 0000000..3c32424
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations.inc
@@ -0,0 +1,108 @@
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
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_ar.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_cs.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_da.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_de.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_es.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_fa.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_fi.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_fr.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_gl.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_he.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_hu.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_it.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_ja.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_ko.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_lt.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_pl.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_pt.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_ru.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_sk.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_sl.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_sv.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_uk.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_zh_CN.qm \
+                ${OE_QMAKE_PATH_TRANSLATIONS}/qt_zh_TW.qm \
+            "
\ No newline at end of file
diff --git a/recipes-qt/qt5/qttranslations_5.3.2.bb b/recipes-qt/qt5/qttranslations_5.3.2.bb
new file mode 100644
index 0000000..d74c946
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_5.3.2.bb
@@ -0,0 +1,7 @@
+
+
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


