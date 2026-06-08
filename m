Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D5BCD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 23:39:14 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68302.1780961946307571530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 16:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c8x3bav6;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1382533d428so1507683c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 16:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780961945; x=1781566745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jik7WdbsdOCY+39LJS8C+GHDwhNghPOlqffmXv2TKNs=;
        b=c8x3bav6xtLnSYJOCZhmhS55oN7gMQrCgaRd4PA9jZfW3OQ04tYHcO6y4Oz2B4qez3
         irNvWupCol7qPdh47DihNW/2dHnX8qkeI1ZrnaNNfEEMbqsidBP6cs0Qx7qxugAUh2+0
         htRzga0H6FTPXWOtwJ1Bp3mzah/Ld/Oduaanx7IBiJef+gwBq4ZoK0lkNPSfeBZwEjO8
         pnCjza7dqVHqDRDl4C7TwGbADDXo6iehcfejTgIUA+p8rWwuMW8O4XBiswQEXbIJLVUU
         waYLMhukKVisuSb/eC8phUTSHG3E9WUlxLFh4XLC6+2Hw0ETujt0b46+reskOcesGgbs
         VSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961945; x=1781566745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jik7WdbsdOCY+39LJS8C+GHDwhNghPOlqffmXv2TKNs=;
        b=O0QVw6BSfsrUzNlmXb8p70pKzDe5HcuEaeV8Iu8ltbQVUZ6ae56yP24WS7PGG/evNQ
         T0Q78ypxP9zvIHPj3uIAqTxZw2ke/o36q3lE9OxrQQGDQfl4sPl4tVoM4wilH6d65eWs
         nHZ+F3HmdwGzdpfUpURGiDKMmE+DrIBakAWSqu1Sp5p8BDp3D2tRAWM7+SMJIgkbIQKB
         H7zVOvKeDWx4FObZzWguSZKw8Q9mkT4kTnhk3Gk4eNhdPiSjnLabGHSdvkoDaYONUreF
         xOShyd8dU1jFDe2xrFGXH33fsp4Y3DtdpImmoedmfBt4CDcO+yQNw8edIGx3VxYFqW64
         qX5g==
X-Gm-Message-State: AOJu0YyUELdJRIvX6a749DGF6Pp9IwJn9dPMd2j35sHsMcYoTQBpGXxA
	RbUQP+tbCnPK9L7vZnR47kZBEvyIhI1QeE3ujP9nOVg8+oizUFioKhNXrAXgmHb7CXoxvA==
X-Gm-Gg: Acq92OH9ajdDXoNY7JcjENSDcSJYpLGtX9nPSCmh+Zj3UzSPLSOMwFvPdQpP4TtyXY0
	F+nEYayQvFutzsvVvYuFCdamWQ4q/hy7JJ9eTgtVZZuQPoc4b2qfajLWGyAJ2WbZ0Qh/u8uc2V+
	UgtJ4dSm78+HBSAIn2xV0pqiSiTA8oTUq6nt8FvQa2nWgPwhC7cxI7pg3tGylnkkY+XapvavIYG
	9ez8+IFW4Ld32GfrcEOqKfNpol3qDZwVR9zdt3mZImnLjOu/NYKRhsO/drwC1d8AOCN3TzEovtX
	UExb3zXeRIXjgU6og8paSFkMuuO2Jd5a5uQeSr2vaybguT7y60xOZL6zxJr+lIs+trq9mP9vOlT
	LloXLarXEoXCUYmaIluVmlgYq1Nolxgs0lWw4WQy1nYrw6SjlbwQf6lXgMItZANLiajS3wvWbQf
	F84b8VqbF0S2E5B1twgXjt0zepf2PgCMBkR0FiasaSlwT6/GMaiDqR89v6tQ8w6WDirlaNYZm0U
	Xa2UYUQW19kFIHNT4nSrMZg/2wNxA4DU0gRYQEtktmDv0Eq2WgzODe1GXw6tPgk+Cwp/npr9FK2
	zSdedjRZdq+DrDMbfGAmElvlJdogdlY9R8HtECjLujXCIjc1NFk=
X-Received: by 2002:a05:7300:5729:b0:304:e72a:d4d9 with SMTP id 5a478bee46e88-3077b17fceamr10100328eec.19.1780961945191;
        Mon, 08 Jun 2026 16:39:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm16941395eec.25.2026.06.08.16.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:39:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 3/3] webrtc-audio-processing: drop obsolete 0.3.1 recipe
Date: Mon,  8 Jun 2026 16:39:00 -0700
Message-ID: <20260608233900.2568363-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608233900.2568363-1-khem.raj@oss.qualcomm.com>
References: <20260608233900.2568363-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 23:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127428

The 0.3.x series is long superseded. We already ships the
maintained webrtc-audio-processing-1 (1.3) and webrtc-audio-processing-2
(2.1) recipes, and pipewire uses webrtc-audio-processing-2. Nothing
depends on the bare 0.3.1 recipe. Drop it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...upport-for-64-bit-and-big-endian-MIP.patch |  41 -------
 ...5-typedefs.h-add-support-for-PowerPC.patch |  28 -----
 ...lement-endianness-conversion-in-wav-.patch | 116 ------------------
 .../riscv_support.patch                       |  33 -----
 .../webrtc-audio-processing_0.3.1.bb          |  23 ----
 5 files changed, 241 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
deleted file mode 100644
index c96f10ed97..0000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0c332b7d94f8425c4f33344ddf406b6eea458861 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Mon, 8 May 2017 17:01:49 +0300
-Subject: [PATCH 4/6] typedefs.h: add support for 64-bit and big endian MIPS
-
-The 64-bit check is taken from the upstream webrtc project, the big
-endian check is my own addition.
-
-Upstream-Status: Pending
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- webrtc/typedefs.h | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/webrtc/typedefs.h b/webrtc/typedefs.h
-index d875490..d1b2f54 100644
---- a/webrtc/typedefs.h
-+++ b/webrtc/typedefs.h
-@@ -41,9 +41,18 @@
- //#define WEBRTC_ARCH_ARMEL
- #define WEBRTC_ARCH_32_BITS
- #define WEBRTC_ARCH_LITTLE_ENDIAN
--#elif defined(__MIPSEL__)
-+#elif defined(__MIPSEL__) || defined(__MIPSEB__)
-+#define WEBRTC_ARCH_MIPS_FAMILY
-+#if defined(__LP64__)
-+#define WEBRTC_ARCH_64_BITS
-+#else
- #define WEBRTC_ARCH_32_BITS
-+#endif
-+#if defined(__MIPSEL__)
- #define WEBRTC_ARCH_LITTLE_ENDIAN
-+#else
-+#define WEBRTC_ARCH_BIG_ENDIAN
-+#endif
- #elif defined(__pnacl__)
- #define WEBRTC_ARCH_32_BITS
- #define WEBRTC_ARCH_LITTLE_ENDIAN
---
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
deleted file mode 100644
index e16b57ecb5..0000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From db5f570e928c8ca5b0b8dc702e1af0a57277f092 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Mon, 3 Jul 2017 16:20:08 +0300
-Subject: [PATCH 5/6] typedefs.h: add support for PowerPC
-
-Upstream-Status: Pending
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- webrtc/typedefs.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/webrtc/typedefs.h b/webrtc/typedefs.h
-index d1b2f54..6e34d9e 100644
---- a/webrtc/typedefs.h
-+++ b/webrtc/typedefs.h
-@@ -53,6 +53,9 @@
- #else
- #define WEBRTC_ARCH_BIG_ENDIAN
- #endif
-+#elif defined(__powerpc__)
-+#define WEBRTC_ARCH_32_BITS
-+#define WEBRTC_ARCH_BIG_ENDIAN
- #elif defined(__pnacl__)
- #define WEBRTC_ARCH_32_BITS
- #define WEBRTC_ARCH_LITTLE_ENDIAN
---
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
deleted file mode 100644
index 5826ab00da..0000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 7d31da8ef93987000f297d435dbacaf7d436107b Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Thu, 15 Jun 2017 18:38:30 +0300
-Subject: [PATCH 6/6] common_audio: implement endianness conversion in wav file
- handling
-
-The code didn't build for big endian machines due to the missing
-endianness conversions.
-
-Upstream-Status: Pending
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- webrtc/common_audio/wav_file.cc   | 27 +++++++++++++++++++++------
- webrtc/common_audio/wav_header.cc | 32 +++++++++++++++++++++++++++++++-
- 2 files changed, 52 insertions(+), 7 deletions(-)
-
-diff --git a/webrtc/common_audio/wav_file.cc b/webrtc/common_audio/wav_file.cc
-index b14b620..e2f7738 100644
---- a/webrtc/common_audio/wav_file.cc
-+++ b/webrtc/common_audio/wav_file.cc
-@@ -64,9 +64,6 @@ WavReader::~WavReader() {
- }
-
- size_t WavReader::ReadSamples(size_t num_samples, int16_t* samples) {
--#ifndef WEBRTC_ARCH_LITTLE_ENDIAN
--#error "Need to convert samples to big-endian when reading from WAV file"
--#endif
-   // There could be metadata after the audio; ensure we don't read it.
-   num_samples = std::min(rtc::checked_cast<uint32_t>(num_samples),
-                          num_samples_remaining_);
-@@ -76,6 +73,13 @@ size_t WavReader::ReadSamples(size_t num_samples, int16_t* samples) {
-   RTC_CHECK(read == num_samples || feof(file_handle_));
-   RTC_CHECK_LE(read, num_samples_remaining_);
-   num_samples_remaining_ -= rtc::checked_cast<uint32_t>(read);
-+
-+#ifdef WEBRTC_ARCH_BIG_ENDIAN
-+  // Convert the read samples from little-endian to big-endian.
-+  for (size_t i = 0; i < read; i++)
-+    samples[i] = ((uint16_t) samples[i] >> 8) | ((uint16_t) samples[i] << 8);
-+#endif
-+
-   return read;
- }
-
-@@ -119,11 +123,22 @@ WavWriter::~WavWriter() {
- }
-
- void WavWriter::WriteSamples(const int16_t* samples, size_t num_samples) {
--#ifndef WEBRTC_ARCH_LITTLE_ENDIAN
--#error "Need to convert samples to little-endian when writing to WAV file"
--#endif
-+#ifdef WEBRTC_ARCH_BIG_ENDIAN
-+  // Convert the samples from big-endian samples to little-endian.
-+  int16_t* converted_samples = static_cast<int16_t*>(malloc(num_samples * sizeof(*samples)));
-+  RTC_CHECK(converted_samples) << "Out of memory.";
-+  for (int i = 0; i < num_samples; i++)
-+    converted_samples[i] =
-+        ((uint16_t) samples[i] >> 8) | ((uint16_t) samples[i] << 8);
-+
-+  const size_t written =
-+      fwrite(converted_samples, sizeof(*converted_samples), num_samples,
-+             file_handle_);
-+  free(converted_samples);
-+#else
-   const size_t written =
-       fwrite(samples, sizeof(*samples), num_samples, file_handle_);
-+#endif
-   RTC_CHECK_EQ(num_samples, written);
-   num_samples_ += static_cast<uint32_t>(written);
-   RTC_CHECK(written <= std::numeric_limits<uint32_t>::max() ||
-diff --git a/webrtc/common_audio/wav_header.cc b/webrtc/common_audio/wav_header.cc
-index 61cfffe..382bfc7 100644
---- a/webrtc/common_audio/wav_header.cc
-+++ b/webrtc/common_audio/wav_header.cc
-@@ -129,7 +129,37 @@ static inline std::string ReadFourCC(uint32_t x) {
-   return std::string(reinterpret_cast<char*>(&x), 4);
- }
- #else
--#error "Write be-to-le conversion functions"
-+static inline void WriteLE16(uint16_t* f, uint16_t x) {
-+  *f = x >> 8 | x << 8;
-+}
-+static inline void WriteLE32(uint32_t* f, uint32_t x) {
-+  *f = x >> 24
-+      | (x && 0xFF0000) >> 8
-+      | (x && 0xFF00) << 8
-+      | x << 24;
-+}
-+static inline void WriteFourCC(uint32_t* f, char a, char b, char c, char d) {
-+  *f = static_cast<uint32_t>(d)
-+      | static_cast<uint32_t>(c) << 8
-+      | static_cast<uint32_t>(b) << 16
-+      | static_cast<uint32_t>(a) << 24;
-+}
-+
-+static inline uint32_t ReadLE16(uint16_t x) {
-+  return x >> 8 | x << 8;
-+}
-+
-+static inline uint32_t ReadLE32(uint32_t x) {
-+  return x >> 24
-+      | (x && 0xFF0000) >> 8
-+      | (x && 0xFF00) << 8
-+      | x << 24;
-+}
-+
-+static inline std::string ReadFourCC(uint32_t x) {
-+  x = ReadLE32(x);
-+  return std::string(reinterpret_cast<char*>(&x), 4);
-+}
- #endif
-
- static inline uint32_t RiffChunkSize(uint32_t bytes_in_payload) {
---
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch
deleted file mode 100644
index 576b9860a8..0000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Add support for RISC-V
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/webrtc/base/basictypes.h
-+++ b/webrtc/base/basictypes.h
-@@ -29,6 +29,10 @@
- #define CPU_ARM 1
- #endif
-
-+#if defined(__riscv) || defined(_M_RISCV)
-+#define CPU_RISCV 1
-+#endif
-+
- #if defined(CPU_X86) && defined(CPU_ARM)
- #error CPU_X86 and CPU_ARM both defined.
- #endif
---- a/webrtc/typedefs.h
-+++ b/webrtc/typedefs.h
-@@ -56,6 +56,13 @@
- #elif defined(__powerpc__)
- #define WEBRTC_ARCH_32_BITS
- #define WEBRTC_ARCH_BIG_ENDIAN
-+#elif defined(__riscv)
-+#if __riscv_xlen == 64
-+# define WEBRTC_ARCH_64_BITS
-+#else
-+# define WEBRTC_ARCH_32_BITS
-+#endif
-+#define WEBRTC_ARCH_LITTLE_ENDIAN
- #elif defined(__pnacl__)
- #define WEBRTC_ARCH_32_BITS
- #define WEBRTC_ARCH_LITTLE_ENDIAN
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb
deleted file mode 100644
index 6e56c4409c..0000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Audio processing bits of the WebRTC reference implementation"
-HOMEPAGE = "https://www.freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
-SECTION = "audio"
-
-DEPENDS:append:libc-musl = " libexecinfo"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2 \
-                    file://webrtc/common.h;beginline=1;endline=9;md5=41f7322d91deabaf0acbbd0b8d0bc548 \
-"
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/${BP}.tar.xz \
-           file://0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch \
-           file://0005-typedefs.h-add-support-for-PowerPC.patch \
-           file://0006-common_audio-implement-endianness-conversion-in-wav-.patch \
-           file://riscv_support.patch \
-"
-
-SRC_URI[md5sum] = "6e10724ca34bcbc715a4c208273acb0c"
-SRC_URI[sha256sum] = "a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf"
-
-LDFLAGS:append:libc-musl = " -lexecinfo"
-inherit autotools pkgconfig

