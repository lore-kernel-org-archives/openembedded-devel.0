Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1ODgJ8-0000v6-DW
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:03:16 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 55FFC4B007E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 17:59:15 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 17:59:14 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 May 2010 17:56:43 +0200
Message-Id: <1274025403-5145-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] psplash: unbreak recipe
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
X-List-Received-Date: Sun, 16 May 2010 16:03:16 -0000

psplash was broken by my previous patch for several machines / distro
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=31402cd6f9d1e7887926bfde465bb25b07f6dbea

this patch should fix this and is compile tested for kaeilos and angstrom distro
and for boc01 and omap3pandora machines

Signed-off-by: Eric Benard <eric@eukrea.com>
---
v3: use --find-copies-harder, sorry for the 2MB+ previous patch
v2: rebased after Koen's fix for Angstrom

 recipes/psplash/files/boc01/psplash-poky-img.h     |   10 ++--
 recipes/psplash/files/configurability.patch        |   16 +++---
 recipes/psplash/files/kaeilos/psplash-poky-img.h   |   10 ++--
 recipes/psplash/files/openmoko/psplash-poky-img.h  |   10 ++--
 recipes/psplash/files/psplash-poky-img.h           |   10 ++--
 recipes/psplash/files/psplash_grayscale.patch      |   62 ++++++++++----------
 .../psplash-omap3pandora/configurability.patch     |   16 +++---
 .../psplash/psplash-omap3pandora/logo-math.patch   |   26 +++++---
 .../{psplash-hand-img.h => psplash-poky-img.h}     |   10 ++--
 recipes/psplash/psplash.inc                        |    2 +-
 10 files changed, 90 insertions(+), 82 deletions(-)
 rename recipes/psplash/psplash-omap3pandora/{psplash-hand-img.h => psplash-poky-img.h} (99%)

diff --git a/recipes/psplash/files/boc01/psplash-poky-img.h b/recipes/psplash/files/boc01/psplash-poky-img.h
index 8c23e48..7cb17fa 100644
--- a/recipes/psplash/files/boc01/psplash-poky-img.h
+++ b/recipes/psplash/files/boc01/psplash-poky-img.h
@@ -1,10 +1,10 @@
 /* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
 
-#define HAND_IMG_ROWSTRIDE (384)
-#define HAND_IMG_WIDTH (128)
-#define HAND_IMG_HEIGHT (64)
-#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
-#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
+#define POKY_IMG_ROWSTRIDE (384)
+#define POKY_IMG_WIDTH (128)
+#define POKY_IMG_HEIGHT (64)
+#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
+#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
   "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\267\377" \
   "\377\377\6\267\267\267~~~\227\227\227\265\265\265\331\331\331\371\371" \
   "\371\372\377\377\377\11\334\334\334\234\234\234tttUUUTTTZZZ\201\201\201" \
diff --git a/recipes/psplash/files/configurability.patch b/recipes/psplash/files/configurability.patch
index c968865..90a9c34 100644
--- a/recipes/psplash/files/configurability.patch
+++ b/recipes/psplash/files/configurability.patch
@@ -232,15 +232,15 @@ Index: psplash/psplash.c
  
    /* Draw the OH logo  */
 -  psplash_fb_draw_image (fb, 
--			 (fb->width  - HAND_IMG_WIDTH)/2, 
--			 ((fb->height * 5) / 6 - HAND_IMG_HEIGHT)/2, 
+-			 (fb->width  - POKY_IMG_WIDTH)/2, 
+-			 ((fb->height * 5) / 6 - POKY_IMG_HEIGHT)/2, 
 +  psplash_fb_draw_image (fb,
-+                         (fb->width  - HAND_IMG_WIDTH)/2,
-+                         (fb->height - HAND_IMG_HEIGHT)/2,
- 			 HAND_IMG_WIDTH,
- 			 HAND_IMG_HEIGHT,
- 			 HAND_IMG_BYTES_PER_PIXEL,
- 			 HAND_IMG_RLE_PIXEL_DATA);
++                         (fb->width  - POKY_IMG_WIDTH)/2,
++                         (fb->height - POKY_IMG_HEIGHT)/2,
+ 			 POKY_IMG_WIDTH,
+ 			 POKY_IMG_HEIGHT,
+ 			 POKY_IMG_BYTES_PER_PIXEL,
+ 			 POKY_IMG_RLE_PIXEL_DATA);
  
    /* Draw progress bar border */
 -  psplash_fb_draw_image (fb, 
diff --git a/recipes/psplash/files/kaeilos/psplash-poky-img.h b/recipes/psplash/files/kaeilos/psplash-poky-img.h
index d262d6c..73b1375 100644
--- a/recipes/psplash/files/kaeilos/psplash-poky-img.h
+++ b/recipes/psplash/files/kaeilos/psplash-poky-img.h
@@ -1,10 +1,10 @@
 /* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
 
-#define HAND_IMG_ROWSTRIDE (720)
-#define HAND_IMG_WIDTH (240)
-#define HAND_IMG_HEIGHT (136)
-#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
-#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
+#define POKY_IMG_ROWSTRIDE (720)
+#define POKY_IMG_WIDTH (240)
+#define POKY_IMG_HEIGHT (136)
+#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
+#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
   "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377" \
   "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377" \
   "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377" \
diff --git a/recipes/psplash/files/openmoko/psplash-poky-img.h b/recipes/psplash/files/openmoko/psplash-poky-img.h
index 26f7f41..42cdb63 100644
--- a/recipes/psplash/files/openmoko/psplash-poky-img.h
+++ b/recipes/psplash/files/openmoko/psplash-poky-img.h
@@ -1,10 +1,10 @@
 /* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
 
-#define HAND_IMG_ROWSTRIDE (1440)
-#define HAND_IMG_WIDTH (480)
-#define HAND_IMG_HEIGHT (640)
-#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
-#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
+#define POKY_IMG_ROWSTRIDE (1440)
+#define POKY_IMG_WIDTH (480)
+#define POKY_IMG_HEIGHT (640)
+#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
+#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
   "\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0" \
   "\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0" \
   "\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0" \
diff --git a/recipes/psplash/files/psplash-poky-img.h b/recipes/psplash/files/psplash-poky-img.h
index c54f04c..5278177 100644
--- a/recipes/psplash/files/psplash-poky-img.h
+++ b/recipes/psplash/files/psplash-poky-img.h
@@ -1,10 +1,10 @@
 /* GdkPixbuf RGBA C-Source image dump 1-byte-run-length-encoded */
 
-#define HAND_IMG_ROWSTRIDE (880)
-#define HAND_IMG_WIDTH (220)
-#define HAND_IMG_HEIGHT (137)
-#define HAND_IMG_BYTES_PER_PIXEL (4) /* 3:RGB, 4:RGBA */
-#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
+#define POKY_IMG_ROWSTRIDE (880)
+#define POKY_IMG_WIDTH (220)
+#define POKY_IMG_HEIGHT (137)
+#define POKY_IMG_BYTES_PER_PIXEL (4) /* 3:RGB, 4:RGBA */
+#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
   "\310\354\354\341\377\2\342\342\330\377\352\352\337\377\323\354\354\341" \
   "\377\2\346\346\333\377\345\345\332\377\377\354\354\341\377\206\354\354" \
   "\341\377\2\335\335\322\377\350\350\335\377\323\354\354\341\377\2\343" \
diff --git a/recipes/psplash/files/psplash_grayscale.patch b/recipes/psplash/files/psplash_grayscale.patch
index 8f42369..531d63a 100644
--- a/recipes/psplash/files/psplash_grayscale.patch
+++ b/recipes/psplash/files/psplash_grayscale.patch
@@ -1,17 +1,17 @@
-diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.c
---- psplash.orig/psplash-fb.c	2007-08-29 20:27:49.000000000 +0200
-+++ psplash/psplash-fb.c	2009-01-15 18:42:11.000000000 +0100
-@@ -62,7 +62,8 @@
+diff -Nru psplash_orig/psplash-fb.c psplash/psplash-fb.c
+--- psplash_orig/psplash-fb.c	2010-04-22 16:17:33.000000000 +0200
++++ psplash/psplash-fb.c	2010-05-16 15:49:40.000000000 +0200
+@@ -132,7 +132,8 @@
        goto fail;
      }
-   
+ 
 -  if (fb_var.bits_per_pixel < 16)
-+  if (fb_var.bits_per_pixel != 1 && fb_var.bits_per_pixel != 2
-+      && fb_var.bits_per_pixel < 16)
++  if (fb_var.bits_per_pixel != 1 && fb_var.bits_per_pixel != 2                           
++       && fb_var.bits_per_pixel < 16) 
      {
        fprintf(stderr,
- 	      "Error, no support currently for %i bpp frame buffers\n",
-@@ -143,7 +144,18 @@
+               "Error, no support currently for %i bpp frame buffers\n"
+@@ -258,7 +259,18 @@
    return NULL;
  }
  
@@ -30,8 +30,8 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.c
 +}
  
  inline void
- psplash_fb_plot_pixel (PSplashFB    *fb, 
-@@ -153,7 +165,7 @@
+ psplash_fb_plot_pixel (PSplashFB    *fb,
+@@ -268,7 +280,7 @@
  		       uint8        green,
  		       uint8        blue)
  {
@@ -40,7 +40,7 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.c
  
    if (x < 0 || x > fb->width-1 || y < 0 || y > fb->height-1)
      return;
-@@ -161,17 +173,17 @@
+@@ -276,17 +288,17 @@
    switch (fb->angle)
      {
      case 270:
@@ -62,22 +62,22 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.c
        break;
      }
  
-@@ -188,6 +200,18 @@
-       *(volatile uint16 *) (fb->data + off) 
- 	= ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
-       break;
-+    case 2:
-+      shift = (3 - (off & 3)) << 1;
-+      *(fb->data + (off >> 2)) = (*(fb->data + (off >> 2)) & ~(3 << shift))
-+      | (((11*red + 16*green + 5*blue) >> 11) << shift);
-+      break;
-+    case 1:
-+      shift = 7 - (off & 7);
-+      if (((11*red + 16*green + 5*blue) >> 5) >= 128)
-+        *(fb->data + (off >> 3)) |= (1 << shift);
-+      else
-+        *(fb->data + (off >> 3)) &= ~(1 << shift);
-+      break;
-     default:
-       /* depth not supported yet */
-       break;
+@@ -303,6 +315,18 @@
+         *(volatile uint16_t *) (fb->data + off)
+ 	  = ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
+         break;
++      case 2:                                                                              
++        shift = (3 - (off & 3)) << 1;                                                      
++        *(fb->data + (off >> 2)) = (*(fb->data + (off >> 2)) & ~(3 << shift))              
++        | (((11*red + 16*green + 5*blue) >> 11) << shift);                                 
++        break;                                                                             
++      case 1:                                                                              
++        shift = 7 - (off & 7);                                                             
++        if (((11*red + 16*green + 5*blue) >> 5) >= 128)                                    
++          *(fb->data + (off >> 3)) |= (1 << shift);                                        
++        else                                                                               
++          *(fb->data + (off >> 3)) &= ~(1 << shift);                                       
++        break;  
+       default:
+         /* depth not supported yet */
+         break;
diff --git a/recipes/psplash/psplash-omap3pandora/configurability.patch b/recipes/psplash/psplash-omap3pandora/configurability.patch
index c968865..90a9c34 100644
--- a/recipes/psplash/psplash-omap3pandora/configurability.patch
+++ b/recipes/psplash/psplash-omap3pandora/configurability.patch
@@ -232,15 +232,15 @@ Index: psplash/psplash.c
  
    /* Draw the OH logo  */
 -  psplash_fb_draw_image (fb, 
--			 (fb->width  - HAND_IMG_WIDTH)/2, 
--			 ((fb->height * 5) / 6 - HAND_IMG_HEIGHT)/2, 
+-			 (fb->width  - POKY_IMG_WIDTH)/2, 
+-			 ((fb->height * 5) / 6 - POKY_IMG_HEIGHT)/2, 
 +  psplash_fb_draw_image (fb,
-+                         (fb->width  - HAND_IMG_WIDTH)/2,
-+                         (fb->height - HAND_IMG_HEIGHT)/2,
- 			 HAND_IMG_WIDTH,
- 			 HAND_IMG_HEIGHT,
- 			 HAND_IMG_BYTES_PER_PIXEL,
- 			 HAND_IMG_RLE_PIXEL_DATA);
++                         (fb->width  - POKY_IMG_WIDTH)/2,
++                         (fb->height - POKY_IMG_HEIGHT)/2,
+ 			 POKY_IMG_WIDTH,
+ 			 POKY_IMG_HEIGHT,
+ 			 POKY_IMG_BYTES_PER_PIXEL,
+ 			 POKY_IMG_RLE_PIXEL_DATA);
  
    /* Draw progress bar border */
 -  psplash_fb_draw_image (fb, 
diff --git a/recipes/psplash/psplash-omap3pandora/logo-math.patch b/recipes/psplash/psplash-omap3pandora/logo-math.patch
index 21467af..2ebfd7c 100644
--- a/recipes/psplash/psplash-omap3pandora/logo-math.patch
+++ b/recipes/psplash/psplash-omap3pandora/logo-math.patch
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
diff --git a/recipes/psplash/psplash-omap3pandora/psplash-hand-img.h b/recipes/psplash/psplash-omap3pandora/psplash-poky-img.h
similarity index 99%
rename from recipes/psplash/psplash-omap3pandora/psplash-hand-img.h
rename to recipes/psplash/psplash-omap3pandora/psplash-poky-img.h
index 13c64cf..c07ae86 100644
--- a/recipes/psplash/psplash-omap3pandora/psplash-hand-img.h
+++ b/recipes/psplash/psplash-omap3pandora/psplash-poky-img.h
@@ -1,10 +1,10 @@
 /* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
 
-#define HAND_IMG_ROWSTRIDE (2400)
-#define HAND_IMG_WIDTH (800)
-#define HAND_IMG_HEIGHT (480)
-#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
-#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
+#define POKY_IMG_ROWSTRIDE (2400)
+#define POKY_IMG_WIDTH (800)
+#define POKY_IMG_HEIGHT (480)
+#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
+#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
   "\347\0\0\0\202\0\0\1\1\0\0\0\202\0\0\1\202\0\0\2\1\0\0\1\202\0\0\2\202" \
   "\0\0\3\1\0\0\2\202\0\0\3\202\0\0\4\1\0\0\3\202\0\0\4\202\0\0\5\1\0\0" \
   "\4\202\0\0\5\202\0\0\6\1\0\0\5\202\0\0\6\202\0\0\7\1\0\0\6\202\0\0\7" \
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index d7b59ae..d16ae3e 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -9,7 +9,7 @@ RCONFLICTS_${PN} = "exquisite"
 
 SRCREV = "422"
 PV = "0.0+svnr${SRCPV}"
-PR = "r26"
+PR = "r27"
 
 # You can create your own pslash-poky-img.h by doing
 # ./make-image-header.sh <file>.png POKY
-- 
1.6.3.3



