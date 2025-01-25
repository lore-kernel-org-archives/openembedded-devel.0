Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20FBC02190
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14813.1737828204903407676
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IurHQT1l;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216426b0865so51893535ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828204; x=1738433004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU6gIG5OE9qu5QH0/Pyy7oLN2Rmq8XGHmFw3m3nCJfU=;
        b=IurHQT1lRAdoqr+ekrVPuGIDI5LtwvbT/xqw4wDk3l2HEPcMokDqCm6Z/uiTs1Y7xv
         LoYqAG8TDiGS1Zl8IXY0ExCpGe2eqWg++3n6I0macL8eGJ8GjI+PhzAWQ2bTixAQGrQs
         NdoKUl94/FaGGBwoDDQsB0fByagZTHpFxUXvx6snlCIuUDQZyPcGJvU+1UvmjEGT5pxz
         xXV3RRQPQ2epVJe72TfWF6gka0ytmlvpEEp4MMPofDnaqfO8Dzw6aRCaPdR1Zh6pr4T0
         mTyd2QrctR/koEgWda3c7cwEEeGgT04lYgswxAwoISy9BMTVpeAAzwn3lFtBT8AyigGr
         vm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828204; x=1738433004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU6gIG5OE9qu5QH0/Pyy7oLN2Rmq8XGHmFw3m3nCJfU=;
        b=IbD54jEodPxgoH8arkgzDiRqmS09ljg6wxpqKhPzVvaGkkK6G862kKy1DPLXD0eB+F
         MR+mtg8RAtBQunHo9/GmZnmS2JIlRjQCdX1Ull+zKjvblQKdqINpNZRC0cv228EjBMr0
         52B2nJ72CZRqAJdddNqrk0PrH+/3+n3nHl9QGtnawfZEh/jRrLgH74ya3ussbORwkogv
         Huj6CI7/0jROXfcPPbElNC/iwPz2OZ91Sv/hIwHyygX4xjDyQHdWHO9ZNQAfXf8NMtEI
         dycqXqKXX3hWg/vfEJt6jnazQwvAehTT1OiUBDI/MtfBIrt7ZRNvF2qjbPfB7zfaewT4
         r1ag==
X-Gm-Message-State: AOJu0YzsWlFbx/aehQXnLOIGZoGI6yXArov2MSN7Zokhf7Ny8WuZqlxy
	jc7DToAEMa5AfSJGrwE3dfvCTcc7Sp86IEtAGqbqm1AesQAn/Tbx3C5DzQ==
X-Gm-Gg: ASbGncvmFd3HwSLbSkJ0HquTyn/H9bYvxIl9JtwS4J1d/S5U1e4nHmzySv95DTH5w6c
	EzxxNGBb3yjLT9HGDH1vyoDGBqFF0kkxvklZIE9FfSUHYlqHhxZtsmsPNm57UtVw7oEwoViogOV
	v8DrhjbZniBdCTmNIh+PnYdfV0I9+YBrK2vdxZj1k2hgJ8eXazU6bgWpmiWlYgP3Db531GC6Oq9
	xf9tm8YBt+UUTCLs4k2yWjR3CJIqWna4esz9M7ZX78r+zMZZP4STd0BdUkx7dP1JbvjlxgpSuyq
	cRdIqmk8y4DTK6/HOPo/eyLKwRo=
X-Google-Smtp-Source: AGHT+IG1vXy0ry6qywEEhNsksip8FaVTgESFbY66vl67s7lqRPW8gN+Cp5aFxqTpqsS2qVcbelkUWA==
X-Received: by 2002:a05:6a21:7881:b0:1e0:eb49:b81b with SMTP id adf61e73a8af0-1eb2158bc78mr63146185637.31.1737828204159;
        Sat, 25 Jan 2025 10:03:24 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 14/14] audiofile: patch CVE-2017-6839
Date: Sat, 25 Jan 2025 10:03:08 -0800
Message-ID: <20250125180308.7856-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115097

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/844a7c6281eb442881330a5d36d5a0719f2870bf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88faae83b2b0e68827c457f4f348f7d7868f5258)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


