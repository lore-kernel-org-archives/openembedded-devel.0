Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEF4CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.3478.1760484784098548307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V7/2rLAI;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso5198925a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484783; x=1761089583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heORXTH2GEooFe3wJyETz4N+CSuea90g1lOti2wc9q0=;
        b=V7/2rLAINCVPb+BRaCksLCbHot0P6c9PYkF7oCMMO3pKfAzQUrInwG4OplC+IM8hTc
         h1zCI+oh3/OnMaDVuDC4rlzv76A3UiRUd1wJXHCzO4K038IWhGOj2cp5URcbeWKfBICN
         U9LqPmiFMnmzaVM5OPQ2gk9S7MitT6YqFsu2igOtMvZOTp9mEd070phkb9bfnjhuOCdE
         5+nNXEsa2a8QN3Uk8rEsqq+lsfEu2yWIkpp3S15T+bhOwqru4JfvzsQiIIc1LbdYTUFm
         quQwf+kNd9f7eXjimSFgH5+fhbqTIofvSnIEGo8ex4jqaRJ8dZx/PrISXTtnGgEw5iKc
         eJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484783; x=1761089583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heORXTH2GEooFe3wJyETz4N+CSuea90g1lOti2wc9q0=;
        b=jvbFI+xYRCpmnandmS+dZTF6D31heUGEYiMNzym3vD775tzOxs41P/9PA6ZC4gEwZq
         d4igwE97i41mlb1P6M5VfXfBqBsvCb5bg8ltTFALK2dfh2QIFZK/gKV0qWTdbt0DX2mf
         ykNFjpZb9tdkHVIjzSTM1sfLDGYZo9X647OckJgVRxOGV4KWv+X8aYSEm3ueJrVHwl7m
         lITiXgzWkXD+9lTDmQWE1Pvja6XoA77Qp42fckdoxZHBE8srX5xgUXXBTnUFVAIvvrj5
         mxkbv2D5pa/bw9Ta1XYUW6BXlPi47t6omYykO8NNtlCki5LBx1HSVXfFOr/3o4bRjnk0
         evCA==
X-Gm-Message-State: AOJu0YyBxCsKPkRvufZlODpK9R/nLX7JjFLiQZJenMH/0bn+soPk7VkC
	nQPnSgprOH9hSoUfxrDyzH4BBKKWg46F7cDyfNJ419twGs74BUKWAYKOCEIldw==
X-Gm-Gg: ASbGnctdyYtoS+7Qn4E8Vg9J5lRZK4rRwIXhHFshsksHq90UKrIQ3gkST2siZ8BjIDu
	uT3y2zx75Ur9zlXnYgV84M9Mj/mC9Ktw+BUv/y5crdlR+JmPJodW1ARUk/c4EgxG1FRiaUM3VF1
	xRJ/hBenpsdCXLpsiXsJMfSPWlu5KR6COzm/w/ESWvULiGhKVEWJ3NHgqXP9/NOzOJkralFBsiy
	mrvCEd9NKfr7DXwBUCJ/Q4mW3LL4V2+6OsLo6yI2l5nxeUxoSBnmqABrxQVlR32gIuEaAq7fWkB
	TsitNdxBBxP/Zh7dtUGGMkv9hAh2Jz8GSiLp/bK4xGY4L2S1ymBgQRSEYT74FOL4aX22yBjrBe+
	xB2pNz0D1T/fKdNAxPNMVKXNYcR2BLKtM61tiwO2nWwLzbi01rLcH6EY=
X-Google-Smtp-Source: AGHT+IEQg4GX4XLZx2DRurkvtWalglp4qxiFXVCAZdU4FDhe5hJMJwQD622nhgnR1g2aV3lFecQYPw==
X-Received: by 2002:a17:90b:3884:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-33b5112974amr38796623a91.16.1760484783202;
        Tue, 14 Oct 2025 16:33:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:02 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 06/18] hdf5: patch CVE-2025-6269
Date: Wed, 15 Oct 2025 12:32:17 +1300
Message-ID: <20251014233233.304125-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120665

Details https://nvd.nist.gov/vuln/detail/CVE-2025-6269

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit beb0dbaf258c94e5f36e052524b5b5627ab4c9cd)
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
 

