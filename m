Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMUu-0001Li-9j
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:40 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 2ED1C18937D; Thu,  2 Apr 2009 14:58:03 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:03 +0200
Message-Id: <1238677083-16873-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] libmikmod: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/libmikmod/libmikmod/ldflags.patch |   12 ++++++++++++
 recipes/libmikmod/libmikmod_3.1.12.bb     |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/libmikmod/libmikmod/ldflags.patch

diff --git a/recipes/libmikmod/libmikmod/ldflags.patch b/recipes/libmikmo=
d/libmikmod/ldflags.patch
new file mode 100644
index 0000000..4261379
--- /dev/null
+++ b/recipes/libmikmod/libmikmod/ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN libmikmod-3.1.12.orig/libmikmod/Makefile.in libmikmod-3.1.12/l=
ibmikmod/Makefile.in
+--- libmikmod-3.1.12.orig/libmikmod/Makefile.in	2004-01-21 17:43:52.0000=
00000 +0000
++++ libmikmod-3.1.12/libmikmod/Makefile.in	2009-04-02 11:28:01.000000000=
 +0000
+@@ -72,7 +72,7 @@
+ 	rm -f Makefile
+=20
+ $(LIB): $(OBJ)
+-	$(LIBTOOL) --mode=3Dlink $(CC) -version-info 2:4:0 -o $@ $(OBJ) $(LIBR=
ARY_LIB) -rpath $(DESTDIR)$(libdir)
++	$(LIBTOOL) --mode=3Dlink $(CC) $(LDFLAGS) -version-info 2:4:0 -o $@ $(=
OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
+=20
+ dl_hpux.lo:	$(top_srcdir)/dlapi/dl_hpux.c \
+ 			$(top_srcdir)/dlapi/dlfcn.h
diff --git a/recipes/libmikmod/libmikmod_3.1.12.bb b/recipes/libmikmod/li=
bmikmod_3.1.12.bb
index f1ed9d6..eabdad4 100644
--- a/recipes/libmikmod/libmikmod_3.1.12.bb
+++ b/recipes/libmikmod/libmikmod_3.1.12.bb
@@ -2,12 +2,13 @@ DESCRIPTION =3D "libmikmod is a module player library s=
upporting many formats, inc
 SECTION =3D "libs"
 PRIORITY =3D "optional"
 LICENSE =3D "LGPL"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "\
   ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \
   file://m4.patch;patch=3D1 \
   file://autofoo.patch;patch=3D1 \
+  file://ldflags.patch;patch=3D1 \
 "
=20
 inherit autotools binconfig
--=20
1.5.6.5



