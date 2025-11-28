Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A12D116F9
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3263.1764361134560408716
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kx3SScQN;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1453494f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361133; x=1764965933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bALTHpv3kBp8MeFQInSS5WUNfM+aFDcTIgL0tFUCNzc=;
        b=Kx3SScQNk/nlg4n5BWkmbz3A5MLPCdbduRwJd97iZqIgJHo72bew4fyWqPm3Rl5Vwe
         iZzjUQiTkvpyl3R/dIx+UxqtGN3lFCx5AISFgAMzsGm5o839I+m0LCPlRbU8et4jj3zI
         LqCMEqAZYRzu9u0fkBXHo3isLdomujUCriTR1srAca8h30Z2npEN+XsPkKahafMGeXX/
         8JlFdok3Xq5doRBDqizAbCW8xrI2X7Hbu1ijnEJabxYXtScwe9ZlS2sMpfbM38mf1vFe
         3aYZyloWQUNEVRL1fBGaxwL+xN8xMMqpm12UEfRWG4UPsC3jQslpbF1lYgjpOychWpMt
         IBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361133; x=1764965933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bALTHpv3kBp8MeFQInSS5WUNfM+aFDcTIgL0tFUCNzc=;
        b=Gz4tHMJz2Mx9ZSzSUiIz25FwUiHAUBwSmIVEgizfnCL9AhOCQ6fopS5EnbV30lOUvO
         48Tt9YnmXcVwA545FjW7OIEikgwvzQLZvm+lMql06hAhEPLUFjALgRMTIbrnFGAW9Lqn
         q0owYT98/eBbJEq084SqpgDqGWgwuq5Un+nia631VGYOygLpKmaPLvmUjRczg8GhMWvZ
         kVjF/vdCuvrqO/HaD/wAEzsE5DAYQsRl583HwuNdq4lx0oIlAhoAgAOZ4b2uFNnh5x6o
         bElr0ZnTj8ME3I2yu8ak6znOqHVmNrHyshcAWVcDA4YyHmflo7LgfGX35tsHpaUdKlV5
         LDHQ==
X-Gm-Message-State: AOJu0YzLl9fP6f2CbDF+xmlZAuN54sF5x7shLdV8AizvcziPxnyS+/pK
	9Z8utkwLHii75AxYzQQMvsUu4Q39SAYYIg7mn8VaWQ/VxdyQ5On7b8JiCkw8fA==
X-Gm-Gg: ASbGnctX9DpVGOfmqQfqbNN8mY1hB8Wh+iArTdp2NIzUTg0ARkKefdLhPFGmvdRu2Sd
	JcBX2FWt6OM9vFWwvHmcEQVqjjta0ogibwUk18u1MeENkLUjYN7SjbrgO2XhzZBX1w4iqp8SZ0d
	ACeEj/gnO/8aDhoOnEXNLntzA0iNwj3+Gd9mFPlPrqTGA8GVjDEWGdya46zLxv+98KU9o+CcQzA
	WG23hk8EB0wg5GOh8Jo8L9r3hk5m2kz46jYgvYVtoLL3tsaRKqkQraiX0Y0p80tcQhzFxpV1bp6
	tA1ghQ+472XwzpqO8Y3+OkOLOVFpbSB5TKcys6QzZXEkmVMNyZolXQRFCONFJey3M/dpBGJyX/w
	UvwfRIXAFZ06pxZTI8rCoyU8hTAlOzBGf7vAknMLY6mL49X5VYGoBT4nLCP8N0itEkxUpiKmh1w
	StIJ5jBsa0AMSqAxompy8=
X-Google-Smtp-Source: AGHT+IGMDXcdKvkD5TRCZYgrDEJcJBDEKzcAHAH2Z/HzEQFa32g8UaE3XDZJwwu9N7nbFk0A4UK3uA==
X-Received: by 2002:a05:6000:2484:b0:42b:41d3:dafa with SMTP id ffacd0b85a97d-42cc1d0cfcemr30070470f8f.46.1764361132811;
        Fri, 28 Nov 2025 12:18:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/14] libraw: patch CVE-2023-1729
Date: Fri, 28 Nov 2025 21:18:42 +0100
Message-ID: <20251128201845.2578315-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122143

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-1729

Pick the patch that is mentioned to solve the issue in the issue
linked from the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libraw/libraw/CVE-2023-1729.patch         | 25 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.20.2.bb   |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch b/meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch
new file mode 100644
index 0000000000..db6f2a2d9a
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch
@@ -0,0 +1,25 @@
+From f7a1082a65b444d606d82ae71e1279789601f78d Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 14 Jan 2023 18:32:59 +0300
+Subject: [PATCH] do not set shrink flag for 3/4 component images
+
+CVE: CVE-2023-1729
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/9ab70f6dca19229cb5caad7cc31af4e7501bac93]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/preprocessing/raw2image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
+index 18f897eb..64722efd 100644
+--- a/src/preprocessing/raw2image.cpp
++++ b/src/preprocessing/raw2image.cpp
+@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
+ 
+   // adjust for half mode!
+   IO.shrink =
++	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
++	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
+       P1.filters &&
+       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
+ 
diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index 51057f97b7..b331d77e8d 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -2,7 +2,9 @@ SUMMARY = "raw image decoder"
 LICENSE = "LGPL-2.1-only | CDDL-1.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
 
-SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https \
+           file://CVE-2023-1729.patch \
+           "
 SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
 S = "${WORKDIR}/git"
 

