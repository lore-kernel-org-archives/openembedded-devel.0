Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RBw-0003bB-GA
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:32 +0200
Received: by fxm19 with SMTP id 19so1044428fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+X5AvAQxABFEqwn6fua+JI7oiNGCgogA+MFswPV1QxU=;
	b=JF/7+/9xtYWoLUsTePfTXx/9HVJim8aUINXSsOhC+FO/ZGYgD0UduAO+ww75LE7vcU
	igxm29Ji8WIBRuk+eVgyIEOO3wXN8BTa5Y4V++EMDt4N50x3oKXNKNpcDZMxeWRjA1DW
	XVYqSYcemnP9J7giIUsA28XaOvBIqbxOM30uc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=abvBBSIkTupANqMclNih2OvuDzHShBBfXYAj1sqa0L/AlDEB1s87QzrMeN7HRBCjKF
	Uehy4WfwgZmges6bCl7DzqPIpx+PXCQEqXG1gu+5Xz1BLxZROywueEQeMyZZ3Nrcs7qH
	Gdcj+5oXqSs1uEbhr3sVjcEF7YNAPto5jHfLk=
Received: by 10.223.98.8 with SMTP id o8mr973992fan.22.1302090263056;
	Wed, 06 Apr 2011 04:44:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm161086fam.40.2011.04.06.04.44.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:04 +0200
Message-Id: <1302090248-16251-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] xorg: add new versions
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
X-List-Received-Date: Wed, 06 Apr 2011 11:46:32 -0000

* xserver-xorg-1.10, dolt was removed in upstream a769f4c22a9cfb5ba248c924a66c31ec966bd8a0
* xserver-xorg-1.10, randr-support needs to be updated, but maybe won't
  be needed when new xinput-calibrator with config in xorg.conf.d is
  used (waiting for Marco)
* xf86-input-tslib needs to be ported to XINPUT 12 ABI or obsoleted
* tested only on om-gta02 for now, please test other devices

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-doc/xorg-sgml-doctools_1.7.bb         |    8 ++++
 recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb   |    8 ++++
 recipes/xorg-driver/xf86-input-mouse_1.7.0.bb      |    7 ++++
 recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb  |    9 +++++
 recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb   |    9 +++++
 recipes/xorg-driver/xf86-video-ati_6.14.1.bb       |    8 ++++
 recipes/xorg-driver/xf86-video-chips_1.2.4.bb      |    7 ++++
 recipes/xorg-driver/xf86-video-geode_2.11.12.bb    |    9 +++++
 recipes/xorg-driver/xf86-video-intel_2.14.902.bb   |   11 ++++++
 .../xorg-driver/xf86-video-siliconmotion_1.7.5.bb  |    7 ++++
 .../xorg-lib/libx11-1.4.3/keysymdef_include.patch  |   19 ++++++++++
 .../libx11-1.4.3/x11_disable_makekeys.patch        |   29 +++++++++++++++
 recipes/xorg-lib/libx11_1.4.3.bb                   |    8 ++++
 recipes/xorg-lib/libxfixes_5.0.bb                  |   13 +++++++
 recipes/xorg-lib/libxi_1.4.2.bb                    |   10 +++++
 recipes/xorg-lib/libxt_1.1.1.bb                    |   22 +++++++++++
 recipes/xorg-proto/fixesproto_5.0.bb               |    9 +++++
 recipes/xorg-proto/xextproto_7.2.0.bb              |    7 ++++
 recipes/xorg-proto/xproto_7.0.21.bb                |    7 ++++
 recipes/xorg-util/util-macros_1.13.0.bb            |    4 ++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++++++
 .../hack-fbdev-ignore-return-mode.patch            |   39 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb    |   29 +++++++++++++++
 23 files changed, 293 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.7.bb
 create mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-mouse_1.7.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-ati_6.14.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.4.bb
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.12.bb
 create mode 100644 recipes/xorg-driver/xf86-video-intel_2.14.902.bb
 create mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb
 create mode 100644 recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch
 create mode 100644 recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
 create mode 100644 recipes/xorg-lib/libx11_1.4.3.bb
 create mode 100644 recipes/xorg-lib/libxfixes_5.0.bb
 create mode 100644 recipes/xorg-lib/libxi_1.4.2.bb
 create mode 100644 recipes/xorg-lib/libxt_1.1.1.bb
 create mode 100644 recipes/xorg-proto/fixesproto_5.0.bb
 create mode 100644 recipes/xorg-proto/xextproto_7.2.0.bb
 create mode 100644 recipes/xorg-proto/xproto_7.0.21.bb
 create mode 100644 recipes/xorg-util/util-macros_1.13.0.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb

diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.7.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.7.bb
new file mode 100644
index 0000000..af85da3
--- /dev/null
+++ b/recipes/xorg-doc/xorg-sgml-doctools_1.7.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2588efb3f49f7fc6ecf41ce42e0b2e5e"
+SRC_URI[archive.sha256sum] = "84fd94e5c50556e6f77501485f8a48724cf3c95c6d58480bc280258ba14580c8"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb b/recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb
new file mode 100644
index 0000000..b3a7538
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- keyboard input driver"
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e2abe9f13e526a73cb68a7d257546eba"
+SRC_URI[archive.sha256sum] = "c46c790fec905d696573b7a374b10ab8b4389112a8f69993fe011006c99e858e"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.7.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.7.0.bb
new file mode 100644
index 0000000..6783e06
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-mouse_1.7.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "7f31472689c15b6de62eff04d0fb57d7"
+SRC_URI[archive.sha256sum] = "4e989542b5e9e0c5f9087288b18e70de1064dd27c83a4bc6dce58f3ea9d74994"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb b/recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb
new file mode 100644
index 0000000..17b9a33
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.1"
+
+EXTRA_OEMAKE += " sdkdir=${STAGING_INCDIR}/xorg "
+
+SRC_URI[archive.md5sum] = "cbe487f9d22237d1e39c7d0b5812ab7e"
+SRC_URI[archive.sha256sum] = "5874d979f028636dbddf14fffb84b496b006e63d5ea8dfa120820e58642812c2"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb
new file mode 100644
index 0000000..9cbd997
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dc77181330f983c7d0ec1ea1592c2ca7"
+SRC_URI[archive.sha256sum] = "00e5d527a0d97e6b2a6e8c519e1339427e66fa0a43af026858655c7c62bd9e35"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.14.1.bb b/recipes/xorg-driver/xf86-video-ati_6.14.1.bb
new file mode 100644
index 0000000..f388472
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-ati_6.14.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "395e23ad026e4246dd70bbd2143688b5"
+SRC_URI[archive.sha256sum] = "e457285096e1e40f53ae5b58b948906c69add5160cc38ce510f0d15e82d91c75"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.4.bb b/recipes/xorg-driver/xf86-video-chips_1.2.4.bb
new file mode 100644
index 0000000..d505b82
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-chips_1.2.4.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Chips display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7aed07116e56c0630f62d7d34d7526e1"
+SRC_URI[archive.sha256sum] = "fb6dc34a8d7db82dc6d555cebe6f95c2269dda4872118978345f6e1215ab4d25"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.12.bb b/recipes/xorg-driver/xf86-video-geode_2.11.12.bb
new file mode 100644
index 0000000..3320bad
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a99c521db731c2f1df309057a8465e4c"
+SRC_URI[archive.sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.14.902.bb b/recipes/xorg-driver/xf86-video-intel_2.14.902.bb
new file mode 100644
index 0000000..20f47d0
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-intel_2.14.902.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
+RDEPENDS_${PN} += "xserver-xorg-extension-dri \
+             xserver-xorg-extension-dri2 \
+             xserver-xorg-extension-glx"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7c48151a87311beea39837812e7b9e2b"
+SRC_URI[archive.sha256sum] = "da9ab33ad03c2a51d1c78d648d481f251b5fd3c13f0644a58a7f097b08d6a27f"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb
new file mode 100644
index 0000000..d358737
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9ca392e16028a2f7c3ebc57f0aa4c1aa"
+SRC_URI[archive.sha256sum] = "97dd597186029d5646923dde84f4c7f38080ce24c80fd127dcdb8fb36eec7913"
diff --git a/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch
new file mode 100644
index 0000000..1a30e34
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch
@@ -0,0 +1,19 @@
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.3.4/src/util/Makefile.am
+===================================================================
+--- libX11-1.3.4.orig/src/util/Makefile.am
++++ libX11-1.3.4/src/util/Makefile.am
+@@ -1,24 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+-
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/recipes/xorg-lib/libx11_1.4.3.bb b/recipes/xorg-lib/libx11_1.4.3.bb
new file mode 100644
index 0000000..11f44cb
--- /dev/null
+++ b/recipes/xorg-lib/libx11_1.4.3.bb
@@ -0,0 +1,8 @@
+require libx11.inc
+#--without-xcb is not an option anymore
+#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
+DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "85e942627aaa020813e0eb8433353563"
+SRC_URI[archive.sha256sum] = "38b5ddd93291714a46a02cb8a5dd94b995a04ed76a608551c44d1598e113635a"
diff --git a/recipes/xorg-lib/libxfixes_5.0.bb b/recipes/xorg-lib/libxfixes_5.0.bb
new file mode 100644
index 0000000..db80f66
--- /dev/null
+++ b/recipes/xorg-lib/libxfixes_5.0.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Fixes extension library."
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "678071bd7f9f7467e2fc712d81022318"
+SRC_URI[archive.sha256sum] = "537a2446129242737a35db40081be4bbcc126e56c03bf5f2b142b10a79cda2e3"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfixes"
diff --git a/recipes/xorg-lib/libxi_1.4.2.bb b/recipes/xorg-lib/libxi_1.4.2.bb
new file mode 100644
index 0000000..c1d944b
--- /dev/null
+++ b/recipes/xorg-lib/libxi_1.4.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3d14f7bfc4a4335cf0144de9b67a5444"
+SRC_URI[archive.sha256sum] = "272b8041efc0a0203fb0ba33481ddec989539aed862181b58c8c3e410e325691"
+
+XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxt_1.1.1.bb b/recipes/xorg-lib/libxt_1.1.1.bb
new file mode 100644
index 0000000..946d511
--- /dev/null
+++ b/recipes/xorg-lib/libxt_1.1.1.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 toolkit intrinsics library"
+DEPENDS += "libsm virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "eb22c0a1f172b06b97a3f5ae89768412"
+SRC_URI[archive.sha256sum] = "a2a1c29c684e3c9082cdb920b5aea802b179d19107b9ab2170fda07575559da7"
+
+EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
+
+do_compile() {
+        (
+                unset CC LD CXX CCLD
+                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
+        ) || exit 1
+        oe_runmake
+}
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXt"
diff --git a/recipes/xorg-proto/fixesproto_5.0.bb b/recipes/xorg-proto/fixesproto_5.0.bb
new file mode 100644
index 0000000..9ca1543
--- /dev/null
+++ b/recipes/xorg-proto/fixesproto_5.0.bb
@@ -0,0 +1,9 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e7431ab84d37b2678af71e29355e101d"
+SRC_URI[archive.sha256sum] = "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce"
+
+
+CONFLICTS = "fixesext"
diff --git a/recipes/xorg-proto/xextproto_7.2.0.bb b/recipes/xorg-proto/xextproto_7.2.0.bb
new file mode 100644
index 0000000..37b4da2
--- /dev/null
+++ b/recipes/xorg-proto/xextproto_7.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "220732210ceffb01bf1caf970e3b1bfb"
+SRC_URI[archive.sha256sum] = "d2bc4208c6b1883ebe00bc5c0048e5d825038cda56775f74bb4aa89afdc576d5"
+
diff --git a/recipes/xorg-proto/xproto_7.0.21.bb b/recipes/xorg-proto/xproto_7.0.21.bb
new file mode 100644
index 0000000..c9f1a8c
--- /dev/null
+++ b/recipes/xorg-proto/xproto_7.0.21.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c5a93a69b701cf81925fab02b35b0d0e"
+SRC_URI[archive.sha256sum] = "38ee2f032c3a9e30504593f8b5e6c1161a6629daba93748a71c6f70c16f65548"
+
diff --git a/recipes/xorg-util/util-macros_1.13.0.bb b/recipes/xorg-util/util-macros_1.13.0.bb
new file mode 100644
index 0000000..5ecba18
--- /dev/null
+++ b/recipes/xorg-util/util-macros_1.13.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
+SRC_URI[archive.sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch
@@ -0,0 +1,14 @@
+diff --git a/fb/fbcopy.c b/fb/fbcopy.c
+index 07eb663..ba394b7 100644
+--- a/fb/fbcopy.c
++++ b/fb/fbcopy.c
+@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
+     while (nbox--)
+     {
+ #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
+-	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
+-	    !upsidedown)
++	if (pm == FB_ALLONES && alu == GXcopy)
+ 	{
+ 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
+ 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb b/recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb
new file mode 100644
index 0000000..99a32e9
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb
@@ -0,0 +1,29 @@
+# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
+DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
+
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+            file://hack-fbdev-ignore-return-mode.patch \
+            file://hack-assume-pixman-supports-overlapped-blt.patch \
+           "
+SRC_URI[archive.md5sum] = "d750cf5f6342b548b7ac2be56e9d1841"
+SRC_URI[archive.sha256sum] = "de18f52c35fc3d3f18c7e905296f9de5ac42dc71e4e01da9ae8e154a78c7771c"
+
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+# The NVidia driver requires Xinerama support in the X server. Ion uses it.
+PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
+XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
+
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
+
+export LDFLAGS += " -ldl "
-- 
1.7.4.1



