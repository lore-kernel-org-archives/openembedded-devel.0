Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D95F71CA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:06:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so45137319wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JqSt/34srtIK0KSVaCJjCz8xeRVhw0rDpgkwC1ZqrxE=;
	b=grt/u61rfBqx2O5aRlJshom9N6GTkOzpK6ofJ4CUOp15uS9ePjyhuTcSV29/2erej/
	4mAS0XiwJ+f6o3u94iB001QzspnBEthOPedqBeYtC4hmX1tJEDYD7NpduZc1tl5eQIuy
	Uok0w8m1CJOk6yEHV3LfWEwXmz8ohXLbkItFvR05E3GiMOFAgy0EjYyuB4MGBGJ95O4C
	m7FzUqAQSJzzdQFvG+TCQ84z2uQSd94pS1QRHpx0g7JUBX1qwRG00Jb98BUam7mAv8J5
	0W7+Wd+nP59SYaEIINHVMApq4Qj4QBd9oBVCvRwm/N0py6yujVVzg3AgvJsqZag0/0iC
	Hvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JqSt/34srtIK0KSVaCJjCz8xeRVhw0rDpgkwC1ZqrxE=;
	b=RLmwAVKn6PpjqGfOBlcFed81jJQQwOl03rDqSkhewDTY2tpIsMHo+2FJOJbyZjGbmm
	J/AMmCwM//gPusfN+ych9x5fvEgjMbvJRH/B9lIno7/dwU5y2V/P3GociT/CTBdkCbzv
	4yh0ah55J94Lz+Ou4SsvsuRaNFvcobH4avHpRJqAbeZOn77Xr2aoEegBoSaKyX3XHuQI
	o0T7Gs/kJKDwFa+f+oicyc1A+FrUiHbi+mOF0ZCuEIluj28CToIfvNkk21L7WeUSHl0V
	iSNAhFupiqejoe/wnax+/qqsQ7/mMy1zZBnRF96fJe5qS304WtUcERNB3a7oOSiVw1ks
	Yu3A==
X-Gm-Message-State: AIkVDXIH8fW977r39KSI4QYRwVgN9ZbD99XYBoxOTOwx3a7xVJvpdUihok/1H8KFZkvHWg==
X-Received: by 10.223.166.80 with SMTP id k74mr34494236wrc.171.1485374778825; 
	Wed, 25 Jan 2017 12:06:18 -0800 (PST)
Received: from localhost.localdomain (p579F7110.dip0.t-ipconnect.de.
	[87.159.113.16]) by smtp.googlemail.com with ESMTPSA id
	q12sm16146948wmd.8.2017.01.25.12.06.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 12:06:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 21:06:02 +0100
Message-Id: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] jack: add ARM NEON support for sample conversions
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

Add a test application checking accurracy and performance win of accelerated
code.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...N-acceleration-for-all-non-dithering-samp.patch | 496 +++++++++++++++++++++
 ...sts-add-application-checking-accurracy-an.patch | 433 ++++++++++++++++++
 meta-oe/recipes-multimedia/jack/jack_git.bb        |   6 +-
 3 files changed, 934 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch
new file mode 100644
index 0000000..76ec713
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch
@@ -0,0 +1,496 @@
+From 99785aabc685a94415fcd445345c093488e10350 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 13 Jan 2017 22:42:11 +0100
+Subject: [PATCH 1/2] Add ARM-NEON acceleration for all non-dithering sample
+ conversion functions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/jackaudio/jack2/pull/250
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ common/memops.c | 356 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 351 insertions(+), 5 deletions(-)
+
+diff --git a/common/memops.c b/common/memops.c
+index 2ff0792..8f9ece2 100644
+--- a/common/memops.c
++++ b/common/memops.c
+@@ -42,6 +42,10 @@
+ #endif
+ #endif
+ 
++#ifdef __ARM_NEON__
++#include <arm_neon.h>
++#endif
++
+ /* Notes about these *_SCALING values.
+ 
+    the MAX_<N>BIT values are floating point. when multiplied by
+@@ -193,6 +197,35 @@ static inline __m128i float_24_sse(__m128 s)
+ }
+ #endif
+ 
++
++#ifdef __ARM_NEON__
++
++static inline float32x4_t clip(float32x4_t s, float32x4_t min, float32x4_t max)
++{
++	return vminq_f32(max, vmaxq_f32(s, min));
++}
++
++static inline int32x4_t float_24_neon(float32x4_t s)
++{
++	const float32x4_t upper_bound = vdupq_n_f32(NORMALIZED_FLOAT_MAX);
++	const float32x4_t lower_bound = vdupq_n_f32(NORMALIZED_FLOAT_MIN);
++
++	float32x4_t clipped = clip(s, lower_bound, upper_bound);
++	float32x4_t scaled = vmulq_f32(clipped, vdupq_n_f32(SAMPLE_24BIT_SCALING));
++	return vcvtq_s32_f32(scaled);
++}
++
++static inline int16x4_t float_16_neon(float32x4_t s)
++{
++	const float32x4_t upper_bound = vdupq_n_f32(NORMALIZED_FLOAT_MAX);
++	const float32x4_t lower_bound = vdupq_n_f32(NORMALIZED_FLOAT_MIN);
++
++	float32x4_t clipped = clip(s, lower_bound, upper_bound);
++	float32x4_t scaled = vmulq_f32(clipped, vdupq_n_f32(SAMPLE_16BIT_SCALING));
++	return vmovn_s32(vcvtq_s32_f32(scaled));
++}
++#endif
++
+ /* Linear Congruential noise generator. From the music-dsp list
+  * less random than rand(), but good enough and 10x faster 
+  */
+@@ -248,6 +281,32 @@ void sample_move_dS_floatLE (char *dst, jack_default_audio_sample_t *src, unsign
+ 
+ void sample_move_d32u24_sSs (char *dst, jack_default_audio_sample_t *src, unsigned long nsamples, unsigned long dst_skip, dither_state_t *state)
+ {
++#ifdef __ARM_NEON__
++	unsigned long unrolled = nsamples / 4;
++	nsamples = nsamples & 3;
++
++	while (unrolled--) {
++		float32x4_t samples = vld1q_f32(src);
++		int32x4_t converted = float_24_neon(samples);
++		int32x4_t shifted = vshlq_n_s32(converted, 8);
++		shifted = vreinterpretq_s32_u8(vrev32q_u8(vreinterpretq_u8_s32(shifted)));
++
++		switch(dst_skip) {
++			case 4:
++				vst1q_s32((int32_t*)dst, shifted);
++				break;
++			default:
++				vst1q_lane_s32((int32_t*)(dst),            shifted, 0);
++				vst1q_lane_s32((int32_t*)(dst+dst_skip),   shifted, 1);
++				vst1q_lane_s32((int32_t*)(dst+2*dst_skip), shifted, 2);
++                vst1q_lane_s32((int32_t*)(dst+3*dst_skip), shifted, 3);
++				break;
++		}
++		dst += 4*dst_skip;
++		src+= 4;
++	}
++#endif
++
+ 	int32_t z;
+ 
+ 	while (nsamples--) {
+@@ -321,7 +380,33 @@ void sample_move_d32u24_sS (char *dst, jack_default_audio_sample_t *src, unsigne
+ 		src++;
+ 	}
+ 
+-#else
++#elif defined(__ARM_NEON__)
++	unsigned long unrolled = nsamples / 4;
++	nsamples = nsamples & 3;
++
++	while (unrolled--) {
++		float32x4_t samples = vld1q_f32(src);
++		int32x4_t converted = float_24_neon(samples);
++		int32x4_t shifted = vshlq_n_s32(converted, 8);
++
++		switch(dst_skip) {
++			case 4:
++				vst1q_s32((int32_t*)dst, shifted);
++				break;
++			default:
++				vst1q_lane_s32((int32_t*)(dst),            shifted, 0);
++				vst1q_lane_s32((int32_t*)(dst+dst_skip),   shifted, 1);
++				vst1q_lane_s32((int32_t*)(dst+2*dst_skip), shifted, 2);
++                vst1q_lane_s32((int32_t*)(dst+3*dst_skip), shifted, 3);
++				break;
++		}
++		dst += 4*dst_skip;
++
++		src+= 4;
++	}
++#endif
++
++#if !defined (__SSE2__)
+ 	while (nsamples--) {
+ 		float_24u32 (*src, *((int32_t*) dst));
+ 		dst += dst_skip;
+@@ -332,6 +417,38 @@ void sample_move_d32u24_sS (char *dst, jack_default_audio_sample_t *src, unsigne
+ 
+ void sample_move_dS_s32u24s (jack_default_audio_sample_t *dst, char *src, unsigned long nsamples, unsigned long src_skip)
+ {
++#ifdef __ARM_NEON__
++	float32x4_t factor = vdupq_n_f32(1.0 / SAMPLE_24BIT_SCALING);
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++		int32x4_t src128;
++		switch(src_skip)
++		{
++			case 4:
++				src128 = vld1q_s32((int32_t*)src);
++				break;
++			case 8:
++				src128 = vld2q_s32((int32_t*)src).val[0];
++				break;
++			default:
++				src128 = vld1q_lane_s32((int32_t*)src,              src128, 0);
++				src128 = vld1q_lane_s32((int32_t*)(src+src_skip),   src128, 1);
++				src128 = vld1q_lane_s32((int32_t*)(src+2*src_skip), src128, 2);
++				src128 = vld1q_lane_s32((int32_t*)(src+3*src_skip), src128, 3);
++				break;
++		}
++		src128 = vreinterpretq_s32_u8(vrev32q_u8(vreinterpretq_u8_s32(src128)));
++		int32x4_t shifted = vshrq_n_s32(src128, 8);
++		float32x4_t as_float = vcvtq_f32_s32(shifted);
++		float32x4_t divided = vmulq_f32(as_float, factor);
++		vst1q_f32(dst, divided);
++
++		src += 4*src_skip;
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
++#endif
++
+ 	/* ALERT: signed sign-extension portability !!! */
+ 
+ 	const jack_default_audio_sample_t scaling = 1.0/SAMPLE_24BIT_SCALING;
+@@ -389,6 +506,34 @@ void sample_move_dS_s32u24 (jack_default_audio_sample_t *dst, char *src, unsigne
+ 		dst += 4;
+ 	}
+ 	nsamples = nsamples & 3;
++#elif defined(__ARM_NEON__)
++	unsigned long unrolled = nsamples / 4;
++	float32x4_t factor = vdupq_n_f32(1.0 / SAMPLE_24BIT_SCALING);
++	while (unrolled--) {
++		int32x4_t src128;
++		switch(src_skip) {
++			case 4:
++				src128 = vld1q_s32((int32_t*)src);
++				break;
++			case 8:
++				src128 = vld2q_s32((int32_t*)src).val[0];
++				break;
++			default:
++				src128 = vld1q_lane_s32((int32_t*)src,              src128, 0);
++				src128 = vld1q_lane_s32((int32_t*)(src+src_skip),   src128, 1);
++				src128 = vld1q_lane_s32((int32_t*)(src+2*src_skip), src128, 2);
++				src128 = vld1q_lane_s32((int32_t*)(src+3*src_skip), src128, 3);
++				break;
++		}
++		int32x4_t shifted = vshrq_n_s32(src128, 8);
++		float32x4_t as_float = vcvtq_f32_s32(shifted);
++		float32x4_t divided = vmulq_f32(as_float, factor);
++		vst1q_f32(dst, divided);
++
++		src += 4*src_skip;
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
+ #endif
+ 
+ 	/* ALERT: signed sign-extension portability !!! */
+@@ -403,6 +548,24 @@ void sample_move_dS_s32u24 (jack_default_audio_sample_t *dst, char *src, unsigne
+ 
+ void sample_move_d24_sSs (char *dst, jack_default_audio_sample_t *src, unsigned long nsamples, unsigned long dst_skip, dither_state_t *state)
+ {
++#ifdef __ARM_NEON__
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++		int32_t z[4];
++		float32x4_t samples = vld1q_f32(src);
++		int32x4_t converted = float_24_neon(samples);
++		converted = vreinterpretq_s32_u8(vrev32q_u8(vreinterpretq_u8_s32(converted)));
++		vst1q_s32(z, converted);
++
++		for (int i = 0; i != 4; ++i) {
++			memcpy (dst, ((char*)(z+i))+1, 3);
++			dst += dst_skip;
++		}
++		src += 4;
++	}
++	nsamples = nsamples & 3;
++#endif
++
+ 	int32_t z;
+ 
+ 	while (nsamples--) {
+@@ -426,7 +589,6 @@ void sample_move_d24_sS (char *dst, jack_default_audio_sample_t *src, unsigned l
+ #if defined (__SSE2__) && !defined (__sun__)
+ 	_MM_SET_ROUNDING_MODE(_MM_ROUND_NEAREST);
+ 	while (nsamples >= 4) {
+-		int i;
+ 		int32_t z[4];
+ 		__m128 samples = _mm_loadu_ps(src);
+ 		__m128i converted = float_24_sse(samples);
+@@ -447,7 +609,7 @@ void sample_move_d24_sS (char *dst, jack_default_audio_sample_t *src, unsigned l
+ 		_mm_store_ss((float*)z+3, (__m128)shuffled3);
+ #endif
+ 
+-		for (i = 0; i != 4; ++i) {
++		for (int i = 0; i != 4; ++i) {
+ 			memcpy (dst, z+i, 3);
+ 			dst += dst_skip;
+ 		}
+@@ -455,6 +617,22 @@ void sample_move_d24_sS (char *dst, jack_default_audio_sample_t *src, unsigned l
+ 		nsamples -= 4;
+ 		src += 4;
+ 	}
++#elif defined(__ARM_NEON__)
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++		int i;
++		int32_t z[4];
++		float32x4_t samples = vld1q_f32(src);
++		int32x4_t converted = float_24_neon(samples);
++		vst1q_s32(z, converted);
++
++		for (i = 0; i != 4; ++i) {
++			memcpy (dst, z+i, 3);
++			dst += dst_skip;
++		}
++		src += 4;
++	}
++	nsamples = nsamples & 3;
+ #endif
+ 
+     int32_t z;
+@@ -473,9 +651,41 @@ void sample_move_d24_sS (char *dst, jack_default_audio_sample_t *src, unsigned l
+ 
+ void sample_move_dS_s24s (jack_default_audio_sample_t *dst, char *src, unsigned long nsamples, unsigned long src_skip)
+ {
++	const jack_default_audio_sample_t scaling = 1.0/SAMPLE_24BIT_SCALING;
++
++#ifdef __ARM_NEON__
++	// we shift 8 to the right by dividing by 256.0 -> no sign extra handling
++	const float32x4_t vscaling = vdupq_n_f32(scaling/256.0);
++	int32_t x[4];
++	memset(x, 0, sizeof(x));
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++#if __BYTE_ORDER == __BIG_ENDIAN	 /* ARM big endian?? */
++		// right aligned / inverse sequence below -> *256
++		memcpy(((char*)&x[0])+1, src, 3);
++		memcpy(((char*)&x[1])+1, src+src_skip, 3);
++		memcpy(((char*)&x[2])+1, src+2*src_skip, 3);
++		memcpy(((char*)&x[3])+1, src+3*src_skip, 3);
++#else
++		memcpy(&x[0], src, 3);
++		memcpy(&x[1], src+src_skip, 3);
++		memcpy(&x[2], src+2*src_skip, 3);
++		memcpy(&x[3], src+3*src_skip, 3);
++#endif
++		src += 4 * src_skip;
++
++		int32x4_t source = vld1q_s32(x);
++		source = vreinterpretq_s32_u8(vrev32q_u8(vreinterpretq_u8_s32(source)));
++		float32x4_t converted = vcvtq_f32_s32(source);
++		float32x4_t scaled = vmulq_f32(converted, vscaling);
++		vst1q_f32(dst, scaled);
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
++#endif
++
+ 	/* ALERT: signed sign-extension portability !!! */
+ 
+-	const jack_default_audio_sample_t scaling = 1.0/SAMPLE_24BIT_SCALING;
+ 	while (nsamples--) {
+ 		int x;
+ #if __BYTE_ORDER == __LITTLE_ENDIAN
+@@ -528,6 +738,34 @@ void sample_move_dS_s24 (jack_default_audio_sample_t *dst, char *src, unsigned l
+ 		dst += 4;
+ 		nsamples -= 4;
+ 	}
++#elif defined(__ARM_NEON__)
++	// we shift 8 to the right by dividing by 256.0 -> no sign extra handling
++	const float32x4_t vscaling = vdupq_n_f32(scaling/256.0);
++	int32_t x[4];
++	memset(x, 0, sizeof(x));
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++#if __BYTE_ORDER == __BIG_ENDIAN	/* ARM big endian?? */
++		// left aligned -> *256
++		memcpy(&x[0], src, 3);
++		memcpy(&x[1], src+src_skip, 3);
++		memcpy(&x[2], src+2*src_skip, 3);
++		memcpy(&x[3], src+3*src_skip, 3);
++#else
++		memcpy(((char*)&x[0])+1, src, 3);
++		memcpy(((char*)&x[1])+1, src+src_skip, 3);
++		memcpy(((char*)&x[2])+1, src+2*src_skip, 3);
++		memcpy(((char*)&x[3])+1, src+3*src_skip, 3);
++#endif
++		src += 4 * src_skip;
++
++		int32x4_t source = vld1q_s32(x);
++		float32x4_t converted = vcvtq_f32_s32(source);
++		float32x4_t scaled = vmulq_f32(converted, vscaling);
++		vst1q_f32(dst, scaled);
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
+ #endif
+ 
+ 	while (nsamples--) {
+@@ -547,6 +785,30 @@ void sample_move_dS_s24 (jack_default_audio_sample_t *dst, char *src, unsigned l
+ 
+ void sample_move_d16_sSs (char *dst,  jack_default_audio_sample_t *src, unsigned long nsamples, unsigned long dst_skip, dither_state_t *state)	
+ {
++#ifdef __ARM_NEON__
++	unsigned long unrolled = nsamples / 4;
++	nsamples = nsamples & 3;
++
++	while (unrolled--) {
++		float32x4_t samples = vld1q_f32(src);
++		int16x4_t converted = float_16_neon(samples);
++		converted = vreinterpret_s16_u8(vrev16_u8(vreinterpret_u8_s16(converted)));
++
++		switch(dst_skip) {
++			case 2:
++				vst1_s16((int16_t*)dst, converted);
++				break;
++			default:
++				vst1_lane_s16((int16_t*)(dst),            converted, 0);
++				vst1_lane_s16((int16_t*)(dst+dst_skip),   converted, 1);
++				vst1_lane_s16((int16_t*)(dst+2*dst_skip), converted, 2);
++				vst1_lane_s16((int16_t*)(dst+3*dst_skip), converted, 3);
++				break;
++		}
++		dst += 4*dst_skip;
++		src+= 4;
++	}
++#endif
+ 	int16_t tmp;
+ 
+ 	while (nsamples--) {
+@@ -574,6 +836,29 @@ void sample_move_d16_sSs (char *dst,  jack_default_audio_sample_t *src, unsigned
+ 
+ void sample_move_d16_sS (char *dst,  jack_default_audio_sample_t *src, unsigned long nsamples, unsigned long dst_skip, dither_state_t *state)	
+ {
++#ifdef __ARM_NEON__
++	unsigned long unrolled = nsamples / 4;
++	nsamples = nsamples & 3;
++
++	while (unrolled--) {
++		float32x4_t samples = vld1q_f32(src);
++		int16x4_t converted = float_16_neon(samples);
++
++		switch(dst_skip) {
++			case 2:
++				vst1_s16((int16_t*)dst, converted);
++				break;
++			default:
++				vst1_lane_s16((int16_t*)(dst),            converted, 0);
++				vst1_lane_s16((int16_t*)(dst+dst_skip),   converted, 1);
++				vst1_lane_s16((int16_t*)(dst+2*dst_skip), converted, 2);
++				vst1_lane_s16((int16_t*)(dst+3*dst_skip), converted, 3);
++				break;
++		}
++		dst += 4*dst_skip;
++		src+= 4;
++	}
++#endif
+ 	while (nsamples--) {
+ 		float_16 (*src, *((int16_t*) dst));
+ 		dst += dst_skip;
+@@ -728,8 +1013,39 @@ void sample_move_dither_shaped_d16_sS (char *dst,  jack_default_audio_sample_t *
+ 
+ void sample_move_dS_s16s (jack_default_audio_sample_t *dst, char *src, unsigned long nsamples, unsigned long src_skip) 	
+ {
+-	short z;
+ 	const jack_default_audio_sample_t scaling = 1.0/SAMPLE_16BIT_SCALING;
++#ifdef __ARM_NEON__
++	const float32x4_t vscaling = vdupq_n_f32(scaling);
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++		int16x4_t source16x4;
++		switch(src_skip) {
++			case 2:
++				source16x4 = vld1_s16((int16_t*)src);
++				break;
++			case 4:
++				source16x4 = vld2_s16((int16_t*)src).val[0];
++				break;
++			default:
++				source16x4 = vld1_lane_s16((int16_t*)src,              source16x4, 0);
++				source16x4 = vld1_lane_s16((int16_t*)(src+src_skip),   source16x4, 1);
++				source16x4 = vld1_lane_s16((int16_t*)(src+2*src_skip), source16x4, 2);
++				source16x4 = vld1_lane_s16((int16_t*)(src+3*src_skip), source16x4, 3);
++				break;
++		}
++		source16x4 = vreinterpret_s16_u8(vrev16_u8(vreinterpret_u8_s16(source16x4)));
++		int32x4_t source32x4 = vmovl_s16(source16x4);
++		src += 4 * src_skip;
++
++		float32x4_t converted = vcvtq_f32_s32(source32x4);
++		float32x4_t scaled = vmulq_f32(converted, vscaling);
++		vst1q_f32(dst, scaled);
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
++#endif
++
++	short z;
+ 
+ 	/* ALERT: signed sign-extension portability !!! */
+ 	while (nsamples--) {
+@@ -752,6 +1068,36 @@ void sample_move_dS_s16 (jack_default_audio_sample_t *dst, char *src, unsigned l
+ {
+ 	/* ALERT: signed sign-extension portability !!! */
+ 	const jack_default_audio_sample_t scaling = 1.0/SAMPLE_16BIT_SCALING;
++#ifdef __ARM_NEON__
++	const float32x4_t vscaling = vdupq_n_f32(scaling);
++	unsigned long unrolled = nsamples / 4;
++	while (unrolled--) {
++		int16x4_t source16x4;
++		switch(src_skip) {
++			case 2:
++				source16x4 = vld1_s16((int16_t*)src);
++				break;
++			case 4:
++				source16x4 = vld2_s16((int16_t*)src).val[0];
++				break;
++			default:
++				source16x4 = vld1_lane_s16((int16_t*)src,              source16x4, 0);
++				source16x4 = vld1_lane_s16((int16_t*)(src+src_skip),   source16x4, 1);
++				source16x4 = vld1_lane_s16((int16_t*)(src+2*src_skip), source16x4, 2);
++				source16x4 = vld1_lane_s16((int16_t*)(src+3*src_skip), source16x4, 3);
++				break;
++		}
++		int32x4_t source32x4 = vmovl_s16(source16x4);
++		src += 4 * src_skip;
++
++		float32x4_t converted = vcvtq_f32_s32(source32x4);
++		float32x4_t scaled = vmulq_f32(converted, vscaling);
++		vst1q_f32(dst, scaled);
++		dst += 4;
++	}
++	nsamples = nsamples & 3;
++#endif
++
+ 	while (nsamples--) {
+ 		*dst = (*((short *) src)) * scaling;
+ 		dst++;
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch b/meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch
new file mode 100644
index 0000000..e0c9e8c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch
@@ -0,0 +1,433 @@
+From d0543c0628d2c0a6d898c694003e941fa189b393 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 15 Jan 2017 20:52:20 +0100
+Subject: [PATCH 2/2] jack_simdtests: add application checking accurracy and
+ performance of SIMD optimizations
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/jackaudio/jack2/pull/250
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ example-clients/simdtests.cpp | 390 ++++++++++++++++++++++++++++++++++++++++++
+ example-clients/wscript       |   3 +-
+ 2 files changed, 392 insertions(+), 1 deletion(-)
+ create mode 100644 example-clients/simdtests.cpp
+
+diff --git a/example-clients/simdtests.cpp b/example-clients/simdtests.cpp
+new file mode 100644
+index 0000000..b74d50a
+--- /dev/null
++++ b/example-clients/simdtests.cpp
+@@ -0,0 +1,390 @@
++/*
++ *  simdtests.c -- test accuraccy and performance of simd optimizations
++ *
++ *  Copyright (C) 2017 Andreas Mueller.
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2 of the License, or
++ *  (at your option) any later version.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with this program; if not, write to the Free Software
++ *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++/* We must include all headers memops.c includes to avoid trouble with
++ * out namespace game below.
++ */
++#include <stdio.h>
++#include <string.h>
++#include <math.h>
++#include <memory.h>
++#include <stdlib.h>
++#include <stdint.h>
++#include <limits.h>
++#ifdef __linux__
++#include <endian.h>
++#endif
++#include "memops.h"
++
++#if defined (__SSE2__) && !defined (__sun__)
++#include <emmintrin.h>
++#ifdef __SSE4_1__
++#include <smmintrin.h>
++#endif
++#endif
++
++#ifdef __ARM_NEON__
++#include <arm_neon.h>
++#endif
++
++// our additional headers
++#include <time.h>
++
++/* Dirty: include mempos.c twice the second time with SIMD disabled
++ * so we can compare aceelerated non accelerated
++ */
++namespace accelerated {
++#include "../common/memops.c"
++}
++
++namespace origerated {
++#ifdef __SSE2__
++#undef __SSE2__
++#endif
++
++#ifdef __ARM_NEON__
++#undef __ARM_NEON__
++#endif
++
++#include "../common/memops.c"
++}
++
++// define conversion function types
++typedef void (*t_jack_to_integer)(
++	char *dst,
++	jack_default_audio_sample_t *src,
++	unsigned long nsamples,
++	unsigned long dst_skip,
++	dither_state_t *state);
++
++typedef void (*t_integer_to_jack)(
++	jack_default_audio_sample_t *dst,
++	char *src,
++	unsigned long nsamples,
++	unsigned long src_skip);
++
++// define/setup test case data
++typedef struct test_case_data {
++	uint32_t frame_size;
++	uint32_t sample_size;
++	bool reverse;
++	t_jack_to_integer jack_to_integer_accel;
++	t_jack_to_integer jack_to_integer_orig;
++	t_integer_to_jack integer_to_jack_accel;
++	t_integer_to_jack integer_to_jack_orig;
++	dither_state_t *ditherstate;
++	const char *name;
++} test_case_data_t;
++
++test_case_data_t test_cases[] = {
++	{
++		4,
++		3,
++		true,
++		accelerated::sample_move_d32u24_sSs,
++		origerated::sample_move_d32u24_sSs,
++		accelerated::sample_move_dS_s32u24s,
++		origerated::sample_move_dS_s32u24s,
++		NULL,
++		"32u24s" },
++	{
++		4,
++		3,
++		false,
++		accelerated::sample_move_d32u24_sS,
++		origerated::sample_move_d32u24_sS,
++		accelerated::sample_move_dS_s32u24,
++		origerated::sample_move_dS_s32u24,
++		NULL,
++		"32u24" },
++	{
++		3,
++		3,
++		true,
++		accelerated::sample_move_d24_sSs,
++		origerated::sample_move_d24_sSs,
++		accelerated::sample_move_dS_s24s,
++		origerated::sample_move_dS_s24s,
++		NULL,
++		"24s" },
++	{
++		3,
++		3,
++		false,
++		accelerated::sample_move_d24_sS,
++		origerated::sample_move_d24_sS,
++		accelerated::sample_move_dS_s24,
++		origerated::sample_move_dS_s24,
++		NULL,
++		"24" },
++	{
++		2,
++		2,
++		true,
++		accelerated::sample_move_d16_sSs,
++		origerated::sample_move_d16_sSs,
++		accelerated::sample_move_dS_s16s,
++		origerated::sample_move_dS_s16s,
++		NULL,
++		"16s" },
++	{
++		2,
++		2,
++		false,
++		accelerated::sample_move_d16_sS,
++		origerated::sample_move_d16_sS,
++		accelerated::sample_move_dS_s16,
++		origerated::sample_move_dS_s16,
++		NULL,
++		"16" },
++};
++
++// we need to repeat for better accuracy at time measurement
++const uint32_t retry_per_case = 1000;
++
++// setup test buffers
++#define TESTBUFF_SIZE 1024
++jack_default_audio_sample_t jackbuffer_source[TESTBUFF_SIZE];
++// integer buffers: max 4 bytes per value / * 2 for stereo
++char integerbuffer_accel[TESTBUFF_SIZE*4*2];
++char integerbuffer_orig[TESTBUFF_SIZE*4*2];
++// float buffers
++jack_default_audio_sample_t jackfloatbuffer_accel[TESTBUFF_SIZE];
++jack_default_audio_sample_t jackfloatbuffer_orig[TESTBUFF_SIZE];
++
++// comparing unsigned makes life easier
++uint32_t extract_integer(
++	char* buff,
++	uint32_t offset,
++	uint32_t frame_size,
++	uint32_t sample_size,
++	bool big_endian)
++{
++	uint32_t retval = 0;
++	unsigned char* curr;
++	uint32_t mult = 1;
++	if(big_endian) {
++		curr = (unsigned char*)buff + offset + sample_size-1;
++		for(uint32_t i=0; i<sample_size; i++) {
++			retval += *(curr--) * mult;
++			mult*=256;
++		}
++	}
++	else {
++		curr = (unsigned char*)buff + offset + frame_size-sample_size;
++		for(uint32_t i=0; i<sample_size; i++) {
++			retval += *(curr++) * mult;
++			mult*=256;
++		}
++	}
++	return retval;
++}
++
++int main(int argc, char *argv[])
++{
++//	parse_arguments(argc, argv);
++	uint32_t maxerr_displayed = 10;
++
++	// fill jackbuffer
++	for(int i=0; i<TESTBUFF_SIZE; i++) {
++		// ramp
++		jack_default_audio_sample_t value =
++			((jack_default_audio_sample_t)((i % TESTBUFF_SIZE) - TESTBUFF_SIZE/2)) / (TESTBUFF_SIZE/2);
++		// force clipping
++		value *= 1.02;
++		jackbuffer_source[i] = value;
++	}
++
++	for(uint32_t testcase=0; testcase<sizeof(test_cases)/sizeof(test_case_data_t); testcase++) {
++		// test mono/stereo
++		for(uint32_t channels=1; channels<=2; channels++) {
++			//////////////////////////////////////////////////////////////////////////////
++			// jackfloat -> integer
++
++			// clean target buffers
++			memset(integerbuffer_accel, 0, sizeof(integerbuffer_accel));
++			memset(integerbuffer_orig, 0, sizeof(integerbuffer_orig));
++			// accel
++			clock_t time_to_integer_accel = clock();
++			for(uint32_t repetition=0; repetition<retry_per_case; repetition++)
++			{
++				test_cases[testcase].jack_to_integer_accel(
++					integerbuffer_accel,
++					jackbuffer_source,
++					TESTBUFF_SIZE,
++					test_cases[testcase].frame_size*channels,
++					test_cases[testcase].ditherstate);
++			}
++			float timediff_to_integer_accel = ((float)(clock() - time_to_integer_accel)) / CLOCKS_PER_SEC;
++			// orig
++			clock_t time_to_integer_orig = clock();
++			for(uint32_t repetition=0; repetition<retry_per_case; repetition++)
++			{
++				test_cases[testcase].jack_to_integer_orig(
++					integerbuffer_orig,
++					jackbuffer_source,
++					TESTBUFF_SIZE,
++					test_cases[testcase].frame_size*channels,
++					test_cases[testcase].ditherstate);
++			}
++			float timediff_to_integer_orig = ((float)(clock() - time_to_integer_orig)) / CLOCKS_PER_SEC;
++			// output performance results
++			printf(
++				"JackFloat->Integer @%7.7s/%u: Orig %7.6f sec / Accel %7.6f sec -> Win: %5.2f %%\n",
++				test_cases[testcase].name,
++				channels,
++				timediff_to_integer_orig,
++				timediff_to_integer_accel,
++				(timediff_to_integer_orig/timediff_to_integer_accel-1)*100.0);
++			uint32_t int_deviation_max = 0;
++			uint32_t int_error_count = 0;
++			// output error (avoid spam -> limit error lines per test case)
++			for(uint32_t sample=0; sample<TESTBUFF_SIZE; sample++) {
++				uint32_t sample_offset = sample*test_cases[testcase].frame_size*channels;
++				// compare both results
++				uint32_t intval_accel=extract_integer(
++					integerbuffer_accel,
++					sample_offset,
++					test_cases[testcase].frame_size,
++					test_cases[testcase].sample_size,
++#if __BYTE_ORDER == __BIG_ENDIAN
++					!test_cases[testcase].reverse);
++#else
++					test_cases[testcase].reverse);
++#endif
++				uint32_t intval_orig=extract_integer(
++					integerbuffer_orig,
++					sample_offset,
++					test_cases[testcase].frame_size,
++					test_cases[testcase].sample_size,
++#if __BYTE_ORDER == __BIG_ENDIAN
++					!test_cases[testcase].reverse);
++#else
++					test_cases[testcase].reverse);
++#endif
++				if(intval_accel != intval_orig) {
++					if(int_error_count<maxerr_displayed) {
++						printf("Value error sample %u:", sample);
++						printf(" Orig 0x");
++						char formatstr[10];
++						sprintf(formatstr, "%%0%uX", test_cases[testcase].sample_size*2);
++						printf(formatstr, intval_orig);
++						printf(" Accel 0x");
++						printf(formatstr, intval_accel);
++						printf("\n");
++					}
++					int_error_count++;
++					uint32_t int_deviation;
++					if(intval_accel > intval_orig)
++						int_deviation = intval_accel-intval_orig;
++					else
++						int_deviation = intval_orig-intval_accel;
++					if(int_deviation > int_deviation_max)
++						int_deviation_max = int_deviation;
++				}
++			}
++			printf(
++				"JackFloat->Integer @%7.7s/%u: Errors: %u Max deviation %u\n",
++				test_cases[testcase].name,
++				channels,
++				int_error_count,
++				int_deviation_max);
++
++			//////////////////////////////////////////////////////////////////////////////
++			// integer -> jackfloat
++
++			// clean target buffers
++			memset(jackfloatbuffer_accel, 0, sizeof(jackfloatbuffer_accel));
++			memset(jackfloatbuffer_orig, 0, sizeof(jackfloatbuffer_orig));
++			// accel
++			clock_t time_to_float_accel = clock();
++			for(uint32_t repetition=0; repetition<retry_per_case; repetition++)
++			{
++				test_cases[testcase].integer_to_jack_accel(
++					jackfloatbuffer_accel,
++					integerbuffer_orig,
++					TESTBUFF_SIZE,
++					test_cases[testcase].frame_size*channels);
++			}
++			float timediff_to_float_accel = ((float)(clock() - time_to_float_accel)) / CLOCKS_PER_SEC;
++			// orig
++			clock_t time_to_float_orig = clock();
++			for(uint32_t repetition=0; repetition<retry_per_case; repetition++)
++			{
++				test_cases[testcase].integer_to_jack_orig(
++					jackfloatbuffer_orig,
++					integerbuffer_orig,
++					TESTBUFF_SIZE,
++					test_cases[testcase].frame_size*channels);
++			}
++			float timediff_to_float_orig = ((float)(clock() - time_to_float_orig)) / CLOCKS_PER_SEC;
++			// output performance results
++			printf(
++				"Integer->JackFloat @%7.7s/%u: Orig %7.6f sec / Accel %7.6f sec -> Win: %5.2f %%\n",
++				test_cases[testcase].name,
++				channels,
++				timediff_to_float_orig,
++				timediff_to_float_accel,
++				(timediff_to_float_orig/timediff_to_float_accel-1)*100.0);
++			jack_default_audio_sample_t float_deviation_max = 0.0;
++			uint32_t float_error_count = 0;
++			// output error (avoid spam -> limit error lines per test case)
++			for(uint32_t sample=0; sample<TESTBUFF_SIZE; sample++) {
++				// For easier estimation/readabilty we scale floats back to integer
++				jack_default_audio_sample_t sample_scaling;
++				switch(test_cases[testcase].sample_size) {
++					case 2:
++						sample_scaling = SAMPLE_16BIT_SCALING;
++						break;
++					default:
++						sample_scaling = SAMPLE_24BIT_SCALING;
++						break;
++				}
++				jack_default_audio_sample_t floatval_accel = jackfloatbuffer_accel[sample] * sample_scaling;
++				jack_default_audio_sample_t floatval_orig = jackfloatbuffer_orig[sample] * sample_scaling;
++				// compare both results
++				jack_default_audio_sample_t float_deviation;
++				if(floatval_accel > floatval_orig)
++					float_deviation = floatval_accel-floatval_orig;
++				else
++					float_deviation = floatval_orig-floatval_accel;
++				if(float_deviation > float_deviation_max)
++					float_deviation_max = float_deviation;
++				// deviation > half bit => error
++				if(float_deviation > 0.5) {
++					if(float_error_count<maxerr_displayed) {
++						printf("Value error sample %u:", sample);
++						printf(" Orig %8.1f Accel %8.1f\n", floatval_orig, floatval_accel);
++					}
++					float_error_count++;
++				}
++			}
++			printf(
++				"Integer->JackFloat @%7.7s/%u: Errors: %u Max deviation %f\n",
++				test_cases[testcase].name,
++				channels,
++				float_error_count,
++				float_deviation_max);
++
++			printf("\n");
++		}
++	}
++	return 0;
++}
+diff --git a/example-clients/wscript b/example-clients/wscript
+index ba67614..1b2f674 100644
+--- a/example-clients/wscript
++++ b/example-clients/wscript
+@@ -28,7 +28,8 @@ example_programs = {
+     'jack_net_master' : 'netmaster.c',
+     'jack_latent_client' : 'latent_client.c',
+     'jack_midi_dump' : 'midi_dump.c',
+-    'jack_midi_latency_test' : 'midi_latency_test.c'
++    'jack_midi_latency_test' : 'midi_latency_test.c',
++    'jack_simdtests' : 'simdtests.cpp'
+     }
+ 
+ example_libs = {
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 89fd638..be5f7bb 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,7 +14,11 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = " \
+    git://github.com/jackaudio/jack2.git \
+    file://0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch \
+    file://0002-jack_simdtests-add-application-checking-accurracy-an.patch \
+"
 SRCREV = "0279a2d65a36d1378f5bab56d95bf9e99cc8cefb"
 PV = "1.9.10+git${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.5.5


