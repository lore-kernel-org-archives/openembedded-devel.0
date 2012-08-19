Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T36cV-0001Hu-3C
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Aug 2012 16:36:51 +0200
Received: by wibhn17 with SMTP id hn17so2685142wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2012 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=h0XQ/91MO30FMaIjqNepv128tDkd57ElLhzOdpX/gb4=;
	b=wqPw2VLxNHVw8Lq4Ok3wnBYgIznRZo5hGQ2z9zOMMNJoOXXK7qTnlhP9CUyFqcfCPz
	qOUCXWmZL9bjNOu8FREN8uMtxbIuoQPGKT3T09hKeAk02N64JeismuCgWWcO5m8ssJQT
	Qtm3Vilb2P2ZZF0nIqpk1jOnfJsa33zWU65bZrKbnSrhMCNClXZVzJJ1vs2Rl/3t431U
	YqcnUvjN8zdE9z/+uZwCjwrHYavfxle/MiH4HGyBFCGYb+J20/vN0WFOHHyzCCZWa6g7
	G1yBQ9x+H6l3xc3pvpp4P7FJxM6aHRbV9LEjmoNMsqzdVCPCbhQaFAX+t/LzhpG9NlrP
	nBPQ==
Received: by 10.216.198.137 with SMTP id v9mr5829161wen.116.1345386290053;
	Sun, 19 Aug 2012 07:24:50 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2BC0.dip.t-dialin.net.
	[91.10.43.192])
	by mx.google.com with ESMTPS id j6sm33283033wiy.4.2012.08.19.07.24.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 07:24:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2012 16:31:49 +0200
Message-Id: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] pixman: remove append from meta-oe
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
X-List-Received-Date: Sun, 19 Aug 2012 14:36:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If [1] is going to be accepted, there is no need for pixman in meta-oe.

[1] http://patches.openembedded.org/patch/34885/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch |  121 --------------------
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ------------------
 .../xorg-lib/pixman_0.26.2.bbappend                |   13 --
 3 files changed, 0 insertions(+), 248 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
deleted file mode 100644
index b56e690..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From dad8537110c27b45795f8879a3e0a54aa77546b9 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 11 Jan 2011 18:10:39 +0200
-Subject: [PATCH] ARM: qemu related workarounds in cpu features detection code
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- pixman/pixman-cpu.c |   67 +++++++++++++++++++++++++++++++++++++++++---------
- 1 files changed, 55 insertions(+), 12 deletions(-)
-
-diff --git a/pixman/pixman-cpu.c b/pixman/pixman-cpu.c
-index aa9036f..a8f2494 100644
---- a/pixman/pixman-cpu.c
-+++ b/pixman/pixman-cpu.c
-@@ -333,15 +333,30 @@ pixman_arm_read_auxv_or_cpu_features ()
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
-+#include <sys/utsname.h>
- #include <fcntl.h>
- #include <string.h>
- #include <elf.h>
- 
-+/*
-+ * The whole CPU capabilities detection is a bit ugly: when running in
-+ * userspace qemu, we see /proc/self/auxv from the host system. To make
-+ * everything even worse, the size of each value is 64-bit when running
-+ * on a 64-bit host system. So the data is totally bogus because we expect
-+ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cause
-+ * segfault (null pointer dereference on x86-64 host). So in order to be
-+ * on a safe side, we require that AT_PLATFORM value is found only once,
-+ * and it has non-zero value (this is still not totally reliable for a big
-+ * endian 64-bit host system running qemu and may theoretically fail).
-+ */
- static void
- pixman_arm_read_auxv_or_cpu_features ()
- {
-     int fd;
-     Elf32_auxv_t aux;
-+    uint32_t hwcap = 0;
-+    const char *plat = NULL;
-+    int plat_cnt = 0;
- 
-     fd = open ("/proc/self/auxv", O_RDONLY);
-     if (fd >= 0)
-@@ -350,32 +365,60 @@ pixman_arm_read_auxv_or_cpu_features ()
- 	{
- 	    if (aux.a_type == AT_HWCAP)
- 	    {
--		uint32_t hwcap = aux.a_un.a_val;
--		/* hardcode these values to avoid depending on specific
--		 * versions of the hwcap header, e.g. HWCAP_NEON
--		 */
--		arm_has_vfp = (hwcap & 64) != 0;
--		arm_has_iwmmxt = (hwcap & 512) != 0;
--		/* this flag is only present on kernel 2.6.29 */
--		arm_has_neon = (hwcap & 4096) != 0;
-+		hwcap = aux.a_un.a_val;
- 	    }
- 	    else if (aux.a_type == AT_PLATFORM)
- 	    {
--		const char *plat = (const char*) aux.a_un.a_val;
--		if (strncmp (plat, "v7l", 3) == 0)
-+		plat = (const char*) aux.a_un.a_val;
-+		plat_cnt++;
-+	    }
-+	}
-+	close (fd);
-+
-+	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
-+	{
-+	    /*
-+	     * Something seems to be really wrong, most likely we are
-+	     * running under qemu. Let's use machine type from "uname" for
-+	     * CPU capabilities detection:
-+	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.html
-+	     */
-+	    struct utsname u;
-+	    hwcap = 0; /* clear hwcap, because it is bogus */
-+	    if (uname (&u) == 0)
-+	    {
-+		if (strcmp (u.machine, "armv7l") == 0)
- 		{
- 		    arm_has_v7 = TRUE;
- 		    arm_has_v6 = TRUE;
-+		    hwcap |= 64; /* qemu is supposed to emulate vfp */
-+		    hwcap |= 4096; /* qemu is supposed to emulate neon */
- 		}
--		else if (strncmp (plat, "v6l", 3) == 0)
-+		else if (strcmp (u.machine, "armv6l") == 0)
- 		{
- 		    arm_has_v6 = TRUE;
-+		    hwcap |= 64; /* qemu is supposed to emulate vfp */
- 		}
- 	    }
- 	}
--	close (fd);
-+	else if (strncmp (plat, "v7l", 3) == 0)
-+	{
-+	    arm_has_v7 = TRUE;
-+	    arm_has_v6 = TRUE;
-+	}
-+	else if (strncmp (plat, "v6l", 3) == 0)
-+	{
-+	    arm_has_v6 = TRUE;
-+	}
-     }
- 
-+    /* hardcode these values to avoid depending on specific
-+     * versions of the hwcap header, e.g. HWCAP_NEON
-+     */
-+    arm_has_vfp = (hwcap & 64) != 0;
-+    arm_has_iwmmxt = (hwcap & 512) != 0;
-+    arm_has_neon = (hwcap & 4096) != 0;
-+
-     arm_tests_initialized = TRUE;
- }
- 
--- 
-1.7.8.6
-
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 34f96ed..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
deleted file mode 100644
index b5be2b5..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-PRINC := "${@int(PRINC) + 10}"
-
-SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-  file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-NEON_armv7a-vfp-neon = " "
-
-EXTRA_OECONF += "${NEON}"
-- 
1.7.4.4



