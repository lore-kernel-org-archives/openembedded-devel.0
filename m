Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z4S-0003e0-A8
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:07:12 +0200
Received: by fxi1 with SMTP id 1so1792903fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+MmKyQaz03Ba8140fTaaQ5HomFPVhurfcPL83ou1GyM=;
	b=fYMm9rZm5pJVGD7gLSeA73mTxcAVT6ZiuM2bMGCy9Z94HGTnvRnAHMSGZXGbrRNSiC
	ROFBSx5tqmUX+S2KDehDiIRir76wj7utgMONSXv+RctwTC6/ZKFGMXVqq6nz/TdecDhj
	18yksFTReazQD8UY9QyvOirDZWL1y2VUHfqT0=
Received: by 10.223.33.19 with SMTP id f19mr1466787fad.122.1316181417988;
	Fri, 16 Sep 2011 06:56:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm1270693fah.24.2011.09.16.06.56.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:10 +0200
Message-Id: <907d47b7f31b79825d14dbb0a8fcf4863c67f956.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/10] xserver-xorg: drop 1.9.4 and git version
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
X-List-Received-Date: Fri, 16 Sep 2011 14:07:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch |   22 ----
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 .../hack-fbdev-ignore-return-mode.patch            |   39 --------
 .../xserver-xorg-1.9.4/randr-support.patch         |  102 --------------------
 .../xorg-xserver/xserver-xorg_1.9.4.bb             |   31 ------
 .../xorg-xserver/xserver-xorg_git.bb               |   38 -------
 6 files changed, 0 insertions(+), 246 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
deleted file mode 100644
index e332ce0..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: xorg-server/m4/dolt.m4
-===================================================================
---- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
-+++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
-@@ -147,7 +147,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -163,7 +163,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
deleted file mode 100644
index abc7db4..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c	2010-08-13 07:53:48.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c	2010-08-28 21:31:10.000000000 +0200
-@@ -106,6 +106,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1359,4 +1361,73 @@
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
-+    LocalDevicePtr local;
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
-+ 	 invert[1] = 0;
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+        invert[1] = 0;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
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
-+        local = dev->public.devicePrivate;
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
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c	2010-07-20 05:24:12.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c	2010-08-28 21:28:48.000000000 +0200
-@@ -387,6 +387,12 @@
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
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb
deleted file mode 100644
index 16f21c6..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto font-util-native"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-            file://dolt-fix.patch \
-            file://randr-support.patch \
-            file://hack-fbdev-ignore-return-mode.patch \
-            file://hack-assume-pixman-supports-overlapped-blt.patch \
-           "
-SRC_URI[md5sum] = "040f091dfdfb4e335116eb0032cc690b"
-SRC_URI[sha256sum] = "ad11047ebba58f2e37b03c70c986db3ea0cc0f1a19d2d3612713ab77b8ec2458"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
deleted file mode 100644
index ee91ae0..0000000
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto font-util-native"
-PV = "1.10.1"
-PR = "${INC_PR}.0"
-PR_append = "+gitr${SRCPV}"
-PE = "2"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "a73311f8304193f9245fb077f173bf1e1d52e040" 
-SRC_URI = " \
-  git://anongit.freedesktop.org/xorg/xserver;protocol=git;branch=server-1.10-branch \
-  file://hack-fbdev-ignore-return-mode.patch \
-  file://hack-assume-pixman-supports-overlapped-blt.patch \
-"
-
-S = "${WORKDIR}/git"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
-- 
1.7.6.1



