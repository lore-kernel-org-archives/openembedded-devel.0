Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OocM3-0001GX-Il
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 15:18:58 +0200
Received: (qmail invoked by alias); 26 Aug 2010 13:11:48 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp023) with SMTP; 26 Aug 2010 15:11:48 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/uwI5ZA27ufHDf0412gEH8ZCQZRe20bwcGETJd7M
	8XGUCTUahUaaYd
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 15:01:03 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201008261501.03967.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH2/2] clutter*: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Thu, 26 Aug 2010 13:18:59 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46rom bfce18ac13b6fe40a26aec110c26441f9350ed28 Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Thu, 26 Aug 2010 14:38:30 +0200
Subject: [PATCH] clutter*: Remove obsolete recipes / files


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 recipes/clutter/clutter-0.9_git.bb                 |   23 -----
 recipes/clutter/clutter-1.0_1.0.10.bb              |   22 ----
 recipes/clutter/clutter-box2d/introspection.diff   |   31 ------
 recipes/clutter/clutter-box2d_0.10.0.bb            |    9 --
 recipes/clutter/clutter-cairo.inc                  |   11 --
 .../clutter/clutter-cairo/enable_examples.patch    |   28 ------
 recipes/clutter/clutter-cairo_svn.bb               |   11 --
 recipes/clutter/clutter-fpu.inc                    |    6 -
 recipes/clutter/clutter-glx_svn.bb                 |   10 --
 recipes/clutter/clutter-gst-0.9_git.bb             |   13 ---
 recipes/clutter/clutter-gst/autofoo-0.4.patch      |   15 ---
 recipes/clutter/clutter-gst/autofoo.patch          |   25 -----
 recipes/clutter/clutter-gst_0.4svn.bb              |    9 --
 recipes/clutter/clutter-gst_svn.bb                 |    9 --
 recipes/clutter/clutter-gtk-0.6_git.bb             |   10 --
 recipes/clutter/clutter-gtk-0.8_git.bb             |   10 --
 recipes/clutter/clutter/enable-tests-r2990.patch   |   50 ----------
 recipes/clutter/clutter/enable_tests-0.4.patch     |   52 ----------
 recipes/clutter/clutter/enable_tests-0.6.patch     |   40 --------
 recipes/clutter/clutter/enable_tests.patch         |   48 ---------
 recipes/clutter/clutter_0.4svn.bb                  |   15 ---
 recipes/clutter/clutter_0.6svn.bb                  |   10 --
 recipes/clutter/clutter_0.8+git.bb                 |   15 ---
 recipes/clutter/clutter_svn.bb                     |   15 ---
 ...st-videosink-guard-GL-calls-with-ifdef-CL.patch |  102 ----------------=
=2D---
 recipes/clutter/files/enable_tests.patch           |   32 ------
 26 files changed, 0 insertions(+), 621 deletions(-)
 delete mode 100644 recipes/clutter/clutter-0.9_git.bb
 delete mode 100644 recipes/clutter/clutter-1.0_1.0.10.bb
 delete mode 100644 recipes/clutter/clutter-box2d/introspection.diff
 delete mode 100644 recipes/clutter/clutter-box2d_0.10.0.bb
 delete mode 100644 recipes/clutter/clutter-cairo.inc
 delete mode 100644 recipes/clutter/clutter-cairo/enable_examples.patch
 delete mode 100644 recipes/clutter/clutter-cairo_svn.bb
 delete mode 100644 recipes/clutter/clutter-fpu.inc
 delete mode 100644 recipes/clutter/clutter-glx_svn.bb
 delete mode 100644 recipes/clutter/clutter-gst-0.9_git.bb
 delete mode 100644 recipes/clutter/clutter-gst/autofoo-0.4.patch
 delete mode 100644 recipes/clutter/clutter-gst/autofoo.patch
 delete mode 100644 recipes/clutter/clutter-gst_0.4svn.bb
 delete mode 100644 recipes/clutter/clutter-gst_svn.bb
 delete mode 100644 recipes/clutter/clutter-gtk-0.6_git.bb
 delete mode 100644 recipes/clutter/clutter-gtk-0.8_git.bb
 delete mode 100644 recipes/clutter/clutter/enable-tests-r2990.patch
 delete mode 100644 recipes/clutter/clutter/enable_tests-0.4.patch
 delete mode 100644 recipes/clutter/clutter/enable_tests-0.6.patch
 delete mode 100644 recipes/clutter/clutter/enable_tests.patch
 delete mode 100644 recipes/clutter/clutter_0.4svn.bb
 delete mode 100644 recipes/clutter/clutter_0.6svn.bb
 delete mode 100644 recipes/clutter/clutter_0.8+git.bb
 delete mode 100644 recipes/clutter/clutter_svn.bb
 delete mode 100644 recipes/clutter/files/0001-clutter-gst-videosink-guard-=
GL-calls-with-ifdef-CL.patch
 delete mode 100644 recipes/clutter/files/enable_tests.patch

diff --git a/recipes/clutter/clutter-0.9_git.bb b/recipes/clutter/clutter-0=
=2E9_git.bb
deleted file mode 100644
index 5bbd8a8..0000000
=2D-- a/recipes/clutter/clutter-0.9_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
=2Drequire clutter.inc
=2D
=2DSRCREV =3D "13e055a351f83c56b895b131566a6e842d24ed2a"
=2D
=2DPV =3D "1.1.0"
=2DPR =3D "${INC_PR}.0"
=2DPR_append =3D "+git${SRCREV}"
=2D
=2DSRC_URI =3D "git://git.clutter-project.org/clutter.git;protocol=3Dgit \
=2D           file://enable_tests.patch "
=2DS =3D "${WORKDIR}/git"
=2D
=2DBASE_CONF +=3D "--disable-introspection"
=2D
=2DPARALLEL_MAKE =3D ""
=2D
=2Ddo_compile_prepend() {
=2D	for i in $(find ${S} -name Makefile) ; do
=2D		sed -i -e s:-Werror::g $i
=2D	done
=2D    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i =
; done )
=2D}
=2D
diff --git a/recipes/clutter/clutter-1.0_1.0.10.bb b/recipes/clutter/clutte=
r-1.0_1.0.10.bb
deleted file mode 100644
index 93fb893..0000000
=2D-- a/recipes/clutter/clutter-1.0_1.0.10.bb
+++ /dev/null
@@ -1,22 +0,0 @@
=2Drequire clutter.inc
=2D
=2DPR =3D "${INC_PR}.0"
=2D
=2DSRC_URI =3D "http://source.clutter-project.org/sources/clutter/1.0/clutt=
er-${PV}.tar.bz2 \
=2D"
=2DSRC_URI[md5sum] =3D "bf48e85291cba33f3f149f4eefe759f0"
=2DSRC_URI[sha256sum] =3D "6fb98dc4d16a3a98be734cf0a6cc4f8d8179800603c3e410=
11c414eeaf1f456b"
=2D
=2DS =3D "${WORKDIR}/clutter-${PV}"
=2D
=2DBASE_CONF +=3D "--disable-introspection"
=2D
=2DPARALLEL_MAKE =3D ""
=2D
=2Ddo_compile_prepend() {
=2D	for i in $(find ${S} -name Makefile) ; do
=2D		sed -i -e s:-Werror::g $i
=2D	done
=2D    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i =
; done )
=2D}
=2D
diff --git a/recipes/clutter/clutter-box2d/introspection.diff b/recipes/clu=
tter/clutter-box2d/introspection.diff
deleted file mode 100644
index e38b837..0000000
=2D-- a/recipes/clutter/clutter-box2d/introspection.diff
+++ /dev/null
@@ -1,31 +0,0 @@
=2DFrom dae84a82efe22b284cba8ca1985ce14bb4e86c99 Mon Sep 17 00:00:00 2001
=2DFrom: Damien Lespiau <damien.lespiau@intel.com>
=2DDate: Mon, 03 Aug 2009 10:47:41 +0000
=2DSubject: [build] Don't build introspection stuff when configure said we =
can't
=2D
=2DSurround the instrospection file generation with if HAVE_INTROSPECTION /
=2Dendif
=2D---
=2Ddiff --git a/clutter-box2d/Makefile.am b/clutter-box2d/Makefile.am
=2Dindex 8da23a7..6db8aae 100644
=2D--- a/clutter-box2d/Makefile.am
=2D+++ b/clutter-box2d/Makefile.am
=2D@@ -39,6 +39,8 @@ DISTCLEANFILES =3D $(MARSHALFILES)
=2D EXTRA_DIST =3D \
=2D 	clutter-box2d-marshal.list
=2D=20
=2D+if HAVE_INTROSPECTION
=2D+
=2D BUILT_GIRSOURCES =3D
=2D=20
=2D ClutterBox2D-@CLUTTER_BOX2D_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libclutter-box2d-@CLUTTER_BOX2D_API_VERSION@.la
=2D@@ -68,5 +70,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.typelib)
=2D %.typelib: %.gir $(INTROSPECTION_COMPILER)
=2D 	$(QUIET_GEN)$(DEBUG) $(INTROSPECTION_COMPILER) --includedir=3D$(srcdir=
) --includedir=3D. $(INTROSPECTION_COMPILER_OPTS) $< -o $(builddir)/$(@F)
=2D=20
=2D+endif # HAVE_INTROSPECTION
=2D+
=2D CLEANFILES=3D
=2D CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)
=2D--
=2Dcgit v0.8.3.1-30-gff3a
diff --git a/recipes/clutter/clutter-box2d_0.10.0.bb b/recipes/clutter/clut=
ter-box2d_0.10.0.bb
deleted file mode 100644
index 5f3a063..0000000
=2D-- a/recipes/clutter/clutter-box2d_0.10.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
=2Drequire clutter-box2d.inc
=2D
=2DSRC_URI =3D "http://source.clutter-project.org/sources/clutter-box2d/0.1=
0/clutter-box2d-${PV}.tar.bz2 \
=2D           file://introspection.diff \
=2D"
=2D
=2DSRC_URI[md5sum] =3D "51618976ca6a5d536c4eac5f0e120d9d"
=2DSRC_URI[sha256sum] =3D "1e42d0cea429e4dc953a1f652672dbd322b3938846e99bab=
35f463de6fd8ae7f"
=2D
diff --git a/recipes/clutter/clutter-cairo.inc b/recipes/clutter/clutter-ca=
iro.inc
deleted file mode 100644
index 5c6d7e7..0000000
=2D-- a/recipes/clutter/clutter-cairo.inc
+++ /dev/null
@@ -1,11 +0,0 @@
=2DDESCRIPTION =3D "Clutter Cairo"
=2DHOMEPAGE =3D "http://www.clutter-project.org/"
=2DLICENSE =3D "LGPL"
=2D
=2DDEPENDS =3D "clutter cairo"
=2D
=2DPACKAGES =3D+ "${PN}-examples"
=2DFILES_${PN}-examples =3D "${bindir}/flowers ${bindir}/clock"
=2D
=2Dinherit autotools pkgconfig
=2D
diff --git a/recipes/clutter/clutter-cairo/enable_examples.patch b/recipes/=
clutter/clutter-cairo/enable_examples.patch
deleted file mode 100644
index c5ed63f..0000000
=2D-- a/recipes/clutter/clutter-cairo/enable_examples.patch
+++ /dev/null
@@ -1,28 +0,0 @@
=2D---
=2D examples/Makefile.am |    2 +-
=2D examples/flowers.c   |    2 +-
=2D 2 files changed, 2 insertions(+), 2 deletions(-)
=2D
=2DIndex: clutter-cairo/examples/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-cairo.orig/examples/Makefile.am	2008-08-11 16:30:04.00000000=
0 +0100
=2D+++ clutter-cairo/examples/Makefile.am	2008-08-11 16:30:24.000000000 +01=
00
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D clock flowers bubbles
=2D+bin_PROGRAMS =3D clock flowers bubbles
=2D=20
=2D INCLUDES =3D -I$(top_srcdir)/ @GCC_FLAGS@ @DEPS_CFLAGS@
=2D AM_LDFLAGS =3D @DEPS_LIBS@ $(top_builddir)/libclutter-cairo-@CLUTTER_CA=
IRO_MAJORMINOR@.la=20
=2DIndex: clutter-cairo/examples/flowers.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-cairo.orig/examples/flowers.c	2008-08-11 16:30:04.000000000 =
+0100
=2D+++ clutter-cairo/examples/flowers.c	2008-08-11 16:30:10.000000000 +0100
=2D@@ -11,7 +11,7 @@
=2D=20
=2D #define PETAL_MIN 20
=2D #define PETAL_VAR 40
=2D-#define N_FLOWERS 40 /* reduce if you have a small card */
=2D+#define N_FLOWERS 8 /* reduce if you have a small card */
=2D=20
=2D typedef struct Flower
=2D {
diff --git a/recipes/clutter/clutter-cairo_svn.bb b/recipes/clutter/clutter=
=2Dcairo_svn.bb
deleted file mode 100644
index db270c1..0000000
=2D-- a/recipes/clutter/clutter-cairo_svn.bb
+++ /dev/null
@@ -1,11 +0,0 @@
=2Drequire clutter-cairo.inc
=2D
=2DPV =3D "0.8.0+svnr${SRCPV}"
=2DSRCREV =3D "3210"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};pro=
to=3Dhttp \
=2D           file://enable_examples.patch"
=2D
=2DS =3D "${WORKDIR}/${PN}"
=2D
=2D
diff --git a/recipes/clutter/clutter-fpu.inc b/recipes/clutter/clutter-fpu.=
inc
deleted file mode 100644
index 21a16fe..0000000
=2D-- a/recipes/clutter/clutter-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
=2D
=2Ddef get_clutter_fpu_setting(bb, d):
=2D	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
=2D		return "--without-fpu"
=2D	return ""
=2D
diff --git a/recipes/clutter/clutter-glx_svn.bb b/recipes/clutter/clutter-g=
lx_svn.bb
deleted file mode 100644
index 0590330..0000000
=2D-- a/recipes/clutter/clutter-glx_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
=2Drequire clutter.inc
=2D
=2DPV =3D "0.3.1+svn${SRCDATE}"
=2DPR =3D "${INC_PR}.0"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3Dclutter;p=
roto=3Dhttp"
=2D
=2DS =3D "${WORKDIR}/clutter"
=2D
=2D
diff --git a/recipes/clutter/clutter-gst-0.9_git.bb b/recipes/clutter/clutt=
er-gst-0.9_git.bb
deleted file mode 100644
index 3bf7d48..0000000
=2D-- a/recipes/clutter/clutter-gst-0.9_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
=2Drequire clutter-gst.inc
=2D
=2DDEPENDS =3D "clutter-0.9 gstreamer gst-plugins-base"
=2D
=2DSRCREV =3D "379b63b013af463210e54470693aedfa9009f4dc"
=2DPV =3D "0.9.0"
=2DPR =3D "r4"
=2DPR_append =3D "+git${SRCREV}"
=2D
=2DSRC_URI =3D "git://git.clutter-project.org/clutter-gst.git;protocol=3Dgi=
t \
=2D           file://gtk-doc.make"
=2D
=2DS =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter-gst/autofoo-0.4.patch b/recipes/clutte=
r/clutter-gst/autofoo-0.4.patch
deleted file mode 100644
index 54df63d..0000000
=2D-- a/recipes/clutter/clutter-gst/autofoo-0.4.patch
+++ /dev/null
@@ -1,15 +0,0 @@
=2D---
=2D doc/reference/Makefile.am |    2 +-
=2D examples/Makefile.am      |    2 +-
=2D 2 files changed, 2 insertions(+), 2 deletions(-)
=2D
=2DIndex: clutter-gst/examples/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 =
+0000
=2D+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D video-player video-sink audio
=2D+bin_PROGRAMS =3D video-player video-sink audio
=2D=20
=2D INCLUDES =3D -I$(top_srcdir)/
=2D=20
diff --git a/recipes/clutter/clutter-gst/autofoo.patch b/recipes/clutter/cl=
utter-gst/autofoo.patch
deleted file mode 100644
index 569b0d8..0000000
=2D-- a/recipes/clutter/clutter-gst/autofoo.patch
+++ /dev/null
@@ -1,25 +0,0 @@
=2D---
=2D doc/reference/Makefile.am |    2 +-
=2D examples/Makefile.am      |    2 +-
=2D 2 files changed, 2 insertions(+), 2 deletions(-)
=2D
=2DIndex: clutter-gst/examples/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 =
+0000
=2D+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D video-player video-sink audio
=2D+bin_PROGRAMS =3D video-player video-sink audio
=2D=20
=2D INCLUDES =3D -I$(top_srcdir)/
=2D=20
=2DIndex: clutter-gst/doc/reference/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-gst.orig/doc/reference/Makefile.am	2007-11-06 19:36:56.00000=
0000 +0000
=2D+++ clutter-gst/doc/reference/Makefile.am	2007-11-06 19:37:02.000000000 =
+0000
=2D@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
=2D=20
=2D # Other files to distribute
=2D # e.g. EXTRA_DIST +=3D version.xml.in
=2D-EXTRA_DIST +=3D version.xml.in
=2D+EXTRA_DIST =3D version.xml.in
diff --git a/recipes/clutter/clutter-gst_0.4svn.bb b/recipes/clutter/clutte=
r-gst_0.4svn.bb
deleted file mode 100644
index 35f94c2..0000000
=2D-- a/recipes/clutter/clutter-gst_0.4svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
=2Drequire clutter-gst.inc
=2D
=2DPV =3D "0.4.0+svnr${SRCPV}"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutte=
r-gst-0-4;proto=3Dhttp \
=2D           file://autofoo-0.4.patch"
=2D
=2D
=2DS =3D "${WORKDIR}/clutter-gst-0-4"
diff --git a/recipes/clutter/clutter-gst_svn.bb b/recipes/clutter/clutter-g=
st_svn.bb
deleted file mode 100644
index 42dc2d8..0000000
=2D-- a/recipes/clutter/clutter-gst_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
=2Drequire clutter-gst.inc
=2D
=2DPV =3D "0.8.0+svnr${SRCPV}"
=2DSRCREV =3D "3188"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};pro=
to=3Dhttp \
=2D           file://autofoo.patch"
=2D
=2DS =3D "${WORKDIR}/${PN}"
diff --git a/recipes/clutter/clutter-gtk-0.6_git.bb b/recipes/clutter/clutt=
er-gtk-0.6_git.bb
deleted file mode 100644
index e37c4c9..0000000
=2D-- a/recipes/clutter/clutter-gtk-0.6_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
=2Drequire clutter-gtk.inc
=2D
=2DSRCREV =3D "2ba362a1a223c2b28541030a80aa11191615340a"
=2DPV =3D "0.6.0+git${SRCREV}"
=2D
=2DDEPENDS +=3D "clutter-0.6"
=2D
=2DSRC_URI =3D "git://git.clutter-project.org/clutter-gtk.git;protocol=3Dgi=
t;branch=3Dclutter-gtk-0-6"
=2D
=2DS =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter-gtk-0.8_git.bb b/recipes/clutter/clutt=
er-gtk-0.8_git.bb
deleted file mode 100644
index b06e266..0000000
=2D-- a/recipes/clutter/clutter-gtk-0.8_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
=2Drequire clutter-gtk.inc
=2D
=2DSRCREV =3D "7d3c3230376e731c06c21afa9d8c1d44dbea27cd"
=2DPV =3D "0.8.0+git${SRCREV}"
=2D
=2DDEPENDS +=3D "clutter"
=2D
=2DSRC_URI =3D "git://git.clutter-project.org/clutter-gtk.git;protocol=3Dgi=
t;branch=3Dclutter-gtk-0-8"
=2D
=2DS =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter/enable-tests-r2990.patch b/recipes/clu=
tter/clutter/enable-tests-r2990.patch
deleted file mode 100644
index 4f449b1..0000000
=2D-- a/recipes/clutter/clutter/enable-tests-r2990.patch
+++ /dev/null
@@ -1,50 +0,0 @@
=2D---
=2D tests/Makefile.am   |    7 ++++++-
=2D tests/test-actors.c |    2 +-
=2D tests/test-text.c   |    2 +-
=2D 3 files changed, 8 insertions(+), 3 deletions(-)
=2D
=2DIndex: clutter/tests/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
=2D+++ clutter/tests/Makefile.am	2008-06-26 16:46:50.000000000 +0100
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale=
 \
=2D+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
=2D                   test-actors test-behave test-text test-entry test-pro=
ject \
=2D 		  test-perspective test-rotate test-depth \
=2D 		  test-threads test-timeline test-timeline-dup-frames \
=2D@@ -17,8 +17,8 @@
=2D 		  test-invariants
=2D=20
=2D if X11_TESTS
=2D-noinst_PROGRAMS +=3D test-pixmap
=2D-noinst_PROGRAMS +=3D test-devices
=2D+bin_PROGRAMS +=3D test-pixmap
=2D+bin_PROGRAMS +=3D test-devices
=2D endif
=2D=20
=2D INCLUDES =3D -I$(top_srcdir)/ -I$(top_srcdir)/clutter -I$(top_builddir)=
/clutter
=2D@@ -73,4 +73,9 @@
=2D test_invariants_SOURCES           =3D test-invariants.c
=2D test_devices_SOURCES              =3D test-devices.c
=2D=20
=2D+test_textdir           =3D $(pkgdatadir)
=2D+test_text_DATA         =3D test-text.c
=2D+test_actorsdir         =3D $(pkgdatadir)
=2D+test_actors_DATA       =3D redhand.png
=2D+
=2D EXTRA_DIST =3D redhand.png test-script.json
=2DIndex: clutter/tests/test-actors.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/test-actors.c	2008-06-26 16:46:26.000000000 +0100
=2D+++ clutter/tests/test-actors.c	2008-06-26 16:46:31.000000000 +0100
=2D@@ -195,7 +195,7 @@
=2D       /* Create a texture from file, then clone in to same resources */
=2D       if (i =3D=3D 0)
=2D 	{
=2D-	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("redhand.png",
=2D+	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("/usr/share/clut=
ter/redhand.png",
=2D 							    &error)) =3D=3D NULL)
=2D 	    {
=2D 	      g_error ("image load failed: %s", error->message);
diff --git a/recipes/clutter/clutter/enable_tests-0.4.patch b/recipes/clutt=
er/clutter/enable_tests-0.4.patch
deleted file mode 100644
index 3178a2c..0000000
=2D-- a/recipes/clutter/clutter/enable_tests-0.4.patch
+++ /dev/null
@@ -1,52 +0,0 @@
=2D---
=2D tests/Makefile.am   |    7 ++++++-
=2D tests/test-actors.c |    2 +-
=2D tests/test-text.c   |    2 +-
=2D 3 files changed, 8 insertions(+), 3 deletions(-)
=2D
=2DIndex: clutter-0-4/tests/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-0-4.orig/tests/Makefile.am	2007-11-06 21:49:25.000000000 +00=
00
=2D+++ clutter-0-4/tests/Makefile.am	2007-11-06 21:49:48.000000000 +0000
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale=
 \
=2D+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
=2D                   test-actors test-behave test-text test-entry test-pro=
ject \
=2D 		  test-boxes test-perspective test-rotate test-depth \
=2D 		  test-threads test-timeline
=2D@@ -24,4 +24,9 @@ test_depth_SOURCES     =3D test-depth.c
=2D test_threads_SOURCES   =3D test-threads.c
=2D test_timeline_SOURCES  =3D test-timeline.c
=2D=20
=2D+test_textdir           =3D $(pkgdatadir)
=2D+test_text_DATA         =3D test-text.c
=2D+test_actorsdir         =3D $(pkgdatadir)
=2D+test_actors_DATA       =3D redhand.png
=2D+
=2D EXTRA_DIST =3D redhand.png
=2DIndex: clutter-0-4/tests/test-actors.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-0-4.orig/tests/test-actors.c	2007-11-06 21:49:25.000000000 +=
0000
=2D+++ clutter-0-4/tests/test-actors.c	2007-11-06 21:49:28.000000000 +0000
=2D@@ -143,7 +143,7 @@ main (int argc, char *argv[])
=2D   stage =3D clutter_stage_get_default ();
=2D   clutter_actor_set_size (stage, 800, 600);
=2D=20
=2D-  pixbuf =3D gdk_pixbuf_new_from_file ("redhand.png", NULL);
=2D+  pixbuf =3D gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png"=
, NULL);
=2D=20
=2D   if (!pixbuf)
=2D     g_error("pixbuf load failed");
=2DIndex: clutter-0-4/tests/test-text.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter-0-4.orig/tests/test-text.c	2007-11-06 21:49:25.000000000 +00=
00
=2D+++ clutter-0-4/tests/test-text.c	2007-11-06 21:49:28.000000000 +0000
=2D@@ -27,7 +27,7 @@ main (int argc, char *argv[])
=2D=20
=2D   stage =3D clutter_stage_get_default ();
=2D=20
=2D-  if (!g_file_get_contents ("test-text.c", &text, &size, NULL))=20
=2D+  if (!g_file_get_contents ("/usr/share/clutter/test-text.c", &text, &s=
ize, NULL))
=2D     g_error("g_file_get_contents() of test-text.c failed");
=2D=20
=2D   clutter_actor_set_size (stage, 800, 600);
diff --git a/recipes/clutter/clutter/enable_tests-0.6.patch b/recipes/clutt=
er/clutter/enable_tests-0.6.patch
deleted file mode 100644
index 544a7e5..0000000
=2D-- a/recipes/clutter/clutter/enable_tests-0.6.patch
+++ /dev/null
@@ -1,40 +0,0 @@
=2D---
=2D tests/Makefile.am   |    7 ++++++-
=2D tests/test-actors.c |    2 +-
=2D tests/test-text.c   |    2 +-
=2D 3 files changed, 8 insertions(+), 3 deletions(-)
=2D
=2DIndex: clutter-0-6/tests/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
=2D+++ clutter-0-6/tests/Makefile.am	2007-11-06 12:30:11.000000000 +0000
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale=
 \
=2D+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
=2D                   test-actors test-behave test-text test-entry test-pro=
ject \
=2D 		  test-boxes test-perspective test-rotate test-depth \
=2D 		  test-threads test-timeline test-score test-script
=2D@@ -26,4 +26,9 @@ test_timeline_SOURCES  =3D test-timeline.c
=2D test_score_SOURCES     =3D test-score.c
=2D test_script_SOURCES    =3D test-script.c
=2D=20
=2D+test_textdir           =3D $(pkgdatadir)
=2D+test_text_DATA         =3D test-text.c
=2D+test_actorsdir         =3D $(pkgdatadir)
=2D+test_actors_DATA       =3D redhand.png
=2D+
=2D EXTRA_DIST =3D redhand.png test-script.json
=2DIndex: clutter-0-6/tests/test-actors.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/test-actors.c	2007-11-06 12:29:17.000000000 +0000
=2D+++ clutter-0-6/tests/test-actors.c	2007-11-06 12:29:21.000000000 +0000
=2D@@ -143,7 +143,7 @@ main (int argc, char *argv[])
=2D   stage =3D clutter_stage_get_default ();
=2D   clutter_actor_set_size (stage, 800, 600);
=2D=20
=2D-  pixbuf =3D gdk_pixbuf_new_from_file ("redhand.png", NULL);
=2D+  pixbuf =3D gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png"=
, NULL);
=2D=20
=2D   if (!pixbuf)
=2D     g_error("pixbuf load failed");
=2D
diff --git a/recipes/clutter/clutter/enable_tests.patch b/recipes/clutter/c=
lutter/enable_tests.patch
deleted file mode 100644
index 4a99968..0000000
=2D-- a/recipes/clutter/clutter/enable_tests.patch
+++ /dev/null
@@ -1,48 +0,0 @@
=2D---
=2D tests/Makefile.am   |    7 ++++++-
=2D tests/test-actors.c |    2 +-
=2D tests/test-text.c   |    2 +-
=2D 3 files changed, 8 insertions(+), 3 deletions(-)
=2D
=2DIndex: clutter/tests/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/Makefile.am	2008-04-25 16:45:17.000000000 +0100
=2D+++ clutter/tests/Makefile.am	2008-04-25 16:47:12.000000000 +0100
=2D@@ -1,4 +1,4 @@
=2D-noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale=
 \
=2D+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
=2D                   test-actors test-behave test-text test-entry test-pro=
ject \
=2D 		  test-perspective test-rotate test-depth \
=2D 		  test-threads test-timeline test-timeline-dup-frames \
=2D@@ -14,7 +14,7 @@
=2D 		  test-cogl-tex-polygon test-stage-read-pixels
=2D=20
=2D if X11_TESTS
=2D-noinst_PROGRAMS +=3D test-pixmap
=2D+bin_PROGRAMS +=3D test-pixmap
=2D endif
=2D=20
=2D INCLUDES =3D -I$(top_srcdir)/ -I$(top_builddir)/clutter
=2D@@ -61,4 +61,9 @@
=2D test_cogl_offscreen_SOURCES   =3D test-cogl-offscreen.c
=2D test_stage_read_pixels_SOURCES =3D test-stage-read-pixels.c
=2D=20
=2D+test_textdir           =3D $(pkgdatadir)
=2D+test_text_DATA         =3D test-text.c
=2D+test_actorsdir         =3D $(pkgdatadir)
=2D+test_actors_DATA       =3D redhand.png
=2D+
=2D EXTRA_DIST =3D redhand.png test-script.json
=2DIndex: clutter/tests/test-actors.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- clutter.orig/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
=2D+++ clutter/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
=2D@@ -184,7 +184,7 @@
=2D       /* Create a texture from file, then clone in to same resources */
=2D       if (i =3D=3D 0)
=2D 	{
=2D-	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("redhand.png",
=2D+	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("/usr/share/clut=
ter/redhand.png",
=2D 							    &error)) =3D=3D NULL)
=2D 	    {
=2D 	      g_error ("image load failed: %s", error->message);
diff --git a/recipes/clutter/clutter_0.4svn.bb b/recipes/clutter/clutter_0.=
4svn.bb
deleted file mode 100644
index 9399180..0000000
=2D-- a/recipes/clutter/clutter_0.4svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
=2Drequire clutter.inc
=2D
=2DPV =3D "0.4.0+svnr${SRCPV}"
=2DPR =3D "${INC_PR}.0"
=2DSRCREV =3D "3240"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutte=
r-0-4;proto=3Dhttp \
=2D	   file://enable_tests-0.4.patch "
=2D
=2DS =3D "${WORKDIR}/clutter-0-4"
=2D
=2Ddo_stage () {
=2D        cp ${S}/clutter.pc ${S}/clutter-0.4.pc
=2D        autotools_stage_all
=2D}
diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_0.=
6svn.bb
deleted file mode 100644
index e86cbaf..0000000
=2D-- a/recipes/clutter/clutter_0.6svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
=2Drequire clutter.inc
=2D
=2DPV =3D "0.6.0+svnr${SRCPV}"
=2DPR =3D "${INC_PR}.0"
=2DSRCREV =3D "3240"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutte=
r-0-6;proto=3Dhttp \
=2D	   file://enable_tests-0.6.patch "
=2D
=2DS =3D "${WORKDIR}/clutter-0-6"
diff --git a/recipes/clutter/clutter_0.8+git.bb b/recipes/clutter/clutter_0=
=2E8+git.bb
deleted file mode 100644
index 692154d..0000000
=2D-- a/recipes/clutter/clutter_0.8+git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
=2Drequire clutter.inc
=2D
=2DCLUTTER_REV =3D "af16378899699376fe7e84c7c11eb3bb5c4668cd"
=2D
=2DPV =3D "0.8.8"
=2DPR =3D "${INC_PR}.0"
=2DPR_append =3D "+gitr${CLUTTER_REV}"
=2D
=2DSRC_URI =3D "git://git.clutter-project.org/clutter.git;protocol=3Dgit;br=
anch=3Dclutter-0-8;rev=3D${CLUTTER_REV} \
=2D           file://enable-tests-r2990.patch"
=2D
=2DS =3D "${WORKDIR}/git"
=2D
=2D
=2DARM_INSTRUCTION_SET =3D "arm"
diff --git a/recipes/clutter/clutter_svn.bb b/recipes/clutter/clutter_svn.bb
deleted file mode 100644
index f2cd50b..0000000
=2D-- a/recipes/clutter/clutter_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
=2Drequire clutter.inc
=2D
=2DDEFAULT_PREFERENCE =3D "-1"
=2D
=2DPV =3D "0.8.0+svnr${SRCPV}"
=2DPR =3D "${INC_PR}.0"
=2DSRCREV =3D "3240"
=2D
=2DSRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3Dclutter;p=
roto=3Dhttp \
=2D           file://enable_tests.patch;maxrev=3D2989 \
=2D           file://enable-tests-r2990.patch;minrev=3D2990"
=2D
=2DS =3D "${WORKDIR}/clutter"
=2D
=2D
diff --git a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-call=
s-with-ifdef-CL.patch b/recipes/clutter/files/0001-clutter-gst-videosink-gu=
ard-GL-calls-with-ifdef-CL.patch
deleted file mode 100644
index e373bca..0000000
=2D-- a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-wit=
h-ifdef-CL.patch
+++ /dev/null
@@ -1,102 +0,0 @@
=2DFrom 0677f1e6b5221caf78d50d94d2d0611e7f4b0abc Mon Sep 17 00:00:00 2001
=2DFrom: Damien Lespiau <damien.lespiau@intel.com>
=2DDate: Sun, 14 Jun 2009 15:30:04 +0100
=2DSubject: [PATCH] Fix compilation with OpenGL ES backends
=2D
=2D* Don't try to compile ARB fp1.0 shaders on non GL platforms,
=2D* Use CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS to query the number of
=2D  texture units one can use in a shader in a portable fashion.
=2D---
=2D clutter-gst/clutter-gst-video-sink.c |   14 ++++++++++++--
=2D 1 files changed, 12 insertions(+), 2 deletions(-)
=2D
=2Ddiff --git a/clutter-gst/clutter-gst-video-sink.c b/clutter-gst/clutter-=
gst-video-sink.c
=2Dindex d6eb6a3..516a42c 100644
=2D--- a/clutter-gst/clutter-gst-video-sink.c
=2D+++ b/clutter-gst/clutter-gst-video-sink.c
=2D@@ -236,6 +236,7 @@ _string_array_to_char_array (char	*dst,
=2D   *dst =3D '\0';
=2D }
=2D=20
=2D+#ifdef CLUTTER_COGL_HAS_GL
=2D static void
=2D clutter_gst_video_sink_fp_paint (ClutterActor        *actor,
=2D                                 ClutterGstVideoSink *sink)
=2D@@ -274,6 +275,7 @@ clutter_gst_video_sink_set_fp_shader (ClutterGstVide=
oSink *sink,
=2D   priv->shaders_init =3D TRUE;
=2D=20
=2D }
=2D+#endif
=2D=20
=2D static void
=2D clutter_gst_video_sink_paint (ClutterActor        *actor,
=2D@@ -532,6 +534,7 @@ static ClutterGstRenderer yv12_glsl_renderer =3D
=2D  * 8 bit Y plane followed by 8 bit 2x2 subsampled V and U planes.
=2D  */
=2D=20
=2D+#ifdef CLUTTER_COGL_HAS_GL
=2D static void
=2D clutter_gst_yv12_fp_init (ClutterActor        *actor,
=2D                           ClutterGstVideoSink *sink)
=2D@@ -573,6 +576,7 @@ static ClutterGstRenderer yv12_fp_renderer =3D
=2D   clutter_gst_yv12_paint,
=2D   clutter_gst_yv12_fp_post_paint,
=2D };
=2D+#endif
=2D=20
=2D /*
=2D  * I420
=2D@@ -620,6 +624,7 @@ static ClutterGstRenderer i420_glsl_renderer =3D
=2D  * Basically the same as YV12, but with the 2 chroma planes switched.
=2D  */
=2D=20
=2D+#ifdef CLUTTER_COGL_HAS_GL
=2D static void
=2D clutter_gst_i420_fp_init (ClutterActor        *actor,
=2D                           ClutterGstVideoSink *sink)
=2D@@ -646,6 +651,7 @@ static ClutterGstRenderer i420_fp_renderer =3D
=2D   clutter_gst_yv12_paint,
=2D   clutter_gst_yv12_fp_post_paint,
=2D };
=2D+#endif
=2D=20
=2D /*
=2D  * AYUV
=2D@@ -707,9 +713,11 @@ clutter_gst_build_renderers_list (ClutterGstSymbols=
 *syms)
=2D       &rgb24_renderer,
=2D       &rgb32_renderer,
=2D       &yv12_glsl_renderer,
=2D-      &yv12_fp_renderer,
=2D       &i420_glsl_renderer,
=2D+#ifdef CLUTTER_COGL_HAS_GL
=2D+      &yv12_fp_renderer,
=2D       &i420_fp_renderer,
=2D+#endif
=2D       &ayuv_glsl_renderer,
=2D       NULL
=2D     };
=2D@@ -717,11 +725,12 @@ clutter_gst_build_renderers_list (ClutterGstSymbol=
s *syms)
=2D   /* get the features */
=2D   gl_extensions =3D (const gchar*) glGetString (GL_EXTENSIONS);
=2D=20
=2D-  glGetIntegerv (GL_MAX_TEXTURE_UNITS, &nb_texture_units);
=2D+  glGetIntegerv (CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS, &nb_texture_unit=
s);
=2D=20
=2D   if (nb_texture_units >=3D 3)
=2D     features |=3D CLUTTER_GST_MULTI_TEXTURE;
=2D=20
=2D+#ifdef CLUTTER_COGL_HAS_GL
=2D   if (cogl_check_extension ("GL_ARB_fragment_program", gl_extensions))
=2D     {
=2D       /* the shaders we'll feed to the GPU are simple enough, we don't =
need
=2D@@ -741,6 +750,7 @@ clutter_gst_build_renderers_list (ClutterGstSymbols =
*syms)
=2D           features |=3D CLUTTER_GST_FP;
=2D         }
=2D     }
=2D+#endif
=2D=20
=2D   if (cogl_features_available (COGL_FEATURE_SHADERS_GLSL))
=2D     features |=3D CLUTTER_GST_GLSL;
=2D--=20
=2D1.6.3
=2D
diff --git a/recipes/clutter/files/enable_tests.patch b/recipes/clutter/fil=
es/enable_tests.patch
deleted file mode 100644
index 953edf6..0000000
=2D-- a/recipes/clutter/files/enable_tests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
=2D---
=2D tests/Makefile.am   |    7 ++++++-
=2D tests/test-actors.c |    2 +-
=2D tests/test-text.c   |    2 +-
=2D 3 files changed, 8 insertions(+), 3 deletions(-)
=2D
=2DIndex: git/tests/interactive/Makefile.am
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000=
 +0000
=2D+++ git/tests/interactive/Makefile.am	2009-03-12 11:04:12.000000000 +0000
=2D@@ -77,7 +77,7 @@
=2D AM_CFLAGS =3D $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
=2D AM_LDFLAGS =3D $(CLUTTER_LIBS)
=2D=20
=2D-noinst_PROGRAMS =3D test-interactive
=2D+bin_PROGRAMS =3D test-interactive
=2D=20
=2D test_interactive_SOURCES =3D \
=2D 	test-main.c \
=2DIndex: git/tests/interactive/test-actors.c
=2D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D--- git.orig/tests/interactive/test-actors.c	2009-03-12 11:01:36.0000000=
00 +0000
=2D+++ git/tests/interactive/test-actors.c	2009-03-12 11:06:32.000000000 +0=
000
=2D@@ -182,7 +182,7 @@
=2D   oh->scaler_1 =3D clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1=
=2E0);
=2D   oh->scaler_2 =3D clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0=
=2E5);
=2D=20
=2D-  real_hand =3D clutter_texture_new_from_file ("redhand.png", &error);
=2D+  real_hand =3D clutter_texture_new_from_file ("/usr/share/clutter/redh=
and.png", &error);
=2D   if (real_hand =3D=3D NULL)
=2D     {
=2D       g_error ("image load failed: %s", error->message);
=2D-=20
1.5.3.4


