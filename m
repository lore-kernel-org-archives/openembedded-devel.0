Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LqPkq-0001iU-Qz
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Apr 2009 12:39:11 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 56EFD4B005D;
	Sun,  5 Apr 2009 12:36:22 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 69F6D4B000F;
	Sun,  5 Apr 2009 12:36:20 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id F2E7B1841EE; Sun,  5 Apr 2009 12:36:07 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Apr 2009 12:36:07 +0200
Message-Id: <1238927767-18963-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] sqlite: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sun, 05 Apr 2009 10:39:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 .../sqlite-2.8.17/mainmk_build_dynamic.patch       |   18 ++++++++++----=
----
 recipes/sqlite/sqlite_2.8.17.bb                    |    2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch b/re=
cipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
index e936f81..914422f 100644
--- a/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
+++ b/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
@@ -1,6 +1,6 @@
-diff -bur sqlite-2.8.17~orig/main.mk sqlite-2.8.17/main.mk
---- sqlite-2.8.17~orig/main.mk	2005-04-23 17:43:23.000000000 -0500
-+++ sqlite-2.8.17/main.mk	2006-02-13 03:31:03.000000000 -0600
+diff -urN sqlite-2.8.17.orig/main.mk sqlite-2.8.17/main.mk
+--- sqlite-2.8.17.orig/main.mk	2005-04-23 22:43:23.000000000 +0000
++++ sqlite-2.8.17/main.mk	2009-04-02 20:10:36.000000000 +0000
 @@ -139,7 +139,7 @@
  # This is the default Makefile target.  The objects listed here
  # are what get build when you type just "make" with no arguments.
@@ -17,13 +17,15 @@ diff -bur sqlite-2.8.17~orig/main.mk sqlite-2.8.17/ma=
in.mk
 -libsqlite.a:	$(LIBOBJ)
 -	$(AR) libsqlite.a $(LIBOBJ)
 -	$(RANLIB) libsqlite.a
-+libsqlite.so:	$(LIBOBJ)
-+	$(CC) -shared -o libsqlite.so -Wl,-soname,libsqlite.so.0 $(LIBOBJ)
-=20
+-
 -sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.a sqlite.h
-+sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.so sqlite.h
- 	$(TCCX) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
+-	$(TCCX) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
 -		libsqlite.a $(LIBREADLINE) $(THREADLIB)
++libsqlite.so:	$(LIBOBJ)
++	$(CC) $(LDFLAGS) -shared -o libsqlite.so -Wl,-soname,libsqlite.so.0 $(=
LIBOBJ)
++
++sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.so sqlite.h
++	$(TCCX) $(LDFLAGS) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.=
c \
 +		-lsqlite $(LIBREADLINE) $(THREADLIB)
 =20
  sqlite_analyzer$(EXE):	$(TOP)/src/tclsqlite.c libsqlite.a $(TESTSRC) \
diff --git a/recipes/sqlite/sqlite_2.8.17.bb b/recipes/sqlite/sqlite_2.8.=
17.bb
index b5939d9..9f6ec7e 100644
--- a/recipes/sqlite/sqlite_2.8.17.bb
+++ b/recipes/sqlite/sqlite_2.8.17.bb
@@ -4,7 +4,7 @@ SECTION =3D "libs"
 PRIORITY =3D "optional"
 DEPENDS =3D "readline ncurses"
 LICENSE =3D "PD"
-PR =3D "r2"
+PR =3D "r3"
=20
 SRC_URI =3D "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
        file://mainmk_build_dynamic.patch;patch=3D1 \
--=20
1.6.2.1



