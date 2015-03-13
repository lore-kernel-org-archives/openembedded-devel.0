Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7D86013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 20:00:13 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so123900912iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DqmDQFi0ItohHzZvWLPiU1/TgqhhwFKW1K+0jBwJkzA=;
	b=rhfezK4XaX3ENrG36fF3qoJzAdtbQcO7pTpWV/K24bjoZcLCHcEopb+eRqkB4fOpWW
	5y36lRlVui3cPq0dY7kcPYIBPufjoJ7ugDyz9/ZszdkyYazTzmo7AJkv87EY23BOhIcA
	pSCD5Ah+FXhDoduwwrmuqLLxXIw75JM9zOdULwvyTS4iSRYl46zWj93t2YehM/Fr2VVS
	cl7VZbk4pUc7LSxUDX7bqivOmwzZMYGkAotfFSkDdxsWtYyF7PV7Koq/ZoTKlTPIg0nZ
	dASiqw99gdsi3B8P24jh90jhGgCXbtRVSBnODoAauK2gPpglpC56BohRK3+qfH+GCMBx
	38Jw==
X-Received: by 10.107.13.144 with SMTP id 138mr87388855ion.24.1426276808202;
	Fri, 13 Mar 2015 13:00:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id v15sm1874320igd.15.2015.03.13.13.00.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 13:00:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 12:59:48 -0700
Message-Id: <1426276788-32502-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH v2] qt5: add QT_GIT to define git repo for Qt core components
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
X-List-Received-Date: Fri, 13 Mar 2015 20:00:16 -0000

Replace duplicated git URIs with a single definition in layer.conf.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 conf/layer.conf                              | 2 ++
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
 recipes-qt/qt5/qt5-git.inc                   | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
 recipes-qt/qt5/qtbase_git.bb                 | 2 +-
 6 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index aacfd78..92558b3 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -26,3 +26,5 @@ BBFILE_PRIORITY_qt5-layer = "7"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
+
+QT_GIT ?= "git://code.qt.io"
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index db5bbe6..0546b00 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
 SRCREV = "c17fe9e0ec0882ac4c4dc1168095f569acab5d09"
-SRC_URI = "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
+SRC_URI = "${QT_GIT}/qt-labs/qt5-everywhere-demo.git"
 
 S = "${WORKDIR}/git/QtDemo"
 
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index df80407..9832eee 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -5,7 +5,7 @@ require ${PN}.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 SRC_URI = "\
-    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 84ddf49..c878998 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?= "5.4"
 
 # each module needs to define valid SRCREV
 SRC_URI += " \
-    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 5a308d4..e558ee6 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -2,7 +2,7 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRC_URI = "\    
-    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 549c92a..1be31ea 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -2,7 +2,7 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRC_URI = "\
-    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-- 
1.9.1


