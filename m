Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9df1-00059K-T9
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 15:34:11 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so5940138wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0v5+GNd1PQtVOiNsKzlrzhMkdlU/HhKckJt3tm5N0pw=;
	b=Es1wd4jtY3MfWh8EdKfky+tuaJxsWTttWjBAR5NB82Hp3OMIEgawjGfqdcJNNapD/v
	Rm+NMYWb960fc92btTg+yOzsLE8LEFaPhp4uoLq7eaoO12+nxPUPhDdYRuS2h0WIa5Lj
	4GRFg1FTyQuX0n+rZMXmz2FQxc6Kq2B7zbMDl1srCPtuRTqGUjLh+6zZp1/sxyB++4Js
	gH3IPMowmLpVFCFxoxnFkvNyzIs6QUtMqrIgVzl/6OvOKZkNCxT2GQ8Ql2SE3XekgICI
	eElwpWckOmCKdju3JfzDh/TVTCz8PAeYLrJ9ODedRUeCcP8GI4UD1Gf1HhPgEj5KRa+d
	nubA==
Received: by 10.180.96.168 with SMTP id dt8mr20245816wib.18.1332167122819;
	Mon, 19 Mar 2012 07:25:22 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm25966940wib.3.2012.03.19.07.25.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:25:21 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 15:25:13 +0100
Message-Id: <1332167114-24083-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1332167114-24083-1-git-send-email-koen@dominion.thruhere.net>
References: <1332167114-24083-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlCU9LmUliBLewDKU8Fyn4QG6zs/c5la+W/GzjjtKhwtVpnctBKsAnUXAJXJYN2CrHs2+je
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/3] pixman: update bbappend to match update recipe in oe-core
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
X-List-Received-Date: Mon, 19 Mar 2012 14:34:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --------------------
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++++++++++++++++++++
 .../xorg-lib/pixman_0.24.4.bbappend                |   16 ---
 .../xorg-lib/pixman_0.25.2.bbappend                |   16 +++
 4 files changed, 130 insertions(+), 130 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.24.4/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.24.4.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.24.4/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.24.4/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 34f96ed..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.24.4/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 0c7aa6a3ebc29d7986d2417371df210f3e9a65b4 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 8/8] Generic C implementation of pixman_blt with overlapping support
-
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index 2ccdfcd..90461b6 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -227,9 +227,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dest_y * dst_stride + dest_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
- }
- 
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index cbd48f3..c20d9f0 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
- 
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- #include <stdio.h>
- #include <string.h>
-@@ -998,4 +999,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
-+    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* PIXMAN_PRIVATE_H */
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..34f96ed
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.25.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 0c7aa6a3ebc29d7986d2417371df210f3e9a65b4 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 8/8] Generic C implementation of pixman_blt with overlapping support
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
+index 2ccdfcd..90461b6 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -227,9 +227,24 @@ general_blt (pixman_implementation_t *imp,
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
++                       dst_bytes + dest_y * dst_stride + dest_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index cbd48f3..c20d9f0 100644
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
+@@ -998,4 +999,46 @@ void pixman_timer_register (pixman_timer_t *timer);
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
+1.6.6.1
+
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.4.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.4.bbappend
deleted file mode 100644
index ea28422..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.24.4.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-DEPENDS += "perl-native"
-BBCLASSEXTEND = "native"
-
-PRINC = "7"
-
-SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-NEON_armv7a-vfp-neon = " "
-
-IWMMXT = " --disable-arm-iwmmxt "
-
-EXTRA_OECONF += "${NEON} ${IWMMXT}"
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
new file mode 100644
index 0000000..ea28422
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+DEPENDS += "perl-native"
+BBCLASSEXTEND = "native"
+
+PRINC = "7"
+
+SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+NEON_armv7a-vfp-neon = " "
+
+IWMMXT = " --disable-arm-iwmmxt "
+
+EXTRA_OECONF += "${NEON} ${IWMMXT}"
-- 
1.7.2.5



