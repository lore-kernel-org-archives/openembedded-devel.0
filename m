Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0728CCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.3559.1760484781650121486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtTFp0mW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so5233653a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484781; x=1761089581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVYTYDiJtg9yXCCu8MvIt5olGPbEAq0roNm56tIgTfk=;
        b=XtTFp0mWp4/ldag3DjIgA2lWe/zUAgiNZt8nPXUJ0/vLMdHg2HzT93JZyZEmK62LrE
         cwXA6ifuZ6yrQt9aatHtdsgE1tqFGyXteFyEnCk4469mn6nNsF3IoUDpb8VmL2tw20s1
         TV07COWlKkcvKlDyKnDs/7byD12geaxhw9Qer2KYiwZhPXIYFcr3o0jWn4xnCqiOhlVa
         FF/wOdiF6zusDHGCSR92HlmpThIntsZdPYNj/z4Iye9UZwBzuSzp/steOqZMQSLYpNZX
         xLJfITvPDxonN0W5VVexQ9qLzbPc/j7D0vy7MNpKVYkf2PQO4UgdPdLsblE6/eyraGcM
         W5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484781; x=1761089581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVYTYDiJtg9yXCCu8MvIt5olGPbEAq0roNm56tIgTfk=;
        b=cXhfJ+jAXOTsMuOXEvsYixe1ATQs71toWXp4TjF55f4ykh8JMzO6ZLQffD7pNtLug1
         iiQ2QUsBqXIaogOOR5a03C/fi0TJh1ekPO8R2b43neLfG9hhXMHtKdARMHUDHx31wNY5
         LQR3VRXy1UnXzVRvnM748WqVvCxq+C7yJBb2nltHYP72eB5zu7p9tCOZk37VNQTEN5gn
         RyA3wK3l3M8+oHXgnINpPWx/Z8HGOrCm64SsbdyeOj6fjIcK8/q7Js4ID6uPveiHEdtB
         rH85FZs1L0xMkyQhR6498ThRgwsbJ3/2hHSEpL7wYQsEXL26SCiOm2h4BJp3Qqphmh8E
         A4Eg==
X-Gm-Message-State: AOJu0Yx9qaI7fGRgDWAan2F/6EhGPUwvK+Q3d9+5NLyOvldWu3buk7sg
	iuNeNMEUt5P0OxQlNUZwRwOieffaSa0qXO5/9+LgHw0eBpYi+uCW0pNk9S0cGQ==
X-Gm-Gg: ASbGnctD5zaJed9hzQeNw0k8bnM73VRccre9JsJkujkdmcHwg1txh8F88WmY0b0Gzz4
	Jun+kvFpvcN23VlYJCJGFS2loxddNH9anhgoI59KezAngiu+mvxKDjTlzoK6QXIyoXuLAQJ9joO
	8HplGeqDlgN3yO/dEhaJ88534FOb8FSCQAuqD8Fc87I5qA74wEywPmyvRUfSNoKCCTXIt3Ts/Kx
	/qU6eUJbyhIfglnBq85DDPD7CNkul8XHoDd2h8qdD4AL2i6DQCBqdAq00s7n40Q3COAsk3xe1Jh
	fCsxP+TXeIw1u4/kmaLsf8GUT3YRwyyMtARXAh1O7a2S3JSB/iP4dp+HqUYhwhtqtvK1+u2rhpD
	4yKHZO7IWv5VG4dCgQX4byt1hlCmC0imbYg6wST2uIsn3+ByY5kr6QuQ=
X-Google-Smtp-Source: AGHT+IEaPl5TAobekuypzsabVe/QaakO/ROMUbjgDMz2j+BFvWw6zHO3ZTvwGOlmgJ7PuPFbNWOpnQ==
X-Received: by 2002:a17:90b:3a8a:b0:32e:ddbc:9bd6 with SMTP id 98e67ed59e1d1-33b5138408emr36408846a91.27.1760484780894;
        Tue, 14 Oct 2025 16:33:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:00 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 05/18] hdf5: patch CVE-2025-2925
Date: Wed, 15 Oct 2025 12:32:16 +1300
Message-ID: <20251014233233.304125-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120664

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2925

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit e7832348a68e4ab18c981b3ddedb6627d989a997)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/0003-CVE-2025-2925.patch       | 53 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch b/meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch
new file mode 100644
index 0000000000..83348190dd
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch
@@ -0,0 +1,53 @@
+From 57a511958842f50cbf07b05262f2fe95e70c141b Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Thu, 9 Oct 2025 14:48:55 -0500
+Subject: [PATCH] CVE-2025-2925
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
index 06a375c673..540c8459ea 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0001-cmake-remove-build-flags.patch \
     file://0001-CVE-2025-2923.patch \
     file://0002-CVE-2025-2924.patch \
+    file://0003-CVE-2025-2925.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

