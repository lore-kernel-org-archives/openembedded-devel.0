Received: from [212.27.42.4] (helo=smtp4-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LqnpZ-0000CY-MR
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 14:21:40 +0200
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 6B10D4C809F;
	Mon,  6 Apr 2009 14:18:44 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 7F71D4C809B;
	Mon,  6 Apr 2009 14:18:42 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id D7DEE1840D9; Mon,  6 Apr 2009 14:18:44 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 14:18:44 +0200
Message-Id: <1239020324-6909-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.4
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] libmng: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:21:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/libmng/libmng/ldflags.patch |   12 ++++++++++++
 recipes/libmng/libmng_1.0.8.bb      |    9 +++++----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 recipes/libmng/libmng/ldflags.patch

diff --git a/recipes/libmng/libmng/ldflags.patch b/recipes/libmng/libmng/=
ldflags.patch
new file mode 100644
index 0000000..078f552
--- /dev/null
+++ b/recipes/libmng/libmng/ldflags.patch
@@ -0,0 +1,12 @@
+diff -urN libmng-1.0.8.orig/makefiles/makefile.linux libmng-1.0.8/makefi=
les/makefile.linux
+--- libmng-1.0.8.orig/makefiles/makefile.linux	2004-08-06 07:17:40.00000=
0000 +0000
++++ libmng-1.0.8/makefiles/makefile.linux	2009-04-06 11:49:45.000000000 =
+0000
+@@ -105,7 +105,7 @@
+ libmng.so.$(MNGVER): $(OBJSDLL)
+ #	$(CC) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.$(MNGVER) =
\
+ #	$(OBJSDLL) -L$(ZLIBLIB) -L$(JPEGLIB) -L$(LCMSLIB) -lz -lm -lc
+-	$(CC) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.$(MNGVER) \
++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libmng.so.$(MNGMAJ) -o libmng.so.=
$(MNGVER) \
+ 	$(OBJSDLL) -L$(ZLIBLIB) -L$(JPEGLIB) -ljpeg -L$(LCMSLIB) -llcms \
+     -lz -lm -lc
+=20
diff --git a/recipes/libmng/libmng_1.0.8.bb b/recipes/libmng/libmng_1.0.8=
.bb
index 9619cf4..d737e33 100644
--- a/recipes/libmng/libmng_1.0.8.bb
+++ b/recipes/libmng/libmng_1.0.8.bb
@@ -2,7 +2,10 @@ DESCRIPTION =3D "MNG Library"
 SECTION =3D "libs"
 DEPENDS =3D "zlib jpeg lcms"
 LICENSE =3D "libmng"
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/libmng/libmng-${PV}.tar.gz"
+PR =3D "r1"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/libmng/libmng-${PV}.tar.gz \
+           file://ldflags.patch;patch=3D1"
=20
 inherit pkgconfig
=20
@@ -10,13 +13,12 @@ EXTRA_OEMAKE_append =3D " ZLIBINC=3D${STAGING_INCDIR}=
 ZLIBLIB=3D${STAGING_LIBDIR} \
 			JPEGINC=3D JPEGLIB=3D LCMSINC=3D LCMSLIB=3D"
=20
 do_compile() {
-	unset LDFLAGS
 	oe_runmake -f makefiles/makefile.linux
 }
=20
 do_stage() {
 	oe_libinstall -so libmng ${STAGING_LIBDIR}
-        install -m 0644 ${S}/libmng.h ${STAGING_INCDIR}/
+	install -m 0644 ${S}/libmng.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/libmng_conf.h ${STAGING_INCDIR}/
 	install -m 0644 ${S}/libmng_types.h ${STAGING_INCDIR}/
 }
@@ -24,7 +26,6 @@ do_stage() {
 do_install() {
 	install -d ${D}${bindir} ${D}${mandir} \
 		   ${D}${libdir} ${D}${includedir}
-	unset LDFLAGS
 	oe_runmake -f makefiles/makefile.linux install \
 	INCPATH=3D"${D}${includedir}" LIBPATH=3D"${D}${libdir}" prefix=3D${pref=
ix}
 }
--=20
1.6.2.1



