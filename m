Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11776.1795762915063745179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=W2UNpZFe;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02ee04378so60623195ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762914; x=1796367714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAI8Pc4pBkHHjMw1bC1wFAEQnlwwV64fVR5CQ8oB/zo=;
        b=W2UNpZFezeVNBhDwBX6wGptSDJbEUHp3HV0De998JZPFyJPBWRdhoswfs6i4G4owi4
         7eK2w6ep4Wm+9jSkPipjRYUB/4ZofHH4r1HZAjuyYpat+QfL1aiKZmhkMlRTbQqjh+cl
         +h9gjqEHefzVet2yMNji5WTby3eOnb9mHDaHio+Dg7Aitx++J1ZCKhzmUnZDVcHSKc9U
         zrZ0bi4ITAholLi5oWjkvw6O4wKEI547VLxocPO65Bcc0zeIo6gwSMzjXgwQTFLeMMDj
         FO/xjiiK+9KU0CprblY9X0Td6bspNTuitpT3VbAKVfM8Tc/GT8SCBoUJ0emG5Nefuku/
         VbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762914; x=1796367714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAI8Pc4pBkHHjMw1bC1wFAEQnlwwV64fVR5CQ8oB/zo=;
        b=vrXIIuowyD5CxES1lP/mjMfnJffvhS7UaM3Nq2+D4AOlUztgYZczLS0avB7A4BP85c
         RRAtV46HSaus+l+G9mDGfbkA6hBYOplZtVCgsshhxB1Kpz2IH06YAwAED2LSgMF3YUG8
         taL3tGmRtYqe2Xa6aH4sSFIBeUi/JJyZNdOZZvcx7VYXcru2Yvy9dxw+xjXfW8J2MZO/
         9OGOpnL/Dc/d9lAEsErwuYdNPmXM2/JnEBF5iBIFLfW0/ltETxkRmbyxxSz9eh+WPzCQ
         glIdU+IHLXiJZXJDWuHO2+t1ul70HAQ2qdRjVT2QQ83Cu++QO6orbujYZH88Lrtb86zr
         gvEA==
X-Gm-Message-State: APuU4Z/ioi5Olx0rRMMfCXPwPmIWDu7DutliIC/LajIJR1m5r3L7mqCO
	AaeQ9Dp2pKE+fKyPDJtQKI2Te1xsPW6qGTMqRBFtda8MesvUFb0aBXgIPeuouoLE
X-Gm-Gg: AZFdTZceyNVhIMJSBSTLCPNWoLcjstvfJZIh6kYGLVn2PTH60X4WTpnvYaTms46MG5+
	G9qgDX91yS9Zci3KP5q/+OrxKNbKEuv3Z4fdDklitzpktPfhC5Jbpk2yKAAKMML7lJTjzk41oer
	oz1XphAbvhiqTOgbpFugIk0unYRZskhhX3xQslcCLp7P3C3L8BwSR3EsquSTRF3c7BDU+5s/Ffy
	d7omouJ583kB4RM1460NM/2b3NQt5RnBELqHDceWr34PjRWVNJnb4eUw7C6vfS3BjKKbnS/eyve
	9Jhk2LM2laoy33vJ6/SURwajkDBSlAcXSar8xpCQINK2/GC2TbhIaQpNC/pnn/M3q4D/Lacv5C8
	7O/+fIh391Ww8hLWMB/811C9gBKnGd+keSiX3qGxGYxZL+qZsSGlvzrOUn0ZGEoCR+4Kf5L9w4d
	q0OiMneCs9UmPtIBlSlToWIhGyUjmysOBcMLE4oaYSuwL6hBKjsDDnaldfxjQ65dLdhYupVjAt3
	TLtY/zsPOwznPNvnlE+nFNcNCJKeX1PGNonopp79KUQSrrHXFvh0GRrClqQ0je2OBlyKTgaM7s/
	2YGKwIPR/4ZdShzPgW2PO5oW8zREIQp05P3w2cu1tagCFDg5PP878NgHeRneIgY0RRjHUxNpqRm
	srkexlCgNGCFkfFxIXpl8ajQj1G7YVpTrj/CglA59AvoEce3YJmfyuw++ybNB9EcZpoJHq8ySVf
	uu8EVE4fPLY6Ob2VhegZCKT/HfXsxW3o2/yNvXE4UhY11S4kpFjfvtvjnYGYioUq/JM3f/a7H2V
	rcmV7IvoJmr9DCJxaXTw+4l4CwTRfn+p3W4RTikut5nNQoJjgXZJKsXat6rb3OPzuF2O/bnsN3G
	1UrL
X-Received: by 2002:a17:90b:268a:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3b41c9778e9mr22396248a91.50.1795762914088;
        Thu, 26 Nov 2026 23:01:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 3/6] fluidsynth: upgrade 2.6.2 -> 2.6.3
Date: Thu, 26 Nov 2026 23:01:42 -0800
Message-ID: <20261127070145.2286713-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133323
Content-Type: text/plain; charset="utf-8"

- Fix FPE and SEGV in rvoice DSP interpolation; stop fluid_clip from
  passing NaNs through
- Ignore SoundFont modulators with out-of-range/linked destinations
- Fix several memory leaks and a stack use-after-scope in the
  channelsmode shell command
- Fix MIDI sostenuto/CC66 handling, LFO direction on frequency update,
  finished voice lookup after reducing polyphony, RTKit fallback
- Compile the rvoice mixer as C++ and use std atomics for its work
  scheduling; OpenMP detection now requires the C++ component

Recipe: the ARM NEON mixer patch is ported to fluid_rvoice_mixer.cpp
since the file was renamed from .c upstream (static_cast added for the
now C++ code). Add UPSTREAM_CHECK_GITTAGREGEX for release tags only.
SRCREVs of the bundled dependencies are unchanged upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...elaration-for-float-multithreaded-se.patch | 56 +++++++++----------
 ...luidsynth_2.6.2.bb => fluidsynth_2.6.3.bb} |  3 +-
 2 files changed, 29 insertions(+), 30 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.6.2.bb => fluidsynth_2.6.3.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
index ead099545d..f025027510 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
@@ -193,24 +193,24 @@ fluidsynth: synth_one_block:all voices>: 97.000/103.681/251.000
 Upstream-Status: Inappropriate [embedded-specific]
 
 ---
- src/rvoice/fluid_rvoice_mixer.c | 55 ++++++++++++++++++++++++++++++++-
- 1 file changed, 54 insertions(+), 1 deletion(-)
+ src/rvoice/fluid_rvoice_mixer.cpp | 55 ++++++++++++++++++++++++++++++++-
+ 1 file changed, 55 insertions(+), 0 deletions(-)
 
-diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice_mixer.c
-index af0ef75d..07a357c7 100644
---- a/src/rvoice/fluid_rvoice_mixer.c
-+++ b/src/rvoice/fluid_rvoice_mixer.c
-@@ -27,6 +27,9 @@
+diff --git a/src/rvoice/fluid_rvoice_mixer.cpp b/src/rvoice/fluid_rvoice_mixer.cpp
+--- a/src/rvoice/fluid_rvoice_mixer.cpp
++++ b/src/rvoice/fluid_rvoice_mixer.cpp
+@@ -26,6 +26,10 @@
  #include "fluid_ladspa.h"
  #include "fluid_synth.h"
  
 +#if defined(__ARM_NEON__)
 +#include "arm_neon.h"
 +#endif
++
+ #include <atomic>
+ #include <new>
  
- // If less than x voices, the thread overhead is larger than the gain,
- // so don't activate the thread(s).
-@@ -1053,9 +1056,15 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+@@ -1454,8 +1458,15 @@
      int i, j;
      int scount = current_blockcount * FLUID_BUFSIZE;
      int minbuf;
@@ -222,20 +222,19 @@ index af0ef75d..07a357c7 100644
 +#else
      fluid_real_t *FLUID_RESTRICT base_src;
      fluid_real_t *FLUID_RESTRICT base_dst;
--
 +#endif
+ 
      minbuf = dst->buf_count;
  
-     if(minbuf > src->buf_count)
-@@ -1063,6 +1072,27 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+@@ -1464,6 +1475,27 @@
          minbuf = src->buf_count;
      }
  
 +#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
-+    base_src_left = fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_dst_left = fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_src_right = fluid_align_ptr(src->right_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_dst_right = fluid_align_ptr(dst->right_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_src_left = static_cast<fluid_real_t *>(fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_dst_left = static_cast<fluid_real_t *>(fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_src_right = static_cast<fluid_real_t *>(fluid_align_ptr(src->right_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_dst_right = static_cast<fluid_real_t *>(fluid_align_ptr(dst->right_buf, FLUID_DEFAULT_ALIGNMENT));
 +
 +    for(i = 0; i < minbuf; i++)
 +    {
@@ -252,10 +251,10 @@ index af0ef75d..07a357c7 100644
 +        }
 +    }
 +#else
-     base_src = fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT);
-     base_dst = fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT);
+     base_src = static_cast<fluid_real_t *>(fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT));
+     base_dst = static_cast<fluid_real_t *>(fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT));
  
-@@ -1090,6 +1120,7 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+@@ -1491,6 +1523,7 @@
              base_dst[dsp_i] += base_src[dsp_i];
          }
      }
@@ -263,15 +262,15 @@ index af0ef75d..07a357c7 100644
  
      minbuf = dst->fx_buf_count;
  
-@@ -1098,6 +1129,27 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+@@ -1499,6 +1532,27 @@
          minbuf = src->fx_buf_count;
      }
  
 +#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
-+    base_src_left = fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_dst_left = fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_src_right = fluid_align_ptr(src->fx_right_buf, FLUID_DEFAULT_ALIGNMENT);
-+    base_dst_right = fluid_align_ptr(dst->fx_right_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_src_left = static_cast<fluid_real_t *>(fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_dst_left = static_cast<fluid_real_t *>(fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_src_right = static_cast<fluid_real_t *>(fluid_align_ptr(src->fx_right_buf, FLUID_DEFAULT_ALIGNMENT));
++    base_dst_right = static_cast<fluid_real_t *>(fluid_align_ptr(dst->fx_right_buf, FLUID_DEFAULT_ALIGNMENT));
 +
 +    for(i = 0; i < minbuf; i++)
 +    {
@@ -288,10 +287,10 @@ index af0ef75d..07a357c7 100644
 +        }
 +    }
 +#else
-     base_src = fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
-     base_dst = fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
+     base_src = static_cast<fluid_real_t *>(fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT));
+     base_dst = static_cast<fluid_real_t *>(fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT));
  
-@@ -1125,6 +1177,7 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+@@ -1526,6 +1580,7 @@
              base_dst[dsp_i] += base_src[dsp_i];
          }
      }
@@ -301,4 +300,3 @@ index af0ef75d..07a357c7 100644
  
 -- 
 2.20.1
-
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.3.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.3.bb
index 03d40eaaae..12c48b9ad2 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.6.3.bb
@@ -21,7 +21,8 @@ SRC_URI = " \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
 SRCREV_FORMAT = "fluidsynth"
-SRCREV_fluidsynth = "c3b244ddfd094489a5490beee013c621a504adf2"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+SRCREV_fluidsynth = "cd8b576ae6d33b805378356e5b33ec9f9c5b2e1b"
 SRCREV_gcem = "012ae73c6d0a2cb09ffe86475f5c6fba3926e200"
 SRCREV_signalsmith-audio-basics = "012d2be17b0eb6839628f8c73687c4ccccc1bb01"
 SRCREV_signalsmith-linear = "5668673560146a9cfe38c25315071e3fd68c8317"
