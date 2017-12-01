Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA66786AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y21so9656847wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q3YftjF0F/CA+Gzit0XKPfHr+cFmdv9+A4UvEOFtYNs=;
	b=en57CD4dRTy7mZN05fhxGK80gnakcuF4MyDskyR220FDtPDl0tBIE4073YaBIaOwmP
	isUGp0C3eDcLUCpavSMybzr9EAgjjuuYK7lDtE7bd04j4aes0SObtZFV+cvM0VBI+rtS
	hzLJeSd/SkXFLrWCPiuopzESI/e7WVCxH8bacLwDdOWFq2iMg/rzO/fICF/KBbYbegzQ
	z29VV2JrZUJbafRMIBLNn75r2VrAoDQT76CjJulJumTho3q+uZNdCtOTlwt7e8vzC34n
	kwMktR/HDdA082l3/bJzlNDEz/M/fvJGAz/2JFay/L3udE7cTmLs5tYfWm/7JKxRZWBM
	q0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q3YftjF0F/CA+Gzit0XKPfHr+cFmdv9+A4UvEOFtYNs=;
	b=o8r+ly0H2v89wH7Z4VvPfkihhQnRbrt7PVBmfnpd2WO/n/GKrgbDTlTcYGsLV2hZ0o
	gkCDeAjMmasOY/PfgrTJhhPchjk4BNYFktBuBRClwKjfrX9/GGMRfLv9gTvNAiXin4pW
	ida+GtTC5vUnAQQVoJkbaum5OxNk9J7aP+sNoMnUpzJxDh286FSIW1hPJo9hWcSyaFmd
	eIQttDe9U4rAaLbTNg+8DgNRD3AM3H3+XLM48RG3SusKASYxpb4j/+lMLEFy+FysxyFg
	hS9EbMjWMIXgLx+M7ZFWYNmLlmoNBoeRCGHGMmqIb5PDiA8tXryTSo/nTrg1ai+ADAS9
	6S4Q==
X-Gm-Message-State: AJaThX6nr3Q2r04fML6fcmJebWCY9WpH1NP8LMGQOFTIsybbKpPEqWhb
	H65U3HgmRU1TsQi9BGIFrXED5A==
X-Google-Smtp-Source: AGs4zMb8ylRwzM4zuefwOTHCfylm0D2wHaFs4/X/NYiTlYxUbhFHN0dAw74g3/Wirx6+1aHnT+cyUg==
X-Received: by 10.223.139.3 with SMTP id n3mr4843282wra.166.1512126509724;
	Fri, 01 Dec 2017 03:08:29 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:10 +0100
Message-Id: <20171201110816.13519-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] fluidsynth: performance improvements
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Use floats instead of double for sound calculations. This improves
  performance notable and was default for version 1.1.6 using autotools.
* Fix buffer overrun when using floats
* Make use of ARM NEON for multithreading enabled

Performance and sound correctnes was tested with qtractor and a reworked
version of fluidsynth-dssi [1-2]. Tests were performed for single- and
multithreading enabled.

[1] https://github.com/schnitzeltony/fluidsynth-dssi/commit/bad09c6f5c5508c5f5330aa5188510f975e50c50
[2] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-misc/recipes-multimedia/fluidsynth/fluidsynth-dssi_1.0.0.bb

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...uffer-overrun-in-fluid_synth_nwrite_float.patch | 32 +++++++++
 ...N-accelaration-for-float-multithreaded-se.patch | 76 ++++++++++++++++++++++
 .../fluidsynth/fluidsynth_1.1.8.bb                 |  8 ++-
 3 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
new file mode 100644
index 0000000..dda76cf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
@@ -0,0 +1,32 @@
+From a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f Mon Sep 17 00:00:00 2001
+From: derselbst <tom.mbrt@googlemail.com>
+Date: Sun, 26 Nov 2017 22:12:12 +0100
+Subject: [PATCH 1/2] avoid buffer overrun in fluid_synth_nwrite_float()
+
+Upstream-Status: Backport [1]
+
+[1] https://github.com/FluidSynth/fluidsynth/commit/a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f
+---
+ src/synth/fluid_synth.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
+index 266d759..14f6b21 100644
+--- a/src/synth/fluid_synth.c
++++ b/src/synth/fluid_synth.c
+@@ -2752,10 +2752,10 @@ fluid_synth_nwrite_float(fluid_synth_t* synth, int len,
+     {
+ #ifdef WITH_FLOAT
+       if(fx_left != NULL)
+-        FLUID_MEMCPY(fx_left[i + count], fx_left_in[i], bytes);
++        FLUID_MEMCPY(fx_left[i] + count, fx_left_in[i], bytes);
+       
+       if(fx_right != NULL)
+-        FLUID_MEMCPY(fx_right[i + count], fx_right_in[i], bytes);
++        FLUID_MEMCPY(fx_right[i] + count, fx_right_in[i], bytes);
+ #else //WITH_FLOAT
+       int j;
+       if(fx_left != NULL) {
+-- 
+2.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
new file mode 100644
index 0000000..0e1846e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
@@ -0,0 +1,76 @@
+From 2de7e128fbdf528716b500cf27ed9a4358c931c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 24 Nov 2017 00:05:35 +0100
+Subject: [PATCH 2/2] Use ARM-NEON accelaration for float-multithreaded setups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/rvoice/fluid_rvoice_mixer.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/src/rvoice/fluid_rvoice_mixer.c b/src/rvoice/fluid_rvoice_mixer.c
+index 9616518..dbf8057 100644
+--- a/src/rvoice/fluid_rvoice_mixer.c
++++ b/src/rvoice/fluid_rvoice_mixer.c
+@@ -27,6 +27,10 @@
+ #include "fluid_ladspa.h"
+ #include "fluid_synth.h"
+ 
++#if defined(__ARM_NEON__)
++#include "arm_neon.h"
++#endif
++
+ 
+ #define ENABLE_MIXER_THREADS 1
+ 
+@@ -794,20 +798,42 @@ fluid_mixer_buffers_mix(fluid_mixer_buffers_t* dest, fluid_mixer_buffers_t* src)
+   if (minbuf > src->buf_count)
+     minbuf = src->buf_count;
+   for (i=0; i < minbuf; i++) {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++    for (j=0; j < scount; j+=4) {
++        float32x4_t vleft = vld1q_f32(&dest->left_buf[i][j]);
++        float32x4_t vright = vld1q_f32(&dest->right_buf[i][j]);
++        vleft = vaddq_f32(vleft, vld1q_f32(&src->left_buf[i][j]));
++        vright = vaddq_f32(vright, vld1q_f32(&src->right_buf[i][j]));
++        vst1q_f32(&dest->left_buf[i][j], vleft);
++        vst1q_f32(&dest->right_buf[i][j], vright);
++    }
++#else
+     for (j=0; j < scount; j++) {
+       dest->left_buf[i][j] += src->left_buf[i][j];
+       dest->right_buf[i][j] += src->right_buf[i][j];
+     }
++#endif
+   }
+ 
+   minbuf = dest->fx_buf_count;
+   if (minbuf > src->fx_buf_count)
+     minbuf = src->fx_buf_count;
+   for (i=0; i < minbuf; i++) {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++    for (j=0; j < scount; j+=4) {
++        float32x4_t vleft = vld1q_f32(&dest->fx_left_buf[i][j]);
++        float32x4_t vright = vld1q_f32(&dest->fx_right_buf[i][j]);
++        vleft = vaddq_f32(vleft, vld1q_f32(&src->fx_left_buf[i][j]));
++        vright = vaddq_f32(vright, vld1q_f32(&src->fx_right_buf[i][j]));
++        vst1q_f32(&dest->fx_left_buf[i][j], vleft);
++        vst1q_f32(&dest->fx_right_buf[i][j], vright);
++    }
++#else
+     for (j=0; j < scount; j++) {
+       dest->fx_left_buf[i][j] += src->fx_left_buf[i][j];
+       dest->fx_right_buf[i][j] += src->fx_right_buf[i][j];
+     }
++#endif
+   }
+ }
+ 
+-- 
+2.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
index ef4c606..406bbf7 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
@@ -6,13 +6,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x"
+SRC_URI = " \
+    git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x \
+    file://0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch \
+    file://0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
+"
 SRCREV = "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig lib_package
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
+EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
 PACKAGECONFIG[sndfile] = "-Denable-libsndfile-support=ON,-Denable-libsndfile-support=OFF,libsndfile1"
-- 
2.9.5


