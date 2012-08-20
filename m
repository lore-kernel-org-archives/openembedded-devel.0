Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDd-0006ek-Bw
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:09:05 +0200
Received: by mail-wi0-f177.google.com with SMTP id hn17so3585094wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=PRXtxz0VEZSEeuK4QfSQKABcdocLx9mStcnKXw/ntEQ=;
	b=hBRjhEpZ+RtPTAjaFIulPrb9eN+KtNcApp6C1vbZJaT9nENFNs6JIKlmIF+pF+rKhK
	E0WjWyE6L6N5g9MzTdNwW0p65lK11rtRqJ8fh0ABZmHbh7yNVGWtLPx39nf4KzH4d3ir
	8BsQZoClE5SfnOyNBBmDV0fuGAhBiOf0FAmCtpUKAr3yPqawVovnsYfNGoaYQu9Hl7DU
	DIp1OWPm6NPy5d2yfI5z1iSypXl4FZuLp4T1r3v9kMKUamFxPuUsYUg0HheX4vLkKput
	ww2Xg+W4aZ+7KbCtGnAizGJZPwwXogALW3GesjAGzWMV/PqC8IMyfyiMBVjE9/00RUxQ
	30fQ==
Received: by 10.180.105.6 with SMTP id gi6mr31821724wib.4.1345496224829;
	Mon, 20 Aug 2012 13:57:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm44456950wiz.11.2012.08.20.13.57.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:57:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:31 +0200
Message-Id: <d27e1e203f15f4ce4ddb59f18602f8ce2ff5c631.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/8] pixman: update bbappend to match 0.27.2
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
X-List-Received-Date: Mon, 20 Aug 2012 21:09:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* when [1] is applied in oe-core this could be dropped completely
  (that's why I've removed PRINC here)
* [1] http://patches.openembedded.org/patch/34885/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch |  122 ++++++++++++--------
 ...plementation-of-pixman_blt-with-overlapp.patch} |   37 ++++--
 ...xman_0.26.2.bbappend => pixman_0.27.2.bbappend} |    5 +-
 3 files changed, 100 insertions(+), 64 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman-0.26.2 => pixman-0.27.2}/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch (46%)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch => pixman-0.27.2/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch} (75%)
 rename meta-oe/recipes-graphics/xorg-lib/{pixman_0.26.2.bbappend => pixman_0.27.2.bbappend} (65%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
similarity index 46%
rename from meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
rename to meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
index b56e690..8a1c524 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -1,18 +1,28 @@
-From dad8537110c27b45795f8879a3e0a54aa77546b9 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 11 Jan 2011 18:10:39 +0200
-Subject: [PATCH] ARM: qemu related workarounds in cpu features detection code
+From d140e69c1d76ed61d1feb53b79820951707ee5a6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 19 Aug 2012 15:15:45 +0200
+Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
+ code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+This was ported from meta-oe's patch [1]
+
+[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+
+Upstream-Status: Inappropriate [other] qemu fix
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- pixman/pixman-cpu.c |   67 +++++++++++++++++++++++++++++++++++++++++---------
- 1 files changed, 55 insertions(+), 12 deletions(-)
+ pixman/pixman-arm.c |   74 +++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 files changed, 69 insertions(+), 5 deletions(-)
 
-diff --git a/pixman/pixman-cpu.c b/pixman/pixman-cpu.c
-index aa9036f..a8f2494 100644
---- a/pixman/pixman-cpu.c
-+++ b/pixman/pixman-cpu.c
-@@ -333,15 +333,30 @@ pixman_arm_read_auxv_or_cpu_features ()
+diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
+index 23374e4..d0771fd 100644
+--- a/pixman/pixman-arm.c
++++ b/pixman/pixman-arm.c
+@@ -129,16 +129,35 @@ detect_cpu_features (void)
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/mman.h>
@@ -32,40 +42,55 @@ index aa9036f..a8f2494 100644
 + * and it has non-zero value (this is still not totally reliable for a big
 + * endian 64-bit host system running qemu and may theoretically fail).
 + */
- static void
- pixman_arm_read_auxv_or_cpu_features ()
++#define ARM_HWCAP_VFP 64
++#define ARM_HWCAP_IWMMXT 512
++#define ARM_HWCAP_NEON 4096
++
+ static arm_cpu_features_t
+ detect_cpu_features (void)
  {
-     int fd;
+     arm_cpu_features_t features = 0;
      Elf32_auxv_t aux;
+     int fd;
 +    uint32_t hwcap = 0;
 +    const char *plat = NULL;
 +    int plat_cnt = 0;
  
      fd = open ("/proc/self/auxv", O_RDONLY);
      if (fd >= 0)
-@@ -350,32 +365,60 @@ pixman_arm_read_auxv_or_cpu_features ()
+@@ -147,22 +166,23 @@ detect_cpu_features (void)
  	{
  	    if (aux.a_type == AT_HWCAP)
  	    {
 -		uint32_t hwcap = aux.a_un.a_val;
--		/* hardcode these values to avoid depending on specific
--		 * versions of the hwcap header, e.g. HWCAP_NEON
--		 */
--		arm_has_vfp = (hwcap & 64) != 0;
--		arm_has_iwmmxt = (hwcap & 512) != 0;
--		/* this flag is only present on kernel 2.6.29 */
--		arm_has_neon = (hwcap & 4096) != 0;
 +		hwcap = aux.a_un.a_val;
+ 
+ 		/* hardcode these values to avoid depending on specific
+ 		 * versions of the hwcap header, e.g. HWCAP_NEON
+ 		 */
+-		if ((hwcap & 64) != 0)
++		if ((hwcap & ARM_HWCAP_VFP) != 0)
+ 		    features |= ARM_VFP;
+-		if ((hwcap & 512) != 0)
++		if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
+ 		    features |= ARM_IWMMXT;
+ 		/* this flag is only present on kernel 2.6.29 */
+-		if ((hwcap & 4096) != 0)
++		if ((hwcap & ARM_HWCAP_NEON) != 0)
+ 		    features |= ARM_NEON;
  	    }
  	    else if (aux.a_type == AT_PLATFORM)
  	    {
 -		const char *plat = (const char*) aux.a_un.a_val;
--		if (strncmp (plat, "v7l", 3) == 0)
 +		plat = (const char*) aux.a_un.a_val;
 +		plat_cnt++;
-+	    }
-+	}
-+	close (fd);
+ 
+ 		if (strncmp (plat, "v7l", 3) == 0)
+ 		    features |= (ARM_V7 | ARM_V6);
+@@ -171,8 +191,52 @@ detect_cpu_features (void)
+ 	    }
+ 	}
+ 	close (fd);
 +
 +	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
 +	{
@@ -80,42 +105,41 @@ index aa9036f..a8f2494 100644
 +	    if (uname (&u) == 0)
 +	    {
 +		if (strcmp (u.machine, "armv7l") == 0)
- 		{
- 		    arm_has_v7 = TRUE;
- 		    arm_has_v6 = TRUE;
-+		    hwcap |= 64; /* qemu is supposed to emulate vfp */
-+		    hwcap |= 4096; /* qemu is supposed to emulate neon */
- 		}
--		else if (strncmp (plat, "v6l", 3) == 0)
++		{
++		    features |= (ARM_V7 | ARM_V6);
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		    hwcap |= ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
++		}
 +		else if (strcmp (u.machine, "armv6l") == 0)
- 		{
- 		    arm_has_v6 = TRUE;
-+		    hwcap |= 64; /* qemu is supposed to emulate vfp */
- 		}
- 	    }
- 	}
--	close (fd);
++		{
++		    features |= ARM_V6;
++		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
++		}
++	    }
++	}
 +	else if (strncmp (plat, "v7l", 3) == 0)
 +	{
-+	    arm_has_v7 = TRUE;
-+	    arm_has_v6 = TRUE;
++	    features |= (ARM_V7 | ARM_V6);
 +	}
 +	else if (strncmp (plat, "v6l", 3) == 0)
 +	{
-+	    arm_has_v6 = TRUE;
++	    features |= ARM_V6;
 +	}
      }
  
 +    /* hardcode these values to avoid depending on specific
 +     * versions of the hwcap header, e.g. HWCAP_NEON
 +     */
-+    arm_has_vfp = (hwcap & 64) != 0;
-+    arm_has_iwmmxt = (hwcap & 512) != 0;
-+    arm_has_neon = (hwcap & 4096) != 0;
++    if ((hwcap & ARM_HWCAP_VFP) != 0)
++        features |= ARM_VFP;
++    if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
++        features |= ARM_IWMMXT;
++    if ((hwcap & ARM_HWCAP_NEON) != 0)
++        features |= ARM_NEON;
 +
-     arm_tests_initialized = TRUE;
+     return features;
  }
  
 -- 
-1.7.8.6
+1.7.4.4
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
rename to meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
index 34f96ed..abd501a 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -1,8 +1,13 @@
-From 0c7aa6a3ebc29d7986d2417371df210f3e9a65b4 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 8/8] Generic C implementation of pixman_blt with overlapping support
+From 211b2bcdb19f86f3868a18520df7dcb4fd122f05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 19 Aug 2012 14:48:00 +0200
+Subject: [PATCH 2/2] Generic C implementation of pixman_blt with overlapping
+ support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
+This was ported from meta-oe's patch [1]:
 Uses memcpy/memmove functions to copy pixels, can handle the
 case when both source and destination areas are in the same
 image (this is useful for scrolling).
@@ -13,16 +18,22 @@ src_stride == dst_stride). Copying direction is undefined
 for the images with different source and destination stride
 which happen to be in the overlapped areas (but this is an
 unrealistic case anyway).
+
+[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+
+Upstream-Status: Unknown - this patch is in meta-oe for a while
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  pixman/pixman-general.c |   21 ++++++++++++++++++---
  pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 61 insertions(+), 3 deletions(-)
 
 diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index 2ccdfcd..90461b6 100644
+index d4b2daa..a86b206 100644
 --- a/pixman/pixman-general.c
 +++ b/pixman/pixman-general.c
-@@ -227,9 +227,24 @@ general_blt (pixman_implementation_t *imp,
+@@ -215,9 +215,24 @@ general_blt (pixman_implementation_t *imp,
               int                      width,
               int                      height)
  {
@@ -51,10 +62,10 @@ index 2ccdfcd..90461b6 100644
  
  static pixman_bool_t
 diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index cbd48f3..c20d9f0 100644
+index d5e6a72..c77d256 100644
 --- a/pixman/pixman-private.h
 +++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
+@@ -24,6 +24,7 @@
  
  #include "pixman.h"
  #include <time.h>
@@ -62,9 +73,9 @@ index cbd48f3..c20d9f0 100644
  #include <assert.h>
  #include <stdio.h>
  #include <string.h>
-@@ -998,4 +999,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
+@@ -1096,6 +1097,48 @@ void pixman_timer_register (pixman_timer_t *timer);
+ extern const uint8_t linear_to_srgb[4096];
+ extern const uint16_t srgb_to_linear[256];
  
 +/* a helper function, can blit 8-bit images with src/dst overlapping support */
 +static inline void
@@ -108,7 +119,9 @@ index cbd48f3..c20d9f0 100644
 +    }
 +}
 +
+ #endif /* __ASSEMBLER__ */
+ 
  #endif /* PIXMAN_PRIVATE_H */
 -- 
-1.6.6.1
+1.7.4.4
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
similarity index 65%
rename from meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
rename to meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
index b5be2b5..a04a549 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
@@ -1,9 +1,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-PRINC := "${@int(PRINC) + 10}"
-
-SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+SRC_URI += " \
   file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+  file://0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
 "
 
 NEON = " --disable-arm-neon "
-- 
1.7.8.6



