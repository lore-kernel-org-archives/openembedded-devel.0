Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OozbC-00007e-8i
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:08:08 +0200
Received: (qmail invoked by alias); 27 Aug 2010 14:07:33 -0000
Received: from p50882A32.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.42.50]
	by mail.gmx.net (mp061) with SMTP; 27 Aug 2010 16:07:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18llENiiMYlLEe5hf1/2yelfC2XpuwvbTCd51+ydb
	tSA8RZ3//cj1+n
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 15:56:24 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201008271556.24288.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH2/2][v2] clutter: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Fri, 27 Aug 2010 14:08:08 -0000
X-Groupsio-MsgNum: 22747
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_IQ8dMaAdH1Ea9kv"

--Boundary-00=_IQ8dMaAdH1Ea9kv
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Now hopefully without line breaks..

--Boundary-00=_IQ8dMaAdH1Ea9kv
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0002-clutter-Remove-obsolete-recipes-files.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-clutter-Remove-obsolete-recipes-files.patch"

From bfce18ac13b6fe40a26aec110c26441f9350ed28 Mon Sep 17 00:00:00 2001
From: Andreas Mueller <schnitzeltony@gmx.de>
Date: Thu, 26 Aug 2010 14:38:30 +0200
Subject: [PATCH] clutter*: Remove obsolete recipes / files


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
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
----
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
.9_git.bb
deleted file mode 100644
index 5bbd8a8..0000000
--- a/recipes/clutter/clutter-0.9_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require clutter.inc
-
-SRCREV =3D "13e055a351f83c56b895b131566a6e842d24ed2a"
-
-PV =3D "1.1.0"
-PR =3D "${INC_PR}.0"
-PR_append =3D "+git${SRCREV}"
-
-SRC_URI =3D "git://git.clutter-project.org/clutter.git;protocol=3Dgit \
-           file://enable_tests.patch "
-S =3D "${WORKDIR}/git"
-
-BASE_CONF +=3D "--disable-introspection"
-
-PARALLEL_MAKE =3D ""
-
-do_compile_prepend() {
-	for i in $(find ${S} -name Makefile) ; do
-		sed -i -e s:-Werror::g $i
-	done
-    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i ; =
done )
-}
-
diff --git a/recipes/clutter/clutter-1.0_1.0.10.bb b/recipes/clutter/clutte=
r-1.0_1.0.10.bb
deleted file mode 100644
index 93fb893..0000000
--- a/recipes/clutter/clutter-1.0_1.0.10.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require clutter.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI =3D "http://source.clutter-project.org/sources/clutter/1.0/clutter=
-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] =3D "bf48e85291cba33f3f149f4eefe759f0"
-SRC_URI[sha256sum] =3D "6fb98dc4d16a3a98be734cf0a6cc4f8d8179800603c3e41011=
c414eeaf1f456b"
-
-S =3D "${WORKDIR}/clutter-${PV}"
-
-BASE_CONF +=3D "--disable-introspection"
-
-PARALLEL_MAKE =3D ""
-
-do_compile_prepend() {
-	for i in $(find ${S} -name Makefile) ; do
-		sed -i -e s:-Werror::g $i
-	done
-    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i ; =
done )
-}
-
diff --git a/recipes/clutter/clutter-box2d/introspection.diff b/recipes/clu=
tter/clutter-box2d/introspection.diff
deleted file mode 100644
index e38b837..0000000
--- a/recipes/clutter/clutter-box2d/introspection.diff
+++ /dev/null
@@ -1,31 +0,0 @@
-From dae84a82efe22b284cba8ca1985ce14bb4e86c99 Mon Sep 17 00:00:00 2001
-From: Damien Lespiau <damien.lespiau@intel.com>
-Date: Mon, 03 Aug 2009 10:47:41 +0000
-Subject: [build] Don't build introspection stuff when configure said we ca=
n't
-
-Surround the instrospection file generation with if HAVE_INTROSPECTION /
-endif
----
-diff --git a/clutter-box2d/Makefile.am b/clutter-box2d/Makefile.am
-index 8da23a7..6db8aae 100644
---- a/clutter-box2d/Makefile.am
-+++ b/clutter-box2d/Makefile.am
-@@ -39,6 +39,8 @@ DISTCLEANFILES =3D $(MARSHALFILES)
- EXTRA_DIST =3D \
- 	clutter-box2d-marshal.list
-=20
-+if HAVE_INTROSPECTION
-+
- BUILT_GIRSOURCES =3D
-=20
- ClutterBox2D-@CLUTTER_BOX2D_API_VERSION@.gir: $(INTROSPECTION_SCANNER) li=
bclutter-box2d-@CLUTTER_BOX2D_API_VERSION@.la
-@@ -68,5 +70,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.typelib)
- %.typelib: %.gir $(INTROSPECTION_COMPILER)
- 	$(QUIET_GEN)$(DEBUG) $(INTROSPECTION_COMPILER) --includedir=3D$(srcdir) =
--includedir=3D. $(INTROSPECTION_COMPILER_OPTS) $< -o $(builddir)/$(@F)
-=20
-+endif # HAVE_INTROSPECTION
-+
- CLEANFILES=3D
- CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)
---
-cgit v0.8.3.1-30-gff3a
diff --git a/recipes/clutter/clutter-box2d_0.10.0.bb b/recipes/clutter/clut=
ter-box2d_0.10.0.bb
deleted file mode 100644
index 5f3a063..0000000
--- a/recipes/clutter/clutter-box2d_0.10.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-box2d.inc
-
-SRC_URI =3D "http://source.clutter-project.org/sources/clutter-box2d/0.10/=
clutter-box2d-${PV}.tar.bz2 \
-           file://introspection.diff \
-"
-
-SRC_URI[md5sum] =3D "51618976ca6a5d536c4eac5f0e120d9d"
-SRC_URI[sha256sum] =3D "1e42d0cea429e4dc953a1f652672dbd322b3938846e99bab35=
f463de6fd8ae7f"
-
diff --git a/recipes/clutter/clutter-cairo.inc b/recipes/clutter/clutter-ca=
iro.inc
deleted file mode 100644
index 5c6d7e7..0000000
--- a/recipes/clutter/clutter-cairo.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION =3D "Clutter Cairo"
-HOMEPAGE =3D "http://www.clutter-project.org/"
-LICENSE =3D "LGPL"
-
-DEPENDS =3D "clutter cairo"
-
-PACKAGES =3D+ "${PN}-examples"
-FILES_${PN}-examples =3D "${bindir}/flowers ${bindir}/clock"
-
-inherit autotools pkgconfig
-
diff --git a/recipes/clutter/clutter-cairo/enable_examples.patch b/recipes/=
clutter/clutter-cairo/enable_examples.patch
deleted file mode 100644
index c5ed63f..0000000
--- a/recipes/clutter/clutter-cairo/enable_examples.patch
+++ /dev/null
@@ -1,28 +0,0 @@
----
- examples/Makefile.am |    2 +-
- examples/flowers.c   |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-cairo/examples/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-cairo.orig/examples/Makefile.am	2008-08-11 16:30:04.000000000 =
+0100
-+++ clutter-cairo/examples/Makefile.am	2008-08-11 16:30:24.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D clock flowers bubbles
-+bin_PROGRAMS =3D clock flowers bubbles
-=20
- INCLUDES =3D -I$(top_srcdir)/ @GCC_FLAGS@ @DEPS_CFLAGS@
- AM_LDFLAGS =3D @DEPS_LIBS@ $(top_builddir)/libclutter-cairo-@CLUTTER_CAIR=
O_MAJORMINOR@.la=20
-Index: clutter-cairo/examples/flowers.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-cairo.orig/examples/flowers.c	2008-08-11 16:30:04.000000000 +0=
100
-+++ clutter-cairo/examples/flowers.c	2008-08-11 16:30:10.000000000 +0100
-@@ -11,7 +11,7 @@
-=20
- #define PETAL_MIN 20
- #define PETAL_VAR 40
--#define N_FLOWERS 40 /* reduce if you have a small card */
-+#define N_FLOWERS 8 /* reduce if you have a small card */
-=20
- typedef struct Flower
- {
diff --git a/recipes/clutter/clutter-cairo_svn.bb b/recipes/clutter/clutter=
-cairo_svn.bb
deleted file mode 100644
index db270c1..0000000
--- a/recipes/clutter/clutter-cairo_svn.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require clutter-cairo.inc
-
-PV =3D "0.8.0+svnr${SRCPV}"
-SRCREV =3D "3210"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};proto=
=3Dhttp \
-           file://enable_examples.patch"
-
-S =3D "${WORKDIR}/${PN}"
-
-
diff --git a/recipes/clutter/clutter-fpu.inc b/recipes/clutter/clutter-fpu.=
inc
deleted file mode 100644
index 21a16fe..0000000
--- a/recipes/clutter/clutter-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_clutter_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--without-fpu"
-	return ""
-
diff --git a/recipes/clutter/clutter-glx_svn.bb b/recipes/clutter/clutter-g=
lx_svn.bb
deleted file mode 100644
index 0590330..0000000
--- a/recipes/clutter/clutter-glx_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter.inc
-
-PV =3D "0.3.1+svn${SRCDATE}"
-PR =3D "${INC_PR}.0"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3Dclutter;pro=
to=3Dhttp"
-
-S =3D "${WORKDIR}/clutter"
-
-
diff --git a/recipes/clutter/clutter-gst-0.9_git.bb b/recipes/clutter/clutt=
er-gst-0.9_git.bb
deleted file mode 100644
index 3bf7d48..0000000
--- a/recipes/clutter/clutter-gst-0.9_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require clutter-gst.inc
-
-DEPENDS =3D "clutter-0.9 gstreamer gst-plugins-base"
-
-SRCREV =3D "379b63b013af463210e54470693aedfa9009f4dc"
-PV =3D "0.9.0"
-PR =3D "r4"
-PR_append =3D "+git${SRCREV}"
-
-SRC_URI =3D "git://git.clutter-project.org/clutter-gst.git;protocol=3Dgit =
\
-           file://gtk-doc.make"
-
-S =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter-gst/autofoo-0.4.patch b/recipes/clutte=
r/clutter-gst/autofoo-0.4.patch
deleted file mode 100644
index 54df63d..0000000
--- a/recipes/clutter/clutter-gst/autofoo-0.4.patch
+++ /dev/null
@@ -1,15 +0,0 @@
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-gst/examples/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0=
000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D video-player video-sink audio
-+bin_PROGRAMS =3D video-player video-sink audio
-=20
- INCLUDES =3D -I$(top_srcdir)/
-=20
diff --git a/recipes/clutter/clutter-gst/autofoo.patch b/recipes/clutter/cl=
utter-gst/autofoo.patch
deleted file mode 100644
index 569b0d8..0000000
--- a/recipes/clutter/clutter-gst/autofoo.patch
+++ /dev/null
@@ -1,25 +0,0 @@
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-gst/examples/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0=
000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D video-player video-sink audio
-+bin_PROGRAMS =3D video-player video-sink audio
-=20
- INCLUDES =3D -I$(top_srcdir)/
-=20
-Index: clutter-gst/doc/reference/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-gst.orig/doc/reference/Makefile.am	2007-11-06 19:36:56.0000000=
00 +0000
-+++ clutter-gst/doc/reference/Makefile.am	2007-11-06 19:37:02.000000000 +0=
000
-@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
-=20
- # Other files to distribute
- # e.g. EXTRA_DIST +=3D version.xml.in
--EXTRA_DIST +=3D version.xml.in
-+EXTRA_DIST =3D version.xml.in
diff --git a/recipes/clutter/clutter-gst_0.4svn.bb b/recipes/clutter/clutte=
r-gst_0.4svn.bb
deleted file mode 100644
index 35f94c2..0000000
--- a/recipes/clutter/clutter-gst_0.4svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-gst.inc
-
-PV =3D "0.4.0+svnr${SRCPV}"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutter-=
gst-0-4;proto=3Dhttp \
-           file://autofoo-0.4.patch"
-
-
-S =3D "${WORKDIR}/clutter-gst-0-4"
diff --git a/recipes/clutter/clutter-gst_svn.bb b/recipes/clutter/clutter-g=
st_svn.bb
deleted file mode 100644
index 42dc2d8..0000000
--- a/recipes/clutter/clutter-gst_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require clutter-gst.inc
-
-PV =3D "0.8.0+svnr${SRCPV}"
-SRCREV =3D "3188"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};proto=
=3Dhttp \
-           file://autofoo.patch"
-
-S =3D "${WORKDIR}/${PN}"
diff --git a/recipes/clutter/clutter-gtk-0.6_git.bb b/recipes/clutter/clutt=
er-gtk-0.6_git.bb
deleted file mode 100644
index e37c4c9..0000000
--- a/recipes/clutter/clutter-gtk-0.6_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-gtk.inc
-
-SRCREV =3D "2ba362a1a223c2b28541030a80aa11191615340a"
-PV =3D "0.6.0+git${SRCREV}"
-
-DEPENDS +=3D "clutter-0.6"
-
-SRC_URI =3D "git://git.clutter-project.org/clutter-gtk.git;protocol=3Dgit;=
branch=3Dclutter-gtk-0-6"
-
-S =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter-gtk-0.8_git.bb b/recipes/clutter/clutt=
er-gtk-0.8_git.bb
deleted file mode 100644
index b06e266..0000000
--- a/recipes/clutter/clutter-gtk-0.8_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-gtk.inc
-
-SRCREV =3D "7d3c3230376e731c06c21afa9d8c1d44dbea27cd"
-PV =3D "0.8.0+git${SRCREV}"
-
-DEPENDS +=3D "clutter"
-
-SRC_URI =3D "git://git.clutter-project.org/clutter-gtk.git;protocol=3Dgit;=
branch=3Dclutter-gtk-0-8"
-
-S =3D "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter/enable-tests-r2990.patch b/recipes/clu=
tter/clutter/enable-tests-r2990.patch
deleted file mode 100644
index 4f449b1..0000000
--- a/recipes/clutter/clutter/enable-tests-r2990.patch
+++ /dev/null
@@ -1,50 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter/tests/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
-+++ clutter/tests/Makefile.am	2008-06-26 16:46:50.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-proje=
ct \
- 		  test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-timeline-dup-frames \
-@@ -17,8 +17,8 @@
- 		  test-invariants
-=20
- if X11_TESTS
--noinst_PROGRAMS +=3D test-pixmap
--noinst_PROGRAMS +=3D test-devices
-+bin_PROGRAMS +=3D test-pixmap
-+bin_PROGRAMS +=3D test-devices
- endif
-=20
- INCLUDES =3D -I$(top_srcdir)/ -I$(top_srcdir)/clutter -I$(top_builddir)/c=
lutter
-@@ -73,4 +73,9 @@
- test_invariants_SOURCES           =3D test-invariants.c
- test_devices_SOURCES              =3D test-devices.c
-=20
-+test_textdir           =3D $(pkgdatadir)
-+test_text_DATA         =3D test-text.c
-+test_actorsdir         =3D $(pkgdatadir)
-+test_actors_DATA       =3D redhand.png
-+
- EXTRA_DIST =3D redhand.png test-script.json
-Index: clutter/tests/test-actors.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/test-actors.c	2008-06-26 16:46:26.000000000 +0100
-+++ clutter/tests/test-actors.c	2008-06-26 16:46:31.000000000 +0100
-@@ -195,7 +195,7 @@
-       /* Create a texture from file, then clone in to same resources */
-       if (i =3D=3D 0)
- 	{
--	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("redhand.png",
-+	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("/usr/share/clutte=
r/redhand.png",
- 							    &error)) =3D=3D NULL)
- 	    {
- 	      g_error ("image load failed: %s", error->message);
diff --git a/recipes/clutter/clutter/enable_tests-0.4.patch b/recipes/clutt=
er/clutter/enable_tests-0.4.patch
deleted file mode 100644
index 3178a2c..0000000
--- a/recipes/clutter/clutter/enable_tests-0.4.patch
+++ /dev/null
@@ -1,52 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter-0-4/tests/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-0-4.orig/tests/Makefile.am	2007-11-06 21:49:25.000000000 +0000
-+++ clutter-0-4/tests/Makefile.am	2007-11-06 21:49:48.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-proje=
ct \
- 		  test-boxes test-perspective test-rotate test-depth \
- 		  test-threads test-timeline
-@@ -24,4 +24,9 @@ test_depth_SOURCES     =3D test-depth.c
- test_threads_SOURCES   =3D test-threads.c
- test_timeline_SOURCES  =3D test-timeline.c
-=20
-+test_textdir           =3D $(pkgdatadir)
-+test_text_DATA         =3D test-text.c
-+test_actorsdir         =3D $(pkgdatadir)
-+test_actors_DATA       =3D redhand.png
-+
- EXTRA_DIST =3D redhand.png
-Index: clutter-0-4/tests/test-actors.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-0-4.orig/tests/test-actors.c	2007-11-06 21:49:25.000000000 +00=
00
-+++ clutter-0-4/tests/test-actors.c	2007-11-06 21:49:28.000000000 +0000
-@@ -143,7 +143,7 @@ main (int argc, char *argv[])
-   stage =3D clutter_stage_get_default ();
-   clutter_actor_set_size (stage, 800, 600);
-=20
--  pixbuf =3D gdk_pixbuf_new_from_file ("redhand.png", NULL);
-+  pixbuf =3D gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png", =
NULL);
-=20
-   if (!pixbuf)
-     g_error("pixbuf load failed");
-Index: clutter-0-4/tests/test-text.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-0-4.orig/tests/test-text.c	2007-11-06 21:49:25.000000000 +0000
-+++ clutter-0-4/tests/test-text.c	2007-11-06 21:49:28.000000000 +0000
-@@ -27,7 +27,7 @@ main (int argc, char *argv[])
-=20
-   stage =3D clutter_stage_get_default ();
-=20
--  if (!g_file_get_contents ("test-text.c", &text, &size, NULL))=20
-+  if (!g_file_get_contents ("/usr/share/clutter/test-text.c", &text, &siz=
e, NULL))
-     g_error("g_file_get_contents() of test-text.c failed");
-=20
-   clutter_actor_set_size (stage, 800, 600);
diff --git a/recipes/clutter/clutter/enable_tests-0.6.patch b/recipes/clutt=
er/clutter/enable_tests-0.6.patch
deleted file mode 100644
index 544a7e5..0000000
--- a/recipes/clutter/clutter/enable_tests-0.6.patch
+++ /dev/null
@@ -1,40 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter-0-6/tests/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/Makefile.am	2007-11-06 12:30:11.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-proje=
ct \
- 		  test-boxes test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-score test-script
-@@ -26,4 +26,9 @@ test_timeline_SOURCES  =3D test-timeline.c
- test_score_SOURCES     =3D test-score.c
- test_script_SOURCES    =3D test-script.c
-=20
-+test_textdir           =3D $(pkgdatadir)
-+test_text_DATA         =3D test-text.c
-+test_actorsdir         =3D $(pkgdatadir)
-+test_actors_DATA       =3D redhand.png
-+
- EXTRA_DIST =3D redhand.png test-script.json
-Index: clutter-0-6/tests/test-actors.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/test-actors.c	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/test-actors.c	2007-11-06 12:29:21.000000000 +0000
-@@ -143,7 +143,7 @@ main (int argc, char *argv[])
-   stage =3D clutter_stage_get_default ();
-   clutter_actor_set_size (stage, 800, 600);
-=20
--  pixbuf =3D gdk_pixbuf_new_from_file ("redhand.png", NULL);
-+  pixbuf =3D gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png", =
NULL);
-=20
-   if (!pixbuf)
-     g_error("pixbuf load failed");
-
diff --git a/recipes/clutter/clutter/enable_tests.patch b/recipes/clutter/c=
lutter/enable_tests.patch
deleted file mode 100644
index 4a99968..0000000
--- a/recipes/clutter/clutter/enable_tests.patch
+++ /dev/null
@@ -1,48 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: clutter/tests/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/Makefile.am	2008-04-25 16:45:17.000000000 +0100
-+++ clutter/tests/Makefile.am	2008-04-25 16:47:12.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS =3D test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-proje=
ct \
- 		  test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-timeline-dup-frames \
-@@ -14,7 +14,7 @@
- 		  test-cogl-tex-polygon test-stage-read-pixels
-=20
- if X11_TESTS
--noinst_PROGRAMS +=3D test-pixmap
-+bin_PROGRAMS +=3D test-pixmap
- endif
-=20
- INCLUDES =3D -I$(top_srcdir)/ -I$(top_builddir)/clutter
-@@ -61,4 +61,9 @@
- test_cogl_offscreen_SOURCES   =3D test-cogl-offscreen.c
- test_stage_read_pixels_SOURCES =3D test-stage-read-pixels.c
-=20
-+test_textdir           =3D $(pkgdatadir)
-+test_text_DATA         =3D test-text.c
-+test_actorsdir         =3D $(pkgdatadir)
-+test_actors_DATA       =3D redhand.png
-+
- EXTRA_DIST =3D redhand.png test-script.json
-Index: clutter/tests/test-actors.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter.orig/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
-+++ clutter/tests/test-actors.c	2008-04-25 16:45:17.000000000 +0100
-@@ -184,7 +184,7 @@
-       /* Create a texture from file, then clone in to same resources */
-       if (i =3D=3D 0)
- 	{
--	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("redhand.png",
-+	  if ((oh->hand[i] =3D clutter_texture_new_from_file ("/usr/share/clutte=
r/redhand.png",
- 							    &error)) =3D=3D NULL)
- 	    {
- 	      g_error ("image load failed: %s", error->message);
diff --git a/recipes/clutter/clutter_0.4svn.bb b/recipes/clutter/clutter_0.=
4svn.bb
deleted file mode 100644
index 9399180..0000000
--- a/recipes/clutter/clutter_0.4svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require clutter.inc
-
-PV =3D "0.4.0+svnr${SRCPV}"
-PR =3D "${INC_PR}.0"
-SRCREV =3D "3240"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutter-=
0-4;proto=3Dhttp \
-	   file://enable_tests-0.4.patch "
-
-S =3D "${WORKDIR}/clutter-0-4"
-
-do_stage () {
-        cp ${S}/clutter.pc ${S}/clutter-0.4.pc
-        autotools_stage_all
-}
diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_0.=
6svn.bb
deleted file mode 100644
index e86cbaf..0000000
--- a/recipes/clutter/clutter_0.6svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter.inc
-
-PV =3D "0.6.0+svnr${SRCPV}"
-PR =3D "${INC_PR}.0"
-SRCREV =3D "3240"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclutter-=
0-6;proto=3Dhttp \
-	   file://enable_tests-0.6.patch "
-
-S =3D "${WORKDIR}/clutter-0-6"
diff --git a/recipes/clutter/clutter_0.8+git.bb b/recipes/clutter/clutter_0=
.8+git.bb
deleted file mode 100644
index 692154d..0000000
--- a/recipes/clutter/clutter_0.8+git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require clutter.inc
-
-CLUTTER_REV =3D "af16378899699376fe7e84c7c11eb3bb5c4668cd"
-
-PV =3D "0.8.8"
-PR =3D "${INC_PR}.0"
-PR_append =3D "+gitr${CLUTTER_REV}"
-
-SRC_URI =3D "git://git.clutter-project.org/clutter.git;protocol=3Dgit;bran=
ch=3Dclutter-0-8;rev=3D${CLUTTER_REV} \
-           file://enable-tests-r2990.patch"
-
-S =3D "${WORKDIR}/git"
-
-
-ARM_INSTRUCTION_SET =3D "arm"
diff --git a/recipes/clutter/clutter_svn.bb b/recipes/clutter/clutter_svn.b=
b
deleted file mode 100644
index f2cd50b..0000000
--- a/recipes/clutter/clutter_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require clutter.inc
-
-DEFAULT_PREFERENCE =3D "-1"
-
-PV =3D "0.8.0+svnr${SRCPV}"
-PR =3D "${INC_PR}.0"
-SRCREV =3D "3240"
-
-SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3Dclutter;pro=
to=3Dhttp \
-           file://enable_tests.patch;maxrev=3D2989 \
-           file://enable-tests-r2990.patch;minrev=3D2990"
-
-S =3D "${WORKDIR}/clutter"
-
-
diff --git a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-call=
s-with-ifdef-CL.patch b/recipes/clutter/files/0001-clutter-gst-videosink-gu=
ard-GL-calls-with-ifdef-CL.patch
deleted file mode 100644
index e373bca..0000000
--- a/recipes/clutter/files/0001-clutter-gst-videosink-guard-GL-calls-with-=
ifdef-CL.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 0677f1e6b5221caf78d50d94d2d0611e7f4b0abc Mon Sep 17 00:00:00 2001
-From: Damien Lespiau <damien.lespiau@intel.com>
-Date: Sun, 14 Jun 2009 15:30:04 +0100
-Subject: [PATCH] Fix compilation with OpenGL ES backends
-
-* Don't try to compile ARB fp1.0 shaders on non GL platforms,
-* Use CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS to query the number of
-  texture units one can use in a shader in a portable fashion.
----
- clutter-gst/clutter-gst-video-sink.c |   14 ++++++++++++--
- 1 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/clutter-gst/clutter-gst-video-sink.c b/clutter-gst/clutter-gs=
t-video-sink.c
-index d6eb6a3..516a42c 100644
---- a/clutter-gst/clutter-gst-video-sink.c
-+++ b/clutter-gst/clutter-gst-video-sink.c
-@@ -236,6 +236,7 @@ _string_array_to_char_array (char	*dst,
-   *dst =3D '\0';
- }
-=20
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_video_sink_fp_paint (ClutterActor        *actor,
-                                 ClutterGstVideoSink *sink)
-@@ -274,6 +275,7 @@ clutter_gst_video_sink_set_fp_shader (ClutterGstVideoS=
ink *sink,
-   priv->shaders_init =3D TRUE;
-=20
- }
-+#endif
-=20
- static void
- clutter_gst_video_sink_paint (ClutterActor        *actor,
-@@ -532,6 +534,7 @@ static ClutterGstRenderer yv12_glsl_renderer =3D
-  * 8 bit Y plane followed by 8 bit 2x2 subsampled V and U planes.
-  */
-=20
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_yv12_fp_init (ClutterActor        *actor,
-                           ClutterGstVideoSink *sink)
-@@ -573,6 +576,7 @@ static ClutterGstRenderer yv12_fp_renderer =3D
-   clutter_gst_yv12_paint,
-   clutter_gst_yv12_fp_post_paint,
- };
-+#endif
-=20
- /*
-  * I420
-@@ -620,6 +624,7 @@ static ClutterGstRenderer i420_glsl_renderer =3D
-  * Basically the same as YV12, but with the 2 chroma planes switched.
-  */
-=20
-+#ifdef CLUTTER_COGL_HAS_GL
- static void
- clutter_gst_i420_fp_init (ClutterActor        *actor,
-                           ClutterGstVideoSink *sink)
-@@ -646,6 +651,7 @@ static ClutterGstRenderer i420_fp_renderer =3D
-   clutter_gst_yv12_paint,
-   clutter_gst_yv12_fp_post_paint,
- };
-+#endif
-=20
- /*
-  * AYUV
-@@ -707,9 +713,11 @@ clutter_gst_build_renderers_list (ClutterGstSymbols *=
syms)
-       &rgb24_renderer,
-       &rgb32_renderer,
-       &yv12_glsl_renderer,
--      &yv12_fp_renderer,
-       &i420_glsl_renderer,
-+#ifdef CLUTTER_COGL_HAS_GL
-+      &yv12_fp_renderer,
-       &i420_fp_renderer,
-+#endif
-       &ayuv_glsl_renderer,
-       NULL
-     };
-@@ -717,11 +725,12 @@ clutter_gst_build_renderers_list (ClutterGstSymbols =
*syms)
-   /* get the features */
-   gl_extensions =3D (const gchar*) glGetString (GL_EXTENSIONS);
-=20
--  glGetIntegerv (GL_MAX_TEXTURE_UNITS, &nb_texture_units);
-+  glGetIntegerv (CGL_MAX_COMBINED_TEXTURE_IMAGE_UNITS, &nb_texture_units)=
;
-=20
-   if (nb_texture_units >=3D 3)
-     features |=3D CLUTTER_GST_MULTI_TEXTURE;
-=20
-+#ifdef CLUTTER_COGL_HAS_GL
-   if (cogl_check_extension ("GL_ARB_fragment_program", gl_extensions))
-     {
-       /* the shaders we'll feed to the GPU are simple enough, we don't ne=
ed
-@@ -741,6 +750,7 @@ clutter_gst_build_renderers_list (ClutterGstSymbols *s=
yms)
-           features |=3D CLUTTER_GST_FP;
-         }
-     }
-+#endif
-=20
-   if (cogl_features_available (COGL_FEATURE_SHADERS_GLSL))
-     features |=3D CLUTTER_GST_GLSL;
---=20
-1.6.3
-
diff --git a/recipes/clutter/files/enable_tests.patch b/recipes/clutter/fil=
es/enable_tests.patch
deleted file mode 100644
index 953edf6..0000000
--- a/recipes/clutter/files/enable_tests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Index: git/tests/interactive/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +=
0000
-+++ git/tests/interactive/Makefile.am	2009-03-12 11:04:12.000000000 +0000
-@@ -77,7 +77,7 @@
- AM_CFLAGS =3D $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
- AM_LDFLAGS =3D $(CLUTTER_LIBS)
-=20
--noinst_PROGRAMS =3D test-interactive
-+bin_PROGRAMS =3D test-interactive
-=20
- test_interactive_SOURCES =3D \
- 	test-main.c \
-Index: git/tests/interactive/test-actors.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/tests/interactive/test-actors.c	2009-03-12 11:01:36.000000000=
 +0000
-+++ git/tests/interactive/test-actors.c	2009-03-12 11:06:32.000000000 +000=
0
-@@ -182,7 +182,7 @@
-   oh->scaler_1 =3D clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0=
);
-   oh->scaler_2 =3D clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5=
);
-=20
--  real_hand =3D clutter_texture_new_from_file ("redhand.png", &error);
-+  real_hand =3D clutter_texture_new_from_file ("/usr/share/clutter/redhan=
d.png", &error);
-   if (real_hand =3D=3D NULL)
-     {
-       g_error ("image load failed: %s", error->message);
--=20
1.5.3.4


--Boundary-00=_IQ8dMaAdH1Ea9kv--
