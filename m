Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZho-0002Wu-Q7
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:44 +0100
Received: by fg-out-1718.google.com with SMTP id 19so637153fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FClytyNu7MA073fLv42OB2xLA+XXo4P5lMUgLTHjUcc=;
	b=QOY6ezTwV4u3nJ7uTm7mqW1Ryfqu/1sPN0w1jmphiL6aFobjSq2J99sRhODQLg+IUl
	hscg0vXNL6dmcAeacAS44joblYEW/1n3adSQ5R0NapYUIKNQTFE7du/0wDtALvLgEqYY
	VU36KQtwu+pmr0g68KVB3fBlmYd+9btGZ+Tqg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wJlQHBQwmv80yMTbMOsWH5DQDtIXidviw5DzBX6w3YKYnVLt9DsZKh+oOfHFwtyZZe
	izwpRny0YHv44iA9XQE6zQ6+3fuV9cWterCkYzUhLohYsmpGOKcWa3vC0f8KL/Hzj50G
	bcIlKvAI4sz9eZAJnntPLphBfVQyjptlms9PE=
Received: by 10.87.21.36 with SMTP id y36mr75857fgi.17.1263990506868;
	Wed, 20 Jan 2010 04:28:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3161756fxm.8.2010.01.20.04.28.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:58 +0100
Message-Id: <1263990478-28107-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-6-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>
	<1263990478-28107-6-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 6/6] xorg: update recipes to latest releases 2010-01-18
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../include/preferred-xorg-versions-live.inc       |   29 ++++++++---------
 recipes/dri/libdrm_2.4.17.bb                       |   16 +++++++++
 recipes/xorg-app/xvidtune_1.0.2.bb                 |    6 +++
 recipes/xorg-driver/xf86-video-intel_2.10.0.bb     |    5 +++
 recipes/xorg-driver/xf86-video-vesa_2.3.0.bb       |    2 +
 recipes/xorg-driver/xf86-video-vmware_10.16.9.bb   |    6 +++
 .../libx11-1.3.3/x11_disable_makekeys.patch        |   23 ++++++++++++++
 recipes/xorg-lib/libx11-native_1.3.3.bb            |   10 ++++++
 recipes/xorg-lib/libx11_1.3.3.bb                   |   33 ++++++++++++++++++++
 recipes/xorg-proto/dri2proto_2.2.bb                |    3 ++
 recipes/xorg-proto/glproto_1.4.11.bb               |    4 ++
 recipes/xorg-util/util-macros-native_1.5.0.bb      |    7 ++++
 recipes/xorg-util/util-macros_1.5.0.bb             |    6 +++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ++++++++
 recipes/xorg-xserver/xserver-xorg_1.7.4.bb         |   25 +++++++++++++++
 15 files changed, 173 insertions(+), 16 deletions(-)
 create mode 100644 recipes/dri/libdrm_2.4.17.bb
 create mode 100644 recipes/xorg-app/xvidtune_1.0.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-intel_2.10.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-vesa_2.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
 create mode 100644 recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
 create mode 100644 recipes/xorg-lib/libx11-native_1.3.3.bb
 create mode 100644 recipes/xorg-lib/libx11_1.3.3.bb
 create mode 100644 recipes/xorg-proto/dri2proto_2.2.bb
 create mode 100644 recipes/xorg-proto/glproto_1.4.11.bb
 create mode 100644 recipes/xorg-util/util-macros-native_1.5.0.bb
 create mode 100644 recipes/xorg-util/util-macros_1.5.0.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.4/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.7.4.bb

diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/distro/include/preferred-xorg-versions-live.inc
index bea2b41..65e94fa 100644
--- a/conf/distro/include/preferred-xorg-versions-live.inc
+++ b/conf/distro/include/preferred-xorg-versions-live.inc
@@ -1,4 +1,4 @@
-#Thu Dec 31 14:54:51 CET 2009
+#Mon Jan 18 14:00:56 CET 2010
 #app
 PREFERRED_VERSION_appres ?= "1.0.2"
 PREFERRED_VERSION_bdftopcf ?= "1.0.2"
@@ -98,7 +98,7 @@ PREFERRED_VERSION_xsetroot ?= "1.0.3"
 PREFERRED_VERSION_xsm ?= "1.0.1"
 PREFERRED_VERSION_xstdcmap ?= "1.0.1"
 PREFERRED_VERSION_xtrap ?= "1.0.2"
-PREFERRED_VERSION_xvidtune ?= "1.0.1"
+PREFERRED_VERSION_xvidtune ?= "1.0.2"
 PREFERRED_VERSION_xvinfo ?= "1.1.0"
 PREFERRED_VERSION_xwd ?= "1.0.3"
 PREFERRED_VERSION_xwininfo ?= "1.0.5"
@@ -156,8 +156,7 @@ PREFERRED_VERSION_xf86-video-i740 ?= "1.3.2"
 PREFERRED_VERSION_xf86-video-i810 ?= "1.7.4"
 PREFERRED_VERSION_xf86-video-impact ?= "0.2.0"
 PREFERRED_VERSION_xf86-video-imstt ?= "1.1.0"
-#PREFERRED_VERSION_xf86-video-intel ?= "2.9.99.902"
-PREFERRED_VERSION_xf86-video-intel ?= "2.9.1"
+PREFERRED_VERSION_xf86-video-intel ?= "2.10.0"
 PREFERRED_VERSION_xf86-video-mach64 ?= "6.8.2"
 PREFERRED_VERSION_xf86-video-mga ?= "1.9.100"
 PREFERRED_VERSION_xf86-video-neomagic ?= "1.2.4"
@@ -187,11 +186,10 @@ PREFERRED_VERSION_xf86-video-trident ?= "1.3.3"
 PREFERRED_VERSION_xf86-video-tseng ?= "1.2.3"
 PREFERRED_VERSION_xf86-video-v4l ?= "0.2.0"
 PREFERRED_VERSION_xf86-video-vermilion ?= "1.0.1"
-PREFERRED_VERSION_xf86-video-vesa ?= "2.2.1"
+PREFERRED_VERSION_xf86-video-vesa ?= "2.3.0"
 PREFERRED_VERSION_xf86-video-vga ?= "4.1.0"
 PREFERRED_VERSION_xf86-video-via ?= "0.2.2"
-#PREFERRED_VERSION_xf86-video-vmware ?= "10.16.9"
-PREFERRED_VERSION_xf86-video-vmware ?= "10.16.8"
+PREFERRED_VERSION_xf86-video-vmware ?= "10.16.9"
 PREFERRED_VERSION_xf86-video-voodoo ?= "1.2.3"
 PREFERRED_VERSION_xf86-video-wsfb ?= "0.3.0"
 PREFERRED_VERSION_xf86-video-xgi ?= "1.5.1"
@@ -244,8 +242,8 @@ PREFERRED_VERSION_libice-native ?= "1.0.6"
 PREFERRED_VERSION_libsm ?= "1.1.1"
 PREFERRED_VERSION_libsm-native ?= "1.1.1"
 PREFERRED_VERSION_libwindowswm ?= "1.0.1"
-PREFERRED_VERSION_libx11 ?= "1.3.2"
-PREFERRED_VERSION_libx11-native ?= "1.3.2"
+PREFERRED_VERSION_libx11 ?= "1.3.3"
+PREFERRED_VERSION_libx11-native ?= "1.3.3"
 PREFERRED_VERSION_libxscrnsaver ?= "1.2.0"
 PREFERRED_VERSION_libxtrap ?= "1.0.0"
 PREFERRED_VERSION_libxau ?= "1.0.5"
@@ -294,8 +292,7 @@ PREFERRED_VERSION_libpciaccess ?= "0.11.0"
 PREFERRED_VERSION_libxkbfile ?= "1.0.6"
 PREFERRED_VERSION_libxkbfile-native ?= "1.0.6"
 PREFERRED_VERSION_libxkbui ?= "1.0.2"
-#PREFERRED_VERSION_pixman ?= "0.17.2"
-PREFERRED_VERSION_pixman ?= "0.16.2"
+PREFERRED_VERSION_pixman ?= "0.17.4"
 PREFERRED_VERSION_xtrans ?= "1.2.5"
 PREFERRED_VERSION_xtrans-native ?= "1.2.5"
 #proto
@@ -305,7 +302,7 @@ PREFERRED_VERSION_bigreqsproto-native ?= "1.1.0"
 PREFERRED_VERSION_compositeproto ?= "0.4.1"
 PREFERRED_VERSION_damageproto ?= "1.2.0"
 PREFERRED_VERSION_dmxproto ?= "2.3"
-PREFERRED_VERSION_dri2proto ?= "2.1"
+PREFERRED_VERSION_dri2proto ?= "2.2"
 PREFERRED_VERSION_evieext ?= "1.1.0"
 PREFERRED_VERSION_fixesproto ?= "4.1.1"
 PREFERRED_VERSION_fixesproto-native ?= "4.1.1"
@@ -313,7 +310,7 @@ PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
 PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
 PREFERRED_VERSION_fontsproto ?= "2.1.0"
 PREFERRED_VERSION_fontsproto-native ?= "2.1.0"
-PREFERRED_VERSION_glproto ?= "1.4.10"
+PREFERRED_VERSION_glproto ?= "1.4.11"
 PREFERRED_VERSION_inputproto ?= "2.0"
 PREFERRED_VERSION_inputproto-native ?= "2.0"
 PREFERRED_VERSION_kbproto ?= "1.0.4"
@@ -349,9 +346,9 @@ PREFERRED_VERSION_imake ?= "1.0.2"
 PREFERRED_VERSION_lndir ?= "1.0.1"
 PREFERRED_VERSION_makedepend ?= "1.0.2"
 PREFERRED_VERSION_makedepend-native ?= "1.0.2"
-PREFERRED_VERSION_util-macros ?= "1.4.1"
-PREFERRED_VERSION_util-macros-native ?= "1.4.1"
+PREFERRED_VERSION_util-macros ?= "1.5.0"
+PREFERRED_VERSION_util-macros-native ?= "1.5.0"
 PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
 #xserver
 #PREFERRED_VERSION_xserver-xorg ?= "1.7.99.2"
-PREFERRED_VERSION_xserver-xorg ?= "1.7.3"
+PREFERRED_VERSION_xserver-xorg ?= "1.7.4"
diff --git a/recipes/dri/libdrm_2.4.17.bb b/recipes/dri/libdrm_2.4.17.bb
new file mode 100644
index 0000000..4f2af1e
--- /dev/null
+++ b/recipes/dri/libdrm_2.4.17.bb
@@ -0,0 +1,16 @@
+SECTION = "x11/base"
+DEPENDS = "libpthread-stubs"
+LICENSE = "MIT"
+SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
+PROVIDES = "drm"
+PR = "r1"
+
+inherit autotools pkgconfig
+
+do_stage() {
+	autotools_stage_all
+}
+
+PACKAGES =+ "${PN}-intel"
+
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
diff --git a/recipes/xorg-app/xvidtune_1.0.2.bb b/recipes/xorg-app/xvidtune_1.0.2.bb
new file mode 100644
index 0000000..bfab14a
--- /dev/null
+++ b/recipes/xorg-app/xvidtune_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " libxaw libxxf86vm libxt"
+
+FILES_${PN} += " ${datadir}/X11/app-defaults/Xvidtune "
diff --git a/recipes/xorg-driver/xf86-video-intel_2.10.0.bb b/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
new file mode 100644
index 0000000..eed1fcb
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.3.0.bb b/recipes/xorg-driver/xf86-video-vesa_2.3.0.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-vesa_2.3.0.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
new file mode 100644
index 0000000..994b8b6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
diff --git a/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
new file mode 100644
index 0000000..5d0a24c
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
@@ -0,0 +1,23 @@
+diff -uNr libX11-1.3.3.orig/src/util/Makefile.am libX11-1.3.3/src/util/Makefile.am
+--- libX11-1.3.3.orig/src/util/Makefile.am	2010-01-15 02:11:36.000000000 +0100
++++ libX11-1.3.3/src/util/Makefile.am	2010-01-18 14:48:27.000000000 +0100
+@@ -1,19 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS=$(X11_CFLAGS)
+-
+-CC = @CC_FOR_BUILD@
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
diff --git a/recipes/xorg-lib/libx11-native_1.3.3.bb b/recipes/xorg-lib/libx11-native_1.3.3.bb
new file mode 100644
index 0000000..98fe79f
--- /dev/null
+++ b/recipes/xorg-lib/libx11-native_1.3.3.bb
@@ -0,0 +1,10 @@
+require libx11_${PV}.bb
+
+SRC_URI += "file://dolt-fix.patch;patch=1"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
+
+DEPENDS = "xproto-native xextproto-native libxau-native xtrans-native libxdmcp-native xcmiscproto-native xf86bigfontproto-native kbproto-native inputproto-native bigreqsproto-native util-macros-native"
+PROVIDES = ""
+
+inherit native
diff --git a/recipes/xorg-lib/libx11_1.3.3.bb b/recipes/xorg-lib/libx11_1.3.3.bb
new file mode 100644
index 0000000..8858a09
--- /dev/null
+++ b/recipes/xorg-lib/libx11_1.3.3.bb
@@ -0,0 +1,33 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "Base X libs."
+DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
+PROVIDES = "virtual/libx11"
+PE = "1"
+PR = "r3"
+
+XORG_PN = "libX11"
+
+SRC_URI += "file://x11_disable_makekeys.patch;patch=1 \
+#            file://dolt-fix.patch;patch=1 \
+#            file://keysymdef_include.patch;patch=1 \
+"
+
+EXTRA_OECONF += "--without-xcb --with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
+
+do_compile() {
+	(
+		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
+		cd src/util; 
+		mv makekeys.c.orig makekeys.c || true
+		touch makekeys-makekeys.o ; ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+		# mv to stop it getting rebuilt
+		mv makekeys.c makekeys.c.orig
+		cd ../../
+	) || exit 1
+	oe_runmake
+}
+
+FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
diff --git a/recipes/xorg-proto/dri2proto_2.2.bb b/recipes/xorg-proto/dri2proto_2.2.bb
new file mode 100644
index 0000000..a0e1fd3
--- /dev/null
+++ b/recipes/xorg-proto/dri2proto_2.2.bb
@@ -0,0 +1,3 @@
+DESCRIPTION = "DRI2 extension headers"
+
+require xorg-proto-common.inc
diff --git a/recipes/xorg-proto/glproto_1.4.11.bb b/recipes/xorg-proto/glproto_1.4.11.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/glproto_1.4.11.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-util/util-macros-native_1.5.0.bb b/recipes/xorg-util/util-macros-native_1.5.0.bb
new file mode 100644
index 0000000..618e78f
--- /dev/null
+++ b/recipes/xorg-util/util-macros-native_1.5.0.bb
@@ -0,0 +1,7 @@
+require util-macros_${PV}.bb
+
+inherit native
+
+XORG_PN = "util-macros"
+
+S = "${WORKDIR}/util-macros-${PV}"
diff --git a/recipes/xorg-util/util-macros_1.5.0.bb b/recipes/xorg-util/util-macros_1.5.0.bb
new file mode 100644
index 0000000..4775fc6
--- /dev/null
+++ b/recipes/xorg-util/util-macros_1.5.0.bb
@@ -0,0 +1,6 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "X autotools macros"
+PE = "1"
+
+ALLOW_EMPTY = "1"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.4/hack-assume-pixman-supports-overlapped-blt.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.4.bb b/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
new file mode 100644
index 0000000..18b540b
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
@@ -0,0 +1,25 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
+PE = "2"
+
+SRC_URI += "file://sysroot_fix.patch;patch=1 \
+            file://dolt-fix-1.7.0.patch;patch=1 \
+            file://randr-support-1.7.0.patch;patch=1 \
+           "
+
+SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch;patch=1"
+SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch;patch=1"
+
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+# The NVidia driver requires Xinerama support in the X server. Ion uses it.
+XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
+
+EXTRA_OECONF += " --enable-config-hal ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
-- 
1.6.6



