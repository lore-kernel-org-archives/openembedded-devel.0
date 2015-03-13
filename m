Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6B26AC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 03:50:52 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so76606965iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gMfmwSy96J3e9HzQxk4Yk5mhQyUJw+HEt5s9NRbNj9c=;
	b=XQOINjQJ0QHr4aftkvqQOjr5G0cY/Cg2hnpzEHlXnWcKPUP/WeYqswjLmqm72qYB95
	cjJy+otDSGXbqv1eyaPkLArpXAjhm+8MeeJ4oa7JV0ehXsdzZdGHEXx6jOiJ0ZxRiAfR
	IhuqlE0H3MLIR0ihTZ/spuD3l4vxZxcdNoL3j1bBKm5KY4tMV9cR75+Fr4u+Xg2HRI/Z
	eQrY8tnFEAvNmDdvxaLT3q91XDya0J38/WxGnODKKWG40rw7tq4s5/dhHp7+pQb60f6U
	UwxZMziorQ5KV+X7W9mpApwDkHVF25GBz2wupSMLejfXnZTwUKKOG4qnRJtxBkikXJYA
	NCug==
X-Received: by 10.42.48.78 with SMTP id r14mr54285997icf.33.1426218653331;
	Thu, 12 Mar 2015 20:50:53 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ig15sm616615igb.10.2015.03.12.20.50.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Mar 2015 20:50:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2015 20:50:41 -0700
Message-Id: <1426218641-28745-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qt5: add QT_GIT to define git repo for Qt core components
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
X-List-Received-Date: Fri, 13 Mar 2015 03:50:54 -0000

Replace four duplicate git URIs with a single definition.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qt5-git.inc             | 4 +++-
 recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
 recipes-qt/qt5/qtbase_git.bb           | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

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
index 84ddf49..a2d96a2 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,11 +1,13 @@
 # Copyright (C) 2012 O.S. Systems Software LTDA.
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
+QT_GIT ?= "git://code.qt.io"
+
 QT_MODULE_BRANCH ?= "5.4"
 
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


