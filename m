Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 37CBD71D42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:06:19 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kq3so4040256wjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8zt67hrwEV7aiHY8HIYy44F+oLoBgrTyeM+ATkw2zMo=;
	b=D98ZIssg7MrqFnJX+LhLwYGOPMzlo/Txtu54xTxdxsd60onaqHGL+H/Q9oEEDtXxrn
	Yyx5pIyzdrTROMZMZhzs0xq+hRWU+Nwo8WG2PksTP887wCKNY5kqccl1a+AibF5g8YNt
	c3vg5chlc8CfNChXriTb4FjT/gRdJGAwmzCSByHZVUSTyn7/OQh755e8MykPoR+0GRzY
	TcRS41hINJ5YqtyE08RVR5noq78u6o+FWIWsw06PY1ZxCxGvwahRvHL1cmTdlvYredkt
	yp1Nq3dPpMkSUdGPYOVhqWTkVg7h8oqFU15ojqy3Pvnc5swI6nZM1r0420NTbUWQuJcm
	D3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8zt67hrwEV7aiHY8HIYy44F+oLoBgrTyeM+ATkw2zMo=;
	b=CdmpKDlfymBb9uxfHx5jqV3mak7D4DoZ7o1Q7tANwWmt068A4uUyWDRFEOWIBhjJEe
	E/EVN/Fwnfgb1UCuls2zs1ZygafbcfUHX9V6cYEbk3kbNZq3I0EwwQMB98zu1NGOkdbB
	xYHExd5cIZE815FS0iGA+1l9j+VFilU80a4cgAcik1ASfSJ7EnWqYBHWbDQNs8glQOsK
	9OWjKzQIIopMcpTtxEknONRaNH1UxDpGp2Fp+QKFCdLebmk3Ia013kpeHhyEnZo9BZiF
	iikhINbTaiDGe4wpn1PrdlnusI5RtfsSE5XHeFKROHcTA0AzhfqmcbcnfcqxejGRhGo1
	8PBA==
X-Gm-Message-State: AIkVDXKyWj/mj3+QwMgXe46CoB7xNAPko10gvHFPacFD+Qzc6UQwO0meTTxPSgu5yD2Xxg==
X-Received: by 10.223.166.106 with SMTP id k97mr36017755wrc.170.1485374779656; 
	Wed, 25 Jan 2017 12:06:19 -0800 (PST)
Received: from localhost.localdomain (p579F7110.dip0.t-ipconnect.de.
	[87.159.113.16]) by smtp.googlemail.com with ESMTPSA id
	q12sm16146948wmd.8.2017.01.25.12.06.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 12:06:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 21:06:03 +0100
Message-Id: <1485374763-7114-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
References: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fluidsynth: add ARM NEON support for sample interpolation
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
X-List-Received-Date: Wed, 25 Jan 2017 20:06:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e_dsp_interpolate_4th_order-make-use-of-A.patch | 158 +++++++++++++++++++++
 .../fluidsynth/fluidsynth_1.1.6.bb                 |   5 +-
 2 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch
new file mode 100644
index 0000000..855f641
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch
@@ -0,0 +1,158 @@
+From 6cf151bd571ab6288ab0bfa7bc4c854bef012183 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 23 Jan 2017 19:32:06 +0100
+Subject: [PATCH] fluid_rvoice_dsp_interpolate_4th_order: make use of ARM NEON
+ intriniscs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/rvoice/fluid_rvoice_dsp.c | 87 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 86 insertions(+), 1 deletion(-)
+
+diff --git a/src/rvoice/fluid_rvoice_dsp.c b/src/rvoice/fluid_rvoice_dsp.c
+index df7da50..ca4a807 100644
+--- a/src/rvoice/fluid_rvoice_dsp.c
++++ b/src/rvoice/fluid_rvoice_dsp.c
+@@ -22,6 +22,9 @@
+ #include "fluid_phase.h"
+ #include "fluid_rvoice.h"
+ #include "fluid_sys.h"
++#ifdef __ARM_NEON__
++#include <arm_neon.h>
++#endif
+ 
+ /* Purpose:
+  *
+@@ -279,13 +282,19 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+   fluid_phase_t dsp_phase_incr;
+   short int *dsp_data = voice->sample->data;
+   fluid_real_t *dsp_buf = voice->dsp_buf;
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++  float32x4_t dsp_amp = vdupq_n_f32(voice->amp);
++  float32x4_t dsp_amp_incr = vdupq_n_f32(voice->amp_incr);
++  float32x4_t coeffs;
++#else
+   fluid_real_t dsp_amp = voice->amp;
+   fluid_real_t dsp_amp_incr = voice->amp_incr;
++  fluid_real_t *coeffs;
++#endif
+   unsigned int dsp_i = 0;
+   unsigned int dsp_phase_index;
+   unsigned int start_index, end_index;
+   short int start_point, end_point1, end_point2;
+-  fluid_real_t *coeffs;
+   int looping;
+ 
+   /* Convert playback "speed" floating point value to phase index/fract */
+@@ -327,11 +336,22 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+     /* interpolate first sample point (start or loop start) if needed */
+     for ( ; dsp_phase_index == start_index && dsp_i < FLUID_BUFSIZE; dsp_i++)
+     {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++      coeffs = vld1q_f32(interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)]);
++      int16x4_t vdsp_data_i16 = vld1_s16(&dsp_data[dsp_phase_index-1]);
++      vdsp_data_i16 = vld1_lane_s16(&start_point, vdsp_data_i16, 0);
++      float32x4_t vdsp_data = vcvtq_f32_s32(vmovl_s16(vdsp_data_i16));
++      vdsp_data *= coeffs;
++      vdsp_data *= dsp_amp;
++      float32x2_t sum2 = vadd_f32(vget_high_f32(vdsp_data), vget_low_f32(vdsp_data));
++      dsp_buf[dsp_i] = vget_lane_f32(vpadd_f32(sum2, sum2), 0);
++#else
+       coeffs = interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)];
+       dsp_buf[dsp_i] = dsp_amp * (coeffs[0] * start_point
+ 				  + coeffs[1] * dsp_data[dsp_phase_index]
+ 				  + coeffs[2] * dsp_data[dsp_phase_index+1]
+ 				  + coeffs[3] * dsp_data[dsp_phase_index+2]);
++#endif
+ 
+       /* increment phase and amplitude */
+       fluid_phase_incr (dsp_phase, dsp_phase_incr);
+@@ -342,11 +362,21 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+     /* interpolate the sequence of sample points */
+     for ( ; dsp_i < FLUID_BUFSIZE && dsp_phase_index <= end_index; dsp_i++)
+     {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++      coeffs = vld1q_f32(interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)]);
++      int16x4_t vdsp_data_i16 = vld1_s16(&dsp_data[dsp_phase_index-1]);
++      float32x4_t vdsp_data = vcvtq_f32_s32(vmovl_s16(vdsp_data_i16));
++      vdsp_data *= coeffs;
++      vdsp_data *= dsp_amp;
++      float32x2_t sum2 = vadd_f32(vget_high_f32(vdsp_data), vget_low_f32(vdsp_data));
++      dsp_buf[dsp_i] = vget_lane_f32(vpadd_f32(sum2, sum2), 0);
++#else
+       coeffs = interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)];
+       dsp_buf[dsp_i] = dsp_amp * (coeffs[0] * dsp_data[dsp_phase_index-1]
+ 				  + coeffs[1] * dsp_data[dsp_phase_index]
+ 				  + coeffs[2] * dsp_data[dsp_phase_index+1]
+ 				  + coeffs[3] * dsp_data[dsp_phase_index+2]);
++#endif
+ 
+       /* increment phase and amplitude */
+       fluid_phase_incr (dsp_phase, dsp_phase_incr);
+@@ -362,11 +392,22 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+     /* interpolate within 2nd to last point */
+     for (; dsp_phase_index <= end_index && dsp_i < FLUID_BUFSIZE; dsp_i++)
+     {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++      coeffs = vld1q_f32(interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)]);
++      int16x4_t vdsp_data_i16 = vld1_s16(&dsp_data[dsp_phase_index-1]);
++      vdsp_data_i16 = vld1_lane_s16(&end_point1, vdsp_data_i16, 3);
++      float32x4_t vdsp_data = vcvtq_f32_s32(vmovl_s16(vdsp_data_i16));
++      vdsp_data *= coeffs;
++      vdsp_data *= dsp_amp;
++      float32x2_t sum2 = vadd_f32(vget_high_f32(vdsp_data), vget_low_f32(vdsp_data));
++      dsp_buf[dsp_i] = vget_lane_f32(vpadd_f32(sum2, sum2), 0);
++#else
+       coeffs = interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)];
+       dsp_buf[dsp_i] = dsp_amp * (coeffs[0] * dsp_data[dsp_phase_index-1]
+ 				  + coeffs[1] * dsp_data[dsp_phase_index]
+ 				  + coeffs[2] * dsp_data[dsp_phase_index+1]
+ 				  + coeffs[3] * end_point1);
++#endif
+ 
+       /* increment phase and amplitude */
+       fluid_phase_incr (dsp_phase, dsp_phase_incr);
+@@ -379,11 +420,23 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+     /* interpolate within the last point */
+     for (; dsp_phase_index <= end_index && dsp_i < FLUID_BUFSIZE; dsp_i++)
+     {
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++      coeffs = vld1q_f32(interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)]);
++      int16x4_t vdsp_data_i16 = vld1_s16(&dsp_data[dsp_phase_index-1]);
++      vdsp_data_i16 = vld1_lane_s16(&end_point1, vdsp_data_i16, 2);
++      vdsp_data_i16 = vld1_lane_s16(&end_point2, vdsp_data_i16, 3);
++      float32x4_t vdsp_data = vcvtq_f32_s32(vmovl_s16(vdsp_data_i16));
++      vdsp_data *= coeffs;
++      vdsp_data *= dsp_amp;
++      float32x2_t sum2 = vadd_f32(vget_high_f32(vdsp_data), vget_low_f32(vdsp_data));
++      dsp_buf[dsp_i] = vget_lane_f32(vpadd_f32(sum2, sum2), 0);
++#else
+       coeffs = interp_coeff[fluid_phase_fract_to_tablerow (dsp_phase)];
+       dsp_buf[dsp_i] = dsp_amp * (coeffs[0] * dsp_data[dsp_phase_index-1]
+ 				  + coeffs[1] * dsp_data[dsp_phase_index]
+ 				  + coeffs[2] * end_point1
+ 				  + coeffs[3] * end_point2);
++#endif
+ 
+       /* increment phase and amplitude */
+       fluid_phase_incr (dsp_phase, dsp_phase_incr);
+@@ -413,7 +466,11 @@ fluid_rvoice_dsp_interpolate_4th_order (fluid_rvoice_dsp_t *voice)
+   }
+ 
+   voice->phase = dsp_phase;
++#if defined(__ARM_NEON__) && defined(WITH_FLOAT)
++  vst1q_lane_f32(&voice->amp, dsp_amp, 0);
++#else
+   voice->amp = dsp_amp;
++#endif
+ 
+   return (dsp_i);
+ }
+-- 
+2.5.5
+
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 54e8697..313ffb0 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz \
+    file://0001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch \
+"
 SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
 SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
 
-- 
2.5.5


