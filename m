Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 2146F76D84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 07:13:38 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id t8I7DbVd025838
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:13:38 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.24])
	by mail2.siemens.de (8.15.1/8.15.1) with ESMTP id t8I7Db5r023317;
	Fri, 18 Sep 2015 09:13:37 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 09:13:12 +0200
Message-Id: <1442560392-17103-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] qtbase: Allow enabling harfbuzz via PACKAGECONFIG
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
X-List-Received-Date: Fri, 18 Sep 2015 07:13:40 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index d4dfd83..95802f7 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -80,6 +80,7 @@ PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
 # fontdatabases/basic/qbasicfontdatabase.cpp will fail to build and system freetype
 # works only together with fontconfig
 PACKAGECONFIG[freetype] = "-system-freetype,-freetype,freetype"
+PACKAGECONFIG[harfbuzz] = "-system-harfbuzz,-no-harfbuzz,harfbuzz"
 PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
 PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
-- 
2.1.4


