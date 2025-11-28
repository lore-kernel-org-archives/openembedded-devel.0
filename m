Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EEBD116FD
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3264.1764361135872978461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqWi5qcW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1394379f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361134; x=1764965934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6go1kSWQs/vxvFPF2KjsRCFxtk7adCP0fQeaTSnFih0=;
        b=QqWi5qcWJ/qmHhDboEsfaQgzippmqwGISKkNjE6zOx8yZ5B92FsWZ97a2esSlPaoTB
         Py2xakFr9KmZmO/0GhDKqvrAUijtrcmBnc2wOcwMd4D87oFnX+Gkh31ISi1pkX3UB+CE
         Dyvp119sXZqc7H0Q6EjYNjDUolgOK7DyCuwOuggYX3Y/ztgYlb7mZWNqwmPq23IpJqpd
         ZKg+Oi2aFi7ea9Fm52S0TCfU/JHIqZ37njTZ956QhiC9to5eV/+HcYq9s1MNpeU5U3GL
         HGvfg/GkTj5qCApx6jT6yBvFO6QCK7LqV6cz+n16/lVEMHAWwbul1V9rMIYo1pFVYqAL
         mOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361134; x=1764965934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6go1kSWQs/vxvFPF2KjsRCFxtk7adCP0fQeaTSnFih0=;
        b=Lrgb76igLqGR1t+RC8nhk0qeQsNkqFq4odkVwX7Mwi8+XmwIvka8G5RQmxkXRV1Vyc
         F7LsheVNis0lVx5nS2gUxK+U3wxzHBnzVEX+4i7viJBH+9+Frj6Cz0VLuB2LCO/V8tP6
         lsTtSmpXouNOj9GmYZ/c672+a7vcwm/L1iRq68oC+KW35nA+FMpqA22T5W1YjlT+Z6zU
         Ae0O8clv4FO2Sdn06PwE54BMEmr1zvHBvF5QJ6C7qtOGQO7hWleMqDXCMyo77Huo86cD
         wBWzwPhGJlMsfYiwzTc8L3bAv8dSxRO8pjUNdyMYolckimKxwUp0BX+Qe5ZrhrDZwwG0
         1xFw==
X-Gm-Message-State: AOJu0YzDrQ1mifdqVlQ3EKSWZ2F5/66J0f2KZEFmAEd9z4B7Y6ntPA9A
	gLQ9bbVM3CxBH+AqMT23GG2e5XN7WzTnhXQBMBCSGnGMigUrnebxyMtUFRtOcQ==
X-Gm-Gg: ASbGnctEJXoh+Jes99vCgs6vN6qscU+pP4PBFNW3M9HheT6IBtNpCJbXtfkd0AyYUwB
	H1wNyoK3a8IoXZbOmCL9jTRR3OgxVPiaVWuh2N2nWR/Is+lo3GN6si1edE0HgB6QRi3JHQPI7WV
	P4Nta/KbcFYk/ujh06DKuQuZOR1DPvzvPG3De6KFKjF3vdq2HiGJgg3blBw+FQIVS7XFT9w/a7e
	6PZRSICiW5VSTLFy0lJDVS1XODLS+4i+OZP4prNSQlZWIZCr7of9qmeJMViI4SPcji53v7RZTkN
	XODl/agAYMBM6KqonvKwFewlVL6AICWxdCEFxMq2NqeBbm9v7D3DRioLSdZih0KYGifzB62UN11
	dV2bsLj6yOQBL6Z9yRDzsFUD43Ce0e8iknQKdYzRma4SeluR1ewwrXb8lgj9+qNpynAbqHP4Okx
	SgMFi/PIzl
X-Google-Smtp-Source: AGHT+IHP/1T4+y2cOnWZ5seVyUOnThxhkD6dB9Hh0z1uAkcRGDAexGwtH+Irp8dF8tLj63cB6bju7A==
X-Received: by 2002:a05:6000:3104:b0:405:3028:1be2 with SMTP id ffacd0b85a97d-42cc1cd8ecamr28550160f8f.11.1764361134217;
        Fri, 28 Nov 2025 12:18:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 13/14] libraw: patch CVE-2025-43963
Date: Fri, 28 Nov 2025 21:18:44 +0100
Message-ID: <20251128201845.2578315-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122145

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-43963

Pick the patch that is referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libraw/libraw/CVE-2025-43963.patch        | 36 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.20.2.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch
new file mode 100644
index 0000000000..9e594dd110
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch
@@ -0,0 +1,36 @@
+From 188a8ba8e1e0a7a85d04dafd867a1a069b568ed9 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Thu, 6 Feb 2025 21:01:58 +0300
+Subject: [PATCH] check split_col/split_row values in phase_one_correct
+
+CVE: CVE-2025-43963
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index 2def6d6e..00a9bc1e 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -211,7 +211,8 @@ int LibRaw::phase_one_correct()
+           off_412 = ftell(ifp) - 38;
+         }
+       }
+-      else if (tag == 0x041f && !qlin_applied)
++      else if (tag == 0x041f && !qlin_applied && ph1.split_col > 0 && ph1.split_col < raw_width
++               && ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant linearization */
+         ushort lc[2][2][16], ref[16];
+         int qr, qc;
+@@ -288,7 +289,8 @@ int LibRaw::phase_one_correct()
+         }
+         qmult_applied = 1;
+       }
+-      else if (tag == 0x0431 && !qmult_applied)
++      else if (tag == 0x0431 && !qmult_applied && ph1.split_col > 0 && ph1.split_col < raw_width
++               && ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant combined */
+         ushort lc[2][2][7], ref[7];
+         int qr, qc;
diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index 2e4ee20633..8d82d3a49c 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https \
            file://CVE-2023-1729.patch \
            file://CVE-2025-43961-43962.patch \
+           file://CVE-2025-43963.patch \
            "
 SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
 S = "${WORKDIR}/git"

