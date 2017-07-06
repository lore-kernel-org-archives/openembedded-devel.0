Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 532 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Jul 2017 12:16:11 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA4171C75
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 12:16:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0D4C120914
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:07:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Thu, 06 Jul 2017 08:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TIzNsv
	Yuw/BWOCZC2eIrNO+htGZiMrZHjCfsfAAS+y0=; b=OVWdOtwl+9T2sfc82qG3Uj
	40ECwsjZlsK7ylzPpVPnTHtEuubNXyDlO3WW85jBnwI1gOLYlPBy/SsLDf4m7rK7
	rsBl2rUhd7YA2M4iWoFf8fxRKtTppCjRdJj8NmagIVBY/o0TnWf54OTiVka5TveC
	k3En4aFJ3xuadfwLBMiLsSL+IxLjY47V2ujq85cH+8lG88QiqmmiZYuUdO0AkiNu
	WUgGtRnfnblP0FrX+CszsJEGCr0f7paokmos7exP0EWWyXfHCX0DGxCpRZfcrsZR
	NEb37LD2SMQY8IU5LLCSe7UGdPFv//fdACZ3/oqSJ2MFTOSex3WT3Z1kuYhfN9qQ
	==
X-ME-Sender: <xms:9ydeWVgSiqeHVU5TE3gKffwN_HCqIf3x4tU3fW0WlS8yFedzbubtyg>
X-Sasl-enc: o6x2orFtjO+5I1Al0VrXXbQTOnkcyEMpqEoC1Sq+90NO 1499342839
Received: from localhost.localdomain (unknown [192.40.95.37])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5A6F22474F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:07:19 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jul 2017 15:07:13 +0300
Message-Id: <20170706120713.4275-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
Subject: [meta-multimedia][PATCH] webrtc-audio-processing: initial recipe
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
X-List-Received-Date: Thu, 06 Jul 2017 12:16:12 -0000

PulseAudio has multiple alternative echo canceller implementations.
Probably the best one is the "webrtc" echo canceller, which depends on
this library.

I added some patches to fix building on MIPS and PowerPC. The first
three patches are taken from upstream, the other three patches are my
own. I have only tested that the code builds on all architectures, not
that the code actually works.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...ild-Protect-against-unsupported-CPU-types.patch |  29 ++++++
 .../0002-build-Add-ARM-64bit-support.patch         |  30 ++++++
 .../0003-build-fix-architecture-detection.patch    |  96 +++++++++++++++++
 ...add-support-for-64-bit-and-big-endian-MIP.patch |  41 ++++++++
 .../0005-typedefs.h-add-support-for-PowerPC.patch  |  28 +++++
 ...o-implement-endianness-conversion-in-wav-.patch | 116 +++++++++++++++++++++
 .../webrtc-audio-processing_0.3.bb                 |  25 +++++
 7 files changed, 365 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
new file mode 100644
index 000000000..7668df35d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
@@ -0,0 +1,29 @@
+From 4945dca11bc4ddec60bd858f45212dc8f39638e0 Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Tue, 5 Jul 2016 18:07:45 -0400
+Subject: [PATCH 1/6] build: Protect against unsupported CPU types
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+Upstream-Status: Accepted [expected in 0.4]
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6f9553b..f5304b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,8 +70,9 @@ AS_CASE(["${host_cpu}"],
+         [
+          HAVE_ARM=1
+          ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
+-        ]
++        ],
+     # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
++    [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
+ )
+ AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
+ AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
new file mode 100644
index 000000000..2e202b03c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
@@ -0,0 +1,30 @@
+From b5bda3431159b6505dcd069641c863018c4d4309 Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Wed, 6 Jul 2016 15:18:15 -0400
+Subject: [PATCH 2/6] build: Add ARM 64bit support
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+Upstream-Status: Accepted [expected in 0.4]
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index f5304b8..be20514 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,6 +71,11 @@ AS_CASE(["${host_cpu}"],
+          HAVE_ARM=1
+          ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
+         ],
++    [aarch64*],
++        [
++         HAVE_NEON=1
++         ARCH_CFLAGS="-DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"
++        ],
+     # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
+     [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
+ )
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
new file mode 100644
index 000000000..82e270fac
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
@@ -0,0 +1,96 @@
+From 7722fb8a3189fea0f6381f02a0e4f63c847f0393 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 6 Aug 2016 11:02:43 +0200
+Subject: [PATCH 3/6] build: fix architecture detection
+
+The current architecture detection, based on the "host_cpu" part of the
+tuple does not work properly for a number of reason:
+
+ - The code assumes that if host_cpu starts with "arm" then ARM
+   instructions are available, which is incorrect. Indeed, Cortex-M
+   platforms can run Linux, they are ARM platforms (so host_cpu = arm),
+   but they don't support ARM instructions: they support only the
+   Thumb-2 instruction set.
+
+ - The armv7 case is also not very useful, as it is not standard at all
+   to pass armv7 as host_cpu even if the host system is actually ARMv7
+   based.
+
+ - For the same reason, the armv8 case is not very useful: ARMv8 is
+   AArch64, and there is already a separate case to handle this
+   architecture.
+
+So, this commit moves away from a host_cpu based logic, and instead
+tests using AC_CHECK_DECLS() the built-in definitions of the compiler:
+
+ - If we have __ARM_ARCH_ISA_ARM defined, then it's an ARM processor
+   that supports the ARM instruction set (this allows to exclude Thumb-2
+   only processors).
+
+ - If we have __ARM_ARCH_7A__, then we have an ARMv7-A processor, and
+   we can enable the corresponding optimizations
+
+ - Same for __aarch64__, __i386__ and __x86_64__.
+
+In addition, we remove the AC_MSG_ERROR() that makes the build fail for
+all architectures but the ones that are explicitly supported. Indeed,
+webrtc-audio-processing builds just fine for other architectures (tested
+on MIPS), it's just that none of the architecture-specific optimizations
+will be used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+Upstream-Status: Accepted [expected in 0.4]
+---
+ configure.ac | 35 +++++++++++------------------------
+ 1 file changed, 11 insertions(+), 24 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index be20514..e898014 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,30 +55,17 @@ AS_CASE(["${host}"],
+ )
+ AC_SUBST(PLATFORM_CFLAGS)
+ 
+-AS_CASE(["${host_cpu}"],
+-    [i?86|x86_64],
+-        [
+-         HAVE_X86=1
+-        ],
+-    [armv7*|armv8*],
+-        [
+-         HAVE_ARM=1
+-         HAVE_ARMV7=1
+-         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7"
+-        ],
+-    [arm*],
+-        [
+-         HAVE_ARM=1
+-         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
+-        ],
+-    [aarch64*],
+-        [
+-         HAVE_NEON=1
+-         ARCH_CFLAGS="-DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"
+-        ],
+-    # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
+-    [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
+-)
++# Testing __ARM_ARCH_ISA_ARM since the code contains ARM instructions,
++# which don't work on Thumb-2 only platforms (ARMv7-M).
++AC_CHECK_DECLS([__ARM_ARCH_ISA_ARM],
++	[HAVE_ARM=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM"])
++AC_CHECK_DECLS([__ARM_ARCH_7A__],
++	[HAVE_ARMV7=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM_V7"])
++AC_CHECK_DECLS([__aarch64__],
++	[HAVE_NEON=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"])
++AC_CHECK_DECLS([__i386__], [HAVE_X86=1])
++AC_CHECK_DECLS([__x86_64__], [HAVE_X86=1])
++
+ AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
+ AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
+ AM_CONDITIONAL(HAVE_ARMV7, [test "x${HAVE_ARMV7}" = "x1"])
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
new file mode 100644
index 000000000..c96f10ed9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch
@@ -0,0 +1,41 @@
+From 0c332b7d94f8425c4f33344ddf406b6eea458861 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Mon, 8 May 2017 17:01:49 +0300
+Subject: [PATCH 4/6] typedefs.h: add support for 64-bit and big endian MIPS
+
+The 64-bit check is taken from the upstream webrtc project, the big
+endian check is my own addition.
+
+Upstream-Status: Pending
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ webrtc/typedefs.h | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/webrtc/typedefs.h b/webrtc/typedefs.h
+index d875490..d1b2f54 100644
+--- a/webrtc/typedefs.h
++++ b/webrtc/typedefs.h
+@@ -41,9 +41,18 @@
+ //#define WEBRTC_ARCH_ARMEL
+ #define WEBRTC_ARCH_32_BITS
+ #define WEBRTC_ARCH_LITTLE_ENDIAN
+-#elif defined(__MIPSEL__)
++#elif defined(__MIPSEL__) || defined(__MIPSEB__)
++#define WEBRTC_ARCH_MIPS_FAMILY
++#if defined(__LP64__)
++#define WEBRTC_ARCH_64_BITS
++#else
+ #define WEBRTC_ARCH_32_BITS
++#endif
++#if defined(__MIPSEL__)
+ #define WEBRTC_ARCH_LITTLE_ENDIAN
++#else
++#define WEBRTC_ARCH_BIG_ENDIAN
++#endif
+ #elif defined(__pnacl__)
+ #define WEBRTC_ARCH_32_BITS
+ #define WEBRTC_ARCH_LITTLE_ENDIAN
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
new file mode 100644
index 000000000..e16b57ecb
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0005-typedefs.h-add-support-for-PowerPC.patch
@@ -0,0 +1,28 @@
+From db5f570e928c8ca5b0b8dc702e1af0a57277f092 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Mon, 3 Jul 2017 16:20:08 +0300
+Subject: [PATCH 5/6] typedefs.h: add support for PowerPC
+
+Upstream-Status: Pending
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ webrtc/typedefs.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/webrtc/typedefs.h b/webrtc/typedefs.h
+index d1b2f54..6e34d9e 100644
+--- a/webrtc/typedefs.h
++++ b/webrtc/typedefs.h
+@@ -53,6 +53,9 @@
+ #else
+ #define WEBRTC_ARCH_BIG_ENDIAN
+ #endif
++#elif defined(__powerpc__)
++#define WEBRTC_ARCH_32_BITS
++#define WEBRTC_ARCH_BIG_ENDIAN
+ #elif defined(__pnacl__)
+ #define WEBRTC_ARCH_32_BITS
+ #define WEBRTC_ARCH_LITTLE_ENDIAN
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
new file mode 100644
index 000000000..5826ab00d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0006-common_audio-implement-endianness-conversion-in-wav-.patch
@@ -0,0 +1,116 @@
+From 7d31da8ef93987000f297d435dbacaf7d436107b Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Thu, 15 Jun 2017 18:38:30 +0300
+Subject: [PATCH 6/6] common_audio: implement endianness conversion in wav file
+ handling
+
+The code didn't build for big endian machines due to the missing
+endianness conversions.
+
+Upstream-Status: Pending
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ webrtc/common_audio/wav_file.cc   | 27 +++++++++++++++++++++------
+ webrtc/common_audio/wav_header.cc | 32 +++++++++++++++++++++++++++++++-
+ 2 files changed, 52 insertions(+), 7 deletions(-)
+
+diff --git a/webrtc/common_audio/wav_file.cc b/webrtc/common_audio/wav_file.cc
+index b14b620..e2f7738 100644
+--- a/webrtc/common_audio/wav_file.cc
++++ b/webrtc/common_audio/wav_file.cc
+@@ -64,9 +64,6 @@ WavReader::~WavReader() {
+ }
+ 
+ size_t WavReader::ReadSamples(size_t num_samples, int16_t* samples) {
+-#ifndef WEBRTC_ARCH_LITTLE_ENDIAN
+-#error "Need to convert samples to big-endian when reading from WAV file"
+-#endif
+   // There could be metadata after the audio; ensure we don't read it.
+   num_samples = std::min(rtc::checked_cast<uint32_t>(num_samples),
+                          num_samples_remaining_);
+@@ -76,6 +73,13 @@ size_t WavReader::ReadSamples(size_t num_samples, int16_t* samples) {
+   RTC_CHECK(read == num_samples || feof(file_handle_));
+   RTC_CHECK_LE(read, num_samples_remaining_);
+   num_samples_remaining_ -= rtc::checked_cast<uint32_t>(read);
++
++#ifdef WEBRTC_ARCH_BIG_ENDIAN
++  // Convert the read samples from little-endian to big-endian.
++  for (size_t i = 0; i < read; i++)
++    samples[i] = ((uint16_t) samples[i] >> 8) | ((uint16_t) samples[i] << 8);
++#endif
++
+   return read;
+ }
+ 
+@@ -119,11 +123,22 @@ WavWriter::~WavWriter() {
+ }
+ 
+ void WavWriter::WriteSamples(const int16_t* samples, size_t num_samples) {
+-#ifndef WEBRTC_ARCH_LITTLE_ENDIAN
+-#error "Need to convert samples to little-endian when writing to WAV file"
+-#endif
++#ifdef WEBRTC_ARCH_BIG_ENDIAN
++  // Convert the samples from big-endian samples to little-endian.
++  int16_t* converted_samples = static_cast<int16_t*>(malloc(num_samples * sizeof(*samples)));
++  RTC_CHECK(converted_samples) << "Out of memory.";
++  for (int i = 0; i < num_samples; i++)
++    converted_samples[i] =
++        ((uint16_t) samples[i] >> 8) | ((uint16_t) samples[i] << 8);
++
++  const size_t written =
++      fwrite(converted_samples, sizeof(*converted_samples), num_samples,
++             file_handle_);
++  free(converted_samples);
++#else
+   const size_t written =
+       fwrite(samples, sizeof(*samples), num_samples, file_handle_);
++#endif
+   RTC_CHECK_EQ(num_samples, written);
+   num_samples_ += static_cast<uint32_t>(written);
+   RTC_CHECK(written <= std::numeric_limits<uint32_t>::max() ||
+diff --git a/webrtc/common_audio/wav_header.cc b/webrtc/common_audio/wav_header.cc
+index 61cfffe..382bfc7 100644
+--- a/webrtc/common_audio/wav_header.cc
++++ b/webrtc/common_audio/wav_header.cc
+@@ -129,7 +129,37 @@ static inline std::string ReadFourCC(uint32_t x) {
+   return std::string(reinterpret_cast<char*>(&x), 4);
+ }
+ #else
+-#error "Write be-to-le conversion functions"
++static inline void WriteLE16(uint16_t* f, uint16_t x) {
++  *f = x >> 8 | x << 8;
++}
++static inline void WriteLE32(uint32_t* f, uint32_t x) {
++  *f = x >> 24
++      | (x && 0xFF0000) >> 8
++      | (x && 0xFF00) << 8
++      | x << 24;
++}
++static inline void WriteFourCC(uint32_t* f, char a, char b, char c, char d) {
++  *f = static_cast<uint32_t>(d)
++      | static_cast<uint32_t>(c) << 8
++      | static_cast<uint32_t>(b) << 16
++      | static_cast<uint32_t>(a) << 24;
++}
++
++static inline uint32_t ReadLE16(uint16_t x) {
++  return x >> 8 | x << 8;
++}
++
++static inline uint32_t ReadLE32(uint32_t x) {
++  return x >> 24
++      | (x && 0xFF0000) >> 8
++      | (x && 0xFF00) << 8
++      | x << 24;
++}
++
++static inline std::string ReadFourCC(uint32_t x) {
++  x = ReadLE32(x);
++  return std::string(reinterpret_cast<char*>(&x), 4);
++}
+ #endif
+ 
+ static inline uint32_t RiffChunkSize(uint32_t bytes_in_payload) {
+-- 
+2.11.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
new file mode 100644
index 000000000..eb9a30466
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Audio processing bits of the WebRTC reference implementation"
+HOMEPAGE = "https://www.freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
+SECTION = "audio"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2 \
+                    file://webrtc/common.h;beginline=1;endline=9;md5=41f7322d91deabaf0acbbd0b8d0bc548 \
+"
+
+# Note that patch 3 effectively reverts patches 1 and 2. The only reason
+# why patches 1 and 2 are included is that otherwise patch 3 wouldn't
+# apply cleanly.
+SRC_URI = "http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/${BP}.tar.xz \
+           file://0001-build-Protect-against-unsupported-CPU-types.patch \
+           file://0002-build-Add-ARM-64bit-support.patch \
+           file://0003-build-fix-architecture-detection.patch \
+           file://0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch \
+           file://0005-typedefs.h-add-support-for-PowerPC.patch \
+           file://0006-common_audio-implement-endianness-conversion-in-wav-.patch \
+"
+
+SRC_URI[md5sum] = "336ae032f608e65808ac577cde0ab72c"
+SRC_URI[sha256sum] = "756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa"
+
+inherit autotools
-- 
2.11.0


