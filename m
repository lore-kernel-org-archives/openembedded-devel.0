Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdObi-0005MP-2T
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:06:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6846417eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3arfZfXAleYTawce42Oi5xVm2EbmGm5/OtWp3h4H4Q0=;
	b=T1r3isIldkaTuQvxUYT+bpteFg2U75yw0gCXTbDEs1rOB6yAl59CDUuKXqWFBiBq5p
	nSEPDAj8BTaqPsMjbm0q8CsoESVTuPNmGcxqnp8+NUjwlyGVJpYmNKh/YWMB2ypGsbQs
	VjvU7xNImuB41rHw5D3ePoxKmV5HLfxRhkYqoeEz3CJWa7hApdGDzjlJjjPQsEQD2q1M
	YWubWmt0l/1jX2P1BKhwX0ZWZSsXkguSQaK9HLyH1Geo0BjAQ2F1ZIOPklPcW7UpuI7D
	gY62LFsTQ9b+jo8oHkjOnMQG2lOHYqse4P0r7Aw3SATNWvMZ0UxQuwMyYmgOpw+Afcv3
	gEuQ==
Received: by 10.14.193.136 with SMTP id k8mr59785804een.30.1354035108929;
	Tue, 27 Nov 2012 08:51:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d44sm41681184eeo.10.2012.11.27.08.51.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:51:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:51:14 +0100
Message-Id: <cc789176d8faa9d4ab7b6dec4180d79c80af384b.1354034673.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] xf86-video-glamo: adapt to xserver-0.12 video API
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
X-List-Received-Date: Tue, 27 Nov 2012 17:06:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...mo-driver-adapt-to-xserver-0.13-video-API.patch | 279 +++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |   3 +-
 2 files changed, 281 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch
new file mode 100644
index 0000000..cbdc6e7
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch
@@ -0,0 +1,279 @@
+From 57e8944e3cced03b9526bd075649d74d97c24899 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 20 Nov 2012 22:18:23 +0100
+Subject: [PATCH 3/3] glamo-driver: adapt to xserver-0.13 video API
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/compat-api.h   | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/glamo-driver.c | 43 ++++++++++++------------
+ 2 files changed, 118 insertions(+), 21 deletions(-)
+ create mode 100644 src/compat-api.h
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+new file mode 100644
+index 0000000..b1591b1
+--- /dev/null
++++ b/src/compat-api.h
+@@ -0,0 +1,96 @@
++/*
++ * Copyright 2012 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ *
++ * Author: Dave Airlie <airlied@redhat.com>
++ */
++
++/* this file provides API compat between server post 1.13 and pre it,
++   it should be reused inside as many drivers as possible */
++#ifndef COMPAT_API_H
++#define COMPAT_API_H
++
++#ifndef GLYPH_HAS_GLYPH_PICTURE_ACCESSOR
++#define GetGlyphPicture(g, s) GlyphPicture((g))[(s)->myNum]
++#define SetGlyphPicture(g, s, p) GlyphPicture((g))[(s)->myNum] = p
++#endif
++
++#ifndef XF86_HAS_SCRN_CONV
++#define xf86ScreenToScrn(s) xf86Screens[(s)->myNum]
++#define xf86ScrnToScreen(s) screenInfo.screens[(s)->scrnIndex]
++#endif
++
++#ifndef XF86_SCRN_INTERFACE
++
++#define SCRN_ARG_TYPE int
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = xf86Screens[(arg1)]
++
++#define SCREEN_ARG_TYPE int
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = screenInfo.screens[(arg1)]
++
++#define SCREEN_INIT_ARGS_DECL int index, ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL int arg, pointer blockData, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, blockData, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL int scrnIndex, ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS scrnIndex, pScreen
++
++#define ADJUST_FRAME_ARGS_DECL int arg, int x, int y, int flags
++
++#define SWITCH_MODE_ARGS_DECL int arg, DisplayModePtr mode, int flags
++
++#define FREE_SCREEN_ARGS_DECL int arg, int flags
++#define FREE_SCREEN_ARGS(x) (x)->scrnIndex, 0
++
++#define VT_FUNC_ARGS_DECL int arg, int flags
++#define VT_FUNC_ARGS(flags) pScrn->scrnIndex, (flags)
++
++#define XF86_ENABLEDISABLEFB_ARG(x) ((x)->scrnIndex)
++#else
++#define SCRN_ARG_TYPE ScrnInfoPtr
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = (arg1)
++
++#define SCREEN_ARG_TYPE ScreenPtr
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = (arg1)
++
++#define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS pScreen
++
++#define ADJUST_FRAME_ARGS_DECL ScrnInfoPtr arg, int x, int y
++#define SWITCH_MODE_ARGS_DECL ScrnInfoPtr arg, DisplayModePtr mode
++
++#define FREE_SCREEN_ARGS_DECL ScrnInfoPtr arg
++#define FREE_SCREEN_ARGS(x) (x)
++
++#define VT_FUNC_ARGS_DECL ScrnInfoPtr arg
++#define VT_FUNC_ARGS(flags) pScrn
++
++#define XF86_ENABLEDISABLEFB_ARG(x) (x)
++
++#endif
++
++#endif
+diff --git a/src/glamo-driver.c b/src/glamo-driver.c
+index b13caae..10b7762 100644
+--- a/src/glamo-driver.c
++++ b/src/glamo-driver.c
+@@ -43,6 +43,7 @@
+ 
+ #include <sys/mman.h>
+ 
++#include "compat-api.h"
+ 
+ static Bool debug = 0;
+ 
+@@ -68,10 +69,10 @@ static Bool
+ GlamoPreInit(ScrnInfoPtr pScrn, int flags);
+ 
+ static Bool
+-GlamoScreenInit(int Index, ScreenPtr pScreen, int argc, char **argv);
++GlamoScreenInit(SCREEN_INIT_ARGS_DECL);
+ 
+ static Bool
+-GlamoCloseScreen(int scrnIndex, ScreenPtr pScreen);
++GlamoCloseScreen(CLOSE_SCREEN_ARGS_DECL);
+ 
+ static Bool
+ GlamoCrtcResize(ScrnInfoPtr scrn, int width, int height);
+@@ -86,10 +87,10 @@ static void
+ GlamoRestoreHW(ScrnInfoPtr pScren);
+ 
+ static Bool
+-GlamoEnterVT(int scrnIndex, int flags);
++GlamoEnterVT(VT_FUNC_ARGS_DECL);
+ 
+ static void
+-GlamoLeaveVT(int scrnIndex, int flags);
++GlamoLeaveVT(VT_FUNC_ARGS_DECL);
+ 
+ static void
+ GlamoLoadColormap(ScrnInfoPtr pScrn, int numColors, int *indices,
+@@ -248,8 +249,8 @@ GlamoUnmapMMIO(ScrnInfoPtr pScrn) {
+ }
+ 
+ static Bool
+-GlamoSwitchMode(int scrnIndex, DisplayModePtr mode, int flags) {
+-    ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++GlamoSwitchMode(SWITCH_MODE_ARGS_DECL) {
++    SCRN_INFO_PTR(arg);
+     xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR (pScrn);
+     xf86OutputPtr output = config->output[config->compat_output];
+     Rotation rotation;
+@@ -286,7 +287,7 @@ GlamoFbdevProbe(DriverPtr drv, GDevPtr *devSections, int numDevSections)
+ 
+ 	for (i = 0; i < numDevSections; i++) {
+ 
+-		dev = xf86FindOptionValue(devSections[i]->options, "Device");
++		dev = (char *) xf86FindOptionValue(devSections[i]->options, "Device");
+ 		if (fbdevHWProbe(NULL, dev, NULL)) {
+ 			int entity;
+ 			pScrn = NULL;
+@@ -430,7 +431,7 @@ GlamoPreInit(ScrnInfoPtr pScrn, int flags)
+ 
+     pGlamo->pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
+ 
+-    fb_device = xf86FindOptionValue(pGlamo->pEnt->device->options, "Device");
++    fb_device = (char *) xf86FindOptionValue(pGlamo->pEnt->device->options, "Device");
+ 
+     /* open device */
+     if (!fbdevHWInit(pScrn, NULL, fb_device))
+@@ -523,7 +524,7 @@ GlamoPreInit(ScrnInfoPtr pScrn, int flags)
+ 
+ 
+ static Bool
+-GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
++GlamoScreenInit(SCREEN_INIT_ARGS_DECL)
+ {
+     ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
+     GlamoPtr pGlamo = GlamoPTR(pScrn);
+@@ -545,7 +546,7 @@ GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ #endif
+ 
+     if (NULL == (pGlamo->fbmem = fbdevHWMapVidmem(pScrn))) {
+-        xf86DrvMsg(scrnIndex, X_ERROR, "mapping of video memory failed\n");
++        xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "mapping of video memory failed\n");
+         return FALSE;
+     }
+ 
+@@ -556,13 +557,13 @@ GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+     /* mi layer */
+     miClearVisualTypes();
+     if (!miSetVisualTypes(pScrn->depth, TrueColorMask, pScrn->rgbBits, TrueColor)) {
+-        xf86DrvMsg(scrnIndex, X_ERROR,
++        xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+                    "visual type setup failed for %d bits per pixel [1]\n",
+                    pScrn->bitsPerPixel);
+         return FALSE;
+     }
+     if (!miSetPixmapDepths()) {
+-      xf86DrvMsg(scrnIndex, X_ERROR, "pixmap depth setup failed\n");
++      xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "pixmap depth setup failed\n");
+       return FALSE;
+     }
+ 
+@@ -617,7 +618,7 @@ GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+     /* software cursor */
+     miDCInitialize(pScreen, xf86GetPointerScreenFuncs());
+ 
+-    GlamoEnterVT(scrnIndex, 0);
++    GlamoEnterVT(VT_FUNC_ARGS(0));
+ 
+     xf86CrtcScreenInit(pScreen);
+ #if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,5,0,0,0)
+@@ -627,7 +628,7 @@ GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+     /* colormap */
+     pGlamo->colormap = NULL;
+     if (!miCreateDefColormap(pScreen)) {
+-        xf86DrvMsg(scrnIndex, X_ERROR,
++        xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+                    "internal error: miCreateDefColormap failed "
+                    "in GlamoScreenInit()\n");
+         return FALSE;
+@@ -652,9 +653,9 @@ GlamoScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ }
+ 
+ static Bool
+-GlamoCloseScreen(int scrnIndex, ScreenPtr pScreen)
++GlamoCloseScreen(CLOSE_SCREEN_ARGS_DECL)
+ {
+-    ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     GlamoPtr pGlamo = GlamoPTR(pScrn);
+ 
+     if (pGlamo->accel)
+@@ -675,7 +676,7 @@ GlamoCloseScreen(int scrnIndex, ScreenPtr pScreen)
+ 
+     pScreen->CreateScreenResources = pGlamo->CreateScreenResources;
+     pScreen->CloseScreen = pGlamo->CloseScreen;
+-    return (*pScreen->CloseScreen)(scrnIndex, pScreen);
++    return (*pScreen->CloseScreen)(CLOSE_SCREEN_ARGS);
+ }
+ 
+ static Bool
+@@ -826,8 +827,8 @@ GlamoRestoreHW(ScrnInfoPtr pScrn) {
+ }
+ 
+ static Bool
+-GlamoEnterVT(int scrnIndex, int flags) {
+-    ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++GlamoEnterVT(VT_FUNC_ARGS_DECL) {
++    SCRN_INFO_PTR(arg);
+     GlamoPtr pGlamo = GlamoPTR(pScrn);
+ 
+     GlamoSaveHW(pScrn);
+@@ -842,8 +843,8 @@ GlamoEnterVT(int scrnIndex, int flags) {
+ }
+ 
+ static void
+-GlamoLeaveVT(int scrnIndex, int flags) {
+-    ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++GlamoLeaveVT(VT_FUNC_ARGS_DECL) {
++    SCRN_INFO_PTR(arg);
+     GlamoPtr pGlamo = GlamoPTR(pScrn);
+ 
+     if (pGlamo->accel)
+-- 
+1.8.0
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 10120b1..b56b995 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
            file://0001-fix-build-with-KMS-disabled.patch \
+           file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.0



