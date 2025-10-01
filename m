Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE8BCCD182
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.18465.1759326781026562037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfu5QcuJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso14583761a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326779; x=1759931579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGMnyDlExOQUIMBDAErbX5azexesU6t7fqOSDN98wWg=;
        b=dfu5QcuJ3RqnTMsfiNswNMHQj1/FBdU9+TsBZv6ym4+Ozp4bA2dPDOZ72ajxX2WsGP
         kAuL2LuNh7Ouk0kynq34jZcAqNeIhw18UE1E/ZbTxme5WOrm/uspBWJeoHwgVlEGfb8k
         w4PxGYTm4aBRVDP5XPQnDrT8YDqVoJHAa+Oc25FFUNbpQ0fIc9QqVMGcLSUqX8NQdi5o
         HnkNMyxBw7fCtiFpQcvIulAMVFHmuWBUvJ/0XxZUQSr1lOW6LKhu5J+vNGX35J+d3peE
         O3qdI9gTB3FhnL7M/kVqtdA1KcH5rrsQZEbyX/diy1e+7NQZQRY8WArU+c0Bc0OKdzVO
         HEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326779; x=1759931579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGMnyDlExOQUIMBDAErbX5azexesU6t7fqOSDN98wWg=;
        b=Qf9LyMHMK/D9QgoNBPpzvV+/ckF/Se+oUjGpjHLV3zHUysHf3ZCentmjfwWOZJxIyJ
         c2G78+CFuy005UcVx3c9CyhW6S7Fi4uujD3musPjrTTFpfPDlAkqyAbr7/gT9CgbnA8z
         QJ8Q/x9bN2lxm9tafKnOvg5I5vDJjeXtuoY8LVUrYrxAR4ohn/+64+4ZmvfCOyRJyI3Q
         XWU8UCXwHDC8cmOigHUra80LU1wrlS5IBIcNMew7cDgp8Q2TlBBpmfcHsIzfe0erWAog
         8YDNJcPAPSBVIdLnxgVCIoElYL2qXCgH43BHs2TMQ/yZMP9PGxr32/N2B4nHt8gALIYZ
         DVmQ==
X-Gm-Message-State: AOJu0YxnR/Pp7GAD2cLyswajnPOPKRFiOwXuhG9yqzizgACEapZU6V1S
	4PQwYtXDoE26HQPsq2/s6qqvTXXnKjdHVwiuTkNjbX6zofhkihzkj4PeuQWTiw==
X-Gm-Gg: ASbGnct0yLYSAp6e/xwAu13LILyZ8lKY5PB5pKceXo6HNhabqRpr7hcyM58ZLw/zqfg
	03qH+L95yDaAukXL2D/WfVIzDQTb68vuQBu839gaekuAnKD3baC7v0bip7joCGWaxTzExHQfWnD
	zONdv0xVAQ/LLDWpOWA9vOxemZBh4wD9o30iYG6vlO2ViDjgybef/MxUb7aZAGrVblqwE4zjb1U
	i12BYc4x4Wy1NSm7Z4eAYNk700bsPRKrgn0Ks6Llvu2hVPfKIHlmhHHNUtQd/jG86jP2jNOSSRq
	zQKhKZE9lRP5qvc5oLP37KPP1F8V3ePFQ6o/Mm7Ql4RpbzgtR5xb68iTjnLk7HmWOj/FsDXVNpn
	gBogIJOOm3ssgfanrfPi7HjDkCmweU3uRonxc1BZtogBF
X-Google-Smtp-Source: AGHT+IGeipOSGH5l/t2w5UJ+kvqmkWyYKouuRavuz85pAZuS3x5/O11V3tFLnNFkCjb4q7XPjgl8QA==
X-Received: by 2002:a05:6402:26d1:b0:62f:32c7:6c2b with SMTP id 4fb4d7f45d1cf-63678bcf1e9mr3939631a12.11.1759326779240;
        Wed, 01 Oct 2025 06:52:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 18/25] audiofile: patch CVE-2017-6839
Date: Wed,  1 Oct 2025 15:52:36 +0200
Message-ID: <20251001135243.1490753-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120133

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/844a7c6281eb442881330a5d36d5a0719f2870bf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88faae83b2b0e68827c457f4f348f7d7868f5258)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |   1 +
 ...lication-overflow-in-MSADPCM-decodeS.patch | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 4fe6657a97..dd8784ae8e 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
+    file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
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

