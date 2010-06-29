Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OTd9R-0007WY-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 17:55:11 +0200
Received: (qmail invoked by alias); 29 Jun 2010 15:50:25 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp059) with SMTP; 29 Jun 2010 17:50:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/akpZ/1J/axj40azBc3l6QJMGDJ8Z9tgsDLhYcCN
	V/IWvC+wbOuES/
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 17:47:11 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201006291747.12761.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems bumping clutter recipes
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
X-List-Received-Date: Tue, 29 Jun 2010 15:55:11 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I am working on building clutter recipes (clutter / clutter-box2d / clutter=
=2Dgtk / clutter-gst). Since none of the recipes worked - most crashed alre=
ady during patching - I decided to rework these=20
recipes and bump to latest stable versions. With clutter / clutter-box2d / =
clutter-gtk I had success so far but now I am in trouble with clutter-gst.

The modifications I made:

=2D------------------------------------------------------------------------=
=2D---------------------------------------------------------------
=46rom 503e5976ff638b278511d232c69058c03e4a2cea Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Tue, 29 Jun 2010 16:25:31 +0200
Subject: [PATCH] Bump clutter recipes to latest stable versions

Note: clutter-gst fails during compile at overo environment!

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 recipes/clutter/clutter-box2d.inc           |    2 +-
 recipes/clutter/clutter-box2d_0.10.0_git.bb |   13 +++++++++++++
 recipes/clutter/clutter-gst.inc             |   13 +------------
 recipes/clutter/clutter-gst_1.0.0.bb        |   12 ++++++++++++
 recipes/clutter/clutter-gtk_0.10.4.bb       |   12 ++++++++++++
 recipes/clutter/clutter.inc                 |    2 +-
 recipes/clutter/clutter_1.2.10.bb           |   18 ++++++++++++++++++
 7 files changed, 58 insertions(+), 14 deletions(-)
 create mode 100644 recipes/clutter/clutter-box2d_0.10.0_git.bb
 create mode 100644 recipes/clutter/clutter-gst_1.0.0.bb
 create mode 100644 recipes/clutter/clutter-gtk_0.10.4.bb
 create mode 100644 recipes/clutter/clutter_1.2.10.bb

diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-bo=
x2d.inc
index 8189d12..bb4f1b6 100644
=2D-- a/recipes/clutter/clutter-box2d.inc
+++ b/recipes/clutter/clutter-box2d.inc
@@ -5,7 +5,7 @@ LICENSE =3D "GPLv2"
 DEPENDS =3D "clutter"
=20
 # The main clutter lib is machine specific so we need to be too
=2DPACKAGE_ARCH =3D "${MACHINE_ARCH}"
+#PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit autotools pkgconfig gtk-doc
=20
diff --git a/recipes/clutter/clutter-box2d_0.10.0_git.bb b/recipes/clutter/=
clutter-box2d_0.10.0_git.bb
new file mode 100644
index 0000000..6417a7d
=2D-- /dev/null
+++ b/recipes/clutter/clutter-box2d_0.10.0_git.bb
@@ -0,0 +1,13 @@
+require clutter-box2d.inc
+
+SRCREV =3D "dae84a82efe22b284cba8ca1985ce14bb4e86c99"
+
+PV =3D "0.10.0"
+PR =3D "r0"
+PR_append =3D "+git${SRCREV}"
+
+SRC_URI =3D "git://git.clutter-project.org/clutter-box2d.git;protocol=3Dgi=
t"
+
+S =3D "${WORKDIR}/git"
+
+
diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.=
inc
index fa8f810..262f033 100644
=2D-- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -7,17 +7,6 @@ DEPENDS =3D "clutter gstreamer gst-plugins-base"
 PACKAGES =3D+ "${PN}-examples"
 FILES_${PN}-examples =3D "${bindir}/video-player ${bindir}/video-sink ${bi=
ndir}/audio"
=20
=2Dinherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
=20
=2Ddo_configure_prepend() {
=2D	if [ -e ${WORKDIR}/gtk-doc.make ] ; then
=2D		cp ${WORKDIR}/gtk-doc.make ${S}/gtk-doc.make
=2D	else
=2D		touch ${S}/gtk-doc.make
=2D	fi
=2D}
=2D
=2Ddo_stage () {
=2D        autotools_stage_all
=2D}
=20
diff --git a/recipes/clutter/clutter-gst_1.0.0.bb b/recipes/clutter/clutter=
=2Dgst_1.0.0.bb
new file mode 100644
index 0000000..ef6589f
=2D-- /dev/null
+++ b/recipes/clutter/clutter-gst_1.0.0.bb
@@ -0,0 +1,12 @@
+require clutter-gst.inc
+
+PR =3D "r0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gst/1.0/clu=
tter-gst-${PV}.tar.bz2 \
+          "
+
+# The main clutter lib is machine specific so we need to be too
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+SRC_URI[md5sum] =3D "673e9548172698ebd48713ebedff500c"
+SRC_URI[sha256sum] =3D "ae6ec048b570157130e9f9069f2495caf0da9eefa8d7f3b178=
9f3346fb16f696"
diff --git a/recipes/clutter/clutter-gtk_0.10.4.bb b/recipes/clutter/clutte=
r-gtk_0.10.4.bb
new file mode 100644
index 0000000..8f4e6a8
=2D-- /dev/null
+++ b/recipes/clutter/clutter-gtk_0.10.4.bb
@@ -0,0 +1,12 @@
+require clutter-gtk.inc
+
+PR =3D "r0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter-gtk/0.10/cl=
utter-gtk-${PV}.tar.bz2 \
+          "
+
+DEPENDS =3D "clutter"
+
+SRC_URI[md5sum] =3D "fd015e8080e1212dacc95d0e3d776d0d"
+SRC_URI[sha256sum] =3D "0134a8de202c518e231f340f5f2f3e988350105de9fadd0e84=
9f08d95ac1b912"
+
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index fce3236..8f38419 100644
=2D-- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -4,7 +4,7 @@ LICENSE =3D "LGPL"
=20
 COMPATIBLE_MACHINE =3D "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx=
31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm3730-am3715-evm|beagleboard|ov=
ero|omap3evm|
omap5912osk)"
=20
=2DSTDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes g=
tk+"
+STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk=
+ cairo"
 BASE_CONF =3D "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
=20
 DEPENDS =3D "${STDDEPENDS} virtual/libgl"
diff --git a/recipes/clutter/clutter_1.2.10.bb b/recipes/clutter/clutter_1.=
2.10.bb
new file mode 100644
index 0000000..298972d
=2D-- /dev/null
+++ b/recipes/clutter/clutter_1.2.10.bb
@@ -0,0 +1,18 @@
+require clutter.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "http://source.clutter-project.org/sources/clutter/1.2/clutter=
=2D${PV}.tar.bz2 \
+          "
+
+PARALLEL_MAKE =3D ""
+
+do_compile_prepend() {
+	for i in $(find ${S} -name Makefile) ; do
+		sed -i -e s:-Werror::g $i
+	done
+    ( cd clutter/cogl/gles ; for i in *.glsl ; do sh stringify.sh -h $i ; =
done )
+}
+
+SRC_URI[md5sum] =3D "ca8dbc4a65c55720779872c13eac86ba"
+SRC_URI[sha256sum] =3D "26cdee7a528eb1346553d16ae8d8d87f35a8a46c0a86829eab=
d227067e84da5d"
=2D-=20
1.5.3.4
=2D------------------------------------------------------------------------=
=2D---------------------------------------------------------------

Some comments of what I did:

1. clutter-box2d does use latest git because the stable version is missing =
HAVE_INTROSPECTION (see=20
http://git.clutter-project.org/clutter-box2d/commit/?id=3Ddae84a82efe22b284=
cba8ca1985ce14bb4e86c99)
2. In clutter-box2d.inc I removed PACKAGE_ARCH =3D "${MACHINE_ARCH}" becaus=
e I had the feeling that this caused OE build an empty image.
3. To get clutter-gst I did several attempts:
	- With or without PACKAGE_ARCH =3D "${MACHINE_ARCH}"=20
	- Checked poky recipes
	- Tried with latest git version

All compiling attempts lead to a bunch of warnings like

| /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/gstreamer-0.10/gst/gstmessage.h: In function 'gst_message_ref':
| /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/gstreamer-0.10/gst/gstmessage.h:306: warning: cast increases req=
uired alignment of target type
| /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/gstreamer-0.10/gst/gstmessage.h: In function 'gst_message_copy':
| /home/Superandi/OpenEmbedded/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/include/gstreamer-0.10/gst/gstmessage.h:344: warning: cast increases req=
uired alignment of target type

and ends up in error

| ./clutter-gst-video-sink.c:138: error: expected ')' before 'GLUNIFORM1IPR=
OC'
| ./clutter-gst-video-sink.c:140: error: expected ')' before 'GLGENPROGRAMS=
PROC'
| ./clutter-gst-video-sink.c:141: error: expected ')' before 'GLBINDPROGRAM=
PROC'
| ./clutter-gst-video-sink.c:142: error: expected ')' before 'GLPROGRAMSTRI=
NGPROC'
| ./clutter-gst-video-sink.c:147: error: expected specifier-qualifier-list =
before 'GLGENPROGRAMSPROC'

The code found from clutter-gst-video-sink.c:138 is

typedef void (APIENTRYP GLUNIFORM1IPROC)(GLint location, GLint value);
/* GL_ARB_fragment_program */
typedef void (APIENTRYP GLGENPROGRAMSPROC)(GLsizei n, GLuint *programs);
typedef void (APIENTRYP GLBINDPROGRAMPROC)(GLenum target, GLuint program);
typedef void (APIENTRYP GLPROGRAMSTRINGPROC)(GLenum target, GLenum format,
                                             GLsizei len, const void *strin=
g);

I seems that APIENTRYP is not defined. APIENTRYP is found in <OEDir>/tmp/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/include/GL/gl.h the mesa OpenGL he=
ader which is not to be included=20
here. The header of interest which is coming from libgles-omap3 in <OEDir>/=
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/GLES2/gl2.h does not=
 define APIENTRYP.

OK these are the symthoms.

What is a good solution? Creating a patch which adds APIENTRYP (and others)=
 to GLES2/gl2.h? I am afraid that this is not the solution because the warn=
ings make me feel that it might leed to a=20
successful build but will the code work as expected? To me it seems that th=
ere is some configure/automake option not properly feeded - especially if y=
ou take a look on clutter-gst-video-sink.c:=20
It seems there is code to feed shaders (do we have any on omap3?). Is possi=
ble that clutter-gst is not suitable for omap3 or did it ever build?

I would be very pleased to get some suggestions on this...



