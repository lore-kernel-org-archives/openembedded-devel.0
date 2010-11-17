Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIixe-0007Cf-6O
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:26:11 +0100
Received: by fxm11 with SMTP id 11so578871fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dP8yIxdS/UrfLrtjdGyElfmY5z0F8gH8/y7g6jj4xC0=;
	b=J5eTKqXtVK/zQntlnPm5oHVUpeffO2wQbZVZNCkD/JNPdhNRVarTAsVe39FFc64JOM
	UyZRxMUbhWzK8sDmEyWPveblW+vP1r+BGKRryUdQGdF3EnmfFXHJiXqJFlRlF4htFQG2
	342J6em1pJ4Kh691lFn/pEfvNcvxQ4X1JWFvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KwvuExbPUNx+twAph6zbE+rWFk3s82s/+euMu9pIQ28DNOau3HapVLZ+oQ/KdRKn46
	oCX8e4HS1Y46kO7aSiiYMDY3qv2h8h3lw910l7kGhmoVWdUN6I4QFEmKX1PvdSIyYmbP
	7bmmDyy6ohYjbaNCoGzIbVlwZm8wGVLukFwF4=
Received: by 10.223.86.6 with SMTP id q6mr6950411fal.144.1290003903694;
	Wed, 17 Nov 2010 06:25:03 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f5sm611833fai.22.2010.11.17.06.25.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 06:25:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 15:24:57 +0100
Message-Id: <1290003899-13958-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] pixman: add version 0.21.2
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
X-List-Received-Date: Wed, 17 Nov 2010 14:26:11 -0000

---
 .../0000-Add-pixman_bits_override_accessors.patch  |   75 ++++++++++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 +++++++++++++++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ++++++++++++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ++++++++++++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 +++++++++++++
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 ++++++++++++++
 ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 ++++++++++++++++++++
 ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 ++++++++++
 recipes/xorg-lib/pixman_0.21.2.bb                  |   22 +++
 9 files changed, 821 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0000-Add-pixman_bits_override_accessors.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
 create mode 100644 recipes/xorg-lib/pixman-0.21.2/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
 create mode 100644 recipes/xorg-lib/pixman_0.21.2.bb

diff --git a/recipes/xorg-lib/pixman-0.21.2/0000-Add-pixman_bits_override_accessors.patch b/recipes/xorg-lib/pixman-0.21.2/0000-Add-pixman_bits_override_accessors.patch
new file mode 100644
index 0000000..1687bd4
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0000-Add-pixman_bits_override_accessors.patch
@@ -0,0 +1,75 @@
+From fff598814365037c8ffdd97afe10a14bb09558fc Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 1/8] add _pixman_bits_override_accessors
+
+* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
+* used in
+  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
+  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
+---
+ pixman/pixman-access.c  |   23 ++++++++++++++++++++++-
+ pixman/pixman-private.h |    5 +++++
+ 2 files changed, 27 insertions(+), 1 deletions(-)
+
+diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
+index f1ce0ba..b33da29 100644
+--- a/pixman/pixman-access.c
++++ b/pixman/pixman-access.c
+@@ -2836,7 +2836,7 @@ typedef struct
+ 	    store_scanline_ ## format, store_scanline_generic_64	\
+     }
+ 
+-static const format_info_t accessors[] =
++static format_info_t accessors[] =
+ {
+ /* 32 bpp formats */
+     FORMAT_INFO (a8r8g8b8),
+@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
+ 	setup_accessors (image);
+ }
+ 
++void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func)
++{
++    format_info_t *info = accessors;
++
++    while (info->format != PIXMAN_null)
++    {
++	if (info->format == format)
++	{
++	    if (fetch_func)
++		info->fetch_scanline_32 = fetch_func;
++	    if (store_func)
++		info->store_scanline_32 = store_func;
++	    return;
++	}
++	info++;
++    }
++}
++
+ #else
+ 
+ void
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index 383748a..969dfab 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -197,6 +197,11 @@ void
+ _pixman_bits_image_setup_accessors (bits_image_t *image);
+ 
+ void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func);
++
++void
+ _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
+                                         int             x,
+                                         int             y,
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.21.2/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..d438dfc
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 6b162fb9d4ede5faa25f24188964f31d7667e74e Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 1/7] Generic C implementation of pixman_blt with overlapping support
+
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index 4d234a0..c4d2c14 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index 969dfab..352bceb 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -10,6 +10,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -869,4 +870,46 @@ void pixman_timer_register (pixman_timer_t *timer);
+ 
+ #endif /* PIXMAN_TIMERS */
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.21.2/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..e86e8ed
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 2d6cc769d233c0b1a391b501e84f5c3b0f1af4f8 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 2/7] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index 34637a4..f9dd473 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using MMX */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.21.2/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..6fdfa5d
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From 532b8f45cee61ea2509a7f263dd30f40f3de29ba Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 3/7] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 5907de0..25015ae 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using SSE2 */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.21.2/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..4950dd8
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From 4e101b976fa5fc72e44553a15516b804ffda0394 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 4/7] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
+ 1 files changed, 51 insertions(+), 11 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 2f82069..6a6ed37 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -185,26 +185,66 @@ pixman_blt_neon (uint32_t *src_bits,
+                  int       width,
+                  int       height)
+ {
+-    if (src_bpp != dst_bpp)
++    uint8_t *   src_bytes;
++    uint8_t *   dst_bytes;
++    int         bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
++    {
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
++    }
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using NEON */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
++    }
++
+     switch (src_bpp)
+     {
+     case 16:
+ 	pixman_composite_src_0565_0565_asm_neon (
+-		width, height,
+-		(uint16_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
+-		(uint16_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
++		width >> 1,
++		height,
++		(uint16_t *) dst_bytes,
++		dst_stride >> 1,
++		(uint16_t *) src_bytes,
++		src_stride >> 1);
+ 	return TRUE;
+     case 32:
+ 	pixman_composite_src_8888_8888_asm_neon (
+-		width, height,
+-		(uint32_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
+-		(uint32_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 4), src_stride);
++		width >> 2,
++		height,
++		(uint32_t *) dst_bytes,
++		dst_stride >> 2,
++		(uint32_t *) src_bytes,
++		src_stride >> 2);
+ 	return TRUE;
+     default:
+ 	return FALSE;
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
new file mode 100644
index 0000000..459c734
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
@@ -0,0 +1,109 @@
+From 8d7a77b6780af1b96db32026fb8d79c5603f0fba Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 5/7] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 60 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index 91ec27d..b838f92 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -459,6 +459,16 @@ generate_composite_function \
+     pixman_composite_src_8888_0565_process_pixblock_tail, \
+     pixman_composite_src_8888_0565_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8888_0565_process_pixblock_head, \
++    pixman_composite_src_8888_0565_process_pixblock_tail, \
++    pixman_composite_src_8888_0565_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_src_0565_8888_process_pixblock_head
+@@ -494,6 +504,16 @@ generate_composite_function \
+     pixman_composite_src_0565_8888_process_pixblock_tail, \
+     pixman_composite_src_0565_8888_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_0565_8888_process_pixblock_head, \
++    pixman_composite_src_0565_8888_process_pixblock_tail, \
++    pixman_composite_src_0565_8888_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_add_8_8_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 6a6ed37..4b2bbea 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -422,6 +422,42 @@ BIND_COMBINE_U (over)
+ BIND_COMBINE_U (add)
+ BIND_COMBINE_U (out_reverse)
+ 
++void
++pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
++                                       uint32_t       *buffer,
++                                       const uint16_t *pixel);
++void
++pixman_store_scanline_r5g6b5_asm_neon (int             width,
++                                       uint16_t       *pixel,
++                                       const uint32_t *values);
++
++static void
++neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            uint32_t *      buffer,
++                            const uint32_t *mask)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint16_t *pixel = (const uint16_t *)bits + x;
++
++    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
++}
++
++static void
++neon_store_scanline_r5g6b5 (bits_image_t *  image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            const uint32_t *values)
++{
++    uint32_t *bits = image->bits + image->rowstride * y;
++    uint16_t *pixel = ((uint16_t *) bits) + x;
++
++    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
++}
++
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+ {
+@@ -437,6 +473,10 @@ _pixman_implementation_create_arm_neon (void)
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
+     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
+ 
++    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
++                                     neon_fetch_scanline_r5g6b5,
++                                     neon_store_scanline_r5g6b5);
++
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+ 
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/recipes/xorg-lib/pixman-0.21.2/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
new file mode 100644
index 0000000..c317147
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
@@ -0,0 +1,148 @@
+From b689ddce66ce6391b6478d870f00fe21bbce944c Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 23 Sep 2010 21:10:56 +0300
+Subject: [PATCH 6/7] ARM: added NEON optimizations for fetch/store a8 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
+ 2 files changed, 106 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index b838f92..8e43a3b 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -418,6 +418,70 @@ generate_composite_function \
+ 
+ /******************************************************************************/
+ 
++.macro pixman_composite_src_8_8888_process_pixblock_head
++    /* This is tricky part: we can't set these values just once in 'init' macro
++     * because leading/trailing pixels handling part uses VZIP.8 instructions,
++     * and they operate on values in-place and destroy original registers
++     * content. Think about it like VST4.8 instruction corrupting NEON
++     * registers after write in 'tail_head' macro. Except that 'tail_head'
++     * macro itself actually does not need these extra VMOVs because it uses
++     * real VST4.8 instruction.
++     */
++    vmov.u8     q0, #0
++    vmov.u8     d2, #0
++.endm
++
++.macro pixman_composite_src_8_8888_process_pixblock_tail
++.endm
++
++.macro pixman_composite_src_8_8888_process_pixblock_tail_head
++    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
++    vld1.8      {d3}, [SRC]!
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8_8888_process_pixblock_head, \
++    pixman_composite_src_8_8888_process_pixblock_tail, \
++    pixman_composite_src_8_8888_process_pixblock_tail_head, \
++    0,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    3,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
++/******************************************************************************/
++
++.macro pixman_composite_src_8888_8_process_pixblock_head
++.endm
++
++.macro pixman_composite_src_8888_8_process_pixblock_tail
++.endm
++
++.macro pixman_composite_src_8888_8_process_pixblock_tail_head
++    vst1.8      {d3}, [DST_W, :64]!
++    vld4.8      {d0, d1, d2, d3}, [SRC]!
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8888_8_process_pixblock_head, \
++    pixman_composite_src_8888_8_process_pixblock_tail, \
++    pixman_composite_src_8888_8_process_pixblock_tail_head, \
++    3,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    0,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
++/******************************************************************************/
++
+ .macro pixman_composite_src_8888_0565_process_pixblock_head
+     vshll.u8    q8, d1, #8
+     vshll.u8    q14, d2, #8
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 4b2bbea..1c68d32 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -458,6 +458,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
+     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
+ }
+ 
++void
++pixman_fetch_scanline_a8_asm_neon (int             width,
++                                   uint32_t       *buffer,
++                                   const uint8_t  *pixel);
++
++
++void
++pixman_store_scanline_a8_asm_neon (int             width,
++                                   uint8_t        *pixel,
++                                   const uint32_t *values);
++
++static void
++neon_fetch_scanline_a8 (pixman_image_t *image,
++                        int             x,
++                        int             y,
++                        int             width,
++                        uint32_t *      buffer,
++                        const uint32_t *mask)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint8_t *pixel = (const uint8_t *) bits + x;
++
++    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
++}
++
++static void
++neon_store_scanline_a8 (bits_image_t *  image,
++                        int             x,
++                        int             y,
++                        int             width,
++                        const uint32_t *values)
++{
++    uint32_t *bits = image->bits + image->rowstride * y;
++    uint8_t *pixel = (uint8_t *) bits + x;
++
++    pixman_store_scanline_a8_asm_neon (width, pixel, values);
++}
++
++
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+ {
+@@ -476,6 +515,9 @@ _pixman_implementation_create_arm_neon (void)
+     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
+                                      neon_fetch_scanline_r5g6b5,
+                                      neon_store_scanline_r5g6b5);
++    _pixman_bits_override_accessors (PIXMAN_a8,
++                                     neon_fetch_scanline_a8,
++                                     neon_store_scanline_a8);
+ 
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman-0.21.2/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/recipes/xorg-lib/pixman-0.21.2/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
new file mode 100644
index 0000000..1abd28a
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.21.2/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
@@ -0,0 +1,77 @@
+From 912d7b4f79cda5dd828f5db7608314057a39338e Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 24 Sep 2010 18:22:44 +0300
+Subject: [PATCH 7/7] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
+ pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index 8e43a3b..5ebee5a 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -1206,6 +1206,20 @@ generate_composite_function \
+     0, /* src_basereg   */ \
+     0  /* mask_basereg  */
+ 
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
++    FLAG_DST_WRITEONLY, \
++    8, /* number of pixels, processed in a single block */ \
++    pixman_composite_src_x888_8888_init, \
++    default_cleanup, \
++    pixman_composite_src_x888_8888_process_pixblock_head, \
++    pixman_composite_src_x888_8888_process_pixblock_tail, \
++    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
++    0,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    0,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_over_n_8_8888_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 1c68d32..0bcfc54 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -496,6 +496,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
+     pixman_store_scanline_a8_asm_neon (width, pixel, values);
+ }
+ 
++void
++pixman_fetch_scanline_x888_asm_neon (int             width,
++                                     uint32_t       *buffer,
++                                     const uint32_t *pixel);
++
++static void
++neon_fetch_scanline_x888 (pixman_image_t *image,
++                          int             x,
++                          int             y,
++                          int             width,
++                          uint32_t *      buffer,
++                          const uint32_t *mask)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint32_t *pixel = (const uint32_t *) bits + x;
++
++    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
++}
+ 
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+@@ -518,6 +536,9 @@ _pixman_implementation_create_arm_neon (void)
+     _pixman_bits_override_accessors (PIXMAN_a8,
+                                      neon_fetch_scanline_a8,
+                                      neon_store_scanline_a8);
++    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
++                                     neon_fetch_scanline_x888,
++                                     NULL);
+ 
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+-- 
+1.7.3.2
+
diff --git a/recipes/xorg-lib/pixman_0.21.2.bb b/recipes/xorg-lib/pixman_0.21.2.bb
new file mode 100644
index 0000000..7e361b6
--- /dev/null
+++ b/recipes/xorg-lib/pixman_0.21.2.bb
@@ -0,0 +1,22 @@
+require pixman.inc
+
+SRC_URI[archive.md5sum] = "9e09fd6e58cbf9717140891e0b7d4a7a"
+SRC_URI[archive.sha256sum] = "295f51416caf307ff7caf1153ee9b1d86b9f7f02a7876d12db6538d80451c5de"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "\
+           file://0000-Add-pixman_bits_override_accessors.patch \
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
+           file://0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
+           file://0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
+"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
-- 
1.7.3.2



