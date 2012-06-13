Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SesfS-0003dn-C5
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2012 20:51:46 +0200
Received: by dalh21 with SMTP id h21so1424073dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2012 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yPIgMkHkLCDAaYrmU8KNuqrKwwKEWppxbADj4TDddL0=;
	b=OiOWyZdrPcn94OSkh9eyMkHXmSWyxlQJNOA83gPJ5BuprUa2yH6s+xybPGaqBn6GFs
	7jSkwQlHiFKUC661qgQykirUphL+NB04siWah6TWap/LOv+Pa37Hq7ck6CeNqVTaXuxx
	g83OQZ3PThTz4eZ7lRQKgZ5H9ajaUsz0ajNgsDfQrVx6RuCtifih75E5CqQuZ89E28je
	0UgRhvkLz6cMPfVuKG6MgQG/BqTr/Vic8ftYsqjMRH2mImGqh74yXSftW+3ebivZyKvk
	/A17MWhr+nTYdCy3T/DmmrEfr0RjMp9LDNYj2oXZ4uCJ+46haKv6spWWNCXNoYHZm3TX
	6RHQ==
Received: by 10.68.129.198 with SMTP id ny6mr52892579pbb.22.1339612869532;
	Wed, 13 Jun 2012 11:41:09 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id ku7sm6574862pbc.31.2012.06.13.11.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jun 2012 11:41:08 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2012 20:40:52 +0200
Message-Id: <1339612853-24121-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] qt4: Remove qt-4.7.4 recipes.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 18:51:46 -0000

This commit removes the following recipes:
qt4-embedded_4.7.4.bbappend
qt4-x11-free_4.7.4.bbappend

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend |    6 ------
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend |    6 ------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
-- 
1.7.9.5



