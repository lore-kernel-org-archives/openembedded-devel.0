Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPDaF-0002dH-N6
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 14:53:10 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so6071028fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=tbzf5C12OxcBtdTu5jFyWN/IDIlU4DWvyKWtc9Kaj60=;
	b=wae36jkOaOJiptOHV1Aer5CSn9NZiKuby19nBPLyccWxYzPNEXvY5mJJpGvFF8gXz2
	T+dEnet0fP1fL3e7U9dSvL9LhX2LYaPwOnOS5aFpBTYFQFKhyAC7IejNkkme+qhGcEwM
	WVdVJHT1cyBspUFO2FCghYXKdEv3KHrzUVY98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eNWt51QzcE7LkC2XZkLZ/pE9pyV0qrGDRzYkuxFIgwOvfidfR+FoIY5s1nrbCL1dVb
	iE4C5g0A221F+9cjiQKzzpei7spB6zqPZVZ4IzmePJFo5kLMhWsZFFqRXkkCbxChLpxm
	SSYSIM1DFP1oE0bToTk53KBTVog1lkbcFUaOs=
Received: by 10.223.127.210 with SMTP id h18mr4974973fas.67.1306327807498;
	Wed, 25 May 2011 05:50:07 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n5sm221016faa.15.2011.05.25.05.50.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 05:50:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 May 2011 14:49:58 +0200
Message-Id: <5e3dc9510776c5f9ee65799732dd3a824de53a0d.1306327689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1306327689.git.Martin.Jansa@gmail.com>
References: <cover.1306327689.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] xserver-xorg: upgrade to 1.10.1.901 and return randr-support patch
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
X-List-Received-Date: Wed, 25 May 2011 12:53:11 -0000

* Thanks to Benjamin Deering for updating patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 .../xserver-xorg-1.10.1.901/randr-support.patch    |  131 ++++++++++++++++++++
 .../replace-pkgconfig-sdkdir-poking.patch          |    0
 ...r-xorg_1.10.1.bb => xserver-xorg_1.10.1.901.bb} |    7 +-
 5 files changed, 135 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/hack-fbdev-ignore-return-mode.patch (100%)
 create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1 => xserver-xorg-1.10.1.901}/replace-pkgconfig-sdkdir-poking.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.1.bb => xserver-xorg_1.10.1.901.bb} (85%)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-assume-pixman-supports-overlapped-blt.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/hack-fbdev-ignore-return-mode.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
new file mode 100644
index 0000000..d870f39
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
@@ -0,0 +1,131 @@
+diff -ur xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c git/xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c	2011-04-28 09:25:00.000000000 +0200
++++ git/xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c	2011-05-19 00:31:01.178439874 +0200
+@@ -99,6 +99,8 @@
+ 		return;								\
+ 	}
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ static int
+@@ -1408,4 +1410,73 @@
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
++    //LocalDevicePtr local;
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
++        swap_axes = 1;
++        invert[0] = 0;
++ 	 invert[1] = 0;
++        break;
++    case RR_Rotate_90:
++        swap_axes = 0;
++        invert[0] = 0;
++ 	 invert[1] = 1;
++        break;
++    case RR_Rotate_180:
++        swap_axes = 1;
++        invert[0] = 0;
++        invert[1] = 0;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 0;
++        invert[0] = 0;
++ 	 invert[1] = 1;
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
++        //local = dev->public.devicePrivate;
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
+diff -ur xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c git/xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c	2011-04-28 09:25:00.000000000 +0200
++++ git/xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c	2011-05-19 00:23:16.244383998 +0200
+@@ -389,6 +389,12 @@
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
+diff -ur xorg-server-1.10.1.901//randr/rrscreen.c git/xorg-server-1.10.1.901//randr/rrscreen.c
+--- xorg-server-1.10.1.901//randr/rrscreen.c	2011-02-25 04:27:32.000000000 +0100
++++ git/xorg-server-1.10.1.901//randr/rrscreen.c	2011-05-18 23:19:39.007760004 +0200
+@@ -910,11 +910,6 @@
+      */
+     width = mode->mode.width;
+     height = mode->mode.height;
+-    if (rotation & (RR_Rotate_90|RR_Rotate_270))
+-    {
+-	width = mode->mode.height;
+-	height = mode->mode.width;
+-    }
+ 
+     if (width < pScrPriv->minWidth || pScrPriv->maxWidth < width) {
+ 	client->errorValue = width;
+@@ -926,7 +921,12 @@
+ 	free(pData);
+ 	return BadValue;
+     }
+-
++    if (rotation & (RR_Rotate_90|RR_Rotate_270))
++    {
++        width = mode->mode.height;
++        height = mode->mode.width;
++    }
++			    
+     if (width != pScreen->width || height != pScreen->height)
+     {
+ 	int	c;
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/replace-pkgconfig-sdkdir-poking.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1/replace-pkgconfig-sdkdir-poking.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/replace-pkgconfig-sdkdir-poking.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb
similarity index 85%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb
index c02bd71..0515a34 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb
@@ -7,15 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "mesa-dri pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PE = "2"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += " \
+            file://randr-support.patch \
             file://hack-fbdev-ignore-return-mode.patch \
             file://hack-assume-pixman-supports-overlapped-blt.patch \
             file://replace-pkgconfig-sdkdir-poking.patch \
            "
-SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
-SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
+SRC_URI[md5sum] = "64585a28abb18726d950cf1005bbcce4"
+SRC_URI[sha256sum] = "b7d775891e7e7fc3001763cf5727995b81bf07b72e12d9d41db282fe625298e6"
 
 do_install_prepend() {
         mkdir -p ${D}/${libdir}/X11/fonts
-- 
1.7.5.rc3



