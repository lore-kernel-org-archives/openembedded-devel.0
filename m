Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRRFp-0001gM-0z
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:53:21 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3662569fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=hWdTSYjbreghRK0NxQ86FjfbSs73bqVamCk05T0EZf0=;
	b=spiW84yEO2kuZRipikDntZy7A1KX5PCur7Hhh1D3uc3YqdCBrkqbYbS+o7r+Ge8mYg
	wdJdCZL7KsvfBNS98OZ3GaK26SLijqyiABecO8vhtSzHRwdYvv08qHXXAAyCdjzumCJU
	i6JOdX51vvZt+cNjruau0arVrhFpVj1FEe184=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vMBdH1zf72lKsvZQ5VZetCzEJ8AfnBs9FhE6RomNTwuTEvh3gfXflx1WvrEtOqFJPJ
	vqszU25P+t+gZhVpMiPOzslFat/RY348+gNb9oxQEl89tqH6CGBVdzAXzCUJWk9kR0Yy
	wBwmPq3yg3qV438vVYEZLwTMXnw/WpENw6lTk=
Received: by 10.223.127.197 with SMTP id h5mr933545fas.36.1306857005400;
	Tue, 31 May 2011 08:50:05 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id y7sm90906fak.7.2011.05.31.08.50.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:50:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2011 17:49:53 +0200
Message-Id: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1306856963.git.Martin.Jansa@gmail.com>
References: <cover.1306856963.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of randr-support.patch with upstream patch
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
X-List-Received-Date: Tue, 31 May 2011 15:53:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch |   61 ++++++++++++++++++++
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 .../randr-support.patch                            |   41 ++-----------
 .../replace-pkgconfig-sdkdir-poking.patch          |    0
 ...r-xorg_1.10.1.901.bb => xserver-xorg_1.10.2.bb} |    9 ++-
 6 files changed, 72 insertions(+), 39 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/hack-fbdev-ignore-return-mode.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/randr-support.patch (75%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/replace-pkgconfig-sdkdir-poking.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.1.901.bb => xserver-xorg_1.10.2.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
new file mode 100644
index 0000000..2c4078a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
@@ -0,0 +1,61 @@
+From 50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd Mon Sep 17 00:00:00 2001
+From: Aaron Plattner <aplattner@nvidia.com>
+Date: Tue, 24 May 2011 23:02:42 +0000
+Subject: randr: check rotated virtual size limits correctly
+
+Commit d1107918d4626268803b54033a07405122278e7f introduced checks to
+the RandR path that cause RRSetScreenConfig requests to fail if the
+size is too large.  Unfortunately, when RandR 1.1 rotation is enabled
+it compares the rotated screen dimensions to the unrotated limits,
+which causes 90- and 270-degree rotation to fail unless your screen
+happens to be square:
+
+  X Error of failed request:  BadValue (integer parameter out of range for operation)
+    Major opcode of failed request:  153 (RANDR)
+    Minor opcode of failed request:  2 (RRSetScreenConfig)
+    Value in failed request:  0x780
+    Serial number of failed request:  14
+    Current serial number in output stream:  14
+
+Fix this by moving the check above the code that swaps the dimensions
+based on the rotation.
+
+Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
+Reviewed-by: Jeremy Huddleston <jeremyhu@apple.com>
+Tested-by: Robert Hooker <robert.hooker@canonical.com>
+Tested-by: Kent Baxley <kent.baxley@canonical.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+(cherry picked from commit b6c7b9b2f39e970cedb6bc1e073f901e28cb0fa3)
+---
+diff --git a/randr/rrscreen.c b/randr/rrscreen.c
+index 1bc1a9e..da6d48d 100644
+--- a/randr/rrscreen.c
++++ b/randr/rrscreen.c
+@@ -910,12 +910,6 @@ ProcRRSetScreenConfig (ClientPtr client)
+      */
+     width = mode->mode.width;
+     height = mode->mode.height;
+-    if (rotation & (RR_Rotate_90|RR_Rotate_270))
+-    {
+-	width = mode->mode.height;
+-	height = mode->mode.width;
+-    }
+-
+     if (width < pScrPriv->minWidth || pScrPriv->maxWidth < width) {
+ 	client->errorValue = width;
+ 	free(pData);
+@@ -927,6 +921,12 @@ ProcRRSetScreenConfig (ClientPtr client)
+ 	return BadValue;
+     }
+ 
++    if (rotation & (RR_Rotate_90|RR_Rotate_270))
++    {
++	width = mode->mode.height;
++	height = mode->mode.width;
++    }
++
+     if (width != pScreen->width || height != pScreen->height)
+     {
+ 	int	c;
+--
+cgit v0.8.3-6-g21f6
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-assume-pixman-supports-overlapped-blt.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-assume-pixman-supports-overlapped-blt.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/hack-fbdev-ignore-return-mode.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/hack-fbdev-ignore-return-mode.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
index d870f39..632a64c 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/randr-support.patch
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/randr-support.patch
@@ -39,22 +39,22 @@ diff -ur xorg-server-1.10.1.901//hw/xfree86/common/xf86Xinput.c git/xorg-server-
 +    case RR_Rotate_0:
 +        swap_axes = 1;
 +        invert[0] = 0;
-+ 	 invert[1] = 0;
++        invert[1] = 0;
 +        break;
 +    case RR_Rotate_90:
 +        swap_axes = 0;
 +        invert[0] = 0;
-+ 	 invert[1] = 1;
++        invert[1] = 1;
 +        break;
 +    case RR_Rotate_180:
 +        swap_axes = 1;
-+        invert[0] = 0;
-+        invert[1] = 0;
++        invert[0] = 1;
++        invert[1] = 1;
 +        break;
 +    case RR_Rotate_270:
 +        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
++        invert[0] = 1;
++        invert[1] = 0;
 +        break;
 +    }
 +
@@ -100,32 +100,3 @@ diff -ur xorg-server-1.10.1.901//hw/xfree86/modes/xf86Crtc.c git/xorg-server-1.1
      return ret;
  }
  
-diff -ur xorg-server-1.10.1.901//randr/rrscreen.c git/xorg-server-1.10.1.901//randr/rrscreen.c
---- xorg-server-1.10.1.901//randr/rrscreen.c	2011-02-25 04:27:32.000000000 +0100
-+++ git/xorg-server-1.10.1.901//randr/rrscreen.c	2011-05-18 23:19:39.007760004 +0200
-@@ -910,11 +910,6 @@
-      */
-     width = mode->mode.width;
-     height = mode->mode.height;
--    if (rotation & (RR_Rotate_90|RR_Rotate_270))
--    {
--	width = mode->mode.height;
--	height = mode->mode.width;
--    }
- 
-     if (width < pScrPriv->minWidth || pScrPriv->maxWidth < width) {
- 	client->errorValue = width;
-@@ -926,7 +921,12 @@
- 	free(pData);
- 	return BadValue;
-     }
--
-+    if (rotation & (RR_Rotate_90|RR_Rotate_270))
-+    {
-+        width = mode->mode.height;
-+        height = mode->mode.width;
-+    }
-+			    
-     if (width != pScreen->width || height != pScreen->height)
-     {
- 	int	c;
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/replace-pkgconfig-sdkdir-poking.patch b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.1.901/replace-pkgconfig-sdkdir-poking.patch
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/replace-pkgconfig-sdkdir-poking.patch
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb
rename to meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
index 0515a34..06a97f9 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.901.bb
+++ b/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.2.bb
@@ -7,16 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "mesa-dri pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PE = "2"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
 SRC_URI += " \
+            file://50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch \
             file://randr-support.patch \
             file://hack-fbdev-ignore-return-mode.patch \
             file://hack-assume-pixman-supports-overlapped-blt.patch \
             file://replace-pkgconfig-sdkdir-poking.patch \
            "
-SRC_URI[md5sum] = "64585a28abb18726d950cf1005bbcce4"
-SRC_URI[sha256sum] = "b7d775891e7e7fc3001763cf5727995b81bf07b72e12d9d41db282fe625298e6"
+SRC_URI[md5sum] = "c9ba50bd44ea70da51f13100336a5484"
+SRC_URI[sha256sum] = "65264f6640568b9db8d738aec1ddd036c3ae21b7ba05b98d006759d11a72792c"
 
 do_install_prepend() {
         mkdir -p ${D}/${libdir}/X11/fonts
@@ -26,7 +27,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
 
 export LDFLAGS += " -ldl "
-- 
1.7.5.3



