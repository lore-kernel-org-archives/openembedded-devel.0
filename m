Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F71CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.9103.1761651194468806646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEcqX8Fj;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so5743834a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651194; x=1762255994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnI0jV8BxEmivHByrf09qjhUCX1d3ttHaYCd0AntpbM=;
        b=kEcqX8FjSMEncm/0WVnKHxKYMTMkRfx+z/NqeRSDcoQ0D7gTKlxBmG5xUHi+3Yz8WX
         xL8k97+W39GzdSOyCKXNmsT+lEuYaPqMiXumz9a3pasNxaYTCFzHoMzrEuQJpSEIgTWf
         eUjsvWoDSpZGFy1rracQVBHQ85VaQgrW5dBAYjyWfWMDz9WjbMpPoN15oyhJD2LdCxJS
         SrR09XraPCe8NkPpC9bRG2V+S/KWrEhUZIdIVJ7yhnCVUmTbJWfNm0jgzIn9GKhLaytx
         4X7uodUIGAVIqRq/o1gHl5BgDNmazWbO8zM1GC7I4FSXkEJ+hiOpI1T2mThvOTAJgfYG
         FF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651194; x=1762255994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnI0jV8BxEmivHByrf09qjhUCX1d3ttHaYCd0AntpbM=;
        b=GjbNTfaJ2DpU+XN4tQrXsMFwTNrUkc7e0Aog2GnA2+5fxqOpbtdEX2FPvdfiyCe4VT
         UTj51zMCpjVM/7p65rwi2Qsow4mh7Ogc1q6WIG7RthndzUxLGe8Ja4inRahSaTxf6V6n
         cj478/cH6GT598dxtgLGDSOFvQ1X7DomBSxnknQXnYD+hWYMPBMcVytUzlkXvYJeNroh
         XngGpQtFLVcAgEVjb7TfgsaHFWiwb+NgJ0csbbeNDJE/jX90eGoRgMrIyIhMGlWdsqbU
         2aqgTZRA7OUkayJa/6a9JJzAWqg0JicWK17I6j1aoDPX3smXSh54gpAEUXJVPX0rdz2m
         77qg==
X-Gm-Message-State: AOJu0YyQ3eMhHVghFgcb/TqPqfp6RBsAmZWLvlFdE7OlufoR2e1iUINx
	CvRdkdXi7aL4g/1xBhCcVOnt4AEcRHSaJ9ULqgi2PT7acS0t7Gr6FyQYvgEE/Q==
X-Gm-Gg: ASbGncvVlSDzu7J0+qulalLfJj7TmQPN8EgrJ2C7Em51vSBQeLGYBC2kltcLhu33U9f
	YUBv6PJ31PMzuYpcrU0RQOEHfpbbFxbjRdDPrjC/Yh/SHG1VU+I4Xe+5HCYVbuiFYpL8Xep4kSU
	gJNWQerI7H7hQDtH9YtYO9fztDlkppMtXH4+3endc8iXJ7G3yMIjLvsjRIQGFW2dwvWiG+KTmP5
	CnvW0gPe2fjd5gojgYZUHaW2kZc7CkDHZbedktitmVH0EvjX7rENSUty2ene3PD2DTO6Y9py2ZT
	PBBTLlAq+ZIxyG5+N/ew/LIyOIFFZJB+APA1SMZl72Dj4GnlmcCAESCOGSaVXDdLzVb90NRVEG6
	iJrEa3GU+fLnNZ855Ap++UxmKVJLkUMEDFNZhcszqu4lYQYV2YEaAGHhYgLiiytdNUD8sVhsHZf
	oCpQW7MSc0hmrvnQ==
X-Google-Smtp-Source: AGHT+IF31NlS7k65tRgzjfwbvIWnehtwVhlWQffiInf9H4CZj6r6ye5JcAs01gY6NzmnrdXbQ49pGw==
X-Received: by 2002:a17:90b:3ec3:b0:33b:c995:5d92 with SMTP id 98e67ed59e1d1-34027bde36cmr3862189a91.32.1761651193442;
        Tue, 28 Oct 2025 04:33:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:13 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 7/7] hdf5: patch CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
Date: Wed, 29 Oct 2025 00:32:47 +1300
Message-ID: <20251028113247.1761834-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121085

As mentioned in the issues [1],[2] and [3], PR[4] addressed several vulnerabilities.

[1] https://github.com/HDFGroup/hdf5/issues/5581#issuecomment-3251977160
[2] https://github.com/HDFGroup/hdf5/issues/5579#issuecomment-2993915196
[3] https://github.com/HDFGroup/hdf5/issues/5580#issuecomment-2993727142
[4] https://github.com/HDFGroup/hdf5/pull/5756

Details:
 https://nvd.nist.gov/vuln/detail/CVE-2025-6269
 https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 https://nvd.nist.gov/vuln/detail/CVE-2025-6516

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-6269-CVE-2025-6270-CVE-2025-6516_01.patch |  65 +++++
 ...-6269-CVE-2025-6270-CVE-2025-6516_02.patch | 252 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +
 3 files changed, 319 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
new file mode 100644
index 0000000000..c09ade1c4c
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
@@ -0,0 +1,65 @@
+From ac57aaf0186ba175947d370496934fd399fbc225 Mon Sep 17 00:00:00 2001
+From: aled-ua <bugbuster.cc@gmail.com>
+Date: Wed, 15 Jan 2025 15:02:25 -0600
+Subject: [PATCH] Fix vuln OSV-2023-77 (#5210)
+
+CVE: CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d]
+(cherry picked from commit 7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Cimage.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/src/H5Cimage.c b/src/H5Cimage.c
+index ec1af787d5..72dc52dafb 100644
+--- a/src/H5Cimage.c
++++ b/src/H5Cimage.c
+@@ -118,7 +118,8 @@ do {                                                       \
+ /* Helper routines */
+ static size_t H5C__cache_image_block_entry_header_size(const H5F_t *f);
+ static size_t H5C__cache_image_block_header_size(const H5F_t *f);
+-static herr_t H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf);
++static herr_t H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf,
++                                             size_t buf_size);
+ #ifndef NDEBUG /* only used in assertions */
+ static herr_t H5C__decode_cache_image_entry(const H5F_t *f, const H5C_t *cache_ptr, const uint8_t **buf,
+                                             unsigned entry_num);
+@@ -299,7 +300,7 @@ H5C__construct_cache_image_buffer(H5F_t *f, H5C_t *cache_ptr)
+         /* needed for sanity checks */
+         fake_cache_ptr->image_len = cache_ptr->image_len;
+         q                         = (const uint8_t *)cache_ptr->image_buffer;
+-        status                    = H5C__decode_cache_image_header(f, fake_cache_ptr, &q);
++        status = H5C__decode_cache_image_header(f, fake_cache_ptr, &q, cache_ptr->image_len + 1);
+         assert(status >= 0);
+ 
+         assert(NULL != p);
+@@ -1269,7 +1270,7 @@ H5C__cache_image_block_header_size(const H5F_t *f)
+  *-------------------------------------------------------------------------
+  */
+ static herr_t
+-H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf)
++H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf, size_t buf_size)
+ {
+     uint8_t        version;
+     uint8_t        flags;
+@@ -1289,6 +1290,10 @@ H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t *
+     /* Point to buffer to decode */
+     p = *buf;
+ 
++    /* Ensure buffer has enough data for signature comparison */
++    if (H5_IS_BUFFER_OVERFLOW(p, H5C__MDCI_BLOCK_SIGNATURE_LEN, *buf + buf_size - 1))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, FAIL, "Insufficient buffer size for signature");
++
+     /* Check signature */
+     if (memcmp(p, H5C__MDCI_BLOCK_SIGNATURE, (size_t)H5C__MDCI_BLOCK_SIGNATURE_LEN) != 0)
+         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, FAIL, "Bad metadata cache image header signature");
+@@ -2388,7 +2393,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+ 
+     /* Decode metadata cache image header */
+     p = (uint8_t *)cache_ptr->image_buffer;
+-    if (H5C__decode_cache_image_header(f, cache_ptr, &p) < 0)
++    if (H5C__decode_cache_image_header(f, cache_ptr, &p, cache_ptr->image_len + 1) < 0)
+         HGOTO_ERROR(H5E_CACHE, H5E_CANTDECODE, FAIL, "cache image header decode failed");
+     assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < cache_ptr->image_len);
+ 
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
new file mode 100644
index 0000000000..f7324f58c1
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
@@ -0,0 +1,252 @@
+From 89e3e43aa0f64a3bbd253bef658846d9ff030bdd Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Thu, 25 Sep 2025 22:17:14 -0400
+Subject: [PATCH] Fixed CVE-2025-6269 (#5850)
+
+The GitHub issue #5579 included several security vulnerabilities in function
+H5C__reconstruct_cache_entry().
+
+This PR addressed them by:
+- adding buffer size argument to the function
+- adding buffer overflow checks
+- adding input validations
+- releasing allocated resource on failure
+
+These changes addressed the crashes reported.  However, there is a skiplist
+crash during the unwinding process that has to be investigated.
+
+CVE: CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70]
+(cherry picked from commit 3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Cimage.c | 84 ++++++++++++++++++++++++++++++++++++++------------
+ src/H5Ocont.c  |  5 +--
+ 2 files changed, 68 insertions(+), 21 deletions(-)
+
+diff --git a/src/H5Cimage.c b/src/H5Cimage.c
+index 72dc52dafb..b97be228ed 100644
+--- a/src/H5Cimage.c
++++ b/src/H5Cimage.c
+@@ -132,7 +132,8 @@ static void   H5C__prep_for_file_close__compute_fd_heights_real(H5C_cache_entry_
+ static herr_t H5C__prep_for_file_close__setup_image_entries_array(H5C_t *cache_ptr);
+ static herr_t H5C__prep_for_file_close__scan_entries(const H5F_t *f, H5C_t *cache_ptr);
+ static herr_t H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr);
+-static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf);
++static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, hsize_t *buf_size,
++                                                       const uint8_t **buf);
+ static herr_t             H5C__write_cache_image_superblock_msg(H5F_t *f, bool create);
+ static herr_t             H5C__read_cache_image(H5F_t *f, H5C_t *cache_ptr);
+ static herr_t             H5C__write_cache_image(H5F_t *f, const H5C_t *cache_ptr);
+@@ -2377,6 +2378,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+ {
+     H5C_cache_entry_t *pf_entry_ptr;        /* Pointer to prefetched entry */
+     H5C_cache_entry_t *parent_ptr;          /* Pointer to parent of prefetched entry */
++    hsize_t            image_len;           /* Image length */
+     const uint8_t     *p;                   /* Pointer into image buffer */
+     unsigned           u, v;                /* Local index variable */
+     herr_t             ret_value = SUCCEED; /* Return value */
+@@ -2392,10 +2394,11 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+     assert(cache_ptr->image_len > 0);
+ 
+     /* Decode metadata cache image header */
+-    p = (uint8_t *)cache_ptr->image_buffer;
+-    if (H5C__decode_cache_image_header(f, cache_ptr, &p, cache_ptr->image_len + 1) < 0)
++    p         = (uint8_t *)cache_ptr->image_buffer;
++    image_len = cache_ptr->image_len;
++    if (H5C__decode_cache_image_header(f, cache_ptr, &p, image_len + 1) < 0)
+         HGOTO_ERROR(H5E_CACHE, H5E_CANTDECODE, FAIL, "cache image header decode failed");
+-    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < cache_ptr->image_len);
++    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < image_len);
+ 
+     /* The image_data_len and # of entries should be defined now */
+     assert(cache_ptr->image_data_len > 0);
+@@ -2407,7 +2410,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+         /* Create the prefetched entry described by the ith
+          * entry in cache_ptr->image_entrise.
+          */
+-        if (NULL == (pf_entry_ptr = H5C__reconstruct_cache_entry(f, cache_ptr, &p)))
++        if (NULL == (pf_entry_ptr = H5C__reconstruct_cache_entry(f, cache_ptr, &image_len, &p)))
+             HGOTO_ERROR(H5E_CACHE, H5E_SYSTEM, FAIL, "reconstruction of cache entry failed");
+ 
+         /* Note that we make no checks on available cache space before
+@@ -2563,19 +2566,21 @@ done:
+  *-------------------------------------------------------------------------
+  */
+ static H5C_cache_entry_t *
+-H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf)
++H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, hsize_t *buf_size, const uint8_t **buf)
+ {
+     H5C_cache_entry_t *pf_entry_ptr = NULL; /* Reconstructed cache entry */
+     uint8_t            flags        = 0;
+     bool               is_dirty     = false;
++    haddr_t            eoa;
++    bool               is_fd_parent = false;
+ #ifndef NDEBUG /* only used in assertions */
+-    bool in_lru       = false;
+-    bool is_fd_parent = false;
+-    bool is_fd_child  = false;
++    bool in_lru      = false;
++    bool is_fd_child = false;
+ #endif
+-    const uint8_t     *p;
+     bool               file_is_rw;
+-    H5C_cache_entry_t *ret_value = NULL; /* Return value */
++    const uint8_t     *p;
++    const uint8_t     *p_end     = *buf + *buf_size - 1; /* Pointer to last valid byte in buffer */
++    H5C_cache_entry_t *ret_value = NULL;                 /* Return value */
+ 
+     FUNC_ENTER_PACKAGE
+ 
+@@ -2595,9 +2600,15 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+     p = *buf;
+ 
+     /* Decode type id */
++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     pf_entry_ptr->prefetch_type_id = *p++;
++    if (pf_entry_ptr->prefetch_type_id < H5AC_BT_ID || pf_entry_ptr->prefetch_type_id >= H5AC_NTYPES)
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "type id is out of valid range");
+ 
+     /* Decode flags */
++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     flags = *p++;
+     if (flags & H5C__MDCI_ENTRY_DIRTY_FLAG)
+         is_dirty = true;
+@@ -2625,19 +2636,31 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+     pf_entry_ptr->is_dirty = (is_dirty && file_is_rw);
+ 
+     /* Decode ring */
++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     pf_entry_ptr->ring = *p++;
+-    assert(pf_entry_ptr->ring > (uint8_t)(H5C_RING_UNDEFINED));
+-    assert(pf_entry_ptr->ring < (uint8_t)(H5C_RING_NTYPES));
++    if (pf_entry_ptr->ring >= (uint8_t)(H5C_RING_NTYPES))
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "ring is out of valid range");
+ 
+     /* Decode age */
++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     pf_entry_ptr->age = *p++;
++    if (pf_entry_ptr->age > H5AC__CACHE_IMAGE__ENTRY_AGEOUT__MAX)
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "entry age is out of policy range");
+ 
+     /* Decode dependency child count */
++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, pf_entry_ptr->fd_child_count);
+-    assert((is_fd_parent && pf_entry_ptr->fd_child_count > 0) ||
+-           (!is_fd_parent && pf_entry_ptr->fd_child_count == 0));
++    if (is_fd_parent && pf_entry_ptr->fd_child_count <= 0)
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "parent entry has no children");
++    else if (!is_fd_parent && pf_entry_ptr->fd_child_count != 0)
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "non-parent entry has children");
+ 
+     /* Decode dirty dependency child count */
++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, pf_entry_ptr->fd_dirty_child_count);
+     if (!file_is_rw)
+         pf_entry_ptr->fd_dirty_child_count = 0;
+@@ -2645,20 +2668,32 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid dirty flush dependency child count");
+ 
+     /* Decode dependency parent count */
++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, pf_entry_ptr->fd_parent_count);
+     assert((is_fd_child && pf_entry_ptr->fd_parent_count > 0) ||
+            (!is_fd_child && pf_entry_ptr->fd_parent_count == 0));
+ 
+     /* Decode index in LRU */
++    if (H5_IS_BUFFER_OVERFLOW(p, 4, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     INT32DECODE(p, pf_entry_ptr->lru_rank);
+     assert((in_lru && pf_entry_ptr->lru_rank >= 0) || (!in_lru && pf_entry_ptr->lru_rank == -1));
+ 
+     /* Decode entry offset */
++    if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_ADDR(f), p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_addr_decode(f, &p, &pf_entry_ptr->addr);
+-    if (!H5_addr_defined(pf_entry_ptr->addr))
+-        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry offset");
++
++    /* Validate address range */
++    eoa = H5F_get_eoa(f, H5FD_MEM_DEFAULT);
++    if (!H5_addr_defined(pf_entry_ptr->addr) || H5_addr_overflow(pf_entry_ptr->addr, pf_entry_ptr->size) ||
++        H5_addr_ge(pf_entry_ptr->addr + pf_entry_ptr->size, eoa))
++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry address range");
+ 
+     /* Decode entry length */
++    if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_SIZE(f), p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_DECODE_LENGTH(f, p, pf_entry_ptr->size);
+     if (pf_entry_ptr->size == 0)
+         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry size");
+@@ -2679,6 +2714,9 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+                         "memory allocation failed for fd parent addrs buffer");
+ 
+         for (u = 0; u < pf_entry_ptr->fd_parent_count; u++) {
++
++            if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_ADDR(f), p_end))
++                HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+             H5F_addr_decode(f, &p, &(pf_entry_ptr->fd_parent_addrs[u]));
+             if (!H5_addr_defined(pf_entry_ptr->fd_parent_addrs[u]))
+                 HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid flush dependency parent offset");
+@@ -2694,6 +2732,8 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+ #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
+ 
+     /* Copy the entry image from the cache image block */
++    if (H5_IS_BUFFER_OVERFLOW(p, pf_entry_ptr->size, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5MM_memcpy(pf_entry_ptr->image_ptr, p, pf_entry_ptr->size);
+     p += pf_entry_ptr->size;
+ 
+@@ -2708,14 +2748,20 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+     /* Sanity checks */
+     assert(pf_entry_ptr->size > 0 && pf_entry_ptr->size < H5C_MAX_ENTRY_SIZE);
+ 
+-    /* Update buffer pointer */
++    /* Update buffer pointer and buffer len */
++    *buf_size -= (hsize_t)(p - *buf);
+     *buf = p;
+ 
+     ret_value = pf_entry_ptr;
+ 
+ done:
+-    if (NULL == ret_value && pf_entry_ptr)
++    if (NULL == ret_value && pf_entry_ptr) {
++        if (pf_entry_ptr->image_ptr)
++            H5MM_xfree(pf_entry_ptr->image_ptr);
++        if (pf_entry_ptr->fd_parent_count > 0 && pf_entry_ptr->fd_parent_addrs)
++            H5MM_xfree(pf_entry_ptr->fd_parent_addrs);
+         pf_entry_ptr = H5FL_FREE(H5C_cache_entry_t, pf_entry_ptr);
++    }
+ 
+     FUNC_LEAVE_NOAPI(ret_value)
+ } /* H5C__reconstruct_cache_entry() */
+diff --git a/src/H5Ocont.c b/src/H5Ocont.c
+index c03f4dd1e9..4b1840448a 100644
+--- a/src/H5Ocont.c
++++ b/src/H5Ocont.c
+@@ -93,6 +93,9 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNUSE
+         HGOTO_ERROR(H5E_OHDR, H5E_NOSPACE, NULL, "memory allocation failed");
+ 
+     /* Decode */
++
++    cont->chunkno = 0;
++
+     if (H5_IS_BUFFER_OVERFLOW(p, H5F_sizeof_addr(f), p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_addr_decode(f, &p, &(cont->addr));
+@@ -103,8 +106,6 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNUSE
+     if (cont->size == 0)
+         HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL, "invalid continuation chunk size (0)");
+ 
+-    cont->chunkno = 0;
+-
+     /* Set return value */
+     ret_value = cont;
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 2832c7e851..80828ad30c 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -21,6 +21,8 @@ SRC_URI = " \
     file://CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch \
     file://CVE-2025-2924.patch \
     file://CVE-2025-2925.patch \
+    file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch \
+    file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

