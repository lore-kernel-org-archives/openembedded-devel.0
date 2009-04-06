Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqs1e-0007ET-Vf
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:50:25 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8A7184B015C;
	Mon,  6 Apr 2009 18:47:28 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9D35F4B00C6;
	Mon,  6 Apr 2009 18:47:26 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 22ED11840D9; Mon,  6 Apr 2009 18:47:28 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 18:47:28 +0200
Message-Id: <1239036448-9036-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] postgresql: use LDFLAGS for shared libs (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 16:50:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/postgresql/postgresql.inc      |    3 +++
 recipes/postgresql/postgresql_8.1.4.bb |    2 +-
 recipes/postgresql/postgresql_8.1.8.bb |    2 +-
 recipes/postgresql/postgresql_8.2.4.bb |    2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/postgresql/postgresql.inc b/recipes/postgresql/postg=
resql.inc
index da74516..4a11e2a 100644
--- a/recipes/postgresql/postgresql.inc
+++ b/recipes/postgresql/postgresql.inc
@@ -11,6 +11,9 @@ SRC_URI =3D "ftp://ftp-archives.postgresql.org/pub/sour=
ce/v${PV}/${P}.tar.bz2"
=20
 LEAD_SONAME =3D "libpq.so"
=20
+# LDFLAGS for shared libraries
+export LDFLAGS_SL =3D "${LDFLAGS}"
+
 inherit autotools pkgconfig
=20
 do_compile_append() {
diff --git a/recipes/postgresql/postgresql_8.1.4.bb b/recipes/postgresql/=
postgresql_8.1.4.bb
index cfb0162..42ba377 100644
--- a/recipes/postgresql/postgresql_8.1.4.bb
+++ b/recipes/postgresql/postgresql_8.1.4.bb
@@ -1,3 +1,3 @@
 require postgresql.inc
=20
-PR =3D "r3"
+PR =3D "r4"
diff --git a/recipes/postgresql/postgresql_8.1.8.bb b/recipes/postgresql/=
postgresql_8.1.8.bb
index cfb0162..42ba377 100644
--- a/recipes/postgresql/postgresql_8.1.8.bb
+++ b/recipes/postgresql/postgresql_8.1.8.bb
@@ -1,3 +1,3 @@
 require postgresql.inc
=20
-PR =3D "r3"
+PR =3D "r4"
diff --git a/recipes/postgresql/postgresql_8.2.4.bb b/recipes/postgresql/=
postgresql_8.2.4.bb
index 9b60b2b..7e2c370 100644
--- a/recipes/postgresql/postgresql_8.2.4.bb
+++ b/recipes/postgresql/postgresql_8.2.4.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
=20
-PR =3D "r3"
+PR =3D "r4"
 DEFAULT_PREFERENCE =3D "-1"
=20
 SRC_URI =3D "http://ftp.de.postgresql.org/mirror/postgresql/source/v${PV=
}/${P}.tar.bz2 \
--=20
1.6.2.1



