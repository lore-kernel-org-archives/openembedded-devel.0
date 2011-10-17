Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoP-0006aL-RQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:44 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so84952bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y3Bh/kWUKkrcZtAa0/e+JLIXdV69wfRw3LdB22Ugh1U=;
	b=oZU6YlNibMP0JyC8btzHiDeU+NXBwaiz5iF/Q1HzCQ1VmhEgfI18t9ztHsUw5WwO32
	u2K2dpmou0eW6LAMV2PWR7NZX4QbYo4XPtQsSJHKW9KJXDWWouoWnD1HnKnCl3dNt/6s
	bK9NyFKYFdf3iNn4ZrtmMc8B5/GKke6G9CV4o=
Received: by 10.204.15.212 with SMTP id l20mr16122213bka.74.1318894544509;
	Mon, 17 Oct 2011 16:35:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t13sm10648816fae.0.2011.10.17.16.35.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:35:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:21 +0200
Message-Id: <506d5f781f5ee93e3c9b8ca51a7fb65f40d4a8b8.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 02/10] xf86-input-tslib: fix build with newer xserver
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xf86-input-tslib-port-ABI-12-r48.patch         |  196 ++++++++++++++++++++
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    3 +-
 2 files changed, 198 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
new file mode 100644
index 0000000..6a6d5b9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
@@ -0,0 +1,196 @@
+Upstream-Status: Pending
+
+Taken from debian:
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=627075
+
+Index: xf86-input-tslib-trunk/src/tslib.c
+===================================================================
+--- xf86-input-tslib-trunk/src/tslib.c	(revision 48)
++++ xf86-input-tslib-trunk/src/tslib.c	(working copy)
+@@ -69,6 +69,13 @@
+ #define DEFAULT_HEIGHT		240
+ #define DEFAULT_WIDTH		320
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
++#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options), NULL)
++#else
++#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
++#endif
++
++
+ enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
+ 
+ enum button_state { BUTTON_NOT_PRESSED = 0, BUTTON_1_PRESSED = 1, BUTTON_3_CLICK = 3, BUTTON_3_CLICKED=4, BUTTON_EMULATION_OFF=-1 };
+@@ -106,7 +113,7 @@
+ }
+ 
+ static Bool
+-ConvertProc( LocalDevicePtr local,
++ConvertProc( InputInfoPtr local,
+ 			 int first,
+ 			 int num,
+ 			 int v0,
+@@ -135,7 +142,7 @@
+     return t;
+ }
+ 
+-static void ReadInput (LocalDevicePtr local)
++static void ReadInput (InputInfoPtr local)
+ {
+ 	struct ts_priv *priv = (struct ts_priv *) (local->private);
+ 	struct ts_sample samp;
+@@ -382,7 +389,11 @@
+ 					       axiswidth - 1,	/* max val */
+ 					       axiswidth,	/* resolution */
+ 					       0,		/* min_res */
+-					       axiswidth);	/* max_res */
++					       axiswidth	/* max_res */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute
++#endif
++					       );
+ 
+ 		InitValuatorAxisStruct(device, 1,
+ #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 7
+@@ -392,7 +403,11 @@
+ 					       axisheight - 1,	/* max val */
+ 					       axisheight,	/* resolution */
+ 					       0,		/* min_res */
+-					       axisheight);	/* max_res */
++					       axisheight	/* max_res */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute
++#endif
++					       );
+ 
+ 		if (InitProximityClassDeviceStruct (device) == FALSE) {
+ 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
+@@ -434,7 +449,7 @@
+ 	ErrorF("%s\n", __FUNCTION__);
+ 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
+ 	ts_close(priv->ts);
+-	xfree(pInfo->private);
++	free(pInfo->private);
+ 	pInfo->private = NULL;
+ 	xf86DeleteInput(pInfo, 0);
+ }
+@@ -444,47 +459,57 @@
+  *
+  * called when the module subsection is found in XF86Config
+  */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++static int 
++xf86TslibInit(InputDriverPtr drv, InputInfoPtr pInfo, int flags)
++#else
+ static InputInfoPtr
+ xf86TslibInit(InputDriverPtr drv, IDevPtr dev, int flags)
++#endif
+ {
+ 	struct ts_priv *priv;
+ 	char *s;
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	InputInfoPtr pInfo;
++#endif
+ 
+-	priv = xcalloc (1, sizeof (struct ts_priv));
++	priv = calloc (1, sizeof (struct ts_priv));
+         if (!priv)
+-                return NULL;
++                return BadValue;
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	if (!(pInfo = xf86AllocateInput(drv, 0))) {
+-		xfree(priv);
+-		return NULL;
++		free(priv);
++		return BadValue;
+ 	}
+ 
+ 	/* Initialise the InputInfoRec. */
+ 	pInfo->name = dev->identifier;
+-	pInfo->type_name = XI_TOUCHSCREEN;
+ 	pInfo->flags =
+ 	    XI86_KEYBOARD_CAPABLE | XI86_POINTER_CAPABLE |
+ 	    XI86_SEND_DRAG_EVENTS;
+-	pInfo->device_control = xf86TslibControlProc;
+-	pInfo->read_input = ReadInput;
+ #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) == 0
+ 	pInfo->motion_history_proc = xf86GetMotionEvents;
+ 	pInfo->history_size = 0;
+ #endif
+-	pInfo->control_proc = NULL;
++	pInfo->conf_idev = dev;
+ 	pInfo->close_proc = NULL;
+-	pInfo->switch_mode = NULL;
+ 	pInfo->conversion_proc = ConvertProc;
+ 	pInfo->reverse_conversion_proc = NULL;
+-	pInfo->dev = NULL;
+ 	pInfo->private_flags = 0;
+ 	pInfo->always_core_feedback = 0;
+-	pInfo->conf_idev = dev;
++#endif
++
++	pInfo->type_name = XI_TOUCHSCREEN;
++	pInfo->control_proc = NULL;
++	pInfo->read_input = ReadInput;
++	pInfo->device_control = xf86TslibControlProc;
++	pInfo->switch_mode = NULL;
+ 	pInfo->private = priv;
++	pInfo->dev = NULL;
+ 
+ 	/* Collect the options, and process the common options. */
+-	xf86CollectInputOptions(pInfo, NULL, NULL);
++	COLLECT_INPUT_OPTIONS(pInfo, NULL);
+ 	xf86ProcessCommonOptions(pInfo, pInfo->options);
+ 
+ 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
+@@ -510,23 +535,31 @@
+ 		priv->rotate = TSLIB_ROTATE_NONE;
+ 	}
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+  	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
++#else
++	s = xf86CheckStrOption(pInfo->options, "path", NULL);
++#endif
+   	if (!s)
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
++#else
++		s = xf86CheckStrOption(pInfo->options, "Device", NULL);
++#endif
+  
+ 	priv->ts = ts_open(s, 1);
+-	xfree(s);
++	free(s);
+ 
+ 	if (!priv->ts) {
+ 		ErrorF("ts_open failed (device=%s)\n",s);
+ 		xf86DeleteInput(pInfo, 0);
+-		return NULL;
++		return BadValue;
+ 	}
+ 
+ 	if (ts_config(priv->ts)) {
+ 		ErrorF("ts_config failed\n");
+ 		xf86DeleteInput(pInfo, 0);
+-		return NULL;
++		return BadValue;
+ 	}
+ 
+ 	pInfo->fd = ts_fd(priv->ts);
+@@ -536,11 +569,13 @@
+ 		priv->state = BUTTON_EMULATION_OFF;
+ 	}
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	/* Mark the device configured */
+ 	pInfo->flags |= XI86_CONFIGURED;
++#endif
+ 
+ 	/* Return the configured device */
+-	return (pInfo);
++	return Success;
+ }
+ 
+ _X_EXPORT InputDriverRec TSLIB = {
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index 9ce5093..de0eb6f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -8,13 +8,14 @@ RSUGGESTS_${PN} += "hal"
 LIC_FILES_CHKSUM = "file://src/tslib.c;endline=28;md5=bd62eaef222dcf5cd59e490a12bd795e \
                     file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
            file://double-free-crash.patch \
            file://10-x11-input-tslib.fdi \
            file://xserver-174-XGetPointerControl.patch \
            file://99-xf86-input-tslib.rules \
+           file://xf86-input-tslib-port-ABI-12-r48.patch \
 "
 SRC_URI[md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
 SRC_URI[sha256sum] = "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
-- 
1.7.7



