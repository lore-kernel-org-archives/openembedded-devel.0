Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O5cSv-0005cZ-Bk
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 12:20:02 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 1DF5877CA74
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 12:11:08 +0200 (CEST)
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 559224B0137;
	Sat, 24 Apr 2010 12:11:04 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 488F24B001B;
	Sat, 24 Apr 2010 12:11:02 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Apr 2010 12:12:06 +0200
Message-Id: <1272103926-15560-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] psplash : update to latest SVN
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
X-List-Received-Date: Sat, 24 Apr 2010 10:20:02 -0000

- update to latest SVN
- update file names : psplash-hand-img.h -> psplash-poky-img.h
- fix comments
- fix psplash-18bpp.patch (missing break in the switch)

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 .../{psplash-hand-img.h => psplash-poky-img.h}     |    0
 .../{psplash-hand-img.h => psplash-poky-img.h}     |    0
 .../{psplash-hand-img.h => psplash-poky-img.h}     |    0
 recipes/psplash/files/logo-math.patch              |   26 +++++---
 .../{psplash-hand-img.h => psplash-poky-img.h}     |    0
 recipes/psplash/files/psplash-18bpp.patch          |   73 +++++++++++--------
 .../{psplash-hand-img.h => psplash-poky-img.h}     |    0
 recipes/psplash/psplash-angstrom_svn.bb            |    8 +-
 recipes/psplash/psplash-omap3pandora_svn.bb        |    8 +-
 recipes/psplash/psplash-openmoko_svn.bb            |    8 +-
 recipes/psplash/psplash.inc                        |   12 ++--
 recipes/psplash/psplash_svn.bb                     |    2 +-
 12 files changed, 78 insertions(+), 59 deletions(-)
 rename recipes/psplash/files/angstrom/{psplash-hand-img.h => psplash-poky-img.h} (100%)
 rename recipes/psplash/files/boc01/{psplash-hand-img.h => psplash-poky-img.h} (100%)
 rename recipes/psplash/files/kaeilos/{psplash-hand-img.h => psplash-poky-img.h} (100%)
 rename recipes/psplash/files/openmoko/{psplash-hand-img.h => psplash-poky-img.h} (100%)
 rename recipes/psplash/files/{psplash-hand-img.h => psplash-poky-img.h} (100%)

diff --git a/recipes/psplash/files/angstrom/psplash-hand-img.h b/recipes/psplash/files/angstrom/psplash-poky-img.h
similarity index 100%
rename from recipes/psplash/files/angstrom/psplash-hand-img.h
rename to recipes/psplash/files/angstrom/psplash-poky-img.h
diff --git a/recipes/psplash/files/boc01/psplash-hand-img.h b/recipes/psplash/files/boc01/psplash-poky-img.h
similarity index 100%
rename from recipes/psplash/files/boc01/psplash-hand-img.h
rename to recipes/psplash/files/boc01/psplash-poky-img.h
diff --git a/recipes/psplash/files/kaeilos/psplash-hand-img.h b/recipes/psplash/files/kaeilos/psplash-poky-img.h
similarity index 100%
rename from recipes/psplash/files/kaeilos/psplash-hand-img.h
rename to recipes/psplash/files/kaeilos/psplash-poky-img.h
diff --git a/recipes/psplash/files/logo-math.patch b/recipes/psplash/files/logo-math.patch
index 21467af..2ebfd7c 100644
--- a/recipes/psplash/files/logo-math.patch
+++ b/recipes/psplash/files/logo-math.patch
@@ -1,15 +1,23 @@
 upstream: http://bugzilla.openedhand.com/show_bug.cgi?id=801
 comment:
 Do better math when showing logo vs progressbar.
+---
+ psplash.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
---- psplash/psplash.c.org	2007-09-22 20:33:36.000000000 +0300
-+++ psplash/psplash.c	2007-12-01 21:27:08.000000000 +0200
-@@ -258,7 +258,7 @@
+diff --git a/psplash.c b/psplash.c
+index 54a65cf..7a52e05 100644
+--- a/psplash.c
++++ b/psplash.c
+@@ -269,7 +269,7 @@ main (int argc, char** argv)
    /* Draw the OH logo  */
    psplash_fb_draw_image (fb, 
- 			 (fb->width  - HAND_IMG_WIDTH)/2, 
--			 (fb->height - HAND_IMG_HEIGHT)/2, 
-+			 ((fb->height * 5) / 6 - HAND_IMG_HEIGHT)/2, 
- 			 HAND_IMG_WIDTH,
- 			 HAND_IMG_HEIGHT,
- 			 HAND_IMG_BYTES_PER_PIXEL,
+ 			 (fb->width  - POKY_IMG_WIDTH)/2, 
+-			 (fb->height - POKY_IMG_HEIGHT)/2, 
++			 ((fb->height * 5) / 6 - POKY_IMG_HEIGHT)/2, 
+ 			 POKY_IMG_WIDTH,
+ 			 POKY_IMG_HEIGHT,
+ 			 POKY_IMG_BYTES_PER_PIXEL,
+-- 
+1.6.3.3
+
diff --git a/recipes/psplash/files/openmoko/psplash-hand-img.h b/recipes/psplash/files/openmoko/psplash-poky-img.h
similarity index 100%
rename from recipes/psplash/files/openmoko/psplash-hand-img.h
rename to recipes/psplash/files/openmoko/psplash-poky-img.h
diff --git a/recipes/psplash/files/psplash-18bpp.patch b/recipes/psplash/files/psplash-18bpp.patch
index 5e582a4..36ab43b 100644
--- a/recipes/psplash/files/psplash-18bpp.patch
+++ b/recipes/psplash/files/psplash-18bpp.patch
@@ -1,9 +1,15 @@
 upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=1764
 
-diff -ru psplash/psplash-fb.c /home/muromec/psplash/psplash-fb.c
---- psplash/psplash-fb.c       2007-08-29 21:27:49.000000000 +0300
-+++ /home/muromec/psplash/psplash-fb.c 2009-08-16 11:59:57.000000000 +0300
-@@ -72,6 +72,7 @@
+---
+ psplash-fb.c |    8 +++++++-
+ psplash-fb.h |    1 +
+ 2 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/psplash-fb.c b/psplash-fb.c
+index 71740cd..860c0c0 100644
+--- a/psplash-fb.c
++++ b/psplash-fb.c
+@@ -160,6 +160,7 @@ psplash_fb_new (int angle)
    fb->real_width  = fb->width  = fb_var.xres;
    fb->real_height = fb->height = fb_var.yres;
    fb->bpp    = fb_var.bits_per_pixel;
@@ -11,34 +17,39 @@ diff -ru psplash/psplash-fb.c /home/muromec/psplash/psplash-fb.c
    fb->stride = fb_fix.line_length;
    fb->type   = fb_fix.type;
    fb->visual = fb_fix.visual;
-@@ -176,7 +177,7 @@
-     }
-
-   /* FIXME: handle no RGB orderings */
--  switch (fb->bpp)
-+  switch (fb->depth)
-     {
-     case 24:
-     case 32:
-@@ -184,6 +185,10 @@
-       *(fb->data + off + 1) = green;
-       *(fb->data + off + 2) = blue;
-       break;
-+    case 18:
-+      *(fb->data + off)     = (red >> 2) | ((green & 0x0C) << 4);
-+      *(fb->data + off + 1) = ((green & 0xF0) >> 4) | ((blue & 0x3C) << 2);
-+      *(fb->data + off + 2) = (blue & 0xC0) >> 6;
-     case 16:
-       *(volatile uint16 *) (fb->data + off)
-       = ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
-diff -ru psplash/psplash-fb.h /home/muromec/psplash/psplash-fb.h
---- psplash/psplash-fb.h       2007-08-29 21:27:49.000000000 +0300
-+++ /home/muromec/psplash/psplash-fb.h 2009-08-16 11:58:39.000000000 +0300
-@@ -26,6 +26,7 @@
-   int            visual;
+@@ -308,7 +309,7 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+         break;
+       }
+   } else if (fb->rgbmode == BGR565 || fb->rgbmode == BGR888) {
+-    switch (fb->bpp)
++    switch (fb->depth)
+       {
+       case 24:
+       case 32:
+@@ -316,6 +317,11 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+         *(fb->data + off + 1) = green;
+         *(fb->data + off + 2) = blue;
+         break;
++      case 18:
++        *(fb->data + off)     = (red >> 2) | ((green & 0x0C) << 4);
++        *(fb->data + off + 1) = ((green & 0xF0) >> 4) | ((blue & 0x3C) << 2);
++        *(fb->data + off + 2) = (blue & 0xC0) >> 6;
++        break;
+       case 16:
+         *(volatile uint16_t *) (fb->data + off)
+ 	  = ((blue >> 3) << 11) | ((green >> 2) << 5) | (red >> 3);
+diff --git a/psplash-fb.h b/psplash-fb.h
+index ef5b39e..160cdeb 100644
+--- a/psplash-fb.h
++++ b/psplash-fb.h
+@@ -34,6 +34,7 @@ typedef struct PSplashFB
+   int            visual;		
    int            width, height;
    int            bpp;
 +  int            depth;
    int            stride;
-   char                *data;
-   char                *base;
+   char		*data;
+   char		*base;
+-- 
+1.6.3.3
+
diff --git a/recipes/psplash/files/psplash-hand-img.h b/recipes/psplash/files/psplash-poky-img.h
similarity index 100%
rename from recipes/psplash/files/psplash-hand-img.h
rename to recipes/psplash/files/psplash-poky-img.h
diff --git a/recipes/psplash/psplash-angstrom_svn.bb b/recipes/psplash/psplash-angstrom_svn.bb
index fc5e4c2..c610d87 100644
--- a/recipes/psplash/psplash-angstrom_svn.bb
+++ b/recipes/psplash/psplash-angstrom_svn.bb
@@ -3,16 +3,16 @@ require psplash-ua.inc
 
 ALTERNATIVE_PRIORITY = "20"
 
-# You can create your own pslash-hand-img.h by doing
-# ./make-image-header.sh <file>.png HAND
-# and rename the resulting .h to pslash-hand-img.h (for the logo)
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://psplash-18bpp.patch;patch=1 \
           file://logo-math.patch;patch=1 \
-          file://psplash-hand-img.h \
+          file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://splashfuncs \
diff --git a/recipes/psplash/psplash-omap3pandora_svn.bb b/recipes/psplash/psplash-omap3pandora_svn.bb
index bc9e9f6..2e531ee 100644
--- a/recipes/psplash/psplash-omap3pandora_svn.bb
+++ b/recipes/psplash/psplash-omap3pandora_svn.bb
@@ -4,15 +4,15 @@ require psplash-ua.inc
 ALTERNATIVE_PRIORITY = "30"
 ALTERNATIVE_PRIORITY_omap3pandora = "5"
 
-# You can create your own pslash-hand-img.h by doing
-# ./make-image-header.sh <file>.png HAND
-# and rename the resulting .h to pslash-hand-img.h (for the logo)
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://logo-math.patch;patch=1 \
-          file://psplash-hand-img.h \
+          file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://splashfuncs \
diff --git a/recipes/psplash/psplash-openmoko_svn.bb b/recipes/psplash/psplash-openmoko_svn.bb
index 1114645..bd04a02 100644
--- a/recipes/psplash/psplash-openmoko_svn.bb
+++ b/recipes/psplash/psplash-openmoko_svn.bb
@@ -3,15 +3,15 @@ require psplash-ua.inc
 
 ALTERNATIVE_PRIORITY = "30"
 
-# You can create your own pslash-hand-img.h by doing
-# ./make-image-header.sh <file>.png HAND
-# and rename the resulting .h to pslash-hand-img.h (for the logo)
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://logo-math.patch;patch=1 \
-          file://psplash-hand-img.h \
+          file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://psplash-init"
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index 7319b96..2c6555a 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -7,20 +7,20 @@ PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
 RCONFLICTS_${PN} = "exquisite"
 
-SRCREV = "249"
+SRCREV = "422"
 PV = "0.0+svnr${SRCPV}"
-PR = "r23"
+PR = "r25"
 
-# You can create your own pslash-hand-img.h by doing
-# ./make-image-header.sh <file>.png HAND
-# and rename the resulting .h to pslash-hand-img.h (for the logo)
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
 inherit autotools pkgconfig update-rc.d
 
 do_configure_append() {
-	install -m 0644 ${WORKDIR}/psplash-hand-img.h ${S}/
+	install -m 0644 ${WORKDIR}/psplash-poky-img.h ${S}/
 	install -m 0644 ${WORKDIR}/psplash-bar-img.h ${S}/
 
 	if [ -e "${WORKDIR}/psplash.h" ]; then
diff --git a/recipes/psplash/psplash_svn.bb b/recipes/psplash/psplash_svn.bb
index 584822e..c214e53 100644
--- a/recipes/psplash/psplash_svn.bb
+++ b/recipes/psplash/psplash_svn.bb
@@ -4,7 +4,7 @@ require psplash-ua.inc
 ALTERNATIVE_PRIORITY = "10"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://psplash-hand-img.h \
+          file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://splashfuncs \
-- 
1.6.3.3



