Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202F5CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3489.1760484800284473088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BwiMbIkT;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso5199039a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484799; x=1761089599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E9IK7jx4kGsq0qhSO9ij4dF/XwZmeonzqoX36aXpZM=;
        b=BwiMbIkT+QnXLvNnss5hp5l4U7nM4e9OBuhLhVZTt2kcfCyIhZ/qAOJVPu86w2pcdC
         Mh2/WI6h+Hzeuy4bIHSa45LLye8f6MZw7RFwVSBvvHyAZGzUZ0gbO1Tf9+rsyYh7zQzK
         BsDb59uUFG4Dm7P5dPw8DF1xdi9bMmqLHfbneiRy+tLEM6VCYsBo6sDBckrcDniVPMkZ
         pTY6CWOO/kPOZJKRH2JuoOLHHFTGT7mRVRLL8GgF43LPlrg7zRB5NCWqd6C2ENM9d/5T
         zQlA7qpjtHAlY0yGXIeVzjQxo7/dYRe9miu62fwsXvxchOexGKYskjetxVwB/UUGYUdX
         yBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484799; x=1761089599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E9IK7jx4kGsq0qhSO9ij4dF/XwZmeonzqoX36aXpZM=;
        b=O7QQHsWeBLwv/aKMJkMTfWtZjiwLjnVptzYyCM8zrAvlx3M6BDQ6BBx67Cgz01bpQ+
         kXrjUUj5GDyCp0rutaY1wiFsb9GSVAFKcSsNbobCas5q27l1+H7V1PljF/2bG3a59vpR
         0/uFyyqaQT4E2d8eEEq3B5fTC8N+9Lqn929OL3Envc8WizQ74Y1GvwSeaqPeFXrBXhzG
         YrTFzaHYfa+NkMwm+QcA6iGmZ2lNyVHUexH29KjguQdrRlgkYpagjjqu84DRHtjz1sHO
         laRe1MBMszJ99C8lt/m5mdVYFUby4s+lciJMGP4hnZk8OJgm2Y7ps9Qm34dS1Y7ofJyC
         Y1Lw==
X-Gm-Message-State: AOJu0YyTEbSFvibarkCuBbA/7em+iEtZkV/YTkBb2WQEQs4gteiA+YpD
	Mx9wEe3DQo7WWwq9FR+o9CBwMgrkl5WOz2ec+jjktnTRyCp3AikwvfqijZ3ffQ==
X-Gm-Gg: ASbGncue+Ncd2EM4tQjqb3tL5WQno4BEsucHDFVm3BOeMZo8Ul6XI36qba35Ko/Q/lF
	6X+EpGdjSvK6ca7+WSkbs2Rx+xrpBVVAYNBO/IIqqPJKjuhuV1nD/3UGn8LTIU4RVYWjn3ENVgL
	r3V6b/zjwBr21JtaaGi74dJPsyEFFsVeWeAiFQpnHCzWLgxoo6V0gNyjdXlsLsvUu/0jyfxdAVa
	pv2o8OCiiZJNOTZm01EQLDyW8/j0Y5NduhY3oyjMY86GhGsCklAt9L9NLdAY63wbxhXrtsVDFjs
	4cyVKPsXTqKsiCFWOlVlgLKzt96b5+0I6eT0mdPrNvRp0OkwFKY6qVxESN6Wf5f+kDHo2di3Fti
	sBy19E5hTRH7QRTBrUUQL+cIhwd43taGY3479tZ1mNR1kXHByZke8O9aKtO6LBvk9FQ==
X-Google-Smtp-Source: AGHT+IGolafeX9ECONveY9uIQznIhvVtyr8PB/QXzb/EfCjZj7wm+s1JrQ+0vgi2eNGY4p5mE2wTNw==
X-Received: by 2002:a17:90b:4d08:b0:335:2b15:7f46 with SMTP id 98e67ed59e1d1-33b51386306mr34080071a91.21.1760484799496;
        Tue, 14 Oct 2025 16:33:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:19 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 13/18] exiv2: patch CVE-2025-54080
Date: Wed, 15 Oct 2025 12:32:24 +1300
Message-ID: <20251014233233.304125-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120672

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-54080

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 40036aa47ad24659d20643195525310fc5fce123)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch | 77 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
new file mode 100644
index 0000000000..6a4c80f8a8
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
@@ -0,0 +1,77 @@
+From 6a0c63f1362dac8badfad5d2dcc55fb4ff04fc60 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 29 Jul 2025 18:58:46 +0100
+Subject: [PATCH] CVE-2025-54080 fix
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/e737332427711f15bcdc4e903203d6b7493eaec0]
+CVE: CVE-2025-54080
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/epsimage.cpp | 40 +++++++++++-----------------------------
+ 1 file changed, 11 insertions(+), 29 deletions(-)
+
+diff --git a/src/epsimage.cpp b/src/epsimage.cpp
+index 2e2241b69..bb4aa3303 100644
+--- a/src/epsimage.cpp
++++ b/src/epsimage.cpp
+@@ -241,6 +241,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+   uint32_t posTiff = 0;
+   uint32_t sizeTiff = 0;
+ 
++  ErrorCode errcode = write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData;
++
+   // check for DOS EPS
+   const bool dosEps =
+       (size >= dosEpsSignature.size() && memcmp(data, dosEpsSignature.data(), dosEpsSignature.size()) == 0);
+@@ -248,12 +250,8 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+ #ifdef DEBUG
+     EXV_DEBUG << "readWriteEpsMetadata: Found DOS EPS signature\n";
+ #endif
+-    if (size < 30) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "Premature end of file after DOS EPS signature.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
++
++    enforce(size >= 30, errcode);
+     posEps = getULong(data + 4, littleEndian);
+     posEndEps = getULong(data + 8, littleEndian) + posEps;
+     posWmf = getULong(data + 12, littleEndian);
+@@ -285,29 +283,13 @@ void readWriteEpsMetadata(BasicIo& io, std::string& xmpPacket, NativePreviewList
+       if (write)
+         throw Error(ErrorCode::kerImageWriteFailed);
+     }
+-    if (posEps < 30 || posEndEps > size) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posEps << ") or size (" << (posEndEps - posEps)
+-                  << ") for EPS section.\n";
+-#endif
+-      throw Error(write ? ErrorCode::kerImageWriteFailed : ErrorCode::kerFailedToReadImageData);
+-    }
+-    if (sizeWmf != 0 && (posWmf < 30 || posWmf + sizeWmf > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posWmf << ") or size (" << sizeWmf
+-                  << ") for WMF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
+-    if (sizeTiff != 0 && (posTiff < 30 || posTiff + sizeTiff > size)) {
+-#ifndef SUPPRESS_WARNINGS
+-      EXV_WARNING << "DOS EPS file has invalid position (" << posTiff << ") or size (" << sizeTiff
+-                  << ") for TIFF section.\n";
+-#endif
+-      if (write)
+-        throw Error(ErrorCode::kerImageWriteFailed);
+-    }
++    enforce(30 <= posEps, errcode);
++    enforce(sizeWmf == 0 || 30 <= posWmf, errcode);
++    enforce(sizeTiff == 0 || 30 <= posTiff, errcode);
++
++    enforce(posEps <= posEndEps && posEndEps <= size, errcode);
++    enforce(posWmf <= size && sizeWmf <= size - posWmf, errcode);
++    enforce(posTiff <= size && sizeTiff <= size - posTiff, errcode);
+   }
+ 
+   // check first line
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 81e9954c1d..947d13208d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -6,6 +6,7 @@ DEPENDS = "zlib expat brotli libinih"
 
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Revert-fix-copy-constructors.patch \
+           file://0001-CVE-2025-54080-fix.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

