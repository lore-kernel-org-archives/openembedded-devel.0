Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8286CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6125.1761651192296104635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqNl1Ep7;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a26dab3a97so3612868b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651191; x=1762255991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PksxnEiXXiZQ5s/e234FZiDyjA9S6rhXza6maTdvP9Y=;
        b=LqNl1Ep7KtCpgVvtIOddLXnxaMgQJIpuqvH/vPTCoJGptGF70towemTYX28KP/a+eS
         456/Ewz5o7LlIoaatk6COjZ2u5zc65DvaZ880wgm7r69Tk972gz8tGiw0I9SJxvOkxw2
         kkVxcXlRaQK+oLOl5eqOEjsCx85ITd+J8Ol52qff4CI3xrh7rk7TcCkH2fV4w8HKf1e8
         n+e6UtY2sxalpZ6ihSvESOTRD2dkzr/ZrV6Ft7F8n5LlOUu3nQ6TS0lWf31FIw+LqgPb
         xgIfbZnM2WWdDRwaXlJ7SF9OpMiTu44RUT3Lp/8qU074we9Zjbp2AKSSmgRqdq9+pouX
         xXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651191; x=1762255991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PksxnEiXXiZQ5s/e234FZiDyjA9S6rhXza6maTdvP9Y=;
        b=ZKJ68uinf1KNwr5qeiXIGKtaWWjYdDmKWpFb8dv79Zh9gjzF8Haa2tYPJa9673v56A
         zSv+FT0nrbvAjG3mmmK1iom3PALU1xeb/ECFhjqkkgynsi9JE1zEGktSxRePySrZh8DD
         /WScdU1vik7xkDIBoL4fPw2qaoCecJhHHkkoeqxqI/YYcTpFgpZqY9cCp0f5uSkkUC9x
         /C4GNj+efgb2mKV9MMhLlxjZzrrZVjmkz/4ccSr672G0lmkWAxjVtvnBx4nymH82Vew3
         7MnPzgC/wUBvOo5kCLWlZxcGsNIC1D2bTuNoZCTM5A+5d8ozbbB5cVsJ4yHyOtxbg4wH
         bL2w==
X-Gm-Message-State: AOJu0YxKUwoINLaMVHfLwzCN0orgMznrh+MpX8gCWr7J3qstsjUhHG+M
	BY+8iAM6mCkLHm85Rn3edOSIybZWjTk9YzfCgMK7wYCUrocrYz4IVhVeNf2tuQ==
X-Gm-Gg: ASbGnctUCmvokbFBsccdmO/yqYV0xdNBuqjxXvPjRduK/DsOR1iHcgSyaL6bymx8XPH
	9fmTBGetM04cE3oDUDX+KiwQ8cSPwRzMyqNrO4ed9zDzBOmkzAPqjBw6D828IqySUwVb7JBO7FN
	CswytN1JWeleEttXFcM9yZ/T0MtxFRpCMv/5hMpbaEmknfdTPv86CQiJKG7SDseUK4s4RbPhHlh
	GFLTHP+HoqC1cb7Xes+Mbqtqm3lCDaLTJTeDlt6fH1v8Cg/Q3OheW2/c2HQ7L8K5UYw6DIgSGSi
	0EZp0lvC/pDssX3qxl12kpQALCZKmVbTgtdDVV3qW+ZyJGeLO0TFMJGXj3qzZ/Rtd/de5NXMuDv
	A+gO7xVQC/AEiMbtRaoNE8eAKQHvQZtAJkixlcnVwk1+PqRpl9hOIyQaO1Qf9eZoeqjY38bUwKY
	Ckcie//almNiDfng==
X-Google-Smtp-Source: AGHT+IEtuibhpfLcG5HEwD4BnDXvCHItm11oF93oZf5GynaImEIewU9ANL132AxCHmrsa5zHaRtBuA==
X-Received: by 2002:a05:6a20:5493:b0:324:b245:bb8e with SMTP id adf61e73a8af0-344d2973e71mr4036614637.26.1761651191027;
        Tue, 28 Oct 2025 04:33:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:10 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/7] hdf5: patch CVE-2025-2925
Date: Wed, 29 Oct 2025 00:32:46 +1300
Message-ID: <20251028113247.1761834-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121084

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2925

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2925.patch            | 53 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch
new file mode 100644
index 0000000000..23bc4e5577
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch
@@ -0,0 +1,53 @@
+From 57a511958842f50cbf07b05262f2fe95e70c141b Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Thu, 9 Oct 2025 14:48:55 -0500
+Subject: [PATCH] Fix CVE-2025-2925 (#5739)
+
+This PR fixes issue #5383, which was occurring due to actual_len + H5C_IMAGE_EXTRA_SPACE being 0. When realloc was called, it freed image, but gets sent to done before new_image can be assigned to image. Because the pointer for image isn't null, it attempts to free it here again, causing the double free to occur. This PR addresses Quincey's concern and fixes the issue while preserving new_image and image.
+
+The bug was first reproduced using the fuzzer and the POC file from #5383. With this change, the double free no longer occurs.
+
+CVE: CVE-2025-2925
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/4310c19608455c17a213383d07715efb2918defc]
+
+(cherry picked from commit 4310c19608455c17a213383d07715efb2918defc)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Centry.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/H5Centry.c b/src/H5Centry.c
+index 6883e89..bef93d8 100644
+--- a/src/H5Centry.c
++++ b/src/H5Centry.c
+@@ -1051,9 +1051,14 @@ H5C__load_entry(H5F_t *f,
+          */
+         do {
+             if (actual_len != len) {
++                /* Verify that the length isn't a bad value  */
++                if (len == 0)
++                    HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "len is a bad value");
++
+                 if (NULL == (new_image = H5MM_realloc(image, len + H5C_IMAGE_EXTRA_SPACE)))
+                     HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
+                 image = (uint8_t *)new_image;
++
+ #if H5C_DO_MEMORY_SANITY_CHECKS
+                 H5MM_memcpy(image + len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
+ #endif        /* H5C_DO_MEMORY_SANITY_CHECKS */
+@@ -1104,10 +1109,15 @@ H5C__load_entry(H5F_t *f,
+                     if (H5C__verify_len_eoa(f, type, addr, &actual_len, true) < 0)
+                         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len exceeds EOA");
+ 
++                    /* Verify that the length isn't 0  */
++                    if (actual_len == 0)
++                        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len is a bad value");
++
+                     /* Expand buffer to new size */
+                     if (NULL == (new_image = H5MM_realloc(image, actual_len + H5C_IMAGE_EXTRA_SPACE)))
+                         HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
+                     image = (uint8_t *)new_image;
++
+ #if H5C_DO_MEMORY_SANITY_CHECKS
+                     H5MM_memcpy(image + actual_len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
+ #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 6bc56f22cc..2832c7e851 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://CVE-2025-2915.patch \
     file://CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch \
     file://CVE-2025-2924.patch \
+    file://CVE-2025-2925.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

