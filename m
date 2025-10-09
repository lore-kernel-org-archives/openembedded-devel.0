Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAECCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:00:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3661.1760050810821655351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 16:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzqbV6C3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1487824b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 16:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760050810; x=1760655610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4boLgDNJ/M3nKUiLuNZv2a9YdiqGksUQr5PZb5dF0E=;
        b=PzqbV6C3gbTLnL2jS5XPZ4FgFF4Jlo5MlgN2M9LSrIxaBGJ+vrSK4bUFYrHgKzE2d6
         iVVkqs1aA1hsNeiSIC4GeKD1eGi1twYzwH9/Iomywfw80ZqLCAcZkpxjZJENM28SE7Sv
         9M4Tr+exaA9QKR8pGBKSjH0eLwRw1exs46I37sA9VzTzrzGSlkHmz6cWQG1H3QrkwGsD
         EthCbSATDgfMrG2Xb6iZ0l26AR9EGwJeEReFRW2OhAjX3oxwoUhMxBp6EwL9fxigVogc
         XokNE+VMwtaBzmgCaU31dTr0v/2Q/GmGIbn4gqT+XPM947eOyi0PKaC3nt9akvXd7UlF
         50SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760050810; x=1760655610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4boLgDNJ/M3nKUiLuNZv2a9YdiqGksUQr5PZb5dF0E=;
        b=QzBhXp2ZjqOezHyzlTHgJW+qgvAIitP6PMDuG6p2hNCxlNoqDnp8zv5/seoFFq5T/q
         XF0QVAEkya8OlZutnZIAEiMOeaGGZM7tCU/TpXiaYwUF6Ki6jnZu59dEpePTsvdq2Yl7
         stN0ZDNT/p1IarsFRojpmv8orv9WYmb1ZJxVprYqZPlPVj56nNwGHiD7/eRfdXRzTwKA
         Ote60PUXFFSIyJclJVsUg9DWljaHvtHicRDfruQEtBeqe2aF4kkzvWK4XPxPwLI/Uc8x
         JZroH3HzZ46R2j/+fpIde0y6jkK57JK+KpV4AEZK1uSX3qaladEVPZCf0LMc5RLNAOYz
         bA4w==
X-Gm-Message-State: AOJu0YyQbS5LEXdgtXTuqIoNyAq/3H39AWZh78uSXKPSUeLWqabW4CoD
	tnSq6Sa8/F1bLz2GOe7Fpz4BKDttDEK2qbjs9YThF4sChlstGmu9oXV2eZxtUw==
X-Gm-Gg: ASbGncvPMjy65HEHwJJKJiRXqt/ebcutT9+aHcrqabzGrlQqfkPAU6PGUzxbtLr7d8E
	6MVyX2aB8adDbyGeoWepVa8t1vaihJPps54moiTrPX2CoDOKBCPp8e74uq6slmnjycGKJbvteow
	Yhqt5lA/dYKH0VQZEFTCZ/mlobADdo245EeEmCz9VkHCu15D8gt50v+CjeUOlITZlgUGxTxjnXs
	TaOTrMy2wVpT7WUF1CYUZOMyzfGcfp8rb/izKwUR9StLTbpzLyf9n0HD+KGu7ONcNTzH9WHfh1p
	n3ugyu2FE1jTXZ5zikUj6nHItjT+p0Mb8u9iczau6ARaDJSChWAqCMPCLyv9QPpZyM1jzFbskIu
	U5dwMkC3EJ4RgHwbiTlvQgLJDxKWes8VCPU0fPsTAvl4dq0MJChiAR3Yr+oZsQjdtT9YIh6g=
X-Google-Smtp-Source: AGHT+IFt28jYyl7q2H0ce0NahkEJrW/5JJ/ooe67GOuvVD0hBKvRv8BlaCwVMSCZ3QHbSGI5Br9tFQ==
X-Received: by 2002:a17:902:cf08:b0:275:c2f:1b41 with SMTP id d9443c01a7336-290274193camr110138725ad.53.1760050809882;
        Thu, 09 Oct 2025 16:00:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93e06sm38961815ad.115.2025.10.09.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 16:00:09 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 4/4] hdf5: patch CVE-2025-6269
Date: Fri, 10 Oct 2025 11:59:31 +1300
Message-ID: <20251009225931.3902783-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
References: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120458

Details https://nvd.nist.gov/vuln/detail/CVE-2025-6269

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0004-CVE-2025-6269-OSV-2023-77.patch      | 294 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 295 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch b/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch
new file mode 100644
index 0000000000..4f155559bc
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch
@@ -0,0 +1,294 @@
+From dfbbcfa5e8038813c99bc8bc1aa4926335c11df1 Mon Sep 17 00:00:00 2001
+From: aled-ua <bugbuster.cc@gmail.com>
+Date: Wed, 15 Jan 2025 15:02:25 -0600
+Subject: [PATCH] CVE-2025-6269 OSV-2023-77
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
+CVE: CVE-2025-6269
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d]
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70]
+
+(cherry picked from commit 7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d)
+(cherry picked from commit 3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Cimage.c | 95 ++++++++++++++++++++++++++++++++++++++------------
+ src/H5Ocont.c  |  5 +--
+ 2 files changed, 76 insertions(+), 24 deletions(-)
+
+diff --git a/src/H5Cimage.c b/src/H5Cimage.c
+index ec1af78..b97be22 100644
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
+@@ -131,7 +132,8 @@ static void   H5C__prep_for_file_close__compute_fd_heights_real(H5C_cache_entry_
+ static herr_t H5C__prep_for_file_close__setup_image_entries_array(H5C_t *cache_ptr);
+ static herr_t H5C__prep_for_file_close__scan_entries(const H5F_t *f, H5C_t *cache_ptr);
+ static herr_t H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr);
+-static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf);
++static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, hsize_t *buf_size,
++                                                       const uint8_t **buf);
+ static herr_t             H5C__write_cache_image_superblock_msg(H5F_t *f, bool create);
+ static herr_t             H5C__read_cache_image(H5F_t *f, H5C_t *cache_ptr);
+ static herr_t             H5C__write_cache_image(H5F_t *f, const H5C_t *cache_ptr);
+@@ -299,7 +301,7 @@ H5C__construct_cache_image_buffer(H5F_t *f, H5C_t *cache_ptr)
+         /* needed for sanity checks */
+         fake_cache_ptr->image_len = cache_ptr->image_len;
+         q                         = (const uint8_t *)cache_ptr->image_buffer;
+-        status                    = H5C__decode_cache_image_header(f, fake_cache_ptr, &q);
++        status = H5C__decode_cache_image_header(f, fake_cache_ptr, &q, cache_ptr->image_len + 1);
+         assert(status >= 0);
+ 
+         assert(NULL != p);
+@@ -1269,7 +1271,7 @@ H5C__cache_image_block_header_size(const H5F_t *f)
+  *-------------------------------------------------------------------------
+  */
+ static herr_t
+-H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf)
++H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **buf, size_t buf_size)
+ {
+     uint8_t        version;
+     uint8_t        flags;
+@@ -1289,6 +1291,10 @@ H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, const uint8_t *
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
+@@ -2372,6 +2378,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+ {
+     H5C_cache_entry_t *pf_entry_ptr;        /* Pointer to prefetched entry */
+     H5C_cache_entry_t *parent_ptr;          /* Pointer to parent of prefetched entry */
++    hsize_t            image_len;           /* Image length */
+     const uint8_t     *p;                   /* Pointer into image buffer */
+     unsigned           u, v;                /* Local index variable */
+     herr_t             ret_value = SUCCEED; /* Return value */
+@@ -2387,10 +2394,11 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+     assert(cache_ptr->image_len > 0);
+ 
+     /* Decode metadata cache image header */
+-    p = (uint8_t *)cache_ptr->image_buffer;
+-    if (H5C__decode_cache_image_header(f, cache_ptr, &p) < 0)
++    p         = (uint8_t *)cache_ptr->image_buffer;
++    image_len = cache_ptr->image_len;
++    if (H5C__decode_cache_image_header(f, cache_ptr, &p, image_len + 1) < 0)
+         HGOTO_ERROR(H5E_CACHE, H5E_CANTDECODE, FAIL, "cache image header decode failed");
+-    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < cache_ptr->image_len);
++    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < image_len);
+ 
+     /* The image_data_len and # of entries should be defined now */
+     assert(cache_ptr->image_data_len > 0);
+@@ -2402,7 +2410,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_ptr)
+         /* Create the prefetched entry described by the ith
+          * entry in cache_ptr->image_entrise.
+          */
+-        if (NULL == (pf_entry_ptr = H5C__reconstruct_cache_entry(f, cache_ptr, &p)))
++        if (NULL == (pf_entry_ptr = H5C__reconstruct_cache_entry(f, cache_ptr, &image_len, &p)))
+             HGOTO_ERROR(H5E_CACHE, H5E_SYSTEM, FAIL, "reconstruction of cache entry failed");
+ 
+         /* Note that we make no checks on available cache space before
+@@ -2558,19 +2566,21 @@ done:
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
+@@ -2590,9 +2600,15 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
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
+@@ -2620,19 +2636,31 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
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
+@@ -2640,20 +2668,32 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
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
+@@ -2674,6 +2714,9 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+                         "memory allocation failed for fd parent addrs buffer");
+ 
+         for (u = 0; u < pf_entry_ptr->fd_parent_count; u++) {
++
++            if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_ADDR(f), p_end))
++                HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+             H5F_addr_decode(f, &p, &(pf_entry_ptr->fd_parent_addrs[u]));
+             if (!H5_addr_defined(pf_entry_ptr->fd_parent_addrs[u]))
+                 HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid flush dependency parent offset");
+@@ -2689,6 +2732,8 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
+ #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
+ 
+     /* Copy the entry image from the cache image block */
++    if (H5_IS_BUFFER_OVERFLOW(p, pf_entry_ptr->size, p_end))
++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5MM_memcpy(pf_entry_ptr->image_ptr, p, pf_entry_ptr->size);
+     p += pf_entry_ptr->size;
+ 
+@@ -2703,14 +2748,20 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const uint8_t **b
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
+index 621095a..180b115 100644
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
+@@ -101,8 +104,6 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNUSE
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_DECODE_LENGTH(f, p, cont->size);
+ 
+-    cont->chunkno = 0;
+-
+     /* Set return value */
+     ret_value = cont;
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 540c8459ea..6d2d439460 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-CVE-2025-2923.patch \
     file://0002-CVE-2025-2924.patch \
     file://0003-CVE-2025-2925.patch \
+    file://0004-CVE-2025-6269-OSV-2023-77.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

