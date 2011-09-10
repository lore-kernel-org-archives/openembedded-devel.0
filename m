Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2Twh-0004zz-QZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Sep 2011 22:14:36 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E42A7A6257;
	Sat, 10 Sep 2011 22:09:25 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Sep 2011 22:09:21 +0200
Message-Id: <1315685361-18809-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] qt4: update to 4.7.4
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
X-List-Received-Date: Sat, 10 Sep 2011 20:14:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

once oe-core has updated qt4 recipe

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend |    5 -----
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend |    5 +++++
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend |    5 -----
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend |    5 +++++
 4 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
deleted file mode 100644
index 9b4ede4..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-DEPENDS +=3D "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.4.bbappend
@@ -0,0 +1,5 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
deleted file mode 100644
index 9b4ede4..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-DEPENDS +=3D "mysql5 postgresql sqlite"
-QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
-QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
-                    -I${STAGING_INCDIR}/postgresql"
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
@@ -0,0 +1,5 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
--=20
1.7.6



