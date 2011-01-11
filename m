Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgau-0000ZX-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:13 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so19263489fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1Ed3goMTMeg42Cw4HYnPQkLcEqt2Xtq1NwxFDHCg3I0=;
	b=krcYaqUiduEX1JVcO/Ht6Ieihnm0CgFuYyGXakzCvhz4D7qiHvBAZ/qbHTeJYQ7QHv
	DOxE/aW3nmhHY15IlxX2quPAxjIdn4QAjIIB43NxvEgWCRkRBjLG5iM/RJnerQXUMgCR
	SS/J6aE310AQ2V2xM2kSJ2bHv7L2CH9Kvuyns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gIWSl0wVb7GQ2VOIMERlBrgl7tqIS2OG8fA4tFfJoJ4KfE6bin6Cc1OzH7gfjS+5+f
	UicgTzUdDXFGLuiUreymgijpTRCO8U/ilTKBZxdP4ahFBQbmb790TYqx7WLZTtAqkOIA
	EgBJxeZN89Jf1Es+iL2Uu/Ute1EMx5kNZ7fNk=
Received: by 10.223.107.66 with SMTP id a2mr4559883fap.92.1294761395155;
	Tue, 11 Jan 2011 07:56:35 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 17sm7449348far.19.2011.01.11.07.56.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:24 +0100
Message-Id: <1294761389-13634-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 07/12] xorg-xserver: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch |   22 +++++
 .../xserver-xorg-1.7.1/randr-support.patch         |   96 ++++++++++++++++++++
 .../xserver-xorg-1.7.1/sysroot_fix.patch           |   13 +++
 .../xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch |   22 +++++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++
 .../hack-fbdev-ignore-return-mode.patch            |   39 ++++++++
 .../xserver-xorg-1.8.1/randr-support.patch         |   96 ++++++++++++++++++++
 .../obsolete/xorg-xserver/xserver-xorg_1.7.1.bb    |   22 +++++
 .../obsolete/xorg-xserver/xserver-xorg_1.8.1.bb    |   33 +++++++
 .../xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch |   22 -----
 .../xserver-xorg-1.7.1/randr-support.patch         |   96 --------------------
 .../xserver-xorg-1.7.1/sysroot_fix.patch           |   13 ---
 .../xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch |   22 -----
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 .../hack-fbdev-ignore-return-mode.patch            |   39 --------
 .../xserver-xorg-1.8.1/randr-support.patch         |   96 --------------------
 recipes/xorg-xserver/xserver-xorg_1.7.1.bb         |   22 -----
 recipes/xorg-xserver/xserver-xorg_1.8.1.bb         |   33 -------
 18 files changed, 357 insertions(+), 357 deletions(-)
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg_1.7.1.bb
 create mode 100644 recipes/obsolete/xorg-xserver/xserver-xorg_1.8.1.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.7.1.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.8.1.bb

diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
new file mode 100644
index 0000000..59753d5
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
@@ -0,0 +1,13 @@
+Index: xorg-server-1.4/xorg-server.m4
+===================================================================
+--- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
++++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
+@@ -30,7 +30,7 @@
+ 
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
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
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
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
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.1.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.1.bb
new file mode 100644
index 0000000..60d4575
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg_1.7.1.bb
@@ -0,0 +1,22 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
+PE = "2"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://sysroot_fix.patch \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
+           "
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+EXTRA_OECONF += "--disable-xephyr --disable-config-hal --disable-xinerama --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
+
+SRC_URI[archive.md5sum] = "dda7842467cda6018fdc87e6002e4db1"
+SRC_URI[archive.sha256sum] = "a58c0de29cbd2b7d1a1ac5ee70a94ad1ed2a085132803c0ca83f2dd8513b4c20"
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.8.1.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.8.1.bb
new file mode 100644
index 0000000..31ce24a
--- /dev/null
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg_1.8.1.bb
@@ -0,0 +1,33 @@
+# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
+DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
+
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
+PE = "2"
+PR = "${INC_PR}.2"
+
+SRC_URI += " \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
+	    file://hack-fbdev-ignore-return-mode.patch \
+           "
+SRC_URI[archive.md5sum] = "7c3b873692f4e93938261d774510e78d"
+SRC_URI[archive.sha256sum] = "bddb974d8f21107ab8f79abf92cebb06ec13243f1ffd1ef56b48452c4994659d"
+
+SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
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
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
deleted file mode 100644
index e332ce0..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.7.1/dolt-fix.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
deleted file mode 100644
index fb8d381..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.7.1/randr-support.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
-@@ -95,6 +95,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1086,4 +1088,67 @@
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
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 1;
-+        invert[0] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        invert[0] = 1;
-+        invert[1] = 1;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 1;
-+        invert[1] = 1;
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
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
-@@ -391,6 +391,12 @@
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
deleted file mode 100644
index 59753d5..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.7.1/sysroot_fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.4/xorg-server.m4
-===================================================================
---- xorg-server-1.4.orig/xorg-server.m4	2008-03-15 20:09:36.000000000 +0100
-+++ xorg-server-1.4/xorg-server.m4	2008-03-15 20:09:51.000000000 +0100
-@@ -30,7 +30,7 @@
- 
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS `pkg-config --cflags xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
deleted file mode 100644
index e332ce0..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.8.1/dolt-fix.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-assume-pixman-supports-overlapped-blt.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.8.1/hack-fbdev-ignore-return-mode.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
deleted file mode 100644
index fb8d381..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.8.1/randr-support.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
-@@ -95,6 +95,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1086,4 +1088,67 @@
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
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 1;
-+        invert[0] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        invert[0] = 1;
-+        invert[1] = 1;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 1;
-+        invert[1] = 1;
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
-diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
-+++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
-@@ -391,6 +391,12 @@
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
diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.1.bb b/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
deleted file mode 100644
index 60d4575..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
-PE = "2"
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://sysroot_fix.patch \
-            file://dolt-fix.patch \
-            file://randr-support.patch \
-           "
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-EXTRA_OECONF += "--disable-xephyr --disable-config-hal --disable-xinerama --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
-
-export LDFLAGS += " -ldl "
-
-SRC_URI[archive.md5sum] = "dda7842467cda6018fdc87e6002e4db1"
-SRC_URI[archive.sha256sum] = "a58c0de29cbd2b7d1a1ac5ee70a94ad1ed2a085132803c0ca83f2dd8513b4c20"
diff --git a/recipes/xorg-xserver/xserver-xorg_1.8.1.bb b/recipes/xorg-xserver/xserver-xorg_1.8.1.bb
deleted file mode 100644
index 31ce24a..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.8.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PE = "2"
-PR = "${INC_PR}.2"
-
-SRC_URI += " \
-            file://dolt-fix.patch \
-            file://randr-support.patch \
-	    file://hack-fbdev-ignore-return-mode.patch \
-           "
-SRC_URI[archive.md5sum] = "7c3b873692f4e93938261d774510e78d"
-SRC_URI[archive.sha256sum] = "bddb974d8f21107ab8f79abf92cebb06ec13243f1ffd1ef56b48452c4994659d"
-
-SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
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
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
-
-export LDFLAGS += " -ldl "
-- 
1.7.4.rc1



