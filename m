Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7160CCD18A
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:44 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.5326.1760206422745264152
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzTVxoJD;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so6246080a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206421; x=1760811221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kma03ci1gnaoYZv/i1ILq6/ORxpCt0wERO0Pjs0p54=;
        b=CzTVxoJDboexKnPiXlD9z96mKNqj5W9eS/xlAuUvJJYpKaCVYoK8A5xgO08b6wrZia
         QwZIDKFzGiz5iQQGBrmJZwMCG6o3xpwHiGe+JuLq2ngR5/3HLOpg0hg4+EI+pBY6khhj
         EybTtJ32RIT9RCrsPzFHmFETrGwalSTDbyUoH9ShEVhuQKl6hoUQcazzLiT/xHx2PkX0
         umjPYLVs/askMXBYgeKmybz2P2wBXvzyg+cwmbj+l2kiL7jBLji/4NJpMTea+okH6g7N
         HmPYfJ5FBSBa6W2904T8TkhiV3w5+G4Nd8/o8jySZIIzXwUTC0BDmLZSSb1Rs7uyUA/q
         PrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206421; x=1760811221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kma03ci1gnaoYZv/i1ILq6/ORxpCt0wERO0Pjs0p54=;
        b=I3HJAZSM+cV+FKr2zlJEbDNAXu2a51w+ciz24pMBHpkvuEP+pki9aMvyCT7vpnMiiB
         gHOKH1OLhu/MgXd7TByIbuscOvoEiLZXaAlxEebpBV+COHFtJ0KdYUOoRsKye2AfqeOq
         9EYyirKzQEYAu0Z8GocAGbCJBisEtYItSCsscB6yn09nDVdLOg3WAJxx9QKmNfL41dNo
         l1pdoP5kzG4esA3n5sbx8yU9tzTAYp/i+exk2xl9QjT77rBAnSIh9Q4vq6PGIFMrlZhs
         cTW+hP94sYh0HdBXFojOsyTqAVAjpiOsaxDo1E1By0yaEyku8jpW7QmVIHb6fTPqyOxK
         Ks/Q==
X-Gm-Message-State: AOJu0Yxdz4S0dhgdI8ltfCgiacIx2dqQyez98b/EMllDe5cPnDOQIIJN
	/k/lP7omib/JJMZXGSsKlv6VnFvjCxJZwC24ZmUIOOYtymKE7pULbK8JPsWIqg==
X-Gm-Gg: ASbGncs7giAyKB5kkQuRPTV5/LGMoe+UQtcfC9t3UPS1I8A1UdhfhMerBVFVRRo8Zkh
	zSTrWRKfxnCjeXtdE6ZOoqJpKnUnZRnvoSxrz/WJ35PGEdIHLj8GqYSlIUR/UnMC8+Ir8xdTvWA
	G/fJ3HabxcWqzXAs+XaRaj6pSMu1VV5GYvE9hzH0keCxcJpyWFfT3AOWpdgIkzIN1qWyx72/lEA
	8w4YWIVUWIYR/L5b1XD0uffhF1RKBvg1yf3eGN5YJFSUmcYR5wVriHwaJp4MRqDf8o0uV/wUJdH
	y5joEhINmMNKwxHBsj+0BOyrlZ83PpCf+Soe+ez36UlbqQFMItb5dK7sOOfeX/3MLvG9ILrMIaZ
	79dqxUsBHPspeftSWj/zg7vK9VXHqXgW3rZz/aB8=
X-Google-Smtp-Source: AGHT+IFBujcQ5huZZjB3AjIUGlmPJfB3ZNTkFa1iwPNMayI4+jD4gG9BLeOlWvFnVSBZnX4uar9pvA==
X-Received: by 2002:a17:906:6a14:b0:b3a:7af8:c4a2 with SMTP id a640c23a62f3a-b50a9c5df86mr1784407566b.10.1760206420672;
        Sat, 11 Oct 2025 11:13:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 01/10] freerdp3: patch CVE-2024-32039 and CVE-2024-32041
Date: Sat, 11 Oct 2025 20:13:30 +0200
Message-ID: <20251011181339.2127670-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120500

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32039
https://nvd.nist.gov/vuln/detail/CVE-2024-32041

Pick the patch that is marked as fixing the related github advisory.
The same commit fixes both vulnerabilities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32039.patch     | 68 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  4 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32039.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32039.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32039.patch
new file mode 100644
index 0000000000..f553228350
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32039.patch
@@ -0,0 +1,68 @@
+From bcaac313a07865cf05176c9d07ec1ca0670b2b61 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:35:05 +0200
+Subject: [PATCH] fix integer overflow
+
+reorder check to prevent possible integer overflow
+
+CVE: CVE-2024-32039 CVE-2024-32041
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/1208f23bc967be01cae42ca448a36f4f3d0cb7d8]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/clear.c |  2 +-
+ libfreerdp/codec/zgfx.c  | 14 +++++++++-----
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index 5c009d8e9..512aeae20 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -409,7 +409,7 @@ static BOOL clear_decompress_residual_data(CLEAR_CONTEXT* clear, wStream* s,
+ 			}
+ 		}
+ 
+-		if ((pixelIndex + runLengthFactor) > pixelCount)
++		if ((pixelIndex >= pixelCount) || (runLengthFactor > (pixelCount - pixelIndex)))
+ 		{
+ 			WLog_ERR(TAG,
+ 			         "pixelIndex %" PRIu32 " + runLengthFactor %" PRIu32 " > pixelCount %" PRIu32
+diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
+index 881823ab3..b7ee27511 100644
+--- a/libfreerdp/codec/zgfx.c
++++ b/libfreerdp/codec/zgfx.c
+@@ -227,7 +227,10 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 	BYTE* pbSegment = NULL;
+ 	size_t cbSegment = 0;
+ 
+-	if (!zgfx || !stream || (segmentSize < 2))
++	WINPR_ASSERT(zgfx);
++	WINPR_ASSERT(stream);
++
++	if (segmentSize < 2)
+ 		return FALSE;
+ 
+ 	cbSegment = segmentSize - 1;
+@@ -346,8 +349,9 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 
+ 						if (count > sizeof(zgfx->OutputBuffer) - zgfx->OutputCount)
+ 							return FALSE;
+-
+-						if (count > zgfx->cBitsRemaining / 8)
++						else if (count > zgfx->cBitsRemaining / 8)
++							return FALSE;
++						else if (zgfx->pbInputCurrent + count > zgfx->pbInputEnd)
+ 							return FALSE;
+ 
+ 						CopyMemory(&(zgfx->OutputBuffer[zgfx->OutputCount]), zgfx->pbInputCurrent,
+@@ -386,8 +390,8 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 	wStream sbuffer = { 0 };
+ 	wStream* stream = Stream_StaticConstInit(&sbuffer, pSrcData, SrcSize);
+ 
+-	if (!stream)
+-		return -1;
++	WINPR_ASSERT(zgfx);
++	WINPR_ASSERT(stream);
+ 
+ 	if (!Stream_CheckAndLogRequiredLength(TAG, stream, 1))
+ 		goto fail;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index f29b9afbee..b07d7d139b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -8,7 +8,9 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg"
 inherit pkgconfig cmake
 
 SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
+           file://CVE-2024-32039.patch \
+           "
 
 S = "${WORKDIR}/git"
 

