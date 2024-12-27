Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3322FE7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:30 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.10969.1735297107441145267
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iO1ficEo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024122710582561ccbf9a9e69eda2ed-rqul6_@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024122710582561ccbf9a9e69eda2ed
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BlUkyx4cmWVCpGVzRsGkHe/djLkX+ak5lmlC16p8fuM=;
 b=iO1ficEorSEdNLM2xCRFfmoaS+/V2JXpRgVl88sSuHMCTzaKpe0hjszh/2PGKpgdn5/xSR
 zqucMz88rQKIEn691S9SrteDCgKv9w9KecJ82f6bf12tbC06dbeSI9lDpcwSxfmIyjJfiRcZ
 0p4xFwNVGOca71bhC51/lLrychOwreOVXswBpoDOLoYRf7fZyT4QM+9pVfSnzEPD1JOcFYM1
 EO0GEayo0UAFKxAO6LkMVETeMXjxyzWCIWHXcKITifdkaz73mLclouJSX4Di3g0HKsxfwTfW
 Z48jdeRyAcQvu3oy03Fc9rYR8l6mWL0v2dznKfryV1yqyRwZly17XQzQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 15/15] audiofile: patch CVE-2017-6839
Date: Fri, 27 Dec 2024 11:56:15 +0100
Message-Id: <20241227105615.3303193-16-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114573

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/844a7c6281eb442881330a5d36d5a0719f2870bf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../audiofile/audiofile_0.3.6.bb              |   1 +
 ...lication-overflow-in-MSADPCM-decodeS.patch | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 08709a35e3..50df31c7b9 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
+    file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
 "
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch b/meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
new file mode 100644
index 0000000000..857ed78c59
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
@@ -0,0 +1,126 @@
+From beacc44eb8cdf6d58717ec1a5103c5141f1b37f9 Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 13:43:53 +0100
+Subject: [PATCH] Check for multiplication overflow in MSADPCM decodeSample
+
+Check for multiplication overflow (using __builtin_mul_overflow
+if available) in MSADPCM.cpp decodeSample and return an empty
+decoded block if an error occurs.
+
+This fixes the 00193-audiofile-signintoverflow-MSADPCM case of #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6839
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/modules/BlockCodec.cpp |  5 ++--
+ libaudiofile/modules/MSADPCM.cpp    | 47 +++++++++++++++++++++++++++++++++----
+ 2 files changed, 46 insertions(+), 6 deletions(-)
+
+diff --git a/libaudiofile/modules/BlockCodec.cpp b/libaudiofile/modules/BlockCodec.cpp
+index 45925e8..4731be1 100644
+--- a/libaudiofile/modules/BlockCodec.cpp
++++ b/libaudiofile/modules/BlockCodec.cpp
+@@ -52,8 +52,9 @@ void BlockCodec::runPull()
+ 	// Decompress into m_outChunk.
+ 	for (int i=0; i<blocksRead; i++)
+ 	{
+-		decodeBlock(static_cast<const uint8_t *>(m_inChunk->buffer) + i * m_bytesPerPacket,
+-			static_cast<int16_t *>(m_outChunk->buffer) + i * m_framesPerPacket * m_track->f.channelCount);
++		if (decodeBlock(static_cast<const uint8_t *>(m_inChunk->buffer) + i * m_bytesPerPacket,
++			static_cast<int16_t *>(m_outChunk->buffer) + i * m_framesPerPacket * m_track->f.channelCount)==0)
++			break;
+ 
+ 		framesRead += m_framesPerPacket;
+ 	}
+diff --git a/libaudiofile/modules/MSADPCM.cpp b/libaudiofile/modules/MSADPCM.cpp
+index 8ea3c85..ef9c38c 100644
+--- a/libaudiofile/modules/MSADPCM.cpp
++++ b/libaudiofile/modules/MSADPCM.cpp
+@@ -101,24 +101,60 @@ static const int16_t adaptationTable[] =
+ 	768, 614, 512, 409, 307, 230, 230, 230
+ };
+ 
++int firstBitSet(int x)
++{
++        int position=0;
++        while (x!=0)
++        {
++                x>>=1;
++                ++position;
++        }
++        return position;
++}
++
++#ifndef __has_builtin
++#define __has_builtin(x) 0
++#endif
++
++int multiplyCheckOverflow(int a, int b, int *result)
++{
++#if (defined __GNUC__ && __GNUC__ >= 5) || ( __clang__ && __has_builtin(__builtin_mul_overflow))
++	return __builtin_mul_overflow(a, b, result);
++#else
++	if (firstBitSet(a)+firstBitSet(b)>31) // int is signed, so we can't use 32 bits
++		return true;
++	*result = a * b;
++	return false;
++#endif
++}
++
++
+ // Compute a linear PCM value from the given differential coded value.
+ static int16_t decodeSample(ms_adpcm_state &state,
+-	uint8_t code, const int16_t *coefficient)
++	uint8_t code, const int16_t *coefficient, bool *ok=NULL)
+ {
+ 	int linearSample = (state.sample1 * coefficient[0] +
+ 		state.sample2 * coefficient[1]) >> 8;
++	int delta;
+ 
+ 	linearSample += ((code & 0x08) ? (code - 0x10) : code) * state.delta;
+ 
+ 	linearSample = clamp(linearSample, MIN_INT16, MAX_INT16);
+ 
+-	int delta = (state.delta * adaptationTable[code]) >> 8;
++	if (multiplyCheckOverflow(state.delta, adaptationTable[code], &delta))
++	{
++                if (ok) *ok=false;
++		_af_error(AF_BAD_COMPRESSION, "Error decoding sample");
++		return 0;
++	}
++	delta >>= 8;
+ 	if (delta < 16)
+ 		delta = 16;
+ 
+ 	state.delta = delta;
+ 	state.sample2 = state.sample1;
+ 	state.sample1 = linearSample;
++	if (ok) *ok=true;
+ 
+ 	return static_cast<int16_t>(linearSample);
+ }
+@@ -212,13 +248,16 @@ int MSADPCM::decodeBlock(const uint8_t *encoded, int16_t *decoded)
+ 	{
+ 		uint8_t code;
+ 		int16_t newSample;
++		bool ok;
+ 
+ 		code = *encoded >> 4;
+-		newSample = decodeSample(*state[0], code, coefficient[0]);
++		newSample = decodeSample(*state[0], code, coefficient[0], &ok);
++		if (!ok) return 0;
+ 		*decoded++ = newSample;
+ 
+ 		code = *encoded & 0x0f;
+-		newSample = decodeSample(*state[1], code, coefficient[1]);
++		newSample = decodeSample(*state[1], code, coefficient[1], &ok);
++		if (!ok) return 0;
+ 		*decoded++ = newSample;
+ 
+ 		encoded++;
+-- 
+2.11.0
+
-- 
2.30.2


