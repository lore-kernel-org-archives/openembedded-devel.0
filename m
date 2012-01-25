Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rq58W-0000D1-08
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 16:51:48 +0100
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 118CD4B063A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 16:43:59 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 16:43:58 +0100
Message-Id: <1327506238-29483-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
MIME-Version: 1.0
Subject: [meta-oe] qt-4.8.0: enable sql features as in 4.7.4
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
X-List-Received-Date: Wed, 25 Jan 2012 15:51:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend |    5 +++++
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -0,0 +1,5 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
@@ -0,0 +1,5 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
--=20
1.7.7.5



