Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqmv4-0007gx-Ma
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 13:23:17 +0200
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id AC4C69400FB;
	Mon,  6 Apr 2009 13:20:22 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp1-g21.free.fr (Postfix) with ESMTP id B089A9400D0;
	Mon,  6 Apr 2009 13:20:19 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 4B62A1840D9; Mon,  6 Apr 2009 13:20:21 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 13:20:20 +0200
Message-Id: <1239016820-24813-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] libnl: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 11:23:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 .../local-includes-and-avoid-wrong-ldflags.patch   |   13 -------------
 recipes/libnl/files/local-includes.patch           |   12 ++++++++++++
 recipes/libnl/files/respect-ldflags.patch          |   12 ++++++++++++
 recipes/libnl/libnl_1.1.bb                         |    5 +++--
 4 files changed, 27 insertions(+), 15 deletions(-)
 delete mode 100644 recipes/libnl/files/local-includes-and-avoid-wrong-ld=
flags.patch
 create mode 100644 recipes/libnl/files/local-includes.patch
 create mode 100644 recipes/libnl/files/respect-ldflags.patch

diff --git a/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.p=
atch b/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch
deleted file mode 100644
index 428df53..0000000
--- a/recipes/libnl/files/local-includes-and-avoid-wrong-ldflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- libnl-1.0-pre8/Makefile.opts.in.orig	2007-11-21 18:25:39.000000000 +=
0100
-+++ libnl-1.0-pre8/Makefile.opts.in	2008-04-04 23:38:40.000000000 +0200
-@@ -10,8 +10,8 @@
- #
-=20
- CC               :=3D @CC@
--CFLAGS           :=3D @CFLAGS@
--LDFLAGS          :=3D @LDFLAGS@
-+CFLAGS           :=3D -I./include -I. -I../include @CFLAGS@
-+LDFLAGS          :=3D
- CPPFLAGS         :=3D @CPPFLAGS@
- PACKAGE_NAME     :=3D @PACKAGE_NAME@
- PACKAGE_VERSION  :=3D @PACKAGE_VERSION@
diff --git a/recipes/libnl/files/local-includes.patch b/recipes/libnl/fil=
es/local-includes.patch
new file mode 100644
index 0000000..85659db
--- /dev/null
+++ b/recipes/libnl/files/local-includes.patch
@@ -0,0 +1,12 @@
+diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
+--- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
++++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
+@@ -10,7 +10,7 @@
+ #
+=20
+ CC               :=3D @CC@
+-CFLAGS           :=3D @CFLAGS@
++CFLAGS           :=3D -I./include -I. -I../include @CFLAGS@
+ LDFLAGS          :=3D @LDFLAGS@
+ CPPFLAGS         :=3D @CPPFLAGS@
+ PACKAGE_NAME     :=3D @PACKAGE_NAME@
diff --git a/recipes/libnl/files/respect-ldflags.patch b/recipes/libnl/fi=
les/respect-ldflags.patch
new file mode 100644
index 0000000..ba97dc6
--- /dev/null
+++ b/recipes/libnl/files/respect-ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
+--- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
++++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
+@@ -48,7 +48,7 @@
+=20
+ $(OUT_SLIB): ../Makefile.opts $(OBJ)
+ 	@echo "  LD $(OUT_SLIB)"; \
+-	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB=
) -lc
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) =
$(LIBNL_LIB) -lc
+ 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
+ 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
+ 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
diff --git a/recipes/libnl/libnl_1.1.bb b/recipes/libnl/libnl_1.1.bb
index dcca3c6..5f2d6f1 100644
--- a/recipes/libnl/libnl_1.1.bb
+++ b/recipes/libnl/libnl_1.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "libnl is a library for applications deal=
ing with netlink sockets"
 SECTION =3D "libs/network"
 LICENSE =3D "LGPL"
 HOMEPAGE =3D "http://people.suug.ch/~tgr/libnl"
-PR =3D "r1"
+PR =3D "r2"
=20
 inherit autotools pkgconfig
=20
@@ -10,8 +10,9 @@ CFLAGS +=3D '-DVLAN_FLAG_REORDER_HDR=3D1'
=20
 SRC_URI =3D "\
   http://people.suug.ch/~tgr/libnl/files/libnl-${PV}.tar.gz \
-  file://local-includes-and-avoid-wrong-ldflags.patch;patch=3D1 \
+  file://local-includes.patch;patch=3D1 \
   file://fix-includes.patch;patch=3D1 \
+  file://respect-ldflags.patch;patch=3D1 \
 "
=20
 do_stage () {
--=20
1.6.2.1



