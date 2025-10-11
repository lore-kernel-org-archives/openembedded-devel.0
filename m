Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB25CCD192
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:55 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.5328.1760206425568702826
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYP3CroS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b463f986f80so682497566b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206424; x=1760811224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Np0YOUZvMmSxRC8rz2s5LUy1IAppV3TI5k6PGmYp1OM=;
        b=mYP3CroSh3USVA085MWJPmnIyS+ppZZTl/OEb46nigaS3k3peRGOjH8F79B32Seoz7
         etNokwJwbcgq1WpZtSMsotj0ROiaopNtRb2JMMiY9IOurhp2+5Vn5x/eP7zWqPUrI4ie
         cs1jwP2cnoJ5C09GCAuqOVP8ozAlng55oFshTJqa15QBYixhJJXhuek0qxGkowxqTMku
         FkTc0DxgjSh/ju0Erbr4/1xyisiP0Irya81YNC/aGYAmd5PoeUyfiC31cWmNf3NaViFh
         KSOrDDOjineE3lhdrug3QES+uthDQecLB2O/H+fTZ3RhVSv5//staY+MEZ45GyODwB2d
         d57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206424; x=1760811224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np0YOUZvMmSxRC8rz2s5LUy1IAppV3TI5k6PGmYp1OM=;
        b=nYBWRMJTxp2gNjgJDpDcOwhI+ks/KFSmdn5EPOmjW9fSqokPYqPOpnL3N+J6NGq7Ks
         dcQW/TkGde2O1e48shVlhfRc9cIFNdwvFGjXv1dPbx4nCttno0q/yqLj5qc4ojL6VqdI
         fMYQUjiwY3+vm24B/u9/TLT7/FF5W0m29ulybVkRlN/kyfFDWfa0+HljSIEC6IZKCMwV
         PjI3OtvCwDEoLxlnv0a1FnTEz8YqTPhBlUyJ/1V6GBRE0AdL2mACfZKX/MFX7p1N4Nz4
         67P+pfRKWFo1l0BxDGL3PGbCZDQqdCjuwFEzMUPFvCVR6ZiPx/zzOMBXJFaq39QfdVH7
         x7Jw==
X-Gm-Message-State: AOJu0YzvvmskccxKifS5fbrQ+ZadymECO4XvzxBEt5ZMh5TE0i5VpMz2
	/8H6uQbM/ev4JZrqvm9+UaoCMpIOpTbnimRsynHe84EyTsOeUiDhw+jWCCBjmQ==
X-Gm-Gg: ASbGnctJQMfk6vFjHAlnOjgR8STTYwWST+XQcarBcLenoLR8IRK31b53TP7b8uRF7Z6
	RRvWkNIADB3D0oQQbora0B5tRaCKexZuU/cgHmnG96DDDSNd23odSE9rZ+O2ezS0Nkg0hphldJ+
	hBXZWyagRMr/h1ytNSgWxQG3lwO17wsiI8dg+k8awp/bdu9NhHn18yZkeUt8FrDqTIS3EqqN9m0
	mbkg4V+R6LoQZ62hse2G3zCGsn809e8gFgzeFlqDOsbOhrdPGhhtWya7aGwPv6UqMKcQxac5qkW
	RUvulKhrTSQqr+eELSWrp8RvHOSONBO+yGeqU2P4hnxeO2yHBt9fpgQrquK42lggQn8EvPTI/zn
	LRJg6PiwrrjQfh2VN8sxtoMngR3w4rXq+ENudvFFKnGrhhHP3rA==
X-Google-Smtp-Source: AGHT+IHpTEtqCQ0EgDed14b80/6Ii98YwBcI7lwCB3RyFzbKU+z0Dhfwr+AmNRrfy5CJStV5jByNPw==
X-Received: by 2002:a17:906:4788:b0:b41:873d:e218 with SMTP id a640c23a62f3a-b50aa1846f5mr1636182966b.14.1760206423806;
        Sat, 11 Oct 2025 11:13:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 06/10] freerdp3: patch CVE-2024-32658
Date: Sat, 11 Oct 2025 20:13:35 +0200
Message-ID: <20251011181339.2127670-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120505

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32658

Pick the commit that is marked to resolve the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32658.patch     | 35 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32658.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32658.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32658.patch
new file mode 100644
index 0000000000..6af8867a6c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32658.patch
@@ -0,0 +1,35 @@
+From f489a734d2c06eb4adee654919455799e4cb8c01 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sat, 20 Apr 2024 17:59:49 +0200
+Subject: [PATCH] fix offset error
+
+CVE: CVE-2024-32658
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/1a755d898ddc028cc818d0dd9d49d5acff4c44bf]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/interleaved.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/interleaved.c b/libfreerdp/codec/interleaved.c
+index df148b667..08520e55e 100644
+--- a/libfreerdp/codec/interleaved.c
++++ b/libfreerdp/codec/interleaved.c
+@@ -212,7 +212,7 @@ static UINT ExtractRunLengthRegularFgBg(const BYTE* pbOrderHdr, const BYTE* pbEn
+ 	runLength = (*pbOrderHdr) & g_MaskRegularRunLength;
+ 	if (runLength == 0)
+ 	{
+-		if (!buffer_within_range(pbOrderHdr, 1, pbEnd))
++		if (!buffer_within_range(pbOrderHdr, 2, pbEnd))
+ 		{
+ 			*advance = 0;
+ 			return 0;
+@@ -282,7 +282,7 @@ static UINT ExtractRunLengthMegaMega(const BYTE* pbOrderHdr, const BYTE* pbEnd,
+ 	WINPR_ASSERT(pbEnd);
+ 	WINPR_ASSERT(advance);
+ 
+-	if (!buffer_within_range(pbOrderHdr, 2, pbEnd))
++	if (!buffer_within_range(pbOrderHdr, 3, pbEnd))
+ 	{
+ 		*advance = 0;
+ 		return 0;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index fd9df18b43..f71cc06ebd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32458.patch \
            file://CVE-2024-32459.patch \
            file://CVE-2024-32460.patch \
+           file://CVE-2024-32658.patch \
            "
 
 S = "${WORKDIR}/git"

