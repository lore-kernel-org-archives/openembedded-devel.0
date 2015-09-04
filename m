Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8C176420
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 11:51:51 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id t84BppKh031158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Sep 2015 13:51:51 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.24])
	by mail1.siemens.de (8.15.1/8.15.1) with ESMTP id t84BppxU017867;
	Fri, 4 Sep 2015 13:51:51 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 13:51:41 +0200
Message-Id: <1441367502-4884-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/2] qt5: move QT_MODULE to qt5-git.inc
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
X-List-Received-Date: Fri, 04 Sep 2015 11:51:52 -0000

QT_MODULE is only used in conjunction with qt5-git.inc.
It feels more consistent to have the variable in the context of the file
where it is used instead of having it in a separate file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-qt/qt5/qt5-git.inc | 1 +
 recipes-qt/qt5/qt5.inc     | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index b73ce4f..34b8ca4 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,6 +1,7 @@
 # Copyright (C) 2012 O.S. Systems Software LTDA.
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
+QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.5"
 
 # each module needs to define valid SRCREV
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 4c58ad6..a076c53 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -5,8 +5,6 @@ inherit qmake5
 
 PACKAGECONFIG_OPENSSL ?= "openssl"
 
-QT_MODULE ?= "${BPN}"
-
 # we don't want conflicts with qt4
 OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
 OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
-- 
2.1.4


