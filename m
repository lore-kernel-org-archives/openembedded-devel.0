Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PLvqE-0000kE-9p
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:47:46 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 0F0C81D36171; Fri, 26 Nov 2010 11:46:29 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 11:46:29 +0100
Message-Id: <1290768389-13294-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mesa: fix build error on uclibc
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
X-List-Received-Date: Fri, 26 Nov 2010 10:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

main/imports.c: In function '_mesa_strtof':
main/imports.c:804:20: error: expected '=3D', ',', ';', 'asm' or '__attri=
bute__' before 'loc'
main/imports.c:804:20: error: 'loc' undeclared (first use in this functio=
n)
main/imports.c:804:20: note: each undeclared identifier is reported only =
once for each function it appears in

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/mesa/mesa-7.8.2.inc                     |    6 ++++++
 recipes/mesa/mesa-7.8.2/uclibc-locale-fix.patch |   13 +++++++++++++
 recipes/mesa/mesa_7.8.2.bb                      |    2 +-
 3 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 recipes/mesa/mesa-7.8.2/uclibc-locale-fix.patch

diff --git a/recipes/mesa/mesa-7.8.2.inc b/recipes/mesa/mesa-7.8.2.inc
index 42d726c..d38b22d 100644
--- a/recipes/mesa/mesa-7.8.2.inc
+++ b/recipes/mesa/mesa-7.8.2.inc
@@ -4,6 +4,12 @@ SRC_URI +=3D " \
             file://glamo.patch \
            "
=20
+UCLIBC_PATCHES +=3D " \
+	file://uclibc-locale-fix.patch \
+	"
+SRC_URI_append_linux-uclibc =3D ${UCLIBC_PATCHES}
+SRC_URI_append_linux-uclibceabi =3D ${UCLIBC_PATCHES}
+
 SRC_URI[archive.md5sum] =3D "6be2d343a0089bfd395ce02aaf8adb57"
 SRC_URI[archive.sha256sum] =3D "505bf418dceba05837f4ea1b1972b9620c35f8cb=
94bc4d1e6d573c15f562576d"
 SRC_URI[demos.md5sum] =3D "757d9e2e06f48b1a52848be9b0307ced"
diff --git a/recipes/mesa/mesa-7.8.2/uclibc-locale-fix.patch b/recipes/me=
sa/mesa-7.8.2/uclibc-locale-fix.patch
new file mode 100644
index 0000000..e05f927
--- /dev/null
+++ b/recipes/mesa/mesa-7.8.2/uclibc-locale-fix.patch
@@ -0,0 +1,13 @@
+Index: Mesa-7.8.2/src/mesa/main/imports.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- Mesa-7.8.2.orig/src/mesa/main/imports.c	2010-11-26 07:52:49.40687900=
1 +0100
++++ Mesa-7.8.2/src/mesa/main/imports.c	2010-11-26 07:54:11.846879005 +01=
00
+@@ -800,7 +800,7 @@
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#ifdef _GNU_SOURCE
++#if defined(_GNU_SOURCE) && defined(__UCLIBC_HAS_LOCALE__)
+    static locale_t loc =3D NULL;
+    if (!loc) {
+       loc =3D newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/recipes/mesa/mesa_7.8.2.bb b/recipes/mesa/mesa_7.8.2.bb
index bbd0c41..48aa0ba 100644
--- a/recipes/mesa/mesa_7.8.2.bb
+++ b/recipes/mesa/mesa_7.8.2.bb
@@ -3,6 +3,6 @@ require mesa-dri_${PV}.bb
=20
 FILESPATHPKG =3D. "mesa-dri-${PV}:"
=20
-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.2"
=20
 EXTRA_OECONF +=3D "--disable-egl"
--=20
1.7.0.4



