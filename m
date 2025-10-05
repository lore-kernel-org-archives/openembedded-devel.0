Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B75CCA476
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:58:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.10965.1759672719647375504
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VmPH2Uci;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322da8so854210766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759672718; x=1760277518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upcKTTjWwBcVUIsLUehA7F/Ff05jkzpogNkUYUHRS8I=;
        b=VmPH2UciiDSP7njBEwrLdYHsNnc5w2fL66h0FObj6tZ5PUaQAPDkDQAA9d5YgqWfHj
         YuYHPre8AOI/YR/wb88g7YzMxNh8BOSgDe9fA07YeKudX1J3qn02h4we9qjQZU4Y8Uxl
         8f9QUpVgm8h3G2Hd2jq3anLnxdCb8Q81EfTlteWR+2nR0aij3hSvrSvbPd6ssuAUKKrg
         xJFW7CQxr01C0J6Y1QRPLTsHIfT0zz+aPSLjDBLpbyvFnBWvNJ+5IfCd7FolX+bw+xyD
         Y+baNM93ItWAfxf384cz+1BQku/VWl64n1tX8H1QgSRzCQPcIjn14OsaFQHq2PUQZH9x
         WHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759672718; x=1760277518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upcKTTjWwBcVUIsLUehA7F/Ff05jkzpogNkUYUHRS8I=;
        b=Wq1SeXCT4avVIirANrPiPvebop4G39kBxgoQFqeiwAdOi0dcmgP5ghWJeEYcWFE2Yx
         aRgBorqk2f2CClroV5wn+a1yC634hIGgBhEoTyIGQB5zZmQoGu6Q53Xat5G6Sz/q9UXT
         fo29A91AaMOOr4+TERBMcjUMukx4k5q44R+dXMYsFGe+WenWrXsQwNLytD7OTj1AIts+
         d9yPCW8Zk/dpk9Z4l37BliVt1rMy3OjMbOI4CyT6aLVzOD/cPMEA5OZdFetdQbkOubXn
         0aNB78h9dLol8l2vT3p71KZQ5OsdWNb9Ov+LXf/oi2KfZinOynOIDs4mA5Ys8g3EARRh
         QnAg==
X-Gm-Message-State: AOJu0YwCbyp2guYnkYzwYm5Ehy9gHtk8RMzgKw2YdDqW5qyJx9n3TjTB
	BpQx2RurV2g8LZhDA03PC+1uvBURi9vv8CqKlJaC30V74bn1FUGFL9Bh9Wm1kg==
X-Gm-Gg: ASbGncvtqTN9wHk0h8fz/heaMa//si01v238R62rx5rt9n5cyYplgIZNQj27rzDb8HH
	S1+DL1dURxjomvatqgthzcMkYq5c05g3/V3v0TM+O7YDZ59MG4rdUEZLh+AsOK7aL/zkxvRh02H
	gt5HfzqYQnCJFZp0HbZQaU08Efk0yydRUa/WkLUbrPD/bbTzBlXJO2pGrxKFXRTD8tVMsxfG5BQ
	WmMveMvRvRifvhYZhHjgwjg9xMXKnBUE5IoO1sUj1T2bF62C2xkz1esLMwHZUeIQ9K3y1O/0f6a
	OplnNWlQBbAvBB3GvN0oCffncZ7z0ehlN2BCYSRjvnnjSuhRGNCbUzMGdp3MZcEeEr2+n92yXpn
	qmKGK9WG/8gOcPScm1iWPop0VEu1wXLoyRm8oeqzFTOIjU/KFCK28UvI=
X-Google-Smtp-Source: AGHT+IH1CZM55j3A2XTM2SaK1R3WDrIzO8t3DibuWzqwWvqVB0TYZytBZlRsllhOi8tJU0DTfQCuiw==
X-Received: by 2002:a17:907:6ea7:b0:b44:f9fe:913a with SMTP id a640c23a62f3a-b49c439b49emr1037716266b.65.1759672717841;
        Sun, 05 Oct 2025 06:58:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm909200166b.69.2025.10.05.06.58.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:58:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/5] audiofile: patch CVE-2017-6839
Date: Sun,  5 Oct 2025 15:58:33 +0200
Message-ID: <20251005135833.879336-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005135833.879336-1-skandigraun@gmail.com>
References: <20251005135833.879336-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120255

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
index 3d0ce3bfbc..d10c7a8b49 100644
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

