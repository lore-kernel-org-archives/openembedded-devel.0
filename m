Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12196C87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:55:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.6660.1754171745602673677
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM5wnOV8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af0dc229478so309390166b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754171744; x=1754776544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKFI5GCC8KnF7ZFiWUakvihNk96/5lboe7JON1MWfrI=;
        b=VM5wnOV81H9ZDV9BQqnTARS4TruPr+/wb/8E+UCIzeSC+pRidXPWm1AtAZuwTAzSjS
         Vt0K+B0WjpdS3o6TPcuspVen9VrgPWD9HtNDtJQtfQgncl3EsgQDo/mKFtRCjG3qMKji
         rshN9UrywHvQ9cDJx9DT6BwKqvdB6wvIGMnCv4l4z9azeCx3BE8JQkTmC/vpQ47bwUcV
         9TKflsm1/py5aCS8wZKWimWCGdt7MMSK0fyMjhqIb/BXU1/tCHWnqU+ZAPQk1+z04yck
         ma6RrNrg01mOIp5YeNe04BwW2j6s8WoxLapk5HH6/F4jtqlhCZvBoqUizOu+W+wa/atT
         30vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754171744; x=1754776544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKFI5GCC8KnF7ZFiWUakvihNk96/5lboe7JON1MWfrI=;
        b=FW1MudJYk3vUnHJHSkgiwleKtzpOZ/Tl56ezvSSJ+ZdE2o82kdoxmcs1vZpSgt/V9W
         R2GYh+rpyvfd/RO+cfGrBkFurnlEnE/MTaSfNWw4jy5y0ZNqDMS/D1J73o8h5NVfImz/
         Y7VjD5uLdJWzJ24RtLTecPBDmYZXmiDYRTbem5ZficJbjoU6H4X5ZgfN6I2QezcTKdvp
         Irz/VJHrkIRSmMyUDgXVxy9LzYHEStiVGAmaME+dLhxnMvH5o0wHTAh9S/AgVZbXhbGK
         pWQg7CJZK0OHYN6ytl43JtQpuLDacGC9KrOlKdCxhxPvmJ13PLXN/L0/TQNDsL7CRtsZ
         514w==
X-Gm-Message-State: AOJu0YwVjBLqkh4x9jFXIiUcyhgcO0FwFMyardERuYpcqP0ezbH09WYZ
	yQLORDKisT4nD1Doo5mUbyQ5rib1e6YXtpCqaASRQSMn4ua1DOw7LOTqq0l9nA==
X-Gm-Gg: ASbGncuLlT2cmRQslZmrIye5pMNpT5sM+MgmpleHvrjPXt3Rj3C4XXPEEXaNjTu4f4B
	7vnRHUwU3oy0ROuBzaEVM7kUCsSa+53HWLPqAKzHAuKlycqloCHphlUdh7zC+WmZd1LXvjgj0tZ
	Y8HVRiFN9wQPWKjFLwmR7o43imDyzNM2ta8AzrzibwCE37uLPK9Ezo/SdcrLA6hitbXMcmHZ7PC
	2bTG6mM0p5pikSi308ILiMit/vYmBO7Vaahlrex79eh7ej/+Wwt2u+f65Es6IU1vvV5+VNdKKPr
	M+WA7csejG29IYGw6CM6Fm/2AK4JMEtRAHdC4XojPWye1VHXNPO4y7q5Qd/P7g9q7RVnluDOle8
	em/anOxYAFx3PRnHf1H5sfTePTw==
X-Google-Smtp-Source: AGHT+IF6NEzxF/JqxH8hNOotolfdLhZLpNnZjt8Kw+jHEHYr8x4068y7aFL1O5WL07Tj1TRHvkkguQ==
X-Received: by 2002:a17:907:3f99:b0:ae7:1c2b:b715 with SMTP id a640c23a62f3a-af9401932camr467882766b.49.1754171743421;
        Sat, 02 Aug 2025 14:55:43 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a1e88desm492741866b.71.2025.08.02.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:55:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Roland Kovacs <roland.kovacs@est.tech>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] jq: add Upstream-Status and CVE tags into .patch files
Date: Sat,  2 Aug 2025 23:55:36 +0200
Message-ID: <20250802215536.3321-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 21:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118831

From: Roland Kovacs <roland.kovacs@est.tech>

v1 version was merged instead of v2 from:
https://lists.openembedded.org/g/openembedded-devel/message/118302
add missing Upstream-Status and CVE tags from v2.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch | 3 +++
 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch | 3 +++
 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
index 93f55eecd0..8b8243b752 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
@@ -8,6 +8,9 @@ This commit fixes signed integer overflow and SEGV issues on growing
 arrays and objects. The size of arrays and objects is now limited to
 `536870912` (`0x20000000`). This fixes CVE-2024-23337 and fixes #3262.
 
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/de21386681c0df0104a99d9d09db23a9b2a78b1e]
+CVE: CVE-2024-23337
+
 (cherry picked from commit de21386681c0df0104a99d9d09db23a9b2a78b1e)
 Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
 ---
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
index 3e27a13036..64a44a1307 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
@@ -7,6 +7,9 @@ This commit drops support for parsing NaN with payload in JSON like
 `NaN123` and fixes CVE-2024-53427. Other JSON extensions like `NaN` and
 `Infinity` are still supported. Fixes #3023, fixes #3196, fixes #3246.
 
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/a09a4dfd55e6c24d04b35062ccfe4509748b1dd3]
+CVE: CVE-2024-53427
+
 (cherry picked from commit a09a4dfd55e6c24d04b35062ccfe4509748b1dd3)
 Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
 ---
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
index 237a50413f..c3dfd8ce21 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
@@ -9,6 +9,9 @@ GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
 but another case (`0[[]|implode]`) was still vulnerable. This commit
 ensures string data is properly null-terminated, and fixes CVE-2025-48060.
 
+Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/c6e041699d8cd31b97375a2596217aff2cfca85b]
+CVE: CVE-2025-48060
+
 (cherry picked from commit c6e041699d8cd31b97375a2596217aff2cfca85b)
 Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
 ---

