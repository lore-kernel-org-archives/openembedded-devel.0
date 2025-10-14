Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF97DCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.366.1760475272863487346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dXp8BLH0;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so3581245a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475272; x=1761080072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzPRJ6DC/7o9gjhWlOYLJQKHHxkCY7yOiX6X4wOJykk=;
        b=dXp8BLH0ezJk81L71vuSxVNQuMe1l4sVuyYIdqa8RJ+KCeSHlTU+IOGIh9VlOI3CYQ
         i8OJPRZ9Rs9wHMBI+UuLswOgtV6zIJcg84mB7roz7LNI7XTEJQ1MOqetvn81pEMnsoqj
         rXZdPjYAsJJLfV0MaxTzF2bSmvwOK4D3Pbtqk90dr1Ffrz2t7r8vejLAKiOQlbktiKex
         F8Y3KWNepU+mWSW6EuKnguWRuZOb7oydjdRd9jvYtrrrhcBP5le7blMnKzhjACarhXSr
         K3YUogsClZ8BIWxcZ2UJyFtQ4smW4O+WvDI3lfnUAJN1gI5NiAXRDc6kiNzObAPh/BFf
         bBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475272; x=1761080072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzPRJ6DC/7o9gjhWlOYLJQKHHxkCY7yOiX6X4wOJykk=;
        b=GjP2iGgx2DAOP5ajC5yyjhTA+XpDY7AoGoIfBfhqDTNTwY9iW8/w7EiH2s94NsBzvp
         gJ8bdKfDlIjxYaN01TEwIy2lQpqcUOJrNaI7HKFqxUtiOXZmTZAslkqrDPrkJx/0qG9Z
         TDQV94isrei5SHPZzHwKqb+Jp1PEO74jlW96aRYoVMs8rFsxLd6unIR7mt2cJyF4bpo1
         YXCVBL3msv0MznDDzSNbGokMDHvxtKrLwLUO5YbSAC4IuKqPNm1nB4D3wNa/3vH9g6Z9
         Il010N0JA4keYcw5T2ScNOjejtBunNY9GvOxDG/kUEhxt4tuVEBSvJUGCHjhela8/k+n
         j+yA==
X-Gm-Message-State: AOJu0YxBS91fMNKoeCkhOblezLgyjosEYnVk3r7rG1XJfSLqe1bsQMKe
	PArJDgWnPYvYMCr5BIrjajtpbFCGYyaGBTwdkqBLNTOloH5AflmY0sS+Rr32xQ==
X-Gm-Gg: ASbGncvCwNjzVHdXQNGDNa+DaL1D3d6gQfseT05izqjkPkstkIbc/qnWhBngA76Wcig
	ix1j5QZqn2+/NRvJSHhw3ioRe8RlNwDEHAZp+NSHUzJAtcVlS1KvuywcnwrmCc3TRIbjdWNuEGb
	WJJc4T3Pj0p2HT5rIOAzzVaMAiP+FcCVYhkMTKFx6pIC5kilAoHXseg0SV7ztCoLk0N91rQ37vx
	RLrAoA8TwEvbh+SomaP1zu572lyeraGo258Eb4O42EYrVy8zHSwJgvDlWxkxvWl7EnRaDlgY/jj
	Ks6ohYesjo4bP3DONaiIBULJoadoSv1j/oe3bbH3Cdk0r0QcgkB4xsu8zJARBiHvHOpn66fApWk
	LwNxrl0Dp95o6GrHvP+Ka6ZdliPH4VWV6PZGoCTvjNZDlXJDE7Z/QlnIalmrgwts4ew==
X-Google-Smtp-Source: AGHT+IHs/Sq89jQs6g/LDStY8aXlodA/lWSTMtWYmHFYXvFa/OIrprJ6nupIYo5fuon/DsAQTUfe3w==
X-Received: by 2002:a17:903:3843:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-290272dfc42mr325214245ad.45.1760475272018;
        Tue, 14 Oct 2025 13:54:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:31 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 10/18] libraw: patch CVE-2025-43964
Date: Wed, 15 Oct 2025 09:53:53 +1300
Message-ID: <20251014205402.1487867-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120643

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

