Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0960E7C187
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 21:42:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f188so3624842wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 13:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=shTAJkQ3Dd4HIz1DwjLaVRIHBOc7F9yDiPEIbAn/XxU=;
	b=SlcTteJL4LwFHX3GkoLC64AG8gL4cfRHVVnUPlTVlsK3tH9aZN0gKPQnA4YEKlmjdG
	emyj91GnfDqYvdGV/PeoDeoN+PlWLyn+sKZOQHNXgR28Pp0lCzmvdhCvmjIvdac69BBj
	2LVilhsDPAyZIQEMPbw5Bs1BnCAO/MMWiUiB7vxvtO7FHXxUV9D+QiWDKbtKev1o3L9R
	U41WZJyD3ZRqDewq3Oiu5SRzrbHiVgaQTuAiEMD/nC1tlWncORLXO4ep34Sdrv0nTHiB
	sp00bQx3Y3zYhIkVzqvhzrwKxusCJsM5AKqKLWFfBfEgBryNm4WGe1PZvjS/IMALzZaq
	UB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=shTAJkQ3Dd4HIz1DwjLaVRIHBOc7F9yDiPEIbAn/XxU=;
	b=MJLmb6jFLUSXKVHp3t78G2fBFdtWUlU4FAnpto9FMx4EW5MBTRr2E0L535ondW0eey
	cj4Ni6LbiBrbFxf65ZJHjq94tJmU8vo866t1fwZE69E3sVQPnegASuqvAQYrQ9nQIgE5
	9T2NTXorb3usZpyx5i44EC/F7tpveJD4DChM0xabughsI8nmvwV4mXX0tFjOjitlMv2W
	yXzXodixCbGOFM65RL7MK+/TfHjR/ERsPidXG60ZSMc4gsrrZWsClHEZSKVdGLDcaXuT
	LmRk/SOkbevL4imoqZC2smPjlcz++2TvRuhovOaOXiQKBUAvBRolAgz5nLGK3LzHGeiJ
	6dWw==
X-Gm-Message-State: AJcUukdoJ+dgKSyMzfhpvXri+IriAnzbbMsC53HPSdRZudpUKxTcQg3C
	1tru+c5yODt/d81/+uh4zBrQJaHT
X-Google-Smtp-Source: ALg8bN6ULpaAEEW3adaHSfJ3MZLuulLA2YOyiL1mJuTrcrNzKItiYsBz7NQxhvdjB/+jddQplyCzYw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr9198208wmk.149.1547674926583; 
	Wed, 16 Jan 2019 13:42:06 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0029715DABF2C2CD5F5CC1.dip0.t-ipconnect.de.
	[2003:f0:7f00:2971:5dab:f2c2:cd5f:5cc1])
	by smtp.gmail.com with ESMTPSA id
	x81sm38356554wmg.17.2019.01.16.13.42.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 13:42:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2019 22:41:54 +0100
Message-Id: <20190116214154.11514-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116214154.11514-1-schnitzeltony@gmail.com>
References: <20190116214154.11514-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] fluidsynth: upgrade 1.1.11 -> 2.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2019 21:42:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Fallout caused by API change should be fixed in all recipes depending
  fluidsynth. To make this happen I sent out patches to many projects during
  last autumn.
* Add PACKAGECONFIG for profiling (disabled by default).
* ARM-NEON-patch was reworked and profiling runs were performed with and
  without the patch. See patch description for profiling results.
* We need to split tool to generate parameter tables to native. Since target
  and native builds do not share much in common we don't use BBCALLSEXTEND
* Add patch which allows clients to reduce useless copies of buffers.
  Fluidsynth-DSSI (in meta-qt5-extra currently) is going to make use of this.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...elaration-for-float-multithreaded-se.patch |  76 -----
 .../fluidsynth/fluidsynth-native_git.bb       |  10 +
 .../fluidsynth/fluidsynth.inc                 |  12 +
 ...tables-helper-we-have-to-use-native-.patch |  37 +++
 ...te_float-Allow-zero-pointer-for-left.patch | 178 ++++++++++
 ...elaration-for-float-multithreaded-se.patch | 304 ++++++++++++++++++
 .../fluidsynth/fluidsynth_1.1.11.bb           |  24 --
 .../fluidsynth/fluidsynth_git.bb              |  22 ++
 8 files changed, 563 insertions(+), 100 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
deleted file mode 100644
index 0e1846e31..000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 2de7e128fbdf528716b500cf27ed9a4358c931c9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 24 Nov 2017 00:05:35 +0100
-Subject: [PATCH 2/2] Use ARM-NEON accelaration for float-multithreaded setups
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- src/rvoice/fluid_rvoice_mixer.c | 26 ++++++++++++++++++++++++++
- 1 file changed, 26 insertions(+)
-
-diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice_mixer.c
-index 9616518..dbf8057 100644
---- a/src/rvoice/fluid_rvoice_mixer.c
-+++ b/src/rvoice/fluid_rvoice_mixer.c
-@@ -27,6 +27,10 @@
- #include "fluid_ladspa.h"
- #include "fluid_synth.h"
- 
-+#if defined(__ARM_NEON__)
-+#include "arm_neon.h"
-+#endif
-+
- 
- #define ENABLE_MIXER_THREADS 1
- 
-@@ -794,20 +798,42 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t* dest, fluid_mixer_buffers_t* src)
-   if (minbuf > src->buf_count)
-     minbuf = src->buf_count;
-   for (i=0; i < minbuf; i++) {
-+#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
-+    for (j=0; j < scount; j+=4) {
-+        float32x4_t vleft = vld1q_f32(&dest->left_buf[i][j]);
-+        float32x4_t vright = vld1q_f32(&dest->right_buf[i][j]);
-+        vleft = vaddq_f32(vleft, vld1q_f32(&src->left_buf[i][j]));
-+        vright = vaddq_f32(vright, vld1q_f32(&src->right_buf[i][j]));
-+        vst1q_f32(&dest->left_buf[i][j], vleft);
-+        vst1q_f32(&dest->right_buf[i][j], vright);
-+    }
-+#else
-     for (j=0; j < scount; j++) {
-       dest->left_buf[i][j] += src->left_buf[i][j];
-       dest->right_buf[i][j] += src->right_buf[i][j];
-     }
-+#endif
-   }
- 
-   minbuf = dest->fx_buf_count;
-   if (minbuf > src->fx_buf_count)
-     minbuf = src->fx_buf_count;
-   for (i=0; i < minbuf; i++) {
-+#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
-+    for (j=0; j < scount; j+=4) {
-+        float32x4_t vleft = vld1q_f32(&dest->fx_left_buf[i][j]);
-+        float32x4_t vright = vld1q_f32(&dest->fx_right_buf[i][j]);
-+        vleft = vaddq_f32(vleft, vld1q_f32(&src->fx_left_buf[i][j]));
-+        vright = vaddq_f32(vright, vld1q_f32(&src->fx_right_buf[i][j]));
-+        vst1q_f32(&dest->fx_left_buf[i][j], vleft);
-+        vst1q_f32(&dest->fx_right_buf[i][j], vright);
-+    }
-+#else
-     for (j=0; j < scount; j++) {
-       dest->fx_left_buf[i][j] += src->fx_left_buf[i][j];
-       dest->fx_right_buf[i][j] += src->fx_right_buf[i][j];
-     }
-+#endif
-   }
- }
- 
--- 
-2.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git.bb
new file mode 100644
index 000000000..a95c4c42a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+inherit native
+
+OECMAKE_SOURCEPATH = "${S}/src/gentables"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 755 ${B}/make_tables.exe ${D}/${bindir}/
+}
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
new file mode 100644
index 000000000..df431b62c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Fluidsynth is a software synthesizer"
+HOMEPAGE = "http://www.fluidsynth.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
+
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
+SRCREV = "1bae9b2fe1a958f54f4910c802a79673e0df9850"
+S = "${WORKDIR}/git"
+PV = "2.0.3"
+
+inherit cmake pkgconfig lib_package
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
new file mode 100644
index 000000000..44612275c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
@@ -0,0 +1,37 @@
+From 81ea820b155e887b13ea5986c3407cf93b2737f6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 2 Jan 2019 18:42:46 +0100
+Subject: [PATCH] Do not build gentables helper - we have to use native variant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/CMakeLists.txt | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index a0ba53d1..1c626717 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -359,14 +359,3 @@ else ( MACOSX_FRAMEWORK )
+ )
+    install ( FILES ${public_main_HEADER} DESTINATION ${INCLUDE_INSTALL_DIR} )
+ endif ( MACOSX_FRAMEWORK )
+-
+-# ******* Auto Generated Lookup Tables ******
+-
+-include(ExternalProject)
+-ExternalProject_Add(gentables
+-    DOWNLOAD_COMMAND ""
+-    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gentables
+-    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/gentables
+-    INSTALL_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gentables/make_tables.exe "${CMAKE_BINARY_DIR}/"
+-)
+-add_dependencies(libfluidsynth-OBJ gentables)
+-- 
+2.14.5
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
new file mode 100644
index 000000000..94daa951c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
@@ -0,0 +1,178 @@
+From 300977537b6056bdbbba9df9100fa6e891ca1f44 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 17 Dec 2018 14:08:45 +0100
+Subject: [PATCH 2/2] fluid_synth_nwrite_float: Allow zero pointer for
+ left/right and zero pointer in arrays
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With this modification a client can define exactly what it wants to get into
+buffers to avoid useless copying of data. On weak machines this leads to measurable
+performance wins.
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/FluidSynth/fluidsynth/pull/490
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 48 insertions(+), 21 deletions(-)
+
+diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
+index 0df620d3..379f8216 100644
+--- a/src/synth/fluid_synth.c
++++ b/src/synth/fluid_synth.c
+@@ -3306,10 +3306,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
+  * Synthesize a block of floating point audio to separate audio buffers (multichannel rendering). First effect channel used by reverb, second for chorus.
+  * @param synth FluidSynth instance
+  * @param len Count of audio frames to synthesize
+- * @param left Array of float buffers to store left channel of planar audio (as many as \c synth.audio-channels buffers, each of \c len in size)
+- * @param right Array of float buffers to store right channel of planar audio (size: dito)
+- * @param fx_left Since 1.1.7: If not \c NULL, array of float buffers to store left effect channels (as many as \c synth.effects-channels buffers, each of \c len in size)
+- * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers to store right effect channels (size: dito)
++ * @param left Array of float buffers to store left channel of planar audio (as many as \c synth.audio-channels buffers, each of \c len in size). Since 2.0.3: NULL allowed / NULL allowed for array entry
++ * @param right Array of float buffers to store right channel of planar audio (size: dito). Since 2.0.3: NULL allowed / NULL allowed for array entry
++ * @param fx_left Since 1.1.7: If not \c NULL, array of float buffers to store left effect channels (as many as \c synth.effects-channels buffers, each of \c len in size). Since 2.0.3: NULL allowed for array entry
++ * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers to store right effect channels (size: dito). Since 2.0.3: NULL allowed for array entry
+  * @return #FLUID_OK on success, #FLUID_FAILED otherwise
+  *
+  * @note Should only be called from synthesis thread.
+@@ -3386,15 +3386,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+         for(i = 0; i < synth->audio_channels; i++)
+         {
+ #ifdef WITH_FLOAT
+-            FLUID_MEMCPY(left[i], &left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
+-            FLUID_MEMCPY(right[i], &right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
++            if(left != NULL && left[i] != NULL)
++            {
++                FLUID_MEMCPY(left[i], &left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
++            }
++            if(right != NULL && right[i] != NULL)
++            {
++                FLUID_MEMCPY(right[i], &right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
++            }
+ #else //WITH_FLOAT
+             int j;
+ 
+             for(j = 0; j < num; j++)
+             {
+-                left[i][j] = (float) left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
+-                right[i][j] = (float) right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
++                if(left != NULL && left[i] != NULL)
++                {
++                    left[i][j] = (float) left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
++                }
++                if(right != NULL && right[i] != NULL)
++                {
++                    right[i][j] = (float) right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
++                }
+             }
+ 
+ #endif //WITH_FLOAT
+@@ -3404,12 +3416,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+         {
+ #ifdef WITH_FLOAT
+ 
+-            if(fx_left != NULL)
++            if(fx_left != NULL && fx_left[i] != NULL)
+             {
+                 FLUID_MEMCPY(fx_left[i], &fx_left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
+             }
+ 
+-            if(fx_right != NULL)
++            if(fx_right != NULL && fx_right[i] != NULL)
+             {
+                 FLUID_MEMCPY(fx_right[i], &fx_right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
+             }
+@@ -3417,7 +3429,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+ #else //WITH_FLOAT
+             int j;
+ 
+-            if(fx_left != NULL)
++            if(fx_left != NULL && fx_left[i] != NULL)
+             {
+                 for(j = 0; j < num; j++)
+                 {
+@@ -3425,7 +3437,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+                 }
+             }
+ 
+-            if(fx_right != NULL)
++            if(fx_right != NULL && fx_right[i] != NULL)
+             {
+                 for(j = 0; j < num; j++)
+                 {
+@@ -3456,15 +3468,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+         for(i = 0; i < synth->audio_channels; i++)
+         {
+ #ifdef WITH_FLOAT
+-            FLUID_MEMCPY(left[i] + count, &left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
+-            FLUID_MEMCPY(right[i] + count, &right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
++            if(left != NULL && left[i] != NULL)
++            {
++                FLUID_MEMCPY(left[i] + count, &left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
++            }
++            if(right != NULL && right[i] != NULL)
++            {
++                FLUID_MEMCPY(right[i] + count, &right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
++            }
+ #else //WITH_FLOAT
+             int j;
+ 
+-            for(j = 0; j < num; j++)
++            if(left != NULL && left[i] != NULL)
++            {
++                for(j = 0; j < num; j++)
++                {
++                    left[i][j + count] = (float) left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
++                }
++            }
++            if(right != NULL && right[i] != NULL)
+             {
+-                left[i][j + count] = (float) left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
+-                right[i][j + count] = (float) right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
++                for(j = 0; j < num; j++)
++                {
++                    right[i][j + count] = (float) right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
++                }
+             }
+ 
+ #endif //WITH_FLOAT
+@@ -3474,12 +3501,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+         {
+ #ifdef WITH_FLOAT
+ 
+-            if(fx_left != NULL)
++            if(fx_left != NULL && fx_left[i] != NULL)
+             {
+                 FLUID_MEMCPY(fx_left[i] + count, &fx_left_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
+             }
+ 
+-            if(fx_right != NULL)
++            if(fx_right != NULL && fx_right[i] != NULL)
+             {
+                 FLUID_MEMCPY(fx_right[i] + count, &fx_right_in[i * FLUID_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
+             }
+@@ -3487,7 +3514,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+ #else //WITH_FLOAT
+             int j;
+ 
+-            if(fx_left != NULL)
++            if(fx_left != NULL && fx_left[i] != NULL)
+             {
+                 for(j = 0; j < num; j++)
+                 {
+@@ -3495,7 +3522,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int len,
+                 }
+             }
+ 
+-            if(fx_right != NULL)
++            if(fx_right != NULL && fx_right[i] != NULL)
+             {
+                 for(j = 0; j < num; j++)
+                 {
+-- 
+2.14.5
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
new file mode 100644
index 000000000..ead099545
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
@@ -0,0 +1,304 @@
+From 947f79f97a5fa6547d99bff282606026632e010b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 13 Oct 2018 23:01:11 +0200
+Subject: [PATCH] Use ARM-NEON accelaration for float-multithreaded setups
+
+Profiling shows a considerable performance win. See estimated number of voices:
+They increase from ~471 to ~513 which makes a ~9% win:
+
+*******************************************************************************
+WITHOUT ARM NEON:
+*******************************************************************************
+
+morona@raspberrypi3:~$ fluidsynth -o synth.cpu-cores=4 -o synth.chorus.active=0 -o synth.reverb.active=0 /usr/share/sf2/fluidr3gm.sf2
+> prof_set_print 1
+> prof_set_notes 10
+> prof_start 3 10000
+Generating 10 notes, generated voices:20
+Number of measures(n_prof):3, duration of one mesure(dur):10000ms
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:30, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    112.00|    118.96|    206.00|   4.461
+ synth_one_block ---------->|    20|    109.00|    116.44|    196.00|   4.367
+ synth_one_block:clear ---->|    20|      1.00|      1.67|     18.00|   0.063
+ synth_one_block:one voice->|     1|     11.00|     12.36|     58.00|   0.463
+ synth_one_block:all voices>|    20|    107.00|    113.47|    187.00|   4.255
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.461|    4.461|     0.000|    0.000|    0.213|              470
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:20, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    112.00|    118.42|    216.00|   4.441
+ synth_one_block ---------->|    20|    109.00|    115.91|    205.00|   4.347
+ synth_one_block:clear ---->|    20|      1.00|      1.65|     18.00|   0.062
+ synth_one_block:one voice->|     1|     11.00|     12.30|     58.00|   0.461
+ synth_one_block:all voices>|    20|    107.00|    112.98|    197.00|   4.237
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.441|    4.441|     0.000|    0.000|    0.212|              472
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:10, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    112.00|    118.64|    244.00|   4.449
+ synth_one_block ---------->|    20|    109.00|    116.12|    234.00|   4.355
+ synth_one_block:clear ---->|    20|      1.00|      1.67|     37.00|   0.062
+ synth_one_block:one voice->|     1|     11.00|     12.31|     63.00|   0.462
+ synth_one_block:all voices>|    20|    107.00|    113.18|    214.00|   4.244
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.449|    4.449|     0.000|    0.000|    0.212|              471
+Stopping 20 voices...voices stopped.
+> quit
+cheers!
+JackTemporaryException : now quits...
+Jack main caught signal 2
+fluid_profiling_print
+fluidsynth: Estimated times: min/avg/max (micro seconds)
+fluidsynth: synth_write_* ------------>: 112.000/118.636/244.000
+fluidsynth: synth_one_block ---------->: 109.000/116.124/234.000
+fluidsynth: synth_one_block:clear ---->: 1.000/1.665/37.000
+fluidsynth: synth_one_block:one voice->: 11.000/12.309/63.000
+fluidsynth: synth_one_block:all voices>: 107.000/113.180/214.000
+
+*******************************************************************************
+WITH ARM NEON:
+*******************************************************************************
+
+morona@raspberrypi3:~$ fluidsynth -o synth.cpu-cores=4 -o synth.chorus.active=0 -o synth.reverb.active=0 /usr/share/sf2/fluidr3gm.sf2
+> prof_set_print 1
+> prof_set_notes 10
+> prof_start 3 10000
+Generating 10 notes, generated voices:20
+Number of measures(n_prof):3, duration of one mesure(dur):10000ms
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:30, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    102.00|    109.21|    213.00|   4.095
+ synth_one_block ---------->|    20|     99.00|    106.68|    201.00|   4.001
+ synth_one_block:clear ---->|    20|      1.00|      1.64|     18.00|   0.062
+ synth_one_block:one voice->|     1|     11.00|     12.30|     54.00|   0.461
+ synth_one_block:all voices>|    20|     97.00|    103.71|    188.00|   3.889
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.095|    4.095|     0.000|    0.000|    0.194|              514
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:20, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    102.00|    109.46|    278.00|   4.105
+ synth_one_block ---------->|    20|     99.00|    106.91|    265.00|   4.009
+ synth_one_block:clear ---->|    20|      1.00|      1.67|     22.00|   0.062
+ synth_one_block:one voice->|     1|     11.00|     12.30|     54.00|   0.461
+ synth_one_block:all voices>|    20|     97.00|    103.94|    251.00|   3.898
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.105|    4.105|     0.000|    0.000|    0.195|              513
+
+Profiling time(mm:ss): Total=0:30  Remainder=0:10, press <ENTER> to cancel
+ ------------------------------------------------------------------------------
+ Duration(microsecond) and cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond)
+ ------------------------------------------------------------------------------
+ Code under profiling       |Voices|       Duration (microsecond)   |  Load(%)
+                            |   nbr|       min|       avg|       max|
+ ---------------------------|------|--------------------------------|----------
+ synth_write_* ------------>|    20|    102.00|    109.22|    278.00|   4.096
+ synth_one_block ---------->|    20|     99.00|    106.65|    265.00|   3.999
+ synth_one_block:clear ---->|    20|      1.00|      1.67|     22.00|   0.062
+ synth_one_block:one voice->|     1|     11.00|     12.31|     57.00|   0.462
+ synth_one_block:all voices>|    20|     97.00|    103.68|    251.00|   3.888
+ synth_one_block:reverb --->| no profiling available
+ synth_one_block:chorus --->| no profiling available
+ voice:note --------------->| no profiling available
+ voice:release ------------>| no profiling available
+ ------------------------------------------------------------------------------
+ Cpu loads(%) (sr: 48000 Hz, sp: 20.83 microsecond) and maximum voices
+ ------------------------------------------------------------------------------
+ nVoices| total(%)|voices(%)| reverb(%)|chorus(%)| voice(%)|estimated maxVoices
+ -------|---------|---------|----------|---------|---------|-------------------
+      20|    4.096|    4.096|     0.000|    0.000|    0.194|              514
+Stopping 20 voices...voices stopped.
+> quit
+cheers!
+JackTemporaryException : now quits...
+Jack main caught signal 2
+fluid_profiling_print
+fluidsynth: Estimated times: min/avg/max (micro seconds)
+fluidsynth: synth_write_* ------------>: 102.000/109.216/278.000
+fluidsynth: synth_one_block ---------->: 99.000/106.649/265.000
+fluidsynth: synth_one_block:clear ---->: 1.000/1.666/22.000
+fluidsynth: synth_one_block:one voice->: 11.000/12.307/57.000
+fluidsynth: synth_one_block:all voices>: 97.000/103.681/251.000
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+---
+ src/rvoice/fluid_rvoice_mixer.c | 55 ++++++++++++++++++++++++++++++++-
+ 1 file changed, 54 insertions(+), 1 deletion(-)
+
+diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice_mixer.c
+index af0ef75d..07a357c7 100644
+--- a/src/rvoice/fluid_rvoice_mixer.c
++++ b/src/rvoice/fluid_rvoice_mixer.c
+@@ -27,6 +27,9 @@
+ #include "fluid_ladspa.h"
+ #include "fluid_synth.h"
+ 
++#if defined(__ARM_NEON__)
++#include "arm_neon.h"
++#endif
+ 
+ // If less than x voices, the thread overhead is larger than the gain,
+ // so don't activate the thread(s).
+@@ -1053,9 +1056,15 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+     int i, j;
+     int scount = current_blockcount * FLUID_BUFSIZE;
+     int minbuf;
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++    fluid_real_t *FLUID_RESTRICT base_src_left;
++    fluid_real_t *FLUID_RESTRICT base_src_right;
++    fluid_real_t *FLUID_RESTRICT base_dst_left;
++    fluid_real_t *FLUID_RESTRICT base_dst_right;
++#else
+     fluid_real_t *FLUID_RESTRICT base_src;
+     fluid_real_t *FLUID_RESTRICT base_dst;
+-
++#endif
+     minbuf = dst->buf_count;
+ 
+     if(minbuf > src->buf_count)
+@@ -1063,6 +1072,27 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+         minbuf = src->buf_count;
+     }
+ 
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++    base_src_left = fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_dst_left = fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_src_right = fluid_align_ptr(src->right_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_dst_right = fluid_align_ptr(dst->right_buf, FLUID_DEFAULT_ALIGNMENT);
++
++    for(i = 0; i < minbuf; i++)
++    {
++        for(j = 0; j < scount; j+=4)
++        {
++            int dsp_i = i * FLUID_MIXER_MAX_BUFFERS_DEFAULT * FLUID_BUFSIZE + j;
++
++            float32x4_t vleft = vld1q_f32(&base_dst_left[dsp_i]);
++            float32x4_t vright = vld1q_f32(&base_dst_right[dsp_i]);
++            vleft = vaddq_f32(vleft, vld1q_f32(&base_src_left[dsp_i]));
++            vright = vaddq_f32(vright, vld1q_f32(&base_src_right[dsp_i]));
++            vst1q_f32(&base_dst_left[dsp_i], vleft);
++            vst1q_f32(&base_dst_right[dsp_i], vright);
++        }
++    }
++#else
+     base_src = fluid_align_ptr(src->left_buf, FLUID_DEFAULT_ALIGNMENT);
+     base_dst = fluid_align_ptr(dst->left_buf, FLUID_DEFAULT_ALIGNMENT);
+ 
+@@ -1090,6 +1120,7 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+             base_dst[dsp_i] += base_src[dsp_i];
+         }
+     }
++#endif
+ 
+     minbuf = dst->fx_buf_count;
+ 
+@@ -1098,6 +1129,27 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+         minbuf = src->fx_buf_count;
+     }
+ 
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++    base_src_left = fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_dst_left = fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_src_right = fluid_align_ptr(src->fx_right_buf, FLUID_DEFAULT_ALIGNMENT);
++    base_dst_right = fluid_align_ptr(dst->fx_right_buf, FLUID_DEFAULT_ALIGNMENT);
++
++    for(i = 0; i < minbuf; i++)
++    {
++        for(j = 0; j < scount; j+=4)
++        {
++            int dsp_i = i * FLUID_MIXER_MAX_BUFFERS_DEFAULT * FLUID_BUFSIZE + j;
++
++            float32x4_t vleft = vld1q_f32(&base_dst_left[dsp_i]);
++            float32x4_t vright = vld1q_f32(&base_dst_right[dsp_i]);
++            vleft = vaddq_f32(vleft, vld1q_f32(&base_src_left[dsp_i]));
++            vright = vaddq_f32(vright, vld1q_f32(&base_src_right[dsp_i]));
++            vst1q_f32(&base_dst_left[dsp_i], vleft);
++            vst1q_f32(&base_dst_right[dsp_i], vright);
++        }
++    }
++#else
+     base_src = fluid_align_ptr(src->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
+     base_dst = fluid_align_ptr(dst->fx_left_buf, FLUID_DEFAULT_ALIGNMENT);
+ 
+@@ -1125,6 +1177,7 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t *dst, fluid_mixer_buffers_t *src,
+             base_dst[dsp_i] += base_src[dsp_i];
+         }
+     }
++#endif
+ }
+ 
+ 
+-- 
+2.20.1
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
deleted file mode 100644
index 4df310275..000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Fluidsynth is a software synthesizer"
-HOMEPAGE = "http://www.fluidsynth.org/"
-SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
-
-DEPENDS = "alsa-lib ncurses glib-2.0"
-
-SRC_URI = " \
-    git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x \
-    file://0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
-"
-SRCREV = "f65c6ba25fb2c7e37c89fc6a4afc5aa645e208c2"
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig lib_package
-
-EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
-PACKAGECONFIG[sndfile] = "-Denable-libsndfile-support=ON,-Denable-libsndfile-support=OFF,libsndfile1"
-PACKAGECONFIG[jack] = "-Denable-jack-support=ON,-Denable-jack-support=OFF,jack"
-PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,-Denable-pulseaudio=OFF,pulseaudio"
-PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
new file mode 100644
index 000000000..4f600a218
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -0,0 +1,22 @@
+require ${BPN}.inc
+
+DEPENDS = "${BPN}-native alsa-lib ncurses glib-2.0"
+
+SRC_URI += " \
+    file://0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch \
+    file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch \
+    file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
+"
+
+EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
+
+do_configure_append() {
+    make_tables.exe ${B}/
+}
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
+PACKAGECONFIG[sndfile] = "-Denable-libsndfile=ON,-Denable-libsndfile=OFF,libsndfile1"
+PACKAGECONFIG[jack] = "-Denable-jack=ON,-Denable-jack=OFF,jack"
+PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,-Denable-pulseaudio=OFF,pulseaudio"
+PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
+PACKAGECONFIG[profiling] = "-Denable-profiling=ON,-Denable-profiling=OFF"
-- 
2.20.1


