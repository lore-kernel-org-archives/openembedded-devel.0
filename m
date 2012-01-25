Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rq6ew-0003Er-VJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:29:23 +0100
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 7D7914B0780
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 18:21:34 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 18:21:33 +0100
Message-Id: <1327512093-30791-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <jfpbee$l8a$1@dough.gmane.org>
References: <jfpbee$l8a$1@dough.gmane.org>
MIME-Version: 1.0
Subject: [PATCH v2] qt-4.8.0: enable sql features as in 4.7.4
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
X-List-Received-Date: Wed, 25 Jan 2012 17:29:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
v2: add PRINC
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend |    6 ++++++
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend

diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
new file mode 100644
index 0000000..3c1ac5e
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -0,0 +1,6 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC =3D "1"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend b/meta-oe=
/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
new file mode 100644
index 0000000..3c1ac5e
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.0.bbappend
@@ -0,0 +1,6 @@
+DEPENDS +=3D "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS =3D "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -p=
lugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS +=3D "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
+PRINC =3D "1"
--=20
1.7.7.5



