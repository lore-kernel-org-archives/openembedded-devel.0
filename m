Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9dI-0008Kh-2e
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:56:48 +0200
Received: by fxg11 with SMTP id 11so880859fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+mg8El0p+1aAog/J6dizhzF8anIIrlfoNnMwaCeJuEk=;
	b=nqOGy6csEewKv6Rt2d8NLM440hPfcsVushufKV+0dTjzxtRpGour1OSP9+1B4Dc1Xc
	G/tEyhQSk+n50owEuXEeG8+IgcRHoidlHQR3aRm1Uj4cMGjLO/AgC/yxOfVL9XoxAYlz
	BfartXNhQGcsnYNDs00Nkrkuk63UsHXKxFdVo=
Received: by 10.223.29.82 with SMTP id p18mr2341fac.44.1314892287535;
	Thu, 01 Sep 2011 08:51:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm135217fac.12.2011.09.01.08.51.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:51:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:50:56 +0200
Message-Id: <49f18160290338d81c35a56f12fb5edaababe78b.1314892207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
References: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314892207.git.Martin.Jansa@gmail.com>
References: <cover.1314892207.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] xf86-video-omapfb: add patch for fixing segfault on starting X when using VRFB
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
X-List-Received-Date: Thu, 01 Sep 2011 15:56:48 -0000

From: Sebastian Krzyszkowiak <dos@dosowisko.net>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0004-Attempt-to-fix-VRFB.patch                 |  320 ++++++++++++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |    3 +-
 2 files changed, 322 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch
new file mode 100644
index 0000000..4d2ecd3
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-Attempt-to-fix-VRFB.patch
@@ -0,0 +1,320 @@
+From 9f034f7a83751e4d1bbff6dd742d54bd96d38230 Mon Sep 17 00:00:00 2001
+From: Eino-Ville Talvala <talvala@stanford.edu>
+Date: Tue, 23 Aug 2011 18:37:01 +0200
+Subject: [PATCH] Attempt to fix VRFB Signed-off-by: Sebastian Krzyszkowiak
+ <dos@dosowisko.net>
+
+---
+ src/image-format-conversions.c |    4 +-
+ src/image-format-conversions.h |    2 +-
+ src/omapfb-driver.c            |   28 +++++++++++++--
+ src/omapfb-xv-blizzard.c       |    1 +
+ src/omapfb-xv-generic.c        |   72 +++++++++++++++++++++++++++++++--------
+ src/omapfb-xv.c                |    3 ++
+ 6 files changed, 88 insertions(+), 22 deletions(-)
+
+diff --git a/src/image-format-conversions.c b/src/image-format-conversions.c
+index dcefa9b..d43427d 100644
+--- a/src/image-format-conversions.c
++++ b/src/image-format-conversions.c
+@@ -38,13 +38,13 @@
+ #include "image-format-conversions.h"
+ 
+ /* Basic line-based copy for packed formats */
+-void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest)
++void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest)
+ {
+ 	int i;
+ 	int len = w * 2;
+ 	for (i = 0; i < h; i++)
+ 	{
+-		memcpy(dest + i * len, src + i * stride, len);
++		memcpy(dest + i * dst_stride, src + i * src_stride, len);
+ 	}
+ }
+ 
+diff --git a/src/image-format-conversions.h b/src/image-format-conversions.h
+index 584896a..ba7caf2 100644
+--- a/src/image-format-conversions.h
++++ b/src/image-format-conversions.h
+@@ -27,7 +27,7 @@
+ #include <stdint.h>
+ 
+ /* Basic line-based copy for packed formats */
+-void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest);
++void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest);
+ 
+ /* Basic C implementation of YV12/I420 to UYVY conversion */
+ void uv12_to_uyvy(int w, int h, int y_pitch, int uv_pitch, uint8_t *y_p, uint8_t *u_p, uint8_t *v_p, uint8_t *dest);
+diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
+index 48aa09c..07989f5 100644
+--- a/src/omapfb-driver.c
++++ b/src/omapfb-driver.c
+@@ -66,6 +66,7 @@
+ #define OMAPFB_VERSION 1000
+ #define OMAPFB_DRIVER_NAME "OMAPFB"
+ #define OMAPFB_NAME "omapfb"
++#define ENFORCE_MODES
+ 
+ static Bool OMAPFBProbe(DriverPtr drv, int flags);
+ static Bool OMAPFBPreInit(ScrnInfoPtr pScrn, int flags);
+@@ -105,11 +106,13 @@ static SymTabRec OMAPFBChipsets[] = {
+ typedef enum {
+ 	OPTION_ACCELMETHOD,
+ 	OPTION_FB,
++	OPTION_ROTATE,
+ } FBDevOpts;
+ 
+ static const OptionInfoRec OMAPFBOptions[] = {
+ 	{ OPTION_ACCELMETHOD,	"AccelMethod",	OPTV_STRING,	{0},	FALSE },
+ 	{ OPTION_FB,		"fb",		OPTV_STRING,	{0},	FALSE },
++	{ OPTION_ROTATE,	"rotation",	OPTV_STRING,	{0},	FALSE },
+ 	{ -1,			NULL,		OPTV_NONE,	{0},	FALSE }
+ };
+ 
+@@ -286,6 +289,7 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
+ {
+ 	OMAPFBPtr ofb;
+ 	EntityInfoPtr pEnt;
++	char *rotate;
+ 	rgb zeros = { 0, 0, 0 };
+ 	struct stat st;
+ 
+@@ -379,6 +383,8 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
+ 	pScrn->progClock = TRUE;
+ 	pScrn->chipset   = "omapfb";
+ 	
++	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Rotate test version 0.02\n");
++	
+ 	/* Start with configured virtual size */
+ 	pScrn->virtualX = pScrn->display->virtualX;
+ 	pScrn->virtualY = pScrn->display->virtualY;
+@@ -496,12 +502,21 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	ofb->CloseScreen = pScreen->CloseScreen;
+ 	pScreen->CloseScreen = OMAPFBCloseScreen;
+ 
++	/* Enforce the default mode (this is silly I guess) */
++#ifdef ENFORCE_MODES
++	//xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Enforcing modes\n");
++	//set_mode(ofb, &ofb->default_mode);
++	//pScrn->displayWidth = ofb->fixed_info.line_length /
++	//  (ofb->state_info.bits_per_pixel>>3); //ofb->state_info.xres;
++#endif
++
+ 	/* Map our framebuffer memory */
++	ofb->mem_info.size = ofb->fixed_info.line_length * ofb->state_info.yres;
+ 	ofb->fb = mmap (NULL, ofb->mem_info.size,
+ 	                PROT_READ | PROT_WRITE, MAP_SHARED,
+ 	                ofb->fd, 0);
+-	if (ofb->fb == NULL) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed\n");
++	if (ofb->fb == MAP_FAILED) {
++		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
+ 		return FALSE;
+ 	}
+ 
+@@ -578,8 +593,13 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	} else if (!ofb->dss) {
+ 
+ 		ofb->plane_info.enabled = 1;
+-		ofb->plane_info.out_width = ofb->state_info.xres;
+-		ofb->plane_info.out_height = ofb->state_info.yres;
++		if (ofb->state_info.rotate == 0 || ofb->state_info.rotate == 2) {
++			ofb->plane_info.out_width = ofb->state_info.xres;
++			ofb->plane_info.out_height = ofb->state_info.yres;
++		} else {
++			ofb->plane_info.out_width = ofb->state_info.yres;
++			ofb->plane_info.out_height = ofb->state_info.xres;
++		}
+ 
+ 		if (ioctl (ofb->fd, OMAPFB_SETUP_PLANE, &ofb->plane_info)) {
+ 			xf86DrvMsg(scrnIndex, X_ERROR,
+diff --git a/src/omapfb-xv-blizzard.c b/src/omapfb-xv-blizzard.c
+index 406ffc6..b71d2aa 100644
+--- a/src/omapfb-xv-blizzard.c
++++ b/src/omapfb-xv-blizzard.c
+@@ -220,6 +220,7 @@ int OMAPFBXVPutImageBlizzard (ScrnInfoPtr pScrn,
+ 			packed_line_copy(src_w & ~3,
+ 			                 src_h & ~3,
+ 			                 ((src_w + 1) & ~1) * 2,
++					 ofb->port->fixed_info.line_length,
+ 			                 (uint8_t*)buf,
+ 			                 (uint8_t*)ofb->port->fb);
+ 			break;
+diff --git a/src/omapfb-xv-generic.c b/src/omapfb-xv-generic.c
+index e6f89fe..b33f344 100644
+--- a/src/omapfb-xv-generic.c
++++ b/src/omapfb-xv-generic.c
+@@ -62,7 +62,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
+ 
+-	/* The memory size is already set in OMAPFBXVQueryImageAttributes */
++	/* The memory size is already set before we get here */
+ 	if (ioctl(ofb->port->fd, OMAPFB_SETUP_MEM, &ofb->port->mem_info) != 0) {
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "Failed to allocate video plane memory\n");
+@@ -73,19 +73,20 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ 	ofb->port->fb = mmap (NULL, ofb->port->mem_info.size,
+ 	                PROT_READ | PROT_WRITE, MAP_SHARED,
+ 	                ofb->port->fd, 0);
+-	if (ofb->port->fb == NULL) {
++	if (ofb->port->fb == MAP_FAILED) {
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "Mapping video memory failed\n");
+ 		return XvBadAlloc;
+ 	}
+ 
+ 	/* Update the state info */
++	/* Let's not - it's bad
+ 	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
+ 	{
+ 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
+ 		return XvBadAlloc;
+ 	}
+-
++	*/
+ 	return Success;
+ }
+ 
+@@ -93,6 +94,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
++	int ret;
+ 
+ 	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
+ 	{
+@@ -104,6 +106,31 @@ int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
+ 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
+ 		return XvBadAlloc;
+ 	}
++	/* Changing rotation/nonstd flags can change the fixed info! */
++	if (ioctl (ofb->port->fd, FBIOGET_FSCREENINFO, &ofb->port->fixed_info))
++	{
++		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
++	/* Correct fixed info requires recalculation of needed memory */
++	ofb->port->mem_info.size = ofb->port->fixed_info.line_length * ofb->port->state_info.yres;
++
++	/* Allocate buffer memory */
++	ret = OMAPXVAllocPlane(pScrn);
++	if (ret != Success)
++		return ret;
++
++	/* Workaround for reset of mode after memory allo */
++	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
++	{
++		xf86Msg(X_ERROR, "%s: setting state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
++	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
++	{
++		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
+ 
+ 	if(ioctl(ofb->port->fd, OMAPFB_SETUP_PLANE,
+ 	   &ofb->port->plane_info) != 0) {
+@@ -124,6 +151,8 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+                              DrawablePtr pDraw)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
++	short drw_temp;
++	short rot_xres, rot_yres;
+ 
+ 	if (!ofb->port->plane_info.enabled
+ 	 || ofb->port->update_window.x != src_x
+@@ -163,13 +192,6 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 			return Success;
+ 		}
+ 
+-		/* If we don't have the plane running, enable it */
+-		if (!ofb->port->plane_info.enabled) {
+-			ret = OMAPXVAllocPlane(pScrn);
+-			if (ret != Success)
+-				return ret;
+-		}
+-
+ 		/* Set up the state info, xres and yres will be used for
+ 		 * scaling to the values in the plane info struct
+ 		 */
+@@ -179,12 +201,31 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 		ofb->port->state_info.yres_virtual = 0;
+ 		ofb->port->state_info.xoffset = 0;
+ 		ofb->port->state_info.yoffset = 0;
+-		ofb->port->state_info.rotate = 0;
++		//ofb->port->state_info.rotate = 0;
+ 		ofb->port->state_info.grayscale = 0;
+ 		ofb->port->state_info.activate = FB_ACTIVATE_NOW;
+ 		ofb->port->state_info.bits_per_pixel = 0;
+ 		ofb->port->state_info.nonstd = xv_to_omapfb_format(image);
+ 
++		/* Plane info does not rotate with state_info */
++		if (ofb->port->state_info.rotate == 1 ||
++		  ofb->port->state_info.rotate == 3) {
++			drw_temp = drw_x;
++			drw_x = drw_y;
++			drw_y = drw_temp;
++
++			drw_temp = drw_w;
++			drw_w = drw_h;
++			drw_h = drw_temp;
++
++			rot_xres = ofb->port->state_info.yres;
++			rot_yres = ofb->port->state_info.xres;
++		} else {
++			rot_xres = ofb->port->state_info.xres;
++			rot_yres = ofb->port->state_info.yres;
++		}
++
++
+ 		/* Set up the video plane info */
+ 		ofb->port->plane_info.enabled = 1;
+ 		ofb->port->plane_info.pos_x = drw_x;
+@@ -193,13 +234,13 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 		ofb->port->plane_info.out_height = drw_h & ~15;
+ 
+ 		/* Cap output to screen size */
+-		if (ofb->port->plane_info.out_width > ofb->state_info.xres) {
++		if (ofb->port->plane_info.out_width > rot_xres) {
+ 			ofb->port->plane_info.pos_x = 0;
+-			ofb->port->plane_info.out_width = ofb->state_info.xres;
++			ofb->port->plane_info.out_width = rot_xres;
+ 		}
+-		if (ofb->port->plane_info.out_height > ofb->state_info.yres) {
++		if (ofb->port->plane_info.out_height > rot_yres) {
+ 			ofb->port->plane_info.pos_y = 0;
+-			ofb->port->plane_info.out_height = ofb->state_info.yres;
++			ofb->port->plane_info.out_height = rot_yres;
+ 		}
+ 
+ 		ret = OMAPXVSetupVideoPlane(pScrn);
+@@ -223,6 +264,7 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 			packed_line_copy(src_w & ~15,
+ 			                 src_h & ~15,
+ 			                 ((src_w + 1) & ~1) * 2,
++			                 ofb->port->fixed_info.line_length,
+ 			                 (uint8_t*)buf,
+ 			                 (uint8_t*)ofb->port->fb);
+ 			break;
+diff --git a/src/omapfb-xv.c b/src/omapfb-xv.c
+index 1df651e..0fee2c6 100644
+--- a/src/omapfb-xv.c
++++ b/src/omapfb-xv.c
+@@ -169,8 +169,11 @@ static int OMAPFBXVQueryImageAttributes (ScrnInfoPtr pScrn,
+ 	h = *height;
+ 
+ 	w = (w + 1) & ~1;
++
++	/* Can't calculate these here - don't know line length
+ 	ofb->port->mem_info.size = w << 1;
+ 	ofb->port->mem_info.size *= h;
++	*/
+ 
+ 	return size;
+ }
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 151eb77..2cc744f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -5,7 +5,7 @@ INC_PR ?= "r15"
 DESCRIPTION = "X.Org X server -- OMAP display driver"
 PE = "1"
 PV = "0.1.1+${PR}+gitr${SRCREV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/omapfb-driver.c;beginline=1;endline=30;md5=a44c2a37e04d1c2c5f0313afb493f833"
@@ -14,6 +14,7 @@ SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
            file://0001-blacklist-tv-out.patch \
            file://0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch \
            file://0003-force-plain-mode.patch \
+           file://0004-Attempt-to-fix-VRFB.patch \
           "
 
 SRCREV_pn-${PN} = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
-- 
1.7.6.1



