Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 460BE76E04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 07:14:51 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id t8I7Em7k015775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:14:48 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.24])
	by mail1.siemens.de (8.15.1/8.15.1) with ESMTP id t8I7Em91023368;
	Fri, 18 Sep 2015 09:14:48 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 09:14:41 +0200
Message-Id: <1442560481-17236-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] qtbase: use system provided sqlite instead of bundled one
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
X-List-Received-Date: Fri, 18 Sep 2015 07:14:52 -0000

If PACKAGECONFIG = "sql-sqlite" is set use the system provided
sqlite3 and not the bundled one.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f4287cc..d4dfd83 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -98,7 +98,7 @@ PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
 PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
 PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
-PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,"
+PACKAGECONFIG[sql-sqlite] = "-system-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
 PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
 PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
-- 
2.1.4


