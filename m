Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E824CCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:17 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.9102.1761651189942191388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOY+bma4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso6251066a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651189; x=1762255989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzuPBWp0imlFZrzX8iqVMM0Ddn0cz3+WseTpTsn7U7U=;
        b=DOY+bma4CDs2kVKKWBD+7grrB+D4faKz03to4lOUUTGSE+RJst8mds1UPXs0Wpp+xs
         GDS6AAoBdOyYHcNGEf6zum4/x1UVSaOQmpsuGwMV3odoxGSLD/vMSRGL0RXRLNz7jmOg
         TaSzywn3Iao8411pIuMqZOZlLy6n0QT2Q7K9KbhKNAilxwbfvNUiCnyqlqggDbLkCUgM
         C84P45XeJDhSHFjpv5ocPVB1sKGN49je52pyChb7tspP5O8dBj1lrhSehsw3LRqXh5qW
         z/lGtrUmx0OQ9eLbtmQbxiJwYN1okA6VWULlk2A7Ks+kPuL2sDf9rfuzpcqJ9bMyzw0C
         xn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651189; x=1762255989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzuPBWp0imlFZrzX8iqVMM0Ddn0cz3+WseTpTsn7U7U=;
        b=G63IrhAgjWpYzKl28v6aVPCVff4gchew37u5qhSSox7fD6kiDdm4b+HUmYOjXgJ1uo
         udw6aHa8QbvTfMzSq915zJtMM5BnNSVBBUcNaFvzXXnM9/ONNEBIuq43FcofJALXKnA7
         rTZTbxJlownbnqAjvbd8Ma6YJ2JDf4LTdBMWGjTrHZ2V7VW1Yaeo8bkMQuwddYnqDOmh
         R79rwIS7gi5XAfmw0X4DpYd81uNaoJGf9gfGnhiaEg8c507EBYOZemHNoJQQFxFSsw66
         2Jge28GdhXEjjyfaZDcsuFh94OzsGTjgd0AK2/go3wG8M0bM27he3/VWCZJqTpJvybfR
         hM7A==
X-Gm-Message-State: AOJu0YwXqbQOITtWgYBbvxaffUXTxLpINjjw44ac9q8IjGNFk8N2/kr2
	yT9vt2SW7cnNeCWHJntWB40xMKrsRL/1b1SMb9Xz6Z+4OqNYTiJJ0LhMetqbVA==
X-Gm-Gg: ASbGncvFwkGsRVM2QWLzUIiVzbnkBsicESkVW4mXGnn2Elg70vJpxvsFQg67CWzpbXG
	wfcBO9/RDTrbTexE5a0ACA1fw6asjYSXRy6ODNJEzkpoQEpmqy9PONNMH4vueUWLUdMWIWLlrHj
	BCFdEpcHVXmZMVTxlgdUem8KWWkZu4IH2qlkiuTBnm/2jai//Rz0QQD0hno4IdFO5p8GWegSYC4
	YVJptYlKbMveN2jaYyskrH0vQq+7P23YYh6loUuBL8XgnJsTrb94WnCrzX5Na2mWuNLPOv+VKDl
	CXe/1ltQ3ZF/V4dVOtkbJpecknI/SDrq2iTHIo7uVY/YgqR1NE1t+DC6LOkv9jWn17e8wJ5A9yG
	QzBTzY3OCIquXomZ7HUT5DVLQy/KsNDdU9CnyrORSX0WKQJxFdUqLgWbGLQY/eiHSr6qdE0gVpO
	7eyvg74uHrqZ+HEw==
X-Google-Smtp-Source: AGHT+IH0d3lycaKTvrVT02Rj05bmQAz7R3lnGcsYTOnQ2/TnIgYnY1hKNVz+ItiEKgaReIwX1EVOzw==
X-Received: by 2002:a17:90b:3fcc:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-34027bc6fe8mr3642118a91.19.1761651188877;
        Tue, 28 Oct 2025 04:33:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:08 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/7] hdf5: patch CVE-2025-2924
Date: Wed, 29 Oct 2025 00:32:45 +1300
Message-ID: <20251028113247.1761834-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121083

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2924

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2924.patch            | 37 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch
new file mode 100644
index 0000000000..1a9185dd66
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch
@@ -0,0 +1,37 @@
+From 3a6f6c1f57c09281d4a9d11a1ae809fd21b666dd Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Mon, 15 Sep 2025 07:56:54 -0500
+Subject: [PATCH] Fixes heap-based buffer overflow in H5HL__fl_deserialize by adding an overflow check.
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
index ca963fdc8f..6bc56f22cc 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://CVE-2025-2914.patch \
     file://CVE-2025-2915.patch \
     file://CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch \
+    file://CVE-2025-2924.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

