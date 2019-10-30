Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 11FD56C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4734zn2yPJz5h
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 11:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572432773;
	bh=PZbZuLA5pmz59G6WcNct+59S1KHbLydTTRlIuP01Vnc=;
	h=From:To:Subject:Date:From;
	b=K6AIgy+4x07t24/O0/8VnZflefukpAVuVg6VkJ0+nKwDsUXtj84Cfbaq0p+4hWv/P
	qVb/jk7CYST3vxfDlP09pslcrLfDx1cnDcobLwMqWqtWda5t26fNqNrBtYHu6lHVJv
	R2wncqA8Ta5jYSCB7f5TNG6TpPu/IEkRD12/DeSa3WOHBSHhGmSXgHeT2NUMMK5Px/
	+S7x6kheaLodBN9LoEqk4dz05sqJuySrDZVmrms+kAneftSf7qU5ezAKVDz4FmQA8/
	sJpqiVmOexmW5twmu77oHChuSOOl9yKKUUIPmL52E6dU49KPomCzMUQ7FDuUoXE5xF
	oZboZ9Typmcu+LIWvuU8Xl7Jddc8XeZbeHjRBHDc9X6x+GmEy7Xpydjmx98LlF7sx7
	s8ZQXIXYKQ2D0sz+VB8cDySpTiHy0YsJhqStw7+8qbEIHUw9dZnDwX1KZyRg2FTFYE
	O5YbND8Oe5QERc6F/wL4cLpHBU36bPRK2bUl6Eh6P4pnIK5RpvfQY0qxXsf62OhoGJ
	k83yF1vb644fYxmIMrhGWzyb8CQZO01xA/XmU5rhYfyasMQobiftEe7baMSabG9WO9
	fBxoqIfl9q97DrBShcQZct2y867L/GHIwPuFoQkilAhK0feUEO+4rGvWcjmpqF8m/D
	rQafGlSkc0sQFJSMzSEmMNZw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 12:52:49 +0200
Message-Id: <20191030105252.17982-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] xf86-input-tslib: Upgrade 0.0.6 -> 0.0.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2019 10:52:54 -0000

New upstream location.
Patches applied upstream removed.
Remove obsolete HAL file.
COPYING is now clearer on the licensing.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../xf86-input-tslib/10-x11-input-tslib.fdi   |  11 -
 .../xf86-input-tslib/double-free-crash.patch  |  20 --
 ...nput-tslib-0.0.6-xf86XInputSetScreen.patch |  31 ---
 .../xf86-input-tslib-port-ABI-12-r48.patch    | 196 ------------------
 .../xserver-174-XGetPointerControl.patch      |  34 ---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb     |  35 ----
 .../xorg-driver/xf86-input-tslib_0.0.7.bb     |  20 ++
 7 files changed, 20 insertions(+), 327 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi
deleted file mode 100644
index 906043947..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi
+++ /dev/null
@@ -1,11 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<deviceinfo version="0.2">
-  <device>
-    <match key="info.capabilities" contains="input.touchpad">
-      <merge key="input.x11_driver" type="string">tslib</merge>
-    </match>
-    <match key="info.capabilities" contains="input.touchscreen">
-      <merge key="input.x11_driver" type="string">tslib</merge>
-    </match>
-  </device>
-</deviceinfo>
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch
deleted file mode 100644
index 07754731d..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-xorg-server-1.7.3/hw/xfree86/common/xf86Helper.c contains this code
-causing a double free crash on chvt or exit:
-
-    /* This should *really* be handled in drv->UnInit(dev) call instead, but
-     * if the driver forgets about it make sure we free it or at least crash
-     * with flying colors */
-    if (pInp->private)
-	xfree(pInp->private);
-Index: xf86-input-tslib-0.0.6/src/tslib.c
-===================================================================
---- xf86-input-tslib-0.0.6.orig/src/tslib.c
-+++ xf86-input-tslib-0.0.6/src/tslib.c
-@@ -435,6 +435,7 @@ xf86TslibUninit(InputDriverPtr drv, Inpu
- 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
- 	ts_close(priv->ts);
- 	xfree(pInfo->private);
-+	pInfo->private = NULL;
- 	xf86DeleteInput(pInfo, 0);
- }
- 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
deleted file mode 100644
index d16b4a53c..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fixes crash when a touchscreen event is received with xserver 1.12 and later:
-X: symbol lookup error: /usr/lib/xorg/modules/input/tslib_drv.so: undefined symbol: xf86XInputSetScreen
-
-Upstream-Status: Pending
-
-Taken from Gentoo:
-https://bugs.gentoo.org/show_bug.cgi?id=446432
-
-diff -ur xf86-input-tslib-0.0.6.orig/src/tslib.c xf86-input-tslib-0.0.6/src/tslib.c
---- xf86-input-tslib-0.0.6.orig/src/tslib.c	2012-12-05 01:12:16.286597071 +0100
-+++ xf86-input-tslib-0.0.6/src/tslib.c	2012-12-05 01:11:02.686598595 +0100
-@@ -75,6 +75,19 @@
- #define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
- #endif
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) > 13
-+static void
-+xf86XInputSetScreen(InputInfoPtr	pInfo,
-+		    int			screen_number,
-+		    int			x,
-+		    int			y)
-+{
-+    if (miPointerGetScreen(pInfo->dev) !=
-+          screenInfo.screens[screen_number]) {
-+	miPointerSetScreen(pInfo->dev, screen_number, x, y);
-+    }
-+}
-+#endif
- 
- enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
- 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
deleted file mode 100644
index 6a6d5b92c..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-Upstream-Status: Pending
-
-Taken from debian:
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=627075
-
-Index: xf86-input-tslib-trunk/src/tslib.c
-===================================================================
---- xf86-input-tslib-trunk/src/tslib.c	(revision 48)
-+++ xf86-input-tslib-trunk/src/tslib.c	(working copy)
-@@ -69,6 +69,13 @@
- #define DEFAULT_HEIGHT		240
- #define DEFAULT_WIDTH		320
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
-+#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options), NULL)
-+#else
-+#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
-+#endif
-+
-+
- enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
- 
- enum button_state { BUTTON_NOT_PRESSED = 0, BUTTON_1_PRESSED = 1, BUTTON_3_CLICK = 3, BUTTON_3_CLICKED=4, BUTTON_EMULATION_OFF=-1 };
-@@ -106,7 +113,7 @@
- }
- 
- static Bool
--ConvertProc( LocalDevicePtr local,
-+ConvertProc( InputInfoPtr local,
- 			 int first,
- 			 int num,
- 			 int v0,
-@@ -135,7 +142,7 @@
-     return t;
- }
- 
--static void ReadInput (LocalDevicePtr local)
-+static void ReadInput (InputInfoPtr local)
- {
- 	struct ts_priv *priv = (struct ts_priv *) (local->private);
- 	struct ts_sample samp;
-@@ -382,7 +389,11 @@
- 					       axiswidth - 1,	/* max val */
- 					       axiswidth,	/* resolution */
- 					       0,		/* min_res */
--					       axiswidth);	/* max_res */
-+					       axiswidth	/* max_res */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+					       ,Absolute
-+#endif
-+					       );
- 
- 		InitValuatorAxisStruct(device, 1,
- #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 7
-@@ -392,7 +403,11 @@
- 					       axisheight - 1,	/* max val */
- 					       axisheight,	/* resolution */
- 					       0,		/* min_res */
--					       axisheight);	/* max_res */
-+					       axisheight	/* max_res */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+					       ,Absolute
-+#endif
-+					       );
- 
- 		if (InitProximityClassDeviceStruct (device) == FALSE) {
- 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
-@@ -434,7 +449,7 @@
- 	ErrorF("%s\n", __FUNCTION__);
- 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
- 	ts_close(priv->ts);
--	xfree(pInfo->private);
-+	free(pInfo->private);
- 	pInfo->private = NULL;
- 	xf86DeleteInput(pInfo, 0);
- }
-@@ -444,47 +459,57 @@
-  *
-  * called when the module subsection is found in XF86Config
-  */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+static int 
-+xf86TslibInit(InputDriverPtr drv, InputInfoPtr pInfo, int flags)
-+#else
- static InputInfoPtr
- xf86TslibInit(InputDriverPtr drv, IDevPtr dev, int flags)
-+#endif
- {
- 	struct ts_priv *priv;
- 	char *s;
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	InputInfoPtr pInfo;
-+#endif
- 
--	priv = xcalloc (1, sizeof (struct ts_priv));
-+	priv = calloc (1, sizeof (struct ts_priv));
-         if (!priv)
--                return NULL;
-+                return BadValue;
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	if (!(pInfo = xf86AllocateInput(drv, 0))) {
--		xfree(priv);
--		return NULL;
-+		free(priv);
-+		return BadValue;
- 	}
- 
- 	/* Initialise the InputInfoRec. */
- 	pInfo->name = dev->identifier;
--	pInfo->type_name = XI_TOUCHSCREEN;
- 	pInfo->flags =
- 	    XI86_KEYBOARD_CAPABLE | XI86_POINTER_CAPABLE |
- 	    XI86_SEND_DRAG_EVENTS;
--	pInfo->device_control = xf86TslibControlProc;
--	pInfo->read_input = ReadInput;
- #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) == 0
- 	pInfo->motion_history_proc = xf86GetMotionEvents;
- 	pInfo->history_size = 0;
- #endif
--	pInfo->control_proc = NULL;
-+	pInfo->conf_idev = dev;
- 	pInfo->close_proc = NULL;
--	pInfo->switch_mode = NULL;
- 	pInfo->conversion_proc = ConvertProc;
- 	pInfo->reverse_conversion_proc = NULL;
--	pInfo->dev = NULL;
- 	pInfo->private_flags = 0;
- 	pInfo->always_core_feedback = 0;
--	pInfo->conf_idev = dev;
-+#endif
-+
-+	pInfo->type_name = XI_TOUCHSCREEN;
-+	pInfo->control_proc = NULL;
-+	pInfo->read_input = ReadInput;
-+	pInfo->device_control = xf86TslibControlProc;
-+	pInfo->switch_mode = NULL;
- 	pInfo->private = priv;
-+	pInfo->dev = NULL;
- 
- 	/* Collect the options, and process the common options. */
--	xf86CollectInputOptions(pInfo, NULL, NULL);
-+	COLLECT_INPUT_OPTIONS(pInfo, NULL);
- 	xf86ProcessCommonOptions(pInfo, pInfo->options);
- 
- 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
-@@ -510,23 +535,31 @@
- 		priv->rotate = TSLIB_ROTATE_NONE;
- 	}
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
-  	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
-+#else
-+	s = xf86CheckStrOption(pInfo->options, "path", NULL);
-+#endif
-   	if (!s)
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
-+#else
-+		s = xf86CheckStrOption(pInfo->options, "Device", NULL);
-+#endif
-  
- 	priv->ts = ts_open(s, 1);
--	xfree(s);
-+	free(s);
- 
- 	if (!priv->ts) {
- 		ErrorF("ts_open failed (device=%s)\n",s);
- 		xf86DeleteInput(pInfo, 0);
--		return NULL;
-+		return BadValue;
- 	}
- 
- 	if (ts_config(priv->ts)) {
- 		ErrorF("ts_config failed\n");
- 		xf86DeleteInput(pInfo, 0);
--		return NULL;
-+		return BadValue;
- 	}
- 
- 	pInfo->fd = ts_fd(priv->ts);
-@@ -536,11 +569,13 @@
- 		priv->state = BUTTON_EMULATION_OFF;
- 	}
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	/* Mark the device configured */
- 	pInfo->flags |= XI86_CONFIGURED;
-+#endif
- 
- 	/* Return the configured device */
--	return (pInfo);
-+	return Success;
- }
- 
- _X_EXPORT InputDriverRec TSLIB = {
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
deleted file mode 100644
index a1f6ba8f9..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From Grazvydas Ignotas
-
-At least xserver 1.7.4 crashes on XGetPointerControl request because of xf86-input-tslib:
-
-Program received signal SIGSEGV, Segmentation fault.
-#0  0x000355e0 in ProcGetPointerControl (client=0x4a2e58) at devices.c:2122
-#1  0x00062fa8 in Dispatch () at dispatch.c:439
-#2  0x00022444 in main (argc=4, argv=0xbeebedc4, envp=0xbeebedd8) at main.c:285
-
-This happens because ptrfeed field is not set in device structure from tslib.
-To fix this, call InitPtrFeedbackClassDeviceStruct() during DEVICE_INIT to get necessary setup done (as done in other input drivers).
-
----
-diff -ur xf86-input-tslib-0.0.6/src/tslib.c xf86-input-tslib-0.0.6_/src/tslib.c
---- xf86-input-tslib-0.0.6/src/tslib.c	2010-02-09 12:23:22.000000000 +0200
-+++ xf86-input-tslib-0.0.6_/src/tslib.c	2010-02-09 12:37:33.000000000 +0200
-@@ -103,8 +103,6 @@
- static void
- PointerControlProc(DeviceIntPtr dev, PtrCtrl * ctrl)
- {
--	ErrorF("%s\n", __FUNCTION__);
--	return;
- }
- 
- static Bool
-@@ -406,6 +404,8 @@
- 		xf86MotionHistoryAllocate(pInfo);
- #endif
- 
-+		if (!InitPtrFeedbackClassDeviceStruct(device, PointerControlProc))
-+			return !Success;
- 		break;
- 
- 	case DEVICE_ON:
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
deleted file mode 100644
index 6a3689a2e..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-input.inc
-SUMMARY = "X.Org X server -- tslib input driver"
-DEPENDS += "tslib"
-RRECOMMENDS_${PN} += "tslib-calibrate"
-RSUGGESTS_${PN} += "hal"
-
-# derived from xf86-input-void, that's why I kept MIT-X, but it's not clear, see COPYING
-LIC_FILES_CHKSUM = "file://src/tslib.c;endline=28;md5=bd62eaef222dcf5cd59e490a12bd795e \
-                    file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
-
-PR = "${INC_PR}.1"
-
-SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2 \
-           file://double-free-crash.patch \
-           file://10-x11-input-tslib.fdi \
-           file://xserver-174-XGetPointerControl.patch \
-           file://99-xf86-input-tslib.rules \
-           file://xf86-input-tslib-port-ABI-12-r48.patch \
-           file://xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch \
-"
-
-SRC_URI[md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
-SRC_URI[sha256sum] = "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
-
-do_configure_prepend() {
-    rm -rf ${S}/m4/ || true
-}
-do_install_append() {
-    install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
-    install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
-    install -d ${D}${nonarch_base_libdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
-}
-
-FILES_${PN} += "${datadir}/hal ${nonarch_base_libdir}/udev"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb
new file mode 100644
index 000000000..1f63047c7
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.7.bb
@@ -0,0 +1,20 @@
+require recipes-graphics/xorg-driver/xorg-driver-input.inc
+SUMMARY = "X.Org X server -- tslib input driver"
+DEPENDS += "tslib"
+RRECOMMENDS_${PN} += "tslib-calibrate"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1524518264f7776a9707c19c8affbbf"
+
+SRC_URI = "https://github.com/merge/xf86-input-tslib/releases/download/${PV}/xf86-input-tslib-${PV}.tar.xz \
+           file://99-xf86-input-tslib.rules \
+"
+
+SRC_URI[md5sum] = "c5ffb03bccccfa1c4ba11079fef0036e"
+SRC_URI[sha256sum] = "1439a9efa50eb481e6a0ab5319ab0765d457732e7da64e3c15f3c0cd13b44297"
+
+do_install_append() {
+    install -d ${D}${nonarch_base_libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/udev"
-- 
2.17.1


