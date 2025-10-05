Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3ECCD185
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:58:40 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.11019.1759672718509051839
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMkU+Hs4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so7989289a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759672717; x=1760277517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtfQ5bJeyUzT+g9g8IPPcnTYbiw69PzlzJDbyFGSRCU=;
        b=CMkU+Hs4xSg8xwjtzR1rqcbp5/hTlQhVs2WJuhuwxiyLOZ2hraiRVEQhg/mkE2uvM0
         2R3zVk19hfDrOgdvuH5P+ApHxM/J+Xf5Lh3jmLp/Yc3BXLTC0EMkYgtzIY3Pj0W2oK3j
         5kCcMvVlHnodndEmMtVuqRFGk7MKNxv8SsJpUiweIACjIQPBgASyRfnkuDmcMAxVE3xd
         C1hj6xZ48C5/+fjKoj7IwpmDYpuxuPgTJT2KRDkt1FxvY4tBepRsGNUVYbym2iMD0GcT
         Z/CVSUovrJ3uVT7yfjG67+rpXu86F9UA0coAtIS2203Lici5KbXaILBqJDdyFgNmwSL9
         LD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759672717; x=1760277517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtfQ5bJeyUzT+g9g8IPPcnTYbiw69PzlzJDbyFGSRCU=;
        b=ldQVh4tN70rZZf14lFtayNO9aA/nnVSPn4f1F1IPmwd0NrWiTHuXlP49P30nJUXYNW
         39UL/DWHZaFcbWJ3igbhkI/FlQjKKNmCFysHJwxYM6AL22ulxHy/7KRKMfYXjoHLT0do
         V8Ygnr0T6Imq9k6zfYg1PLyVa98JJkIMYI93N/fc/YNMCAhWv2Z0KwLcgi2ZEx7rMAQo
         L7Wly2EDI8vzW6mlK623eCjgJYBrZO46rgwrR39Dt3sRoZYWMhUb05bhr+mZlSyryjaO
         GjtMlkabLh6KMq/myNOTLYnJgTFFlLU6eCotTptPV5T9a/I61jd1Aixfop3Gd85ivZef
         Au1A==
X-Gm-Message-State: AOJu0YwHIoQJRmVv/0KLDSXcQ9WoV74uBW1SgUx393Q/ww34eMy/DFRh
	iiE8649rrsIU6MO9IIgjiOQZPZFol4z+b/wdHQJfNzjJ4Ekyum8gNP4v+oSMcg==
X-Gm-Gg: ASbGncvu8NRnkB3X3p93K0Bsqbf/s/9aPPmA8za4nzKf2egtWRocaPLoktaVjrEwT/A
	uNaiPPb3apJmPRBtGuXq2/xF5ovFgfZkRUdlz0DiPqY12sH4a5XWaMzhxWAWAC65vo6DyRdeZTS
	DCLWJ9gvDc95Tlus40AH1ThmV16vF5DynuV5SfMYwJLagV88THz/YcuosqSB4jrwwqukX0XXTO/
	qFOQwYlwO6ayMaOJ8G3s8agWupgsH2KU3aZsxbs28DmN6ECHnpb+1BiSS9uw+cBEVUASnsW9S1Y
	LBu7PKuHqkJYqj5M0TyGBWY09bUpQubnbB4qCoMixu98YFarcbAY+kZiT87B5fwTzaJUO7tku5i
	myguB29w5yzbJcxVXCufWttUweLPnave55A96fXEAOVA5RtwnoFgraEE=
X-Google-Smtp-Source: AGHT+IG7LhdL+ZFCpOTWU6tVGuodsI2LyVgwEuJ4CNvOnmfgHTw3aWyVofs3JfwRc9SVE0sHukcLow==
X-Received: by 2002:a17:907:2683:b0:afe:b92b:28e9 with SMTP id a640c23a62f3a-b49c4cde1c8mr1213586966b.49.1759672716455;
        Sun, 05 Oct 2025 06:58:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm909200166b.69.2025.10.05.06.58.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:58:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/5] audiofile: fix multiple CVEs
Date: Sun,  5 Oct 2025 15:58:31 +0200
Message-ID: <20251005135833.879336-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005135833.879336-1-skandigraun@gmail.com>
References: <20251005135833.879336-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120253

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6830 / CVE-2017-6834 / CVE-2017-6836 / CVE-2017-6838

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/4a1a8277bba490d227f413e218138e39f1fe1203

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75f2bd2b3b145d8282db9926d8212c6d81bde99e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...multiplication-overflow-in-sfconvert.patch | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a48bed2a3b..8aebe88f26 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
+    file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
new file mode 100644
index 0000000000..ec21b09f30
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
@@ -0,0 +1,79 @@
+From 7d65f89defb092b63bcbc5d98349fb222ca73b3c Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 13:54:52 +0100
+Subject: [PATCH] Check for multiplication overflow in sfconvert
+
+Checks that a multiplication doesn't overflow when
+calculating the buffer size, and if it overflows,
+reduce the buffer size instead of failing.
+
+This fixes the 00192-audiofile-signintoverflow-sfconvert case
+in #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6830
+CVE: CVE-2017-6834
+CVE: CVE-2017-6836
+CVE: CVE-2017-6838
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sfcommands/sfconvert.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/sfcommands/sfconvert.c b/sfcommands/sfconvert.c
+index 80a1bc4..970a3e4 100644
+--- a/sfcommands/sfconvert.c
++++ b/sfcommands/sfconvert.c
+@@ -45,6 +45,33 @@ void printusage (void);
+ void usageerror (void);
+ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid);
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
+ int main (int argc, char **argv)
+ {
+ 	if (argc == 2)
+@@ -323,8 +350,11 @@ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid)
+ {
+ 	int frameSize = afGetVirtualFrameSize(infile, trackid, 1);
+ 
+-	const int kBufferFrameCount = 65536;
+-	void *buffer = malloc(kBufferFrameCount * frameSize);
++	int kBufferFrameCount = 65536;
++	int bufferSize;
++	while (multiplyCheckOverflow(kBufferFrameCount, frameSize, &bufferSize))
++		kBufferFrameCount /= 2;
++	void *buffer = malloc(bufferSize);
+ 
+ 	AFframecount totalFrames = afGetFrameCount(infile, AF_DEFAULT_TRACK);
+ 	AFframecount totalFramesWritten = 0;
+-- 
+2.11.0
+

