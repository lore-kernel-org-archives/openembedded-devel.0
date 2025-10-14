Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5CCCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:26 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.312.1760475260813969715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSgEJBUq;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b57bffc0248so227528a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475260; x=1761080060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVYTYDiJtg9yXCCu8MvIt5olGPbEAq0roNm56tIgTfk=;
        b=TSgEJBUqu0DT6gRwLjhJawBw2oY6Ktg4UUt9Cp4LaQTUvdsCwZjTY3Q1X9y8P48AIb
         VL6Nx5XAR9h3gvOOIUh33Q2kssWpshRKgabE2Xm67aMmVJVLvtACO0MZK1YcNwOKYtZy
         4iBkfp1mK32mvIfiiyQsvh51tr6iaT0psSCLi0iFB1kj+xjZYelqeGmCDa+gDeU3hj3G
         IdDtpLvSmewxQ8IpdnZcI14/7LdcCpJeRyZ3YXRVloN480yJIeshXw1hrubCjSuVAGqL
         61Wj4tk3OBN0Jr0FJIjBLSlTmF14yaBdP+c1gKAfucZTmS3rXUUGC3n1OXx5ao1jcZVe
         Pprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475260; x=1761080060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVYTYDiJtg9yXCCu8MvIt5olGPbEAq0roNm56tIgTfk=;
        b=vn1PDfcYioRzU+cXRm6nlCQFTy2QLnAU3Ytb+O7XMCQItT2Y/1K1nbUkzR9hc3ZAU9
         0fU5Rguao1Tr4jMxur0Zk8Uo2PQmxOraE5HMkgJFmtcMLvn6ou1wgf4ThjYhU9xtjh7Y
         LfV8uN3dTPhVm52eBFvS5ipaiPBkBvYnTY/P9lIPzAh7FWbkHVhRHvJ8E3fR33bM7c1n
         +sUw1fXYjq4666Smd8/76M5u/EE5ZiqUkEDhKXF7r5UsgrGd/JL4IK6CThEuk4vtIVCi
         c6frYSShr+9Iliisc6LOtKpdR8qMnNTl40Dq2uvWMcTjIK6wj8r9xjPccnFTeD+OF2VQ
         ZdtA==
X-Gm-Message-State: AOJu0YxMltyWts2Zw7dUXGoVFLGLaZLF6Cq3ww3bPA8WV3mKbN59dIMq
	WGdrV+AcHQpbUafokZjfKLKcObVvd8xqHmQJtK750D51Ksr+WJ3GyOP6gDd7Lg==
X-Gm-Gg: ASbGncvyxzWZEzXK+hJVYhI6jz2jJM+rhYQp3ELRK73VExQ7WSvpUEeRDs3+1GCwPwT
	zIDHF25/X88JEMOImA/M1kg+F083YRBbTQklKM7Lg/x3Xd3BEadaV4YWfbsWjAscckHLYhE0QE2
	XfElyFxvjnd/ldAiCKneYJh5Ou7R/sb29dfivTd8hue3KRhz2Bg31FkUEYUAe/kRcokA34pb6X7
	py2h/0XD15zFzr33k8LsrrcL86Szeekncus31AHJ5PCF7EALISNHlcYUGS5tfmX07sze4SYTgNG
	X6hMD4XZLWBbUvjQ/hdT1X/9ut3ioHOjo3I4uQYuxjBGk68X473Y7TCSta6bEFln2ojr4NvFqpX
	QuOKn+EDfr2jv04obnkH1gw3PZu5OzXFvIClPElz9UdaCPAjNGusXYl8=
X-Google-Smtp-Source: AGHT+IGabVRhcguCIZ3RRr3DB46yyLvDes2A/VujGefZXPxrRUmjBbae6xlIS2Zc5qtBxES7NYGb4A==
X-Received: by 2002:a17:903:298e:b0:28e:b14e:d45 with SMTP id d9443c01a7336-28ec9cd7160mr395593555ad.30.1760475259950;
        Tue, 14 Oct 2025 13:54:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:19 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 05/18] hdf5: patch CVE-2025-2925
Date: Wed, 15 Oct 2025 09:53:48 +1300
Message-ID: <20251014205402.1487867-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120638

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
 

