Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RzOD6-0006u2-0C
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 09:03:00 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A4E9EA6283;
	Mon, 20 Feb 2012 08:54:40 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 08:54:28 +0100
Message-Id: <1329724469-2002-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe 1/2] imagemagick: upgrade to latest stable version
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
X-List-Received-Date: Mon, 20 Feb 2012 08:03:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- 6.4.4 doesn't compile following zlib upgrade to 1.26
- hack configure.ac to remove lzip requirement for autoconf (which
is not present in OE and not needed for compiling imagemagick)

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../imagemagick-6.4.4/PerlMagic_MakePatch.patch    |   11 ------
 .../imagemagick-6.7.5/PerlMagic_MakePatch.patch    |   11 ++++++
 .../imagemagick/imagemagick_6.4.4.bb               |   38 --------------=
------
 .../imagemagick/imagemagick_6.7.5.bb               |   37 ++++++++++++++=
+++++
 4 files changed, 48 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.4.4=
/PerlMagic_MakePatch.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.4.4=
.bb
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.7.5=
.bb

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMa=
gic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.4=
.4/PerlMagic_MakePatch.patch
deleted file mode 100644
index f8ad0af..0000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_Mak=
ePatch.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
-+++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.0000=
00000 +0200
-@@ -87,6 +87,8 @@
-=20
-    # Use same compiler as ImageMagick
-    'PERLMAINCC'	=3D> '@PERLMAINCC@ @OPENMP_CFLAGS@',
-+   'AR' =3D> '@AR@',
-+   'LD' =3D> '@PERLMAINCC@',
-=20
-    # Set Perl installation prefix to ImageMagick installation prefix
- #   'PREFIX'	=3D> '@prefix@',
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMa=
gic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7=
.5/PerlMagic_MakePatch.patch
new file mode 100644
index 0000000..f8ad0af
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_Mak=
ePatch.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
++++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.0000=
00000 +0200
+@@ -87,6 +87,8 @@
+=20
+    # Use same compiler as ImageMagick
+    'PERLMAINCC'	=3D> '@PERLMAINCC@ @OPENMP_CFLAGS@',
++   'AR' =3D> '@AR@',
++   'LD' =3D> '@PERLMAINCC@',
+=20
+    # Set Perl installation prefix to ImageMagick installation prefix
+ #   'PREFIX'	=3D> '@prefix@',
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
deleted file mode 100644
index d5f95c9..0000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "ImageMagick is an image convertion tools"
-SECTION =3D "console/utils"
-LICENSE =3D "ImageMagick"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De1ebcc1358b9f81eba64255fc5da6=
892"
-# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
-DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
-
-PR =3D "r10"
-
-PATCHSET =3D "1"
-SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
-           file://PerlMagic_MakePatch.patch \
-          "
-SRC_URI[md5sum] =3D "882ff241f6ad39655541d5055596f93b"
-SRC_URI[sha256sum] =3D "5a5b2779707bfd9816cf17d8f53d242c05005092da192a89=
8ac10961b3b19dda"
-
-S =3D "${WORKDIR}/ImageMagick-${PV}"
-
-inherit autotools binconfig pkgconfig
-
-EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --w=
ithout-perl --disable-openmp"
-
-FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
-                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-                ${libdir}/ImageMagick-${PV}/config/ \
-                ${datadir}/ImageMagick-${PV}"
-
-FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
-
-FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*=
"
-
-BBCLASSEXTEND =3D "native"
-
-LEAD_SONAME =3D "libMagickCore.so.*"
-
-do_configure_prepend() {
-    export ac_cv_sys_file_offset_bits=3Dyes
-}
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
new file mode 100644
index 0000000..9b8b799
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
@@ -0,0 +1,37 @@
+DESCRIPTION =3D "ImageMagick is an image convertion tools"
+SECTION =3D "console/utils"
+LICENSE =3D "ImageMagick"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D944f66dcedc98d5a4e5d964bd3b32=
e7b"
+# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
+DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
+
+PATCHSET =3D "6"
+SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
+           file://PerlMagic_MakePatch.patch \
+          "
+SRC_URI[md5sum] =3D "bcf07cf0822572fa2b47fa6d506f699a"
+SRC_URI[sha256sum] =3D "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5=
a7dae01e47bdbd80"
+
+S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
+
+inherit autotools binconfig pkgconfig
+
+EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --w=
ithout-perl --disable-openmp"
+
+FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
+                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
+                ${libdir}/ImageMagick-${PV}/config/ \
+                ${datadir}/ImageMagick-${PV}"
+
+FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
+
+FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*=
"
+
+BBCLASSEXTEND =3D "native"
+
+LEAD_SONAME =3D "libMagickCore.so.*"
+
+do_configure_prepend() {
+    export ac_cv_sys_file_offset_bits=3Dyes
+	sed -i -e s:dist-lzip::g ${S}/configure.ac
+}
--=20
1.7.7.6



