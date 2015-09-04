Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 76C6C76420
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 11:51:52 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id t84BpqHD030044
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Sep 2015 13:51:52 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.24])
	by mail1.siemens.de (8.15.1/8.15.1) with ESMTP id t84BppxV017867;
	Fri, 4 Sep 2015 13:51:52 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 13:51:42 +0200
Message-Id: <1441367502-4884-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441367502-4884-1-git-send-email-pascal.bach@siemens.com>
References: <1441367502-4884-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-qt5][PATCH 2/2] qt5: remove redundant QT_MODULE assignments
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
X-List-Received-Date: Fri, 04 Sep 2015 11:51:53 -0000

QT_MODULE is already set to the correct value by qt5-git.inc

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-qt/qt5/qtbase-native_git.bb    | 2 --
 recipes-qt/qt5/qtwayland-native_git.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 3efcb55..d75f5e5 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-QT_MODULE = "qtbase"
-
 require qt5-native.inc
 require qt5-git.inc
 
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 1a93284..efb615a 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-QT_MODULE = "${BPN}"
-
 DEPENDS = "qtbase-native wayland-native"
 
 SRC_URI += " \
-- 
2.1.4


