Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBB0CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:00:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3660.1760050804326724772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 16:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VBxsFoH1;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-279e2554b6fso11085445ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760050803; x=1760655603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdFhuR+vPKZiGCochz61yh6Z69tpZXzW/YRbxclW94U=;
        b=VBxsFoH16g4MtC8L2KoM2f2lbrvrqrz6FZBa+0vbi9VWPNuYig9jQwayBM7vMgrJ7S
         FfHHui7f0HZ6KTv/YUgjnlm0zyR9P0+s25yWMBsnnShygHlbJAE4IoollEmsLFmGlAH8
         8qqAbCI3G3xa4KwC4CVlWTaJaa5pQAMID2whXrXbJPuX2W73NP9L1Kn2cWlPgJIxDNuP
         tTaEAdU2Gp6ibACkqivMEYGoIgvmSlHQGeFh/rlt7WoNErpVgkCHUOGj6j8KmjNVCa5A
         rWA2eD3lD/ahfEXqh2AXNlthIpjEKQ43XhVgJLjpBmBhKhirMnTJVUF1GuxxlpLAFmKM
         oQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760050803; x=1760655603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdFhuR+vPKZiGCochz61yh6Z69tpZXzW/YRbxclW94U=;
        b=h3iVr6xQBtHsG5I7KDAx3YPyPZMVDMULcFi48gEif+tAgAJfCI9Y8bdX8oIT/bdHZU
         cXe5fNcN2nQyPq6JfnFbFzMm6WI32/xBerKeP41fPOM/BUIvqQ1xwOtdGBx49yke7d0/
         0q2muuULSm90CFOPsa/rvcCze/rit4LbhPptxDhdL7N5bWK3A20NoiKlYv1IMndb7jm3
         bl/7lsrxeqMzVDq+7rM/vwcHYYFjVt/YQv2umKV7qRThtr1cR+n1kFhZbqWCAkwkxFGM
         UcVb/O6FNDOuwaLXsuWv9h8GnNgJxtEsaGYzWo8PpuFau1qr7dzyoH1FJh2V/tvn/seB
         eqcw==
X-Gm-Message-State: AOJu0Yxs/YB+klKk96uUHuzpbxmyxNQ/7VBGM157CvTRjpGw9MmQys4m
	DvnRWOOkEL1j6XNtKil+f5FlVgVyKsUkjRbXtST8sAVsgj93Jx9JuMx94Dlkqg==
X-Gm-Gg: ASbGncurjEtXcQsA3INVcsEVlu+p2YDr9es0K2L6XXLzP0Zr9uWaKk8GRBWSsrhauxo
	CFPUjNzffGp+IiREGGHjpzidvOJxvrulcajyoPZlNNy4Wq9G9Gfirn75cDhOJ9KB48aW2quLM7f
	n5I52K6BdXj9g2WV3U62hRzRZ2fmQcLmYtSVw3uhKk8wG610biH2zhIkLEWOwptxCr0PpdH5JCj
	l1uR7iUaXHn3GjgQQu81C5a7RsqHlTAv9e8X3BnHjU3wokiqVEJeHmfUoe7zPOKH2jVgGeYb54x
	DF70gWCqtZqsj69k1k+YA8qBkrgePLu8fOUH3e/UDNtpYMJekNBnWt6RLwQlkQ6ka/IsLOWqRhl
	iZ95TdH1Mwtl9fGLujNiYQsbEHGsMjtAgBQ9CZYB6KY9JQclbZaQGFUpis9cD
X-Google-Smtp-Source: AGHT+IErVEzmJcXdm4EP8lvwLilT0D43+Yh3R/d+s7cNcwHzJWW4qgH1Qsz1XXP+GTjb2qsyVY0RZA==
X-Received: by 2002:a17:903:2c10:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-29027374b5amr108826995ad.14.1760050803394;
        Thu, 09 Oct 2025 16:00:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93e06sm38961815ad.115.2025.10.09.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 16:00:02 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 3/4] hdf5: patch CVE-2025-2925
Date: Fri, 10 Oct 2025 11:59:30 +1300
Message-ID: <20251009225931.3902783-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
References: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120457

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2925

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
 

