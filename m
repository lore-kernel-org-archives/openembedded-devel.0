Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgNEt-0001Ff-U2
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:14:53 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3183334eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 14:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JgFQC+8QoLORRU1gQdEkYXqIZ3gCZbVrZsKTh+P2DjE=;
	b=lDN3CECLfFMObcF48KRrRSMk5w8g13Wm5yCLxygjM/AG2pDoTbdB1jJ7agwYMVxlwF
	by6tYdCs36/pxo9rnYJXKiD6IiCJlEvoaQcQnehFcGfQECZLKD3n6D0NtYva63hAV7ms
	36c3PcJcb+XDyyMsYmRvmPx8kUlAikgDmZ8PiO4bZQ6EzIZn4VxIFOTEKdrptRa1V69Q
	rVUB3iCfXj0vXE5sOlWWgV4zxTPSUiqk5bnkqR+HlExpSq8k+jydla738ma3MNbqx4ym
	xaLGjKst+OsSiiKZQjip1TDx8z1MbpZ2ASeZaLvCK0tTRZ3JWvuPfuzX0nI0xlR60EWT
	XORw==
Received: by 10.14.206.197 with SMTP id l45mr11832550eeo.17.1354744823772;
	Wed, 05 Dec 2012 14:00:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm11818920eep.5.2012.12.05.14.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 14:00:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 23:00:13 +0100
Message-Id: <1354744813-31423-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] qt4: rename bbappends to match new 4.8.4 version from oe-core
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
X-List-Received-Date: Wed, 05 Dec 2012 22:14:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend | 6 ------
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend | 6 ++++++
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend | 6 ------
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend | 6 ++++++
 4 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
new file mode 100644
index 0000000..27cac11
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
@@ -0,0 +1,6 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
deleted file mode 100644
index 27cac11..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-DEPENDS += "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
new file mode 100644
index 0000000..27cac11
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
@@ -0,0 +1,6 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC := "${@int(PRINC) + 1}"
-- 
1.8.0



