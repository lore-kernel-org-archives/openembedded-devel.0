Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA4DF72667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:53:45 +0000 (UTC)
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2015 14:53:44 +0100
X-Spam-Status: No, hits=0.0 required=5.0 tests=AWL: 0.000, BAYES_00: -1.665,
	TOTAL_SCORE: -1.665, autolearn=ham
X-Footer: YmFzeXNrb20uY29t
Received: from sirius.nbg.basyskom.de ([193.158.222.114]) by mx1.basyskom.com
	(Kerio Connect 8.4.0) (using TLSv1.2 with cipher AES256-SHA256
	(256 bits)); Fri, 27 Feb 2015 14:51:17 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
Date: Fri, 27 Feb 2015 14:51:13 +0100
Message-ID: <1425045073-21251-1-git-send-email-stephan.binner@basyskom.com>
X-Mailer: git-send-email 1.9.1
Resent-Message-ID: <201502271453.43602.>
Resent-Date: Fri, 27 Feb 2015 14:53:43 +0100
Resent-From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Resent-To: openembedded-devel@lists.openembedded.org
Resent-Cc: Stephan Binner <stephan.binner@basyskom.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] Add qttranslations to qt5-versions.inc and packagegroups
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
X-List-Received-Date: Fri, 27 Feb 2015 13:53:47 -0000

Signed-off-by: Stephan Binner <stephan.binner@basyskom.com>
---
 conf/distro/include/qt5-versions.inc                         |  1 +
 .../packagegroups/packagegroup-qt5-toolchain-target.bb       | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 2ecd49c..c61bb6f 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -22,6 +22,7 @@ PREFERRED_VERSION_qtserialport = "${QT5_VERSION}"
 PREFERRED_VERSION_qtscript = "${QT5_VERSION}"
 PREFERRED_VERSION_qtsvg = "${QT5_VERSION}"
 PREFERRED_VERSION_qtsystems = "${QT5_VERSION}"
+PREFERRED_VERSION_qttranslations = "${QT5_VERSION}"
 PREFERRED_VERSION_qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qttools-native = "${QT5_VERSION}"
 PREFERRED_VERSION_nativesdk-qttools = "${QT5_VERSION}"
diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 6318dc6..8e8f98e 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -13,6 +13,7 @@ USE_RUBY = " \
     qtquick1-mkspecs \
     qtquick1-plugins \
     qtquick1-qmlplugins \
+    qttranslations-qtquick1 \
     qtwebkit-dev \
     qtwebkit-mkspecs \
     qtwebkit-qmlplugins \
@@ -43,14 +44,21 @@ RDEPENDS_${PN} += " \
     qtbase-mkspecs \
     qtbase-plugins \
     qtbase-staticdev \
+    qttranslations-qt \
+    qttranslations-qtbase \
+    qttranslations-qtconfig \
+    qttranslations-qthelp \
     qtconnectivity-dev \
     qtconnectivity-mkspecs \
     qtconnectivity-qmlplugins \
+    qttranslations-qtconnectivity \
     qtdeclarative-dev \
     qtdeclarative-mkspecs \
     qtdeclarative-plugins \
     qtdeclarative-qmlplugins \
     qtdeclarative-staticdev \
+    qttranslations-qmlviewer \
+    qttranslations-qtdeclarative \
     qtenginio-dev \
     qtenginio-mkspecs \
     qtenginio-qmlplugins \
@@ -61,12 +69,15 @@ RDEPENDS_${PN} += " \
     qtlocation-mkspecs \
     qtlocation-plugins \
     qtlocation-qmlplugins \
+    qttranslations-qtlocation \
     qtmultimedia-dev \
     qtmultimedia-mkspecs \
     qtmultimedia-plugins \
     qtmultimedia-qmlplugins \
+    qttranslations-qtmultimedia \
     qtscript-dev \
     qtscript-mkspecs \
+    qttranslations-qtscript \
     qtsensors-dev \
     qtsensors-mkspecs \
     qtsensors-plugins \
@@ -95,6 +106,7 @@ RDEPENDS_${PN} += " \
     qtwebchannel-qmlplugins \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
+    qttranslations-qtxmlpatterns \
 "
 
 RRECOMMENDS_${PN} += " \
-- 
1.9.1




