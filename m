Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FF5CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3556.1760484779465110539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joj5shDB;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2698e4795ebso57818305ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484779; x=1761089579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os960+YvAPECZcOnkZ8D8wTgTbF9vHvo7RSwctv9RwQ=;
        b=joj5shDBqRCep0cqLM3GPmetE2k+weEQjOBbCS/s7ZSNAJobIUNkr0j21TKwh1BCsk
         xNJ67zM/kvAfY4r29do1tyKkg5Gx0ZBVsV60bh1aPOSaTGWCPj4Gwy4S78FYrN7fgxh9
         nVP3f7wegU9+VWvsXHnx8sR3EgOK3qiWftPRHO+hFbn9gEsGHl5b9DAlt7VdX3THiwCa
         f60E5RSU4gBKB2G5ddRVIpqCoIUOTpi9bVEAvJmu+v3qyzqFjk1ZgkEhnEyAWDTc35EN
         udglhR0VZ+wJWJhZqrSvGpTo151j8Z1g3BcTs2+2e1YGVPxcagMGD8fPvtbFI+ymZ0xQ
         D9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484779; x=1761089579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os960+YvAPECZcOnkZ8D8wTgTbF9vHvo7RSwctv9RwQ=;
        b=v/H9Kx3l9FbOIqXxNzhveY4Vgr2pUafEvwbYSuRTG+ItKSGYAwFLWuQHAOjpQCXq1D
         sh/7qo3qy1comYRIfVqguDgAxh1dXJx7NgUz9AX1GDvR6osGfzyugwhuQYUHLWR8SU6C
         Tif5OuGG1lPGgAIskmQ4hNyTZEgYp5I70nQcDdOGvy8ILuSs+D+u6uE2czwvomxjxpW6
         uNpZ8ixzq8XCvCjn9C0QyHH+k97NtFVZgT2EQJyxoEOq3cGM9N+O5/OYzkyUgjZTnvnL
         qH1v6RjlvYauc9enBxCU5C7qo1ZiBCXpMEt+/s4gH+stoNWom4e/iRa43+JPd0m76mvq
         e3KQ==
X-Gm-Message-State: AOJu0YyvY+KczgO5Wawxrr+5tt28mnc3xxsHGXflFDrR6UlmymyRyTis
	1CZpXkY6VFWtfw2SonYs4SAHdHrBIWX4MOpahyIeIUXmb4zgppb/76UfdfcMxg==
X-Gm-Gg: ASbGncu/3IjHM5PthjEaf8l4Kzph5vzcsw73y+sBv9+niKAeo4QOe3m6GlCWJFYSjUS
	Pg3aH001UuSTLIBBloJ5s6YzKqMkz/UDzB7Q1HlPMSAshyP2LaNnawNLo/GSSHLQnKTyV6/iWvk
	Ojz2Ai7fzcyiJ/ki9UUhC1agHBDqOzPyNgx6BYY0nABG93tSj/yurwhAkjlGNrLKlMTEu5gbdTU
	lwsZujgbkRxPxSqiO33U/ApiO18n9/TKooedKbrIYJrG9dfhY0pDFWsupwdvhAkBQxD8sO4FMgW
	53dGq0lV0Em82WGxFM5ozpgd/5Mt+HFzeXgVlz8lGCxaLKqHAL+cckUhObzLAqF4Ibw/vvdRu7t
	wzjlZFAWa4OOcSHuw3LhpKEpiXK0l4gA2sparmkp0OCpN8WYzV4eg4IzWQjmoXGi5eQ==
X-Google-Smtp-Source: AGHT+IG6zvBOHl//S+74IVcjDX1nr03OP0r+CmHgg7Y3qdAFMk0ZbvfERq0IIuKjtYlU92m4HKemMw==
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id d9443c01a7336-2902741cf99mr339075875ad.52.1760484778597;
        Tue, 14 Oct 2025 16:32:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:32:58 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 04/18] hdf5: patch CVE-2025-2924
Date: Wed, 15 Oct 2025 12:32:15 +1300
Message-ID: <20251014233233.304125-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120663

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2924

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit f0cdeee91832709fe78b1f2af2a0504af80c41d7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/0002-CVE-2025-2924.patch       | 39 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch b/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
new file mode 100644
index 0000000000..73ee50db1f
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
@@ -0,0 +1,39 @@
+From 3a6f6c1f57c09281d4a9d11a1ae809fd21b666dd Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Mon, 15 Sep 2025 07:56:54 -0500
+Subject: [PATCH] CVE-2025-2924
+
+Fixes heap-based buffer overflow in H5HL__fl_deserialize by adding an overflow check.
+
+CVE: CVE-2025-2924
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/0a57195ca67d278f1cf7d01566c121048e337a59]
+
+(cherry picked from commit 0a57195ca67d278f1cf7d01566c121048e337a59)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5HLcache.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/H5HLcache.c b/src/H5HLcache.c
+index d0836fe..7f412d2 100644
+--- a/src/H5HLcache.c
++++ b/src/H5HLcache.c
+@@ -225,6 +225,7 @@ H5HL__fl_deserialize(H5HL_t *heap)
+     /* check arguments */
+     assert(heap);
+     assert(!heap->freelist);
++    HDcompile_assert(sizeof(hsize_t) == sizeof(uint64_t));
+ 
+     /* Build free list */
+     free_block = heap->free_block;
+@@ -232,6 +233,10 @@ H5HL__fl_deserialize(H5HL_t *heap)
+         const uint8_t *image; /* Pointer into image buffer */
+ 
+         /* Sanity check */
++
++        if (free_block > UINT64_MAX - (2 * heap->sizeof_size))
++            HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "decoded heap block address overflow");
++
+         if ((free_block + (2 * heap->sizeof_size)) > heap->dblk_size)
+             HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "bad heap free list");
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 4305826b22..06a375c673 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
     file://0001-CVE-2025-2923.patch \
+    file://0002-CVE-2025-2924.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

