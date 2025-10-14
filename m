Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13214CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:18 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.3573.1760484793312660016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJ2rpV/i;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so6022794a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484792; x=1761089592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzPRJ6DC/7o9gjhWlOYLJQKHHxkCY7yOiX6X4wOJykk=;
        b=EJ2rpV/iFORs+TfHG9gR2joDggSQhx6+z3KjMLKjoepqa1ROIZDampjfm5/y0JCAex
         EaPfgTUfjrHS+LTiEOtfrF8GAHh89EoXc7zKRPDWGr1hKsd5emBuB51xlAi24dct8Vvq
         EAkw5Mfvez6qmhYPIlUINme8HxeI1vTEAR9MekK324iNk+baM+AwGlqNtUL8UmuLWdmT
         Qty3fKsfY6In+UcQAHP0UPFNDVx2q+MN4h2ZyNbm9Cb9VKyT/jNX0LPrJzt5S4hBebD4
         YhX07oAXknB5RJ9tJ37qGco42NTtLk9vGeOQuYQb4DH1p7DEFKktfqWCB9IAbAezXRtY
         5zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484792; x=1761089592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzPRJ6DC/7o9gjhWlOYLJQKHHxkCY7yOiX6X4wOJykk=;
        b=r9xjUNUtda95hJ+GQHNAj497RSmjIqTquQErcJc97c01kBCqs8c4tE9LElpKxCqMA5
         vZEI8we1cfUhmdst+dMbMpMHG0zWCfHJ78BNkw5MNGhFmwWrj3qtV4OWYj1jAytM1fXM
         zro2rEsbjFqXaGIG72xC1Ies4BMJwm5GfhhFc62vYyqRPzTkhKa5Scz2prG1cMQhsUi2
         KZWfg66Z+HzuPhfPQX2UzrmhPc+yRc/wteUfZXU6sxSExNNPoCR5sSdRa/G5OuwR1DbT
         ob/sRqVDGKgfPmEVFUZu+sAvokIQq6SSci3nx1QTw8RwmcnBBoHDQQLVjIfZ5e5VgDTu
         lwFQ==
X-Gm-Message-State: AOJu0YwZih6kurj70hHJ36QYigYUCaVZPhaBErk34bzoeALYnBAC9EkZ
	knT19nFsRixLm6usULFPC8bznfHjjoXvL/8cc7CT3OaX32IfTxMG1mNg+oohhg==
X-Gm-Gg: ASbGncvA4As80DdD0hvgeQd7+00pbFmuMcghtsK745Q4UVbUnunUkAgoBAlcW/1RC/4
	WD+MQpgvRnD0Qz70oOAXKrfWXL6nh7QE6ImJMXn4Bftn4hsEGtRXF059BD2KHINfXp/82aZvS4I
	VssapRsc9Kgy7qjCp71Gb2R9qAYqvpTKrfalo1QJe+wAmzDNrhCLkY1miY6nzJu/3JCnXrwI+1y
	0DNcuEGCJ3nUf4ZKrrfdkx0xmF8mok/tbfSpT4keSqiq5jX1cfWnvKHyObp0kKnB0Wiqco+/9Zb
	r07WCJskgKmdgnCILBjkRNhMRlfO+baWwA+7geLsjuiEcWiHVydSK1GB+9PLMkYLVTh+zzgMZse
	L6mAW9if6BJvGCX4N1qDjbdnocdOd0VeFXbpXBMFzBRawt6JkF2X8d5WuyDq3VmM6EQ==
X-Google-Smtp-Source: AGHT+IEb4MBqjO6DxKSsvaWkSt1DWqE62vwCR6lmsMnPbL76X45yHHh7iXXfEzdmSNXqW/9tnAgv7w==
X-Received: by 2002:a17:90b:4a52:b0:330:84dc:d11b with SMTP id 98e67ed59e1d1-33b5138e273mr34402112a91.18.1760484792479;
        Tue, 14 Oct 2025 16:33:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:12 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 10/18] libraw: patch CVE-2025-43964
Date: Wed, 15 Oct 2025 12:32:21 +1300
Message-ID: <20251014233233.304125-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120669

Details https://nvd.nist.gov/vuln/detail/CVE-2025-43964

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 95f680e0df1844b259cb07d6668bf381439f784f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/libraw/0003-CVE-2025-43964.patch   | 29 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.21.2.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch b/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
new file mode 100644
index 0000000000..d7d7664da3
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch
@@ -0,0 +1,29 @@
+From 0ecd9906f70114a974809bb35b4ec9fe7fed9011 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sun, 2 Mar 2025 11:35:43 +0300
+Subject: [PATCH] CVE-2025-43964
+
+additional checks in PhaseOne correction tag 0x412 processing
+
+CVE: CVE-2025-43964
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0]
+
+(cherry picked from commit a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index f89aecce..95015d27 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -495,6 +495,8 @@ int LibRaw::phase_one_correct()
+ 	  unsigned w0 = head[1] * head[3], w1 = head[2] * head[4];
+ 	  if (w0 > 10240000 || w1 > 10240000)
+ 		  throw LIBRAW_EXCEPTION_ALLOC;
++	  if (w0 < 1 || w1 < 1)
++		  throw LIBRAW_EXCEPTION_IO_CORRUPT;
+       yval[0] = (float *)calloc(head[1] * head[3] + head[2] * head[4], 6);
+       yval[1] = (float *)(yval[0] + head[1] * head[3]);
+       xval[0] = (ushort *)(yval[1] + head[2] * head[4]);
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index d4750630e0..1303c0e8ac 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https \
     file://0001-CVE-2025-43961-CVE-2025-43962.patch \
     file://0002-CVE-2025-43963.patch \
+    file://0003-CVE-2025-43964.patch \
 "
 SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"

