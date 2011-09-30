Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9ckb-0007eY-KB
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:03:38 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4w+B3Oasq4eHjSPa6VPaJ2+vkaybeII439Nv5AM78l0=;
	b=tOI2vfAEB01PNJQfv9jiy08dh/vY4QeSSXZxd0Z81lr/XZjU5vMJF1+LzxdspNzWes
	r3B0LuaCsBvRYQW9Uk6KN0d35ee2zD1PD+NybSO6pbUywDWI44Vk2psTWUAIvIDkMzOl
	nAeq6bZ2PH5cMu9zaP3Tfo245QfaWhP/KqcNA=
Received: by 10.204.141.139 with SMTP id m11mr7949451bku.406.1317387490101;
	Fri, 30 Sep 2011 05:58:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm4893472bkt.4.2011.09.30.05.58.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:58:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:45 +0200
Message-Id: <28db9a770c5bb55924db9768c174fff4b47b83d6.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 09/15] xserver-xorg: drop 1.10.2 and use xserver-xf86-lite-1.11.0 from oe-core instead
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
X-List-Received-Date: Fri, 30 Sep 2011 13:03:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xorg-xserver-common.inc           |  126 --------------------
 .../50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch |   61 ----------
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 --
 .../hack-fbdev-ignore-return-mode.patch            |   39 ------
 .../xserver-xorg-1.10.2/randr-support.patch        |  102 ----------------
 .../replace-pkgconfig-sdkdir-poking.patch          |   33 -----
 .../xorg-xserver/xserver-xorg_1.10.2.bb            |   33 -----
 7 files changed, 0 insertions(+), 408 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
deleted file mode 100644
index 0b4a854..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ /dev/null
@@ -1,126 +0,0 @@
-HOMEPAGE = "http://www.x.org"
-SECTION = "x11/base"
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
-
-INC_PR = "r21"
-
-# xf86-*-* packages depend on an X server built with the xfree86 DDX
-# so we have a virtual to represent that:
-PROVIDES = "virtual/xserver-xf86"
-
-# Other packages tend to just care that there is *an* X server:
-PROVIDES += "virtual/xserver"
-
-# Config manager for xserver, options are: hal, udev, empty (for configuration in xorg.conf)
-DISTRO_XORG_CONFIG_MANAGER ?= "udev"
-
-# default none, enabled by DISTRO_XORG_CONFIG_MANAGER setting
-CONFIG_MANAGER_OPTION += "${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['hal']]}"
-CONFIG_MANAGER_OPTION += "${@['--disable-config-udev','--enable-config-udev',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['udev']]}"
-
-DEPENDS = "fontconfig freetype flex-native liblbxutil kbproto \ 
-xf86driproto drm glproto randrproto renderproto fixesproto damageproto \
-xcmiscproto xextproto xproto xf86miscproto xf86vidmodeproto xf86bigfontproto \
-scrnsaverproto bigreqsproto resourceproto fontsproto inputproto \
-xf86dgaproto videoproto compositeproto trapproto recordproto dmxproto \
-resourceproto xineramaproto xtrans evieext libxkbfile libxfont libxau \
-libfontenc libxdmcp libxxf86vm libxaw libxmu libxt libxpm libxext libx11 \
-libxkbui libxxf86misc libxi libdmx libxtst libxres virtual/libgl libxcalibrate \
-libxv ${DISTRO_XORG_CONFIG_MANAGER}"
-
-RRECOMMENDS_${PN} = "libpciaccess"
-
-XORG_PN = "xorg-server"
-SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-
-S = "${WORKDIR}/${XORG_PN}-${PV}"
-
-inherit autotools pkgconfig glx-use-tls
-
-EXTRA_OECONF += " --enable-xcalibrate \
-                  --enable-kdrive \
-                  --enable-xephyr \
-                  --disable-xfbdev \
-                  --disable-xnest \
-                  --disable-kdrive-vesa \
-                  --with-default-font-path="${datadir}/fonts/X11/misc" \
-                  ac_cv_file__usr_share_sgml_X11_defs_ent=no"
-
-# CONFIG_MANAGER_OPTION is used only in recipes which support those options
-
-EXTRA_OECONF_append_arm = " ac_cv_header_linux_apm_bios_h=no "
-
-PACKAGES =+ "xserver-security-policy"
-FILES_xserver-security-policy += "${libdir}/xserver/SecurityPolicy"
-RRECOMMENDS_${PN} += "xserver-security-policy xkeyboard-config rgb xserver-xf86-config"
-
-PACKAGES =+ "${PN}-sdl ${PN}-fbdev ${PN}-xprint ${PN}-xvfb ${PN}-utils ${PN}-xephyr"
-
-RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-
-FILES_${PN}-fbdev = "${bindir}/Xfbdev"
-FILES_${PN}-sdl = "${bindir}/Xsdl"
-FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
-FILES_${PN}-xvfb = "${bindir}/Xvfb"
-FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
-FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
-FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
-FILES_${PN}-xephyr = "${bindir}/Xephyr"
-
-FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
-                    ${libdir}/xorg/modules/*/.debug \
-                    ${libdir}/xorg/modules/*/*/.debug \
-                   "
-
-# Split out some modules and extensions from the main package
-# These aren't needed for basic operations and only take up space:
-#  32.0k   libdri.so
-#  336.0k  libglx.so
-#  1360k   libint10.so
-#  180.0k  libwfb.so
-#  320.0k  libxaa.so
-#  124.0k  libxf1bpp.so
-#  84.0k   libxf4bpp.so
-#          librecord.so
-#          libextmod.so
-#          libdbe.so
-
-PACKAGES =+ "${PN}-extension-dri \
-             ${PN}-extension-dri2 \
-             ${PN}-extension-glx \
-             ${PN}-extension-record \
-             ${PN}-extension-extmod \
-             ${PN}-extension-dbe \
-             ${PN}-module-libint10 \
-             ${PN}-module-libafb \
-             ${PN}-module-libwfb  \
-             ${PN}-module-libmfb \
-             ${PN}-module-libcfb \
-             ${PN}-module-xaa \
-             ${PN}-module-libxf1bpp \
-             ${PN}-module-libxf4bpp"
-
-
-FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
-FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
-FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
-FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
-FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
-FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
-FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
-FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
-FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
-FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
-FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
-FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
-FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
-FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
-
-PACKAGES =+ "${PN}-multimedia-modules"
-
-FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
-
-do_install_append () {
-	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
-}
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
deleted file mode 100644
index 2c4078a..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd Mon Sep 17 00:00:00 2001
-From: Aaron Plattner <aplattner@nvidia.com>
-Date: Tue, 24 May 2011 23:02:42 +0000
-Subject: randr: check rotated virtual size limits correctly
-
-Commit d1107918d4626268803b54033a07405122278e7f introduced checks to
-the RandR path that cause RRSetScreenConfig requests to fail if the
-size is too large.  Unfortunately, when RandR 1.1 rotation is enabled
-it compares the rotated screen dimensions to the unrotated limits,
-which causes 90- and 270-degree rotation to fail unless your screen
-happens to be square:
-
-  X Error of failed request:  BadValue (integer parameter out of range for operation)
-    Major opcode of failed request:  153 (RANDR)
-    Minor opcode of failed request:  2 (RRSetScreenConfig)
-    Value in failed request:  0x780
-    Serial number of failed request:  14
-    Current serial number in output stream:  14
-
-Fix this by moving the check above the code that swaps the dimensions
-based on the rotation.
-
-Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
-Reviewed-by: Jeremy Huddleston <jeremyhu@apple.com>
-Tested-by: Robert Hooker <robert.hooker@canonical.com>
-Tested-by: Kent Baxley <kent.baxley@canonical.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-(cherry picked from commit b6c7b9b2f39e970cedb6bc1e073f901e28cb0fa3)
----
-diff --git a/randr/rrscreen.c b/randr/rrscreen.c
-index 1bc1a9e..da6d48d 100644
---- a/randr/rrscreen.c
-+++ b/randr/rrscreen.c
-@@ -910,12 +910,6 @@ ProcRRSetScreenConfig (ClientPtr client)
-      */
-     width = mode->mode.width;
-     height = mode->mode.height;
--    if (rotation & (RR_Rotate_90|RR_Rotate_270))
--    {
--	width = mode->mode.height;
--	height = mode->mode.width;
--    }
--
-     if (width < pScrPriv->minWidth || pScrPriv->maxWidth < width) {
- 	client->errorValue = width;
- 	free(pData);
-@@ -927,6 +921,12 @@ ProcRRSetScreenConfig (ClientPtr client)
- 	return BadValue;
-     }
- 
-+    if (rotation & (RR_Rotate_90|RR_Rotate_270))
-+    {
-+	width = mode->mode.height;
-+	height = mode->mode.width;
-+    }
-+
-     if (width != pScreen->width || height != pScreen->height)
-     {
- 	int	c;
---
-cgit v0.8.3-6-g21f6
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
-(and probably other) while returning from chvt or resume on some
-hardware (e. g. zaurus).
-
-Correct fix would require debugging of fbdev mode during LeaveVT and
-EnterVT.
-
-This patch may cause staying in incorrect or corrupted display mode
-after EnterVT, but on man affected devices it does not cause any visible
-problems.
-
-Hacked code is never called on properly written drivers.
-
-Devices affected and testers involved for future patch removal:
-Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
-
-See also:
-https://bugzilla.redhat.com/show_bug.cgi?id=238451
-
-The bug (first line indicates that your device is affected):
-
-(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
-
-Fatal server error:
-EnterVT failed for screen 0
-
-Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-===================================================================
---- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
-+++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
- #if DEBUG
- 		print_fbdev_mode("returned", &set_var);
- #endif
--		return FALSE;
-+		/* return FALSE; UGLY HACK to allow return from chvt */
- 	}
- 
- 	if (!check)
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
deleted file mode 100644
index 632a64c..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-diff -ur xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c git/xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c	2011-04-28 09:25:00.000000000 +0200
-+++ git/xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c	2011-05-19 00:31:01.178439874 +0200
-@@ -99,6 +99,8 @@
- 		return;								\
- 	}
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- static int
-@@ -1408,4 +1410,73 @@
-     EnableDevice(dev, TRUE);
- }
- 
-+/* Taken from evdev-properties.h. */
-+#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
-+#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
-+
-+/* This is a hack until we get device -> CRTC association. */
-+void
-+xf86InputRotationNotify(Rotation rotation)
-+{
-+    DeviceIntPtr dev;
-+    //LocalDevicePtr local;
-+    int ret;
-+    int swap_axes = 0;
-+    CARD8 invert[2] = { 0, 0 };
-+    static Atom prop_swap = 0, prop_invert = 0;
-+    static int atom_generation = -1;
-+    
-+    if (atom_generation != serverGeneration) {
-+        prop_swap = 0;
-+        prop_invert = 0;
-+    }
-+
-+    switch (rotation & RR_Rotate_All) {
-+    case RR_Rotate_0:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+        invert[1] = 0;
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+        invert[1] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        swap_axes = 1;
-+        invert[0] = 1;
-+        invert[1] = 1;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 0;
-+        invert[0] = 1;
-+        invert[1] = 0;
-+        break;
-+    }
-+
-+    if (!prop_swap)
-+        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
-+                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
-+    if (!prop_invert)
-+        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
-+                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
-+
-+    for (dev = inputInfo.devices; dev; dev = dev->next) {
-+        //local = dev->public.devicePrivate;
-+        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
-+                                     PropModeReplace, 1, &swap_axes, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
-+            continue;
-+        }
-+        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
-+                                     PropModeReplace, 2, invert, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing invert property failed!\n");
-+            continue;
-+        }
-+    }
-+}
-+
-+
- /* end of xf86Xinput.c */
-diff -ur xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c git/xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c	2011-04-28 09:25:00.000000000 +0200
-+++ git/xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c	2011-05-19 00:23:16.244383998 +0200
-@@ -389,6 +389,12 @@
-     if (didLock)
- 	crtc->funcs->unlock (crtc);
- 
-+    /*
-+     * Rotate Touchscreen
-+     */
-+    xf86InputRotationNotify(crtc->rotation);
-+
-+    
-     return ret;
- }
- 
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
deleted file mode 100644
index 3967c4c..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-configury forces pkg-config to poke for sdkdir variable which 
-pkg-config happily returns but does not prepend sysroot to it
-since thats only done for includes and libs. This then gets -I
-prepended and added to CFLAGS. Guess what gcc cross gripes
-about including host includes in cross builds but does not bail
-out the build but it does not escape the wrath of our oe's
-QA checks and rightly so. We replace use of sdkdir with 
---cflags-only-I which returns the include paths correctly
-pointing inside sysroot and not at the host includes and plus
-includedir if you look inside the .pc file is assigned sdkdir
-anyway so we do not lose anything
-
-This m4 macro is included in other packages e.g. xf86-video-fbdev
-which dont build on hosts which have installation of
-xorg-xserver-dev because it gets this include poisoning
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-status: Pending
-
-Index: xorg-server-1.10.1/xorg-server.m4
-===================================================================
---- xorg-server-1.10.1.orig/xorg-server.m4
-+++ xorg-server-1.10.1/xorg-server.m4
-@@ -31,7 +31,7 @@ dnl
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags-only-I xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
deleted file mode 100644
index 1d88364..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "mesa-dri pixman libpciaccess openssl dri2proto glproto font-util-native"
-PE = "2"
-PR = "${INC_PR}.1"
-
-SRC_URI += " \
-            file://50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch \
-            file://randr-support.patch \
-            file://hack-fbdev-ignore-return-mode.patch \
-            file://hack-assume-pixman-supports-overlapped-blt.patch \
-            file://replace-pkgconfig-sdkdir-poking.patch \
-           "
-SRC_URI[md5sum] = "c9ba50bd44ea70da51f13100336a5484"
-SRC_URI[sha256sum] = "65264f6640568b9db8d738aec1ddd036c3ae21b7ba05b98d006759d11a72792c"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
-- 
1.7.6.1



