Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oozb7-00007M-In
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:08:03 +0200
Received: (qmail invoked by alias); 27 Aug 2010 14:07:28 -0000
Received: from p50882A32.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.42.50]
	by mail.gmx.net (mp061) with SMTP; 27 Aug 2010 16:07:28 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+x4U5U/xaxqfq7/5ZGoAQk3Ba8/FOxdWl9EvmtuC
	Q3YJ4mu//4X6Wb
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 15:56:16 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201008271556.16795.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH1/2][v2] clutter: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Fri, 27 Aug 2010 14:08:03 -0000
X-Groupsio-MsgNum: 22746
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_AQ8dMk4XwrmrIoV"

--Boundary-00=_AQ8dMk4XwrmrIoV
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Now hopefully without line breaks..

--Boundary-00=_AQ8dMk4XwrmrIoV
Content-Type: text/x-diff;
  charset="us-ascii";
  name="0001-clutter-.bb-Bump-revisions-to-latest-stable-clean.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-clutter-.bb-Bump-revisions-to-latest-stable-clean.patch"

From bfa206373e1c566068f454160185135dfb55cf6c Mon Sep 17 00:00:00 2001
From: Andreas Mueller <schnitzeltony@gmx.de>
Date: Thu, 26 Aug 2010 14:29:26 +0200
Subject: [PATCH] clutter*.bb: Bump revisions to latest stable & cleanup
 Tested on gumstix overo:
   clutter: 1.2.12:
     Test result: Build OK / most conformance/interactive tests running
     no fonts displayed (pango related? / suggestions welcome)
   clutter-box2d: 0.10.0_git:
     Test result: Build OK / latest examples running
     Note: Introspection build error was fixed upstream
   clutter-gst: 1.2.0:
     Test result: Build OK
   clutter-gtk: 0.10.6:
     Test result: Build OK
   clutter-gesture 0.0.2_git
     Test result: Build OK


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-box2d.inc                  |   22 ++-
 .../clutter-box2d/example-data-location.patch      |   11 +
 recipes/clutter/clutter-box2d_0.10.0_git.bb        |   14 ++
 recipes/clutter/clutter-common.inc                 |   37 ++++
 .../clutter/clutter-gesture/no-gl-include.patch    |   21 ++
 recipes/clutter/clutter-gesture_0.0.2_git.bb       |   17 ++
 recipes/clutter/clutter-gst.inc                    |   23 ++-
 recipes/clutter/clutter-gst_1.2.0.bb               |    9 +
 recipes/clutter/clutter-gtk.inc                    |   15 +-
 recipes/clutter/clutter-gtk_0.10.6.bb              |   10 +
 recipes/clutter/clutter.inc                        |   91 +++++++--
 recipes/clutter/clutter/sample.desktop             |    9 +
 recipes/clutter/clutter/test-conformance-run       |    8 +
 recipes/clutter/clutter_1.2.12.bb                  |   27 +++
 recipes/clutter/files/gtk-doc-for-git.make         |  213 ++++++++++++++++=
++++
 recipes/clutter/files/gtk-doc.make                 |  173 ----------------
 recipes/gnome/libchamplain-gtk_0.2.8.bb            |    3 +-
 recipes/gnome/libchamplain_0.2.8.bb                |    3 +-
 recipes/moblin/bickley_git.bb                      |    4 +-
 recipes/moblin/hornsey_git.bb                      |    4 +-
 recipes/moblin/nbtk_git.bb                         |    4 +-
 21 files changed, 504 insertions(+), 214 deletions(-)
 create mode 100644 recipes/clutter/clutter-box2d/example-data-location.pat=
ch
 create mode 100644 recipes/clutter/clutter-box2d_0.10.0_git.bb
 create mode 100644 recipes/clutter/clutter-common.inc
 create mode 100644 recipes/clutter/clutter-gesture/no-gl-include.patch
 create mode 100644 recipes/clutter/clutter-gesture_0.0.2_git.bb
 create mode 100644 recipes/clutter/clutter-gst_1.2.0.bb
 create mode 100644 recipes/clutter/clutter-gtk_0.10.6.bb
 create mode 100644 recipes/clutter/clutter/sample.desktop
 create mode 100755 recipes/clutter/clutter/test-conformance-run
 create mode 100644 recipes/clutter/clutter_1.2.12.bb
 create mode 100644 recipes/clutter/files/gtk-doc-for-git.make
 delete mode 100644 recipes/clutter/files/gtk-doc.make

diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-bo=
x2d.inc
index 2b39916..a16d62e 100644
--- a/recipes/clutter/clutter-box2d.inc
+++ b/recipes/clutter/clutter-box2d.inc
@@ -2,16 +2,28 @@ DESCRIPTION =3D "Clutter Box2D"
 HOMEPAGE =3D "http://www.clutter-project.org/"
 LICENSE =3D "GPLv2"
=20
-DEPENDS =3D "clutter-1.0"
+DEPENDS =3D "clutter"
+
+INC_PR =3D "r1"
=20
 # The main clutter lib is machine specific so we need to be too
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit autotools pkgconfig gtk-doc
=20
-EXTRA_OECONF +=3D "--disable-introspection"
+require clutter-common.inc
=20
-do_install_append () {
-	install -d ${D}${bindir}
-	install ${S}/examples/.libs/blockbox ${D}${bindir}
+do_configure_prepend() {
+	make_all_execs_installable
 }
+
+# clutter-box2d-examples=20
+PACKAGES =3D+ "${PN}-examples"
+FILES_${PN}-examples =3D "${bindir}/* ${datadir}/clutter-box2d-examples"
+
+do_install() {
+	autotools_do_install
+	install -m 755 -d ${D}${datadir}/clutter-box2d-examples
+	install -m 0755 ${S}/examples/redhand.png ${D}${datadir}/clutter-box2d-ex=
amples
+}
+
diff --git a/recipes/clutter/clutter-box2d/example-data-location.patch b/re=
cipes/clutter/clutter-box2d/example-data-location.patch
new file mode 100644
index 0000000..3aaab54
--- /dev/null
+++ b/recipes/clutter/clutter-box2d/example-data-location.patch
@@ -0,0 +1,11 @@
+--- a/examples/blockbox.h.old	2010-07-20 15:05:30.000000000 +0200
++++ b/examples/blockbox.h	2010-08-23 18:20:03.000000000 +0200
+@@ -8,7 +8,7 @@
+ #include "scenes.h"
+ #include "util.h"
+=20
+-#define ASSETS_DIR "./"
++#define ASSETS_DIR "/usr/share/clutter-box2d-examples/"
+ extern gboolean simulating;
+=20
+ #endif
diff --git a/recipes/clutter/clutter-box2d_0.10.0_git.bb b/recipes/clutter/=
clutter-box2d_0.10.0_git.bb
new file mode 100644
index 0000000..a7f348e
--- /dev/null
+++ b/recipes/clutter/clutter-box2d_0.10.0_git.bb
@@ -0,0 +1,14 @@
+require clutter-box2d.inc
+
+SRCREV =3D "4e72b9c135a9439b82d801c62422531db611f98b"
+
+PR =3D "${INC_PR}.0"
+PR_append =3D "+git${SRCREV}"
+
+SRC_URI =3D "git://git.clutter-project.org/clutter-box2d.git;protocol=3Dgi=
t \
+           file://example-data-location.patch \
+          "
+
+S =3D "${WORKDIR}/git"
+
+
diff --git a/recipes/clutter/clutter-common.inc b/recipes/clutter/clutter-c=
ommon.inc
new file mode 100644
index 0000000..5e487e3
--- /dev/null
+++ b/recipes/clutter/clutter-common.inc
@@ -0,0 +1,37 @@
+# common functions for all clutter-libraries
+
+# all .debug stuff goes to clutter*-dbg
+FILES_${PN}-dbg +=3D "${bindir}/.debug"
+
+# helper for git-recipes which do not have gtk-doc.make
+copy_gtk_doc_make() {
+	echo clutter-common.inc:::copy_gtk_doc_make: Copy ${1}...
+	Dest=3D${S}/gtk-doc.make
+	if [ ! -f $Dest ] ; then
+		if [ $# =3D=3D 1 ] && [ $1 ] &&  [ -f $1 ] ; then
+			echo clutter-common.inc:::copy_gtk_doc_make: Copying $1 to $Dest
+			cp $1 $Dest
+		else
+			echo Warning: clutter-common.inc:::copy_gtk_doc_make: called with inval=
id parameter $1
+		fi
+	else
+		echo clutter-common.inc:::copy_gtk_doc_make: Try existing $Dest
+	fi
+}
+
+# clutter packs assume building and target are the same
+# for us they are definitely not
+make_all_execs_installable() {
+	for i in $(find ${S} -name Makefile.am) ; do
+		sed -i -e s:noinst_PROGRAMS:bin_PROGRAMS:g $i
+	done
+}
+
+
+# helper to check for TARGET_FPU=3Dsoft and inform configure=20
+# of the result so it can disable some floating points
+def get_clutter_fpu_setting(bb, d):
+	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+		return "--without-fpu"
+	return ""
+
diff --git a/recipes/clutter/clutter-gesture/no-gl-include.patch b/recipes/=
clutter/clutter-gesture/no-gl-include.patch
new file mode 100644
index 0000000..ee0a9d3
--- /dev/null
+++ b/recipes/clutter/clutter-gesture/no-gl-include.patch
@@ -0,0 +1,21 @@
+--- a/engine/engine.c.old	2010-07-01 11:04:12.000000000 +0200
++++ b/engine/engine.c	2010-07-01 10:45:51.000000000 +0200
+@@ -26,7 +26,6 @@
+ #include <errno.h>
+ #include <cairo/cairo.h>
+ #include <pango/pangocairo.h>
+-#include <GL/gl.h>
+ #include "engine.h"
+ #include "../clutter-gesture/clutter-gesture.h"
+ #include "stroke.h"
+--- a/clutter-gesture/clutter-gesture.c.old	2010-07-01 11:04:12.000000000 =
+0200
++++ b/clutter-gesture/clutter-gesture.c	2010-07-01 10:45:51.000000000 +020=
0
+@@ -29,7 +29,6 @@
+ #include <string.h>
+ #include <cairo/cairo.h>
+ #include <pango/pangocairo.h>
+-#include <GL/gl.h>
+ #include <glib-object.h>
+
+ #include "clutter-gesture.h"
+
diff --git a/recipes/clutter/clutter-gesture_0.0.2_git.bb b/recipes/clutter=
/clutter-gesture_0.0.2_git.bb
new file mode 100644
index 0000000..a8e6b77
--- /dev/null
+++ b/recipes/clutter/clutter-gesture_0.0.2_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "Clutter gesture implements a gesture-recognition framewor=
k on top of Clutter"
+HOMEPAGE =3D "http://moblin.org/projects/clutter-gesture"
+
+SRC_URI =3D "git://git.moblin.org/clutter-gesture;protocol=3Dgit \
+           file://no-gl-include.patch "
+
+SRCREV =3D 6d287de2c3b94f6af351cfe9bd22cea7f75daf02
+PR =3D "r0"
+PR_append =3D "+git${SRCREV}"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "clutter glib-2.0"
+
+inherit autotools pkgconfig
+
+
diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.=
inc
index 8fa30b4..8a2afa0 100644
--- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -1,19 +1,24 @@
-DESCRIPTION =3D "Clutter GStreamer"
+DESCRIPTION =3D "Clutter GStreamer integration library"
 HOMEPAGE =3D "http://www.clutter-project.org/"
 LICENSE =3D "LGPL"
=20
-DEPENDS =3D "clutter gstreamer gst-plugins-base"
+INC_PR =3D "r1"
=20
-PACKAGES =3D+ "${PN}-examples"
-FILES_${PN}-examples =3D "${bindir}/video-player ${bindir}/video-sink ${bi=
ndir}/audio"
+DEPENDS =3D "clutter gstreamer gst-plugins-base"
=20
 inherit autotools pkgconfig
=20
+require clutter-common.inc
+
 do_configure_prepend() {
-	if [ -e ${WORKDIR}/gtk-doc.make ] ; then
-		cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
-	else
-		touch ${S}/gtk-doc.make
-	fi
+	make_all_execs_installable
 }
=20
+# clutter-gst-examples=20
+PACKAGES =3D+ "${PN}-examples"
+FILES_${PN}-examples =3D "${bindir}/video-*"
+
+# clutter-gst-tests=20
+PACKAGES =3D+ "${PN}-tests"
+FILES_${PN}-tests =3D "${bindir}/test-*"
+
diff --git a/recipes/clutter/clutter-gst_1.2.0.bb b/recipes/clutter/clutter=
-gst_1.2.0.bb
new file mode 100644
index 0000000..d7f7f02
--- /dev/null
+++ b/recipes/clutter/clutter-gst_1.2.0.bb
@@ -0,0 +1,9 @@
+require clutter-gst.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gst/1.2/clu=
tter-gst-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] =3D "1048815f0c9152edbfdc59a94d0e3b87"
+SRC_URI[sha256sum] =3D "ed3357c10fe82727091616296abd53c752e15c816a4030474f=
1919c0d347e5d3"
diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gtk.=
inc
index d9b01ca..be477f0 100644
--- a/recipes/clutter/clutter-gtk.inc
+++ b/recipes/clutter/clutter-gtk.inc
@@ -1,11 +1,20 @@
 DESCRIPTION =3D "Clutter GTK+"
 HOMEPAGE =3D "http://www.clutter-project.org/"
 LICENSE =3D "LGPL"
+INC_PR =3D "r1"
=20
-DEPENDS =3D "gtk+"
+DEPENDS =3D "gtk+ clutter"
=20
+inherit autotools pkgconfig
+
+require clutter-common.inc
+
+do_configure_prepend() {
+	make_all_execs_installable
+}
+
+# clutter-gtk-examples=20
 PACKAGES =3D+ "${PN}-examples"
-FILES_${PN}-examples =3D "${bindir}/gtk-clutter-test ${bindir}/gtk-clutter=
-events ${bindir}/gtk-clutter-multistage"
+FILES_${PN}-examples =3D "${bindir}/*"
=20
-inherit autotools pkgconfig gtk-doc
=20
diff --git a/recipes/clutter/clutter-gtk_0.10.6.bb b/recipes/clutter/clutte=
r-gtk_0.10.6.bb
new file mode 100644
index 0000000..b168ff5
--- /dev/null
+++ b/recipes/clutter/clutter-gtk_0.10.6.bb
@@ -0,0 +1,10 @@
+require clutter-gtk.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gtk/0.10/cl=
utter-gtk-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] =3D "e7407392b14d6cddd9d4f86feaa9bd3f"
+SRC_URI[sha256sum] =3D "c65ec1e6b2932ed23b3db145357a96ae5ec7cb0666139468eb=
a781d6c56a5371"
+
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index 0c7eaa8..57e9f7c 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -4,8 +4,14 @@ LICENSE =3D "LGPL"
=20
 COMPATIBLE_MACHINE =3D "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx=
31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|=
overo|omap3evm|omap5912osk)"
=20
-STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk=
+"
-BASE_CONF =3D "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
+INC_PR =3D "r2"
+
+INC_SRC_URI =3D "file://sample.desktop \
+               file://test-conformance-run \
+              "
+
+STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk=
+ cairo"
+BASE_CONF =3D "--enable-docs --disable-gtk-doc --enable-conformance --with=
-x ${@get_clutter_fpu_setting(bb, d)} "
=20
 DEPENDS =3D "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF =3D "${BASE_CONF} --with-flavour=3Dglx"
@@ -37,24 +43,77 @@ EXTRA_OECONF_mx31ads =3D "${BASE_CONF} --with-flavour=
=3Deglnative"
 PACKAGE_ARCH_mx31ads =3D "${MACHINE_ARCH}"
 LDFLAGS_append_mx31ads =3D " -lpvrNULLWSEGL -lstdc++ "
=20
-INC_PR =3D "r1"
+inherit autotools pkgconfig
+
+require clutter-common.inc
=20
-inherit autotools pkgconfig gtk-doc
+PARALLEL_MAKE =3D ""
=20
-PACKAGES =3D+ "clutter-examples"
-FILES_clutter-examples =3D "${bindir}/test-* ${pkgdatadir}/redhand.png"
+# clutter tests=20
+PACKAGES =3D+ "${PN}-tests"
+FILES_${PN}-tests =3D "${bindir}/test-* \
+                     ${datadir}/applications/test-* \
+                     ${datadir}/clutter-tests"
=20
-#check for TARGET_FPU=3Dsoft and inform configure of the result so it can =
disable some floating points
-require clutter-fpu.inc
+# cally is part of clutter since 1.3.8 (c0f753d108b7a2ad23dbf5a5b596f80175=
442927)
+PACKAGES =3D+ "${PN}-cally-examples"
+FILES_${PN}-cally-examples =3D "${bindir}/cally-*-example"
=20
-#Fix up some weirdness in the docs
 do_configure_prepend() {
-    if [ -e ${WORKDIR}/gtk-doc.make ] ; then
-        cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
-    else
-        touch ${S}/gtk-doc.make
-    fi
-    sed -i s:doc/reference/Makefile::g ${S}/configure.ac
-    sed -i s:doc::g ${S}/Makefile.am
+	# Fix up 'Requires' entries in *.pc.in to prevent from "NOTE: couldn't fi=
nd pkgconfig module '${requires}' in any package"
+	for i in $(find ${S} -name '*.pc.in') ; do
+		sed -i s:'${requires}':'@CLUTTER_REQUIRES@':g $i
+	done
+=09
+	make_all_execs_installable
+
+	# Align the test data location
+	for i in $(find ${S}/tests -name Makefile.am) ; do
+		sed -i -e 's:$(top_srcdir)/tests/data:${datadir}/clutter-tests:g' $i
+	done
+}
+
+# helper to (re)build shader source files from *.glsl=09
+rebuild_shader_sources() {
+	if [ $# =3D=3D 1 ] && [ $1 ] &&  [ -d $1 ] ; then
+		glespath=3D$1
+		for i in ${glespath}/*.glsl ; do=20
+			echo "clutter.inc::rebuild_shader_sources: Stringifying $i"
+			# *.h
+			sh ${glespath}/stringify.sh -h $i > "${i%.glsl}.h"
+			# *.c
+			sh ${glespath}/stringify.sh $i > "${i%.glsl}.c"
+		done
+	else
+		echo Warning: "clutter.inc::rebuild_shader_sources: called with invalid =
parameter ${1}!"
+	fi
+}
+
+# tests are not prepared for installation - so let us do it
+install_tests() {
+	install -m 755 -d ${D}${bindir}/
+	install -m 755 -d ${D}${datadir}/applications
+
+	# conformance tests script
+	install -m 0755 ${WORKDIR}/test-conformance-run ${D}${bindir}
+
+	# interactive tests desktop entries
+	for i in ${S}/tests/interactive/*.o ; do=20
+		test_path=3D`echo ${i} | sed -e 's:\.o::' -e 's:test_interactive-::'`
+		test_name=3D`echo ${test_path} | sed 's:.*/::'`
+		if [ -e ${test_path} ] ; then=20
+			echo "clutter.inc::install_tests: Installing desktop entry for interact=
ive test ${test_name}..."
+			sed -e s:NAME:${test_name}: \
+			    -e "s:EXEC:${bindir}/test-interactive ${test_name}:" \
+			     ${WORKDIR}/sample.desktop > ${D}${datadir}/applications/${test_nam=
e}.desktop
+		fi
+	done
+
+	# test data
+	install -m 755 -d ${D}${datadir}/clutter-tests
+	for i in $(find ${S}/tests/data -name '*.png' -o -name '*.json') ; do
+		echo "clutter.inc::install_tests: Installing test data ${i}..."
+		install -m 0755 ${i} ${D}${datadir}/clutter-tests/
+	done
 }
=20
diff --git a/recipes/clutter/clutter/sample.desktop b/recipes/clutter/clutt=
er/sample.desktop
new file mode 100644
index 0000000..34dec2b
--- /dev/null
+++ b/recipes/clutter/clutter/sample.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Version=3D1.0
+Name=3DNAME
+Comment=3DClutter Test
+Exec=3DEXEC
+Icon=3Dstar
+Type=3DApplication
+Categories=3DGraphics;
+
diff --git a/recipes/clutter/clutter/test-conformance-run b/recipes/clutter=
/clutter/test-conformance-run
new file mode 100755
index 0000000..7efd896
--- /dev/null
+++ b/recipes/clutter/clutter/test-conformance-run
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Simple script to run all conformance tests.=20
+# Works around abortion on crash
+for i in `test-conformance -l` ; do
+	test-conformance $@ -p $i
+done
+
diff --git a/recipes/clutter/clutter_1.2.12.bb b/recipes/clutter/clutter_1.=
2.12.bb
new file mode 100644
index 0000000..3832e2c
--- /dev/null
+++ b/recipes/clutter/clutter_1.2.12.bb
@@ -0,0 +1,27 @@
+require clutter.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter/1.2/clutter=
-${PV}.tar.bz2 \
+           ${INC_SRC_URI} \
+          "
+
+# Cookbook causes trouble in this version
+BASE_CONF +=3D " --disable-docs"
+# --disable-docs -> reduce configure time
+inherit gtk-doc
+
+# enable '--clutter-debug' / '--cogl-debug' params
+BASE_CONF +=3D " --enable-debug"
+
+do_compile_prepend() {
+	rebuild_shader_sources ${S}/clutter/cogl/cogl/driver/gles
+}
+
+do_install() {
+	autotools_do_install
+	install_tests
+}
+
+SRC_URI[md5sum] =3D "76f70e765adcf7146be1ceb50bafa14f"
+SRC_URI[sha256sum] =3D "4582e6579897374d1f8ce51daa330311ebb90033fad95d5f07=
6c1e9392b4ae68"
diff --git a/recipes/clutter/files/gtk-doc-for-git.make b/recipes/clutter/f=
iles/gtk-doc-for-git.make
new file mode 100644
index 0000000..5574645
--- /dev/null
+++ b/recipes/clutter/files/gtk-doc-for-git.make
@@ -0,0 +1,213 @@
+# -*- mode: makefile -*-
+
+####################################
+# Everything below here is generic #
+####################################
+
+if GTK_DOC_USE_LIBTOOL
+GTKDOC_CC =3D $(LIBTOOL) --tag=3DCC --mode=3Dcompile $(CC) $(INCLUDES) $(A=
M_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC) $(AM_CFLAGS) $(CFL=
AGS) $(AM_LDFLAGS) $(LDFLAGS)
+GTKDOC_RUN =3D $(LIBTOOL) --mode=3Dexecute
+else
+GTKDOC_CC =3D $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(=
CFLAGS)
+GTKDOC_LD =3D $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+GTKDOC_RUN =3D
+endif
+
+# We set GPATH here; this gives us semantics for GNU make
+# which are more like other make's VPATH, when it comes to
+# whether a source that is a target of one rule is then
+# searched for in VPATH/GPATH.
+#
+GPATH =3D $(srcdir)
+
+TARGET_DIR=3D$(HTML_DIR)/$(DOC_MODULE)
+
+EXTRA_DIST =3D 				\
+	$(content_files)		\
+	$(HTML_IMAGES)			\
+	$(DOC_MAIN_SGML_FILE)		\
+	$(DOC_MODULE)-sections.txt	\
+	$(DOC_MODULE)-overrides.txt
+
+DOC_STAMPS=3Dscan-build.stamp sgml-build.stamp html-build.stamp pdf-build.=
stamp \
+	$(srcdir)/sgml.stamp $(srcdir)/html.stamp  \
+	$(srcdir)/pdf.stamp
+
+SCANOBJ_FILES =3D 		 \
+	$(DOC_MODULE).args 	 \
+	$(DOC_MODULE).hierarchy  \
+	$(DOC_MODULE).interfaces \
+	$(DOC_MODULE).prerequisites \
+	$(DOC_MODULE).signals
+
+REPORT_FILES =3D \
+	$(DOC_MODULE)-undocumented.txt \
+	$(DOC_MODULE)-undeclared.txt \
+	$(DOC_MODULE)-unused.txt
+
+CLEANFILES =3D $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
+
+if ENABLE_GTK_DOC
+if GTK_DOC_BUILD_HTML
+HTML_BUILD_STAMP=3Dhtml-build.stamp
+else
+HTML_BUILD_STAMP=3D
+endif
+if GTK_DOC_BUILD_PDF
+PDF_BUILD_STAMP=3Dpdf-build.stamp
+else
+PDF_BUILD_STAMP=3D
+endif
+
+all-local: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
+else
+all-local:
+endif
+
+docs: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
+
+$(REPORT_FILES): sgml-build.stamp
+
+#### scan ####
+
+scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
+	@echo 'gtk-doc: Scanning header files'
+	@-chmod -R u+w $(srcdir)
+	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
+	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
+	  done ; \
+	  cd $(srcdir) && \
+	  gtkdoc-scan --module=3D$(DOC_MODULE) --ignore-headers=3D"$(IGNORE_HFILE=
S)" $${_source_dir} $(SCAN_OPTIONS) $(EXTRA_HFILES)
+	@if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; the=
n \
+	    CC=3D"$(GTKDOC_CC)" LD=3D"$(GTKDOC_LD)" RUN=3D"$(GTKDOC_RUN)" CFLAGS=
=3D"$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS=3D"$(GTKDOC_LIBS) $(LDFLAGS)" gtkdo=
c-scangobj $(SCANGOBJ_OPTIONS) --module=3D$(DOC_MODULE) --output-dir=3D$(sr=
cdir) ; \
+	else \
+	    cd $(srcdir) ; \
+	    for i in $(SCANOBJ_FILES) ; do \
+               test -f $$i || touch $$i ; \
+	    done \
+	fi
+	@touch scan-build.stamp
+
+$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_M=
ODULE)-overrides.txt: scan-build.stamp
+	@true
+
+#### xml ####
+
+sgml-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-se=
ctions.txt $(DOC_MODULE)-overrides.txt $(expand_content_files)
+	@echo 'gtk-doc: Building XML'
+	@-chmod -R u+w $(srcdir)
+	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
+	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
+	  done ; \
+	  cd $(srcdir) && \
+	  gtkdoc-mkdb --module=3D$(DOC_MODULE) --output-format=3Dxml --expand-con=
tent-files=3D"$(expand_content_files)" --main-sgml-file=3D$(DOC_MAIN_SGML_F=
ILE) $${_source_dir} $(MKDB_OPTIONS)
+	@touch sgml-build.stamp
+
+sgml.stamp: sgml-build.stamp
+	@true
+
+#### html ####
+
+html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building HTML'
+	@-chmod -R u+w $(srcdir)
+	@rm -rf $(srcdir)/html
+	@mkdir $(srcdir)/html
+	@mkhtml_options=3D""; \
+	gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
+	if test "$(?)" =3D "0"; then \
+	  mkhtml_options=3D--path=3D"$(srcdir)"; \
+	fi; \
+	cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options $(MKHTML_OPTIONS) $(D=
OC_MODULE) ../$(DOC_MAIN_SGML_FILE)
+	@test "x$(HTML_IMAGES)" =3D "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) ht=
ml )
+	@echo 'gtk-doc: Fixing cross-references'
+	@cd $(srcdir) && gtkdoc-fixxref --module=3D$(DOC_MODULE) --module-dir=3Dh=
tml --html-dir=3D$(HTML_DIR) $(FIXXREF_OPTIONS)
+	@touch html-build.stamp
+
+#### pdf ####
+
+pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building PDF'
+	@-chmod -R u+w $(srcdir)
+	@rm -rf $(srcdir)/$(DOC_MODULE).pdf
+	@mkpdf_imgdirs=3D""; \
+	if test "x$(HTML_IMAGES)" !=3D "x"; then \
+	  for img in $(HTML_IMAGES); do \
+	    part=3D`dirname $$img`; \
+	    echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=3D$$part "; \
+	    if test $$? !=3D 0; then \
+	      mkpdf_imgdirs=3D"$$mkpdf_imgdirs --imgdir=3D$$part"; \
+	    fi; \
+	  done; \
+	fi; \
+	cd $(srcdir) && gtkdoc-mkpdf --path=3D"$(abs_srcdir)" $$mkpdf_imgdirs $(D=
OC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
+	@touch pdf-build.stamp
+
+##############
+
+clean-local:
+	rm -f *~ *.bak
+	rm -rf .libs
+
+distclean-local:
+	cd $(srcdir) && \
+	  rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
+	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
+
+maintainer-clean-local: clean
+	cd $(srcdir) && rm -rf html
+
+install-data-local:
+	@installfiles=3D`echo $(srcdir)/html/*`; \
+	if test "$$installfiles" =3D '$(srcdir)/html/*'; \
+	then echo '-- Nothing to install' ; \
+	else \
+	  if test -n "$(DOC_MODULE_VERSION)"; then \
+	    installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
+	  else \
+	    installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
+	  fi; \
+	  $(mkinstalldirs) $${installdir} ; \
+	  for i in $$installfiles; do \
+	    echo '-- Installing '$$i ; \
+	    $(INSTALL_DATA) $$i $${installdir}; \
+	  done; \
+	  if test -n "$(DOC_MODULE_VERSION)"; then \
+	    mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
+	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2; \
+	    mv -f $${installdir}/$(DOC_MODULE).devhelp \
+	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
+	  fi; \
+	  $(GTKDOC_REBASE) --relative --dest-dir=3D$(DESTDIR) --html-dir=3D$${ins=
talldir}; \
+	fi
+
+uninstall-local:
+	@if test -n "$(DOC_MODULE_VERSION)"; then \
+	  installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
+	else \
+	  installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
+	fi; \
+	rm -rf $${installdir}
+
+#
+# Require gtk-doc when making dist
+#
+if ENABLE_GTK_DOC
+dist-check-gtkdoc:
+else
+dist-check-gtkdoc:
+	@echo "*** gtk-doc must be installed and enabled in order to make dist"
+	@false
+endif
+
+dist-hook: dist-check-gtkdoc dist-hook-local
+	mkdir $(distdir)/html
+	cp $(srcdir)/html/* $(distdir)/html
+	-cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
+	cd $(distdir) && rm -f $(DISTCLEANFILES)
+	$(GTKDOC_REBASE) --online --relative --html-dir=3D$(distdir)/html
+
+.PHONY : dist-hook-local docs
diff --git a/recipes/clutter/files/gtk-doc.make b/recipes/clutter/files/gtk=
-doc.make
deleted file mode 100644
index 354ffb7..0000000
--- a/recipes/clutter/files/gtk-doc.make
+++ /dev/null
@@ -1,173 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC =3D $(LIBTOOL) --mode=3Dcompile $(CC) $(INCLUDES) $(AM_CPPFLAGS)=
 $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD =3D $(LIBTOOL) --mode=3Dlink $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_L=
DFLAGS) $(LDFLAGS)
-else
-GTKDOC_CC =3D $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(=
CFLAGS)
-GTKDOC_LD =3D $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-endif
-
-# We set GPATH here; this gives us semantics for GNU make
-# which are more like other make's VPATH, when it comes to
-# whether a source that is a target of one rule is then
-# searched for in VPATH/GPATH.
-#
-GPATH =3D $(srcdir)
-
-TARGET_DIR=3D$(HTML_DIR)/$(DOC_MODULE)
-
-EXTRA_DIST =3D 				\
-	$(content_files)		\
-	$(HTML_IMAGES)			\
-	$(DOC_MAIN_SGML_FILE)		\
-	$(DOC_MODULE)-sections.txt	\
-	$(DOC_MODULE)-overrides.txt
-
-DOC_STAMPS=3Dscan-build.stamp tmpl-build.stamp sgml-build.stamp html-build=
.stamp \
-	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
-
-SCANOBJ_FILES =3D 		 \
-	$(DOC_MODULE).args 	 \
-	$(DOC_MODULE).hierarchy  \
-	$(DOC_MODULE).interfaces \
-	$(DOC_MODULE).prerequisites \
-	$(DOC_MODULE).signals
-
-REPORT_FILES =3D \
-	$(DOC_MODULE)-undocumented.txt \
-	$(DOC_MODULE)-undeclared.txt \
-	$(DOC_MODULE)-unused.txt
-
-CLEANFILES =3D $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
-
-if ENABLE_GTK_DOC
-all-local: html-build.stamp
-else
-all-local:
-endif
-
-docs: html-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	  gtkdoc-scan --module=3D$(DOC_MODULE) --source-dir=3D$(DOC_SOURCE_DIR) -=
-ignore-headers=3D"$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then=
 \
-	    CC=3D"$(GTKDOC_CC)" LD=3D"$(GTKDOC_LD)" CFLAGS=3D"$(GTKDOC_CFLAGS)" L=
DFLAGS=3D"$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=3D$(=
DOC_MODULE) --output-dir=3D$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_M=
ODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-se=
ctions.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-tmpl/*.sgml:
-	@true
-
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sec=
tions.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	gtkdoc-mkdb --module=3D$(DOC_MODULE) --source-dir=3D$(DOC_SOURCE_DIR) --o=
utput-format=3Dxml --expand-content-files=3D"$(expand_content_files)" --mai=
n-sgml-file=3D$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
-	touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	rm -rf $(srcdir)/html
-	mkdir $(srcdir)/html
-	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	test "x$(HTML_IMAGES)" =3D "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) htm=
l )
-	@echo 'gtk-doc: Fixing cross-references'
-	cd $(srcdir) && gtkdoc-fixxref --module-dir=3Dhtml --html-dir=3D$(HTML_DI=
R) $(FIXXREF_OPTIONS)
-	touch html-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	-installfiles=3D`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" =3D '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
-	  done; \
-	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
-	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :;=
 \
-	  which gtkdoc-rebase >/dev/null && \
-	    gtkdoc-rebase --relative --dest-dir=3D$(DESTDIR) --html-dir=3D$(DESTD=
IR)$(TARGET_DIR) ; \
-	fi
-=09
-
-uninstall-local:
-	rm -f $(DESTDIR)$(TARGET_DIR)/*
-
-#
-# Require gtk-doc when making dist
-#
-if ENABLE_GTK_DOC
-dist-check-gtkdoc:
-else
-dist-check-gtkdoc:
-	@echo "*** gtk-doc must be installed and enabled in order to make dist"
-	@false
-endif
-
-dist-hook: dist-check-gtkdoc dist-hook-local
-	mkdir $(distdir)/tmpl
-	mkdir $(distdir)/xml
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	-cp $(srcdir)/xml/*.xml $(distdir)/xml
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	-gtkdoc-rebase --online --relative --html-dir=3D$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/recipes/gnome/libchamplain-gtk_0.2.8.bb b/recipes/gnome/libcha=
mplain-gtk_0.2.8.bb
index e403da6..f9b49ee 100644
--- a/recipes/gnome/libchamplain-gtk_0.2.8.bb
+++ b/recipes/gnome/libchamplain-gtk_0.2.8.bb
@@ -1,6 +1,7 @@
 DESCRIPTION =3D "Libchamplain is a C library aimed to provide a Gtk+ widge=
t to display rasterized maps. "
 LICENSE =3D "LGPL"
-DEPENDS =3D "libchamplain clutter-gtk-0.8"
+DEPENDS =3D "libchamplain clutter-gtk"
+PR =3D "r1"
=20
 inherit gnome autotools
=20
diff --git a/recipes/gnome/libchamplain_0.2.8.bb b/recipes/gnome/libchampla=
in_0.2.8.bb
index 4e2b6b4..804874f 100644
--- a/recipes/gnome/libchamplain_0.2.8.bb
+++ b/recipes/gnome/libchamplain_0.2.8.bb
@@ -1,6 +1,7 @@
 DESCRIPTION =3D "Libchamplain is a C library aimed to provide a Gtk+ widge=
t to display rasterized maps. "
 LICENSE =3D "LGPL"
-DEPENDS =3D "clutter-cairo libsoup-2.4 clutter gtk+"
+DEPENDS =3D "libsoup-2.4 clutter gtk+"
+PR =3D "r1"
=20
 inherit gnome autotools
=20
diff --git a/recipes/moblin/bickley_git.bb b/recipes/moblin/bickley_git.bb
index fc7abc8..c4c1f7c 100644
--- a/recipes/moblin/bickley_git.bb
+++ b/recipes/moblin/bickley_git.bb
@@ -2,9 +2,9 @@ DESCRIPTION =3D "A meta data manager API and framework (inc=
luding Media)"
 SRC_URI =3D "git://git.moblin.org/${PN}.git;protocol=3Dgit"
 PV =3D "0.0"
 PR_append =3D "+git${SRCREV}"
-PR =3D "r4"
+PR =3D "r5"
=20
-DEPENDS =3D "redland gtk+ dbus-glib clutter-gst-0.9 libexif taglib gupnp g=
upnp-av samba"
+DEPENDS =3D "redland gtk+ dbus-glib clutter-gst libexif taglib gupnp gupnp=
-av samba"
 RDEPENDS_${PN} =3D "xdg-user-dirs"
=20
 S =3D "${WORKDIR}/git"
diff --git a/recipes/moblin/hornsey_git.bb b/recipes/moblin/hornsey_git.bb
index c5c62d4..e2cf840 100644
--- a/recipes/moblin/hornsey_git.bb
+++ b/recipes/moblin/hornsey_git.bb
@@ -3,10 +3,10 @@ LICENSE =3D "LGPLv2.1"
=20
 SRCREV =3D "125a1dea08d552ed2510ee762e1b54ca161915c1"
 PV =3D "0.0"
-PR =3D "r1"
+PR =3D "r2"
 PR_append =3D "+git${SRCREV}"
=20
-DEPENDS =3D "clutter-0.9 clutter-gst-0.9 bickley nbtk bognor-regis libuniq=
ue startup-notification gtk+"
+DEPENDS =3D "clutter clutter-gst bickley nbtk bognor-regis libunique start=
up-notification gtk+"
=20
 SRC_URI =3D "git://git.moblin.org/${PN}.git;protocol=3Dgit \
            file://fix-api.patch \
diff --git a/recipes/moblin/nbtk_git.bb b/recipes/moblin/nbtk_git.bb
index 174adeb..a189ae0 100644
--- a/recipes/moblin/nbtk_git.bb
+++ b/recipes/moblin/nbtk_git.bb
@@ -2,10 +2,10 @@ LICENSE =3D "LGPLv2.1"
=20
 SRCREV =3D "73958e79f0ad69dd4e63cb8e697bd80ecee1cc34"
 PV =3D "0.8.0"
-PR =3D "r1"
+PR =3D "r2"
 PR_append =3D "+git${SRCREV}"
=20
-DEPENDS =3D "glib-2.0 gtk+ libccss clutter-0.9"
+DEPENDS =3D "glib-2.0 gtk+ libccss clutter"
=20
 SRC_URI =3D "git://git.moblin.org/${PN}.git;protocol=3Dgit"
 S =3D "${WORKDIR}/git"
--=20
1.5.3.4


--Boundary-00=_AQ8dMk4XwrmrIoV--
