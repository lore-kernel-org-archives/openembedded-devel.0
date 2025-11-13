Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D57CD8C96
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 15:55:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27229.1763049315110012830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 07:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+CiO1lb;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso8913985e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763049313; x=1763654113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xIjGa4RCSNzSnn3u15bGnPzk3wrbKek4j5xR9kTFqs=;
        b=f+CiO1lbS0V9BKiCMKZKPxqNuwC3lfrQkC3G14Tk9/tWd2gwpMRU5a/LuUqzeB0QIh
         wTZ9Z/4v5xUEPBK1t0ftaCxlDEjgv9kEg49l2gyoPXLywOUglfUVBgDLEpggeo56zeV9
         rzgpicCBZTW6baBAjLOjWZDu0YLqFMBJ/Zr8k1hveHkmZWF7GiCGCMDkYWRrc0ELPZFB
         t249bCvt1Neo5BcLfiiYWSbcOyaunrBNCoAMlHcOOUjVsEva/cj+23L0s3TKLP0ZK3Sy
         ajRdv0GvoBj1EP90dFvXPaSYOUFpgrd7MIJR8k+3u0E95guZAoobEyuEYU79B5K9YZHv
         gfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763049313; x=1763654113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xIjGa4RCSNzSnn3u15bGnPzk3wrbKek4j5xR9kTFqs=;
        b=Fu2nwBD6grNXjT4Q1C/+u+WgRqZ+hI7+zv9fKxk+3HKGwtGmsyQPLCwxrsxUHPbus1
         3drQ8Cdv/+Bdty+9z+JSWoL5frLrtZKwLukfAxYkvL1v3zJBw03FF3GeRZvWLv2Igmjv
         PY8L9nyrGm/kp8eJRmlZN892huSal0DBSXGyBs+4880gktL2MgcapWNbCJcQWD6N/Hd7
         HV1ymZKfADmBY5AanTLuHByfU8Mr43f+25nEvSW11sOMGc5XaugnkM5EJ7J0ad43zLkk
         7BEpRKoGtKKgfN8CrNtVqQosGMww4N15dcwQBaSexWDfUP6kwn1025iLgMb03clxbNxi
         DpgA==
X-Gm-Message-State: AOJu0YwohL3bFd3pFIZ1PEa9dHDQGMBDRqwBCDzO1Wy1ZaPJUAf0bAYO
	dEeRqNrQUTWNpHS7Rx90h+CPh1xiwZWx/n12+Fgku/tUN8RBFnLDZsvUIY8xAGqr
X-Gm-Gg: ASbGncsiRVDHZW950IIdt1R+NKLJD+qWrVWDxe8XoNloW4L8eHnm0H2mf6dArW9kpJn
	uXioqzbkUR/j56V1OwqRuH6f8VTKjYB/jMLyHYiRWCKZzs5yk5ZS5QVWBWOtKQqpn1D6dhSbdp4
	xcabTNm1MpRdKvJ878Gjtdop8kX9qW8fPJ9CGNvV3QnKFxfIXhV99kgy7LSS1sjw9nmBHVykSCq
	subbi0mk1N6EUwNmNeO93lyGa/IPAudlATb/6ZFLtjTKxmVAAS28YJiybOV128oEbVTPpA3VqCI
	jyy7OjWCsgJtBD3zo9GIB12yMsxitttkLgmB2Lf3W2XDE4g1ghXOFNuRfnAo4Zsn5k44yoaqeAJ
	e5G05rYpTQECaCINfsjms3DW+GfFoRnnqUW01jacA0zokgkUSBzLiZaFav+1Ze5oHFyWfEyIM4e
	eTvNhA6+kf
X-Google-Smtp-Source: AGHT+IHSFFFx27kN9iUNHfql1W4gbls5I7Ahn+AE+OaKgaMFjZXUKaiX83ty+sQAH/9ND8pbszlZGg==
X-Received: by 2002:a05:600c:138b:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-4778fdc847dmr801745e9.19.1763049312892;
        Thu, 13 Nov 2025 07:55:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c897bb8sm39673605e9.12.2025.11.13.07.55.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:55:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hdf5: upgrade 1.14.6 -> 2.0.0
Date: Thu, 13 Nov 2025 16:55:11 +0100
Message-ID: <20251113155511.26444-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 15:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121652

Drop patches that were incorporated in this release.

License-Update: Switched to 3-clause BSD license:
https://github.com/HDFGroup/hdf5/commit/edd7bea821b63f7d09e29296d341a5d6965012f9

Release notes:
https://github.com/HDFGroup/hdf5/releases/tag/2.0.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fix-CVE-2025-2153-5795.patch   | 47 ----------
 .../files/0001-Fix-CVE-2025-2310-5872.patch   | 41 ---------
 .../files/0001-Fix-CVE-2025-2924-5814.patch   | 36 --------
 .../files/0001-Fix-CVE-2025-2925-5739.patch   | 52 -----------
 .../files/0001-Fixes-CVE-2025-6750-5856.patch | 87 -------------------
 ...efix-of-the-attempts-in-PR-5209-5722.patch | 47 ----------
 .../files/0001-cmake-remove-build-flags.patch | 48 +++++-----
 ...ffix-shared-from-shared-library-name.patch | 20 +++--
 .../hdf5/{hdf5_1.14.6.bb => hdf5_2.0.0.bb}    | 19 +---
 9 files changed, 39 insertions(+), 358 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch
 rename meta-oe/recipes-support/hdf5/{hdf5_1.14.6.bb => hdf5_2.0.0.bb} (65%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch
deleted file mode 100644
index 4b31718dea..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 183c8aeb601a02a38dd6815bcb651a7317b1b647 Mon Sep 17 00:00:00 2001
-From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
-Date: Thu, 9 Oct 2025 07:51:49 -0500
-Subject: [PATCH] Fix CVE-2025-2153 (#5795)
-
-This PR fixes #5329. Previously, the message flags field was able to be modified such that a message that is not sharable according to the share_flags field in H5O_msg_class_t could be treated as sharable. A check has been added to make sure messages that are not sharable can't be modified so that they indicate they can be shared.
-
-The bug was first reproduced using the fuzzer and the POC file from #5329. With this change, the heap based buffer overflow no longer occurs.
-
-CVE: CVE-2025-2153
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/38954615fc079538aa45d48097625a6d76aceef0]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5Ocache.c   | 4 ++--
- src/H5Omessage.c | 3 +++
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/H5Ocache.c b/src/H5Ocache.c
-index 87f321c..12c30cf 100644
---- a/src/H5Ocache.c
-+++ b/src/H5Ocache.c
-@@ -1399,8 +1399,8 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-             else {
-                 /* Check for message of unshareable class marked as "shareable"
-                  */
--                if ((flags & H5O_MSG_FLAG_SHAREABLE) && H5O_msg_class_g[id] &&
--                    !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
-+                if (((flags & H5O_MSG_FLAG_SHARED) || (flags & H5O_MSG_FLAG_SHAREABLE)) &&
-+                    H5O_msg_class_g[id] && !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
-                     HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL,
-                                 "message of unshareable class flagged as shareable");
- 
-diff --git a/src/H5Omessage.c b/src/H5Omessage.c
-index 7190e46..fb9006c 100644
---- a/src/H5Omessage.c
-+++ b/src/H5Omessage.c
-@@ -354,6 +354,9 @@ H5O__msg_write_real(H5F_t *f, H5O_t *oh, const H5O_msg_class_t *type, unsigned m
-          */
-         assert(!(mesg_flags & H5O_MSG_FLAG_DONTSHARE));
- 
-+        /* Sanity check to see if the type is not sharable */
-+        assert(type->share_flags & H5O_SHARE_IS_SHARABLE);
-+
-         /* Remove the old message from the SOHM index */
-         /* (It would be more efficient to try to share the message first, then
-          *      delete it (avoiding thrashing the index in the case the ref.
diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch
deleted file mode 100644
index f15a7f9644..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7cc3c76f681fb4ca739457950352654aecd647a9 Mon Sep 17 00:00:00 2001
-From: Matt L <124107509+mattjala@users.noreply.github.com>
-Date: Thu, 9 Oct 2025 16:10:23 -0500
-Subject: [PATCH] Fix CVE-2025-2310 (#5872)
-
-Malformed files can have a zero name-length, which when subtracted lead to an overflow and an out-of-bounds read.
-
-Check that name length is not too small in addition to checking for an overflow directly.
-
-CVE: CVE-2025-2310
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/6c86f97e03c6dc7d7bd2bae9acc422bdc3438ff4]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5Oattr.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/H5Oattr.c b/src/H5Oattr.c
-index 6d1d237..2f8c259 100644
---- a/src/H5Oattr.c
-+++ b/src/H5Oattr.c
-@@ -167,6 +167,11 @@ H5O__attr_decode(H5F_t *f, H5O_t *open_oh, unsigned H5_ATTR_UNUSED mesg_flags, u
-     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
-         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
-     UINT16DECODE(p, name_len); /* Including null */
-+
-+    /* Verify that retrieved name length (including null byte) is valid */
-+    if (name_len <= 1)
-+        HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, NULL, "decoded name length is invalid");
-+
-     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
-         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
-     UINT16DECODE(p, attr->shared->dt_size);
-@@ -190,6 +195,7 @@ H5O__attr_decode(H5F_t *f, H5O_t *open_oh, unsigned H5_ATTR_UNUSED mesg_flags, u
-      */
-     if (H5_IS_BUFFER_OVERFLOW(p, name_len, p_end))
-         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
-+
-     if (NULL == (attr->shared->name = H5MM_strndup((const char *)p, name_len - 1)))
-         HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, NULL, "memory allocation failed");
- 
diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch
deleted file mode 100644
index a86b5a491b..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f76c5adea55edec75680fdd7365cc97abc112d0e Mon Sep 17 00:00:00 2001
-From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
-Date: Mon, 15 Sep 2025 07:56:54 -0500
-Subject: [PATCH] Fix CVE-2025-2924 (#5814)
-
-CVE: CVE-2025-2924
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/0a57195ca67d278f1cf7d01566c121048e337a59]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5HLcache.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/H5HLcache.c b/src/H5HLcache.c
-index d0836fe..7f412d2 100644
---- a/src/H5HLcache.c
-+++ b/src/H5HLcache.c
-@@ -225,6 +225,7 @@ H5HL__fl_deserialize(H5HL_t *heap)
-     /* check arguments */
-     assert(heap);
-     assert(!heap->freelist);
-+    HDcompile_assert(sizeof(hsize_t) == sizeof(uint64_t));
- 
-     /* Build free list */
-     free_block = heap->free_block;
-@@ -232,6 +233,10 @@ H5HL__fl_deserialize(H5HL_t *heap)
-         const uint8_t *image; /* Pointer into image buffer */
- 
-         /* Sanity check */
-+
-+        if (free_block > UINT64_MAX - (2 * heap->sizeof_size))
-+            HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "decoded heap block address overflow");
-+
-         if ((free_block + (2 * heap->sizeof_size)) > heap->dblk_size)
-             HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "bad heap free list");
- 
diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch
deleted file mode 100644
index 7a0afba423..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ad959fdac99810ea64504d7bdfc7724c5ca25e21 Mon Sep 17 00:00:00 2001
-From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
-Date: Thu, 9 Oct 2025 14:48:55 -0500
-Subject: [PATCH] Fix CVE-2025-2925 (#5739)
-
-This PR fixes issue #5383, which was occurring due to actual_len + H5C_IMAGE_EXTRA_SPACE being 0. When realloc was called, it freed image, but gets sent to done before new_image can be assigned to image. Because the pointer for image isn't null, it attempts to free it here again, causing the double free to occur. This PR addresses Quincey's concern and fixes the issue while preserving new_image and image.
-
-The bug was first reproduced using the fuzzer and the POC file from #5383. With this change, the double free no longer occurs.
-
-CVE: CVE-2025-2925
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/4310c19608455c17a213383d07715efb2918defc]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5Centry.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/H5Centry.c b/src/H5Centry.c
-index 1ca7479..77bc00d 100644
---- a/src/H5Centry.c
-+++ b/src/H5Centry.c
-@@ -1051,9 +1051,14 @@ H5C__load_entry(H5F_t *f,
-          */
-         do {
-             if (actual_len != len) {
-+                /* Verify that the length isn't a bad value  */
-+                if (len == 0)
-+                    HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "len is a bad value");
-+
-                 if (NULL == (new_image = H5MM_realloc(image, len + H5C_IMAGE_EXTRA_SPACE)))
-                     HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
-                 image = (uint8_t *)new_image;
-+
- #if H5C_DO_MEMORY_SANITY_CHECKS
-                 H5MM_memcpy(image + len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
- #endif        /* H5C_DO_MEMORY_SANITY_CHECKS */
-@@ -1104,10 +1109,15 @@ H5C__load_entry(H5F_t *f,
-                     if (H5C__verify_len_eoa(f, type, addr, &actual_len, true) < 0)
-                         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len exceeds EOA");
- 
-+                    /* Verify that the length isn't 0  */
-+                    if (actual_len == 0)
-+                        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len is a bad value");
-+
-                     /* Expand buffer to new size */
-                     if (NULL == (new_image = H5MM_realloc(image, actual_len + H5C_IMAGE_EXTRA_SPACE)))
-                         HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
-                     image = (uint8_t *)new_image;
-+
- #if H5C_DO_MEMORY_SANITY_CHECKS
-                     H5MM_memcpy(image + actual_len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
- #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch b/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch
deleted file mode 100644
index cf8687f010..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 7159488b73fb429a78f79763f7b3775a3c160fad Mon Sep 17 00:00:00 2001
-From: bmribler <39579120+bmribler@users.noreply.github.com>
-Date: Fri, 26 Sep 2025 11:46:50 -0400
-Subject: [PATCH] Fixes CVE-2025-6750 (#5856)
-
-* Fixes CVE-2025-6750
-
-A heap buffer overflow occurred because an mtime message was not properly decoded, resulting in a buffer of size 0 being passed into the encoder.
-
-This PR added decoding for both old and new mtime messages which will allow invalid message size to be detected.
-
-Fixes #5549
-
-CVE: CVE-2025-6750
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/86149a098837a37b2513746e9baf84010f75fb54]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5Ocache.c | 41 +++++++++++++++++++++++++++++++++++------
- 1 file changed, 35 insertions(+), 6 deletions(-)
-
-diff --git a/src/H5Ocache.c b/src/H5Ocache.c
-index 12c30cf..e6095a7 100644
---- a/src/H5Ocache.c
-+++ b/src/H5Ocache.c
-@@ -1265,6 +1265,9 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
-             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
- 
-+        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
-+            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
-+
-         /* Message flags */
-         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
-             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
-@@ -1297,12 +1300,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-             }
-         }
- 
--        /* Try to detect invalidly formatted object header message that
--         *  extends past end of chunk.
--         */
--        if (chunk_image + mesg_size > eom_ptr)
--            HGOTO_ERROR(H5E_OHDR, H5E_CANTINIT, FAIL, "corrupt object header");
--
-         /* Increment count of null messages */
-         if (H5O_NULL_ID == id)
-             nullcnt++;
-@@ -1449,6 +1446,38 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-                     HGOTO_ERROR(H5E_OHDR, H5E_CANTSET, FAIL, "can't decode refcount");
-                 oh->nlink = *refcount;
-             }
-+            /* Check if message is an old mtime message */
-+            else if (H5O_MTIME_ID == id) {
-+                time_t *mtime = NULL;
-+
-+                /* Decode mtime message */
-+                mtime =
-+                    (time_t *)(H5O_MSG_MTIME->decode)(udata->f, NULL, 0, &ioflags, mesg->raw_size, mesg->raw);
-+
-+                /* Save the decoded old format mtime */
-+                if (!mtime)
-+                    HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, FAIL, "can't decode old format mtime");
-+
-+                /* Save 'native' form of mtime message and its value */
-+                mesg->native = mtime;
-+                oh->ctime    = *mtime;
-+            }
-+            /* Check if message is an new mtime message */
-+            else if (H5O_MTIME_NEW_ID == id) {
-+                time_t *mtime = NULL;
-+
-+                /* Decode mtime message */
-+                mtime = (time_t *)(H5O_MSG_MTIME_NEW->decode)(udata->f, NULL, 0, &ioflags, mesg->raw_size,
-+                                                              mesg->raw);
-+
-+                /* Save the decoded new format mtime */
-+                if (!mtime)
-+                    HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, FAIL, "can't decode new format mtime");
-+
-+                /* Save 'native' form of mtime message and its value */
-+                mesg->native = mtime;
-+                oh->ctime    = *mtime;
-+            }
-             /* Check if message is a link message */
-             else if (H5O_LINK_ID == id) {
-                 /* Increment the count of link messages */
diff --git a/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch b/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch
deleted file mode 100644
index bb18879b5e..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0354419c3b5c6832c994b005903372f156b5fddb Mon Sep 17 00:00:00 2001
-From: bmribler <39579120+bmribler@users.noreply.github.com>
-Date: Wed, 13 Aug 2025 14:45:41 -0400
-Subject: [PATCH] Refix of the attempts in PR-5209 (#5722)
-
-This PR addresses the root cause of the issue by adding a sanity-check immediately
-after reading the file space page size from the file.
-
-The same fuzzer in GH-5376 was used to verify that the assert before the vulnerability
-had occurred and that an error indicating a corrupted file space page size replaced it.
-
-CVE: CVE-2025-2914
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/804f3bace997e416917b235dbd3beac3652a8a05]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/H5Fsuper.c  | 2 ++
- src/H5Ofsinfo.c | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/src/H5Fsuper.c b/src/H5Fsuper.c
-index d9fe3a7..1c8dc6c 100644
---- a/src/H5Fsuper.c
-+++ b/src/H5Fsuper.c
-@@ -746,6 +746,8 @@ H5F__super_read(H5F_t *f, H5P_genplist_t *fa_plist, bool initial_read)
-             if (!(flags & H5O_MSG_FLAG_WAS_UNKNOWN)) {
-                 H5O_fsinfo_t fsinfo; /* File space info message from superblock extension */
- 
-+                memset(&fsinfo, 0, sizeof(H5O_fsinfo_t));
-+
-                 /* f->shared->null_fsm_addr: Whether to drop free-space to the floor */
-                 /* The h5clear tool uses this property to tell the library
-                  * to drop free-space to the floor
-diff --git a/src/H5Ofsinfo.c b/src/H5Ofsinfo.c
-index 5b69235..2bb6ea6 100644
---- a/src/H5Ofsinfo.c
-+++ b/src/H5Ofsinfo.c
-@@ -182,6 +182,9 @@ H5O__fsinfo_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNU
-         if (H5_IS_BUFFER_OVERFLOW(p, H5F_sizeof_size(f), p_end))
-             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
-         H5F_DECODE_LENGTH(f, p, fsinfo->page_size); /* File space page size */
-+        /* Basic sanity check */
-+        if (fsinfo->page_size == 0 || fsinfo->page_size > H5F_FILE_SPACE_PAGE_SIZE_MAX)
-+            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL, "invalid page size in file space info");
- 
-         if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
-             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 77e77d88f6..8ccf4a3a13 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -9,46 +9,45 @@ to improve reproducibility.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+Updated for v2.0.0
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
 ---
  src/libhdf5.settings.cmake.in | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
+diff --git a/src/libhdf5.settings.in b/src/libhdf5.settings.in
 index deb07ed..6f255c4 100644
---- a/src/libhdf5.settings.cmake.in
-+++ b/src/libhdf5.settings.cmake.in
-@@ -23,23 +23,23 @@ Linking Options:
- ----------------
-                       Libraries: @BUILD_NAME_EXT@
-   Statically Linked Executables: @BUILD_STATIC_EXECS@
--                        LDFLAGS: @CMAKE_SHARED_LINKER_FLAGS@
-+                        LDFLAGS:
-                      H5_LDFLAGS: @H5_LDFLAGS@
-                      AM_LDFLAGS: @AM_LDFLAGS@
-                 Extra libraries: @LINK_LIBS@
--                       Archiver: @CMAKE_AR@
--                       AR_FLAGS:
--                         Ranlib: @CMAKE_RANLIB@
-+                       Archiver:
-+                       AR_FLAGS:
-+                         Ranlib:
- 
+--- a/src/libhdf5.settings.in
++++ b/src/libhdf5.settings.in
+@@ -4,7 +4,7 @@
+ General Information:
+ -------------------
+                    HDF5 Version: @HDF5_PACKAGE_VERSION_STRING@
+-                  Configured on: @CONFIG_DATE@
++                  Configured on:
+                   Configured by: @CMAKE_GENERATOR@
+                     Host system: @CMAKE_HOST_SYSTEM@
+               Uname information: @CMAKE_SYSTEM_NAME@
+@@ -34,12 +34,12 @@
  Languages:
  ----------
                                C: YES
 -                     C Compiler: @CMAKE_C_COMPILER@ @CMAKE_C_COMPILER_VERSION@
+-                       CPPFLAGS: @CPPFLAGS@
 +                     C Compiler:
-                        CPPFLAGS: @CPPFLAGS@
++                       CPPFLAGS:
                      H5_CPPFLAGS: @H5_CPPFLAGS@
                      AM_CPPFLAGS: @AM_CPPFLAGS@
--                         CFLAGS: @CMAKE_C_FLAGS@
+-                         CFLAGS: @CMAKE_C_FLAGS@ @HDF5_BUILD_MODE_C_FLAGS@
 -                      H5_CFLAGS: @HDF5_CMAKE_C_FLAGS@
 +                         CFLAGS:
 +                      H5_CFLAGS:
                        AM_CFLAGS: @AM_CFLAGS@
                 Shared C Library: @H5_ENABLE_SHARED_LIB@
                 Static C Library: @H5_ENABLE_STATIC_LIB@
-@@ -51,11 +51,11 @@ Languages:
+@@ -51,11 +51,11 @@
                 AM Fortran Flags: @AM_FCFLAGS@
           Shared Fortran Library: @H5_ENABLE_SHARED_LIB@
           Static Fortran Library: @H5_ENABLE_STATIC_LIB@
@@ -57,11 +56,8 @@ index deb07ed..6f255c4 100644
  
                              C++: @HDF5_BUILD_CPP_LIB@
                     C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
--                      C++ Flags: @CMAKE_CXX_FLAGS@
+-                      C++ Flags: @CMAKE_CXX_FLAGS@ @HDF5_BUILD_MODE_CXX_FLAGS@
 +                      C++ Flags:
                     H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
                     AM C++ Flags: @AM_CXXFLAGS@
               Shared C++ Library: @H5_ENABLE_SHARED_LIB@
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
index f0eb05a1e7..33ba78042a 100644
--- a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
+++ b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
@@ -6,18 +6,23 @@ Subject: [PATCH 2/2] Remove suffix `-shared' from shared library name
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Adapted to v2.0.0
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
 ---
  CMakeLists.txt | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -191,19 +191,19 @@ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF
- set (HDF5_JAVA_JNI_LIB_TARGET     "${HDF5_JAVA_JNI_LIB_CORENAME}")
- set (HDF5_JAVA_HDF5_LIB_TARGET    "${HDF5_JAVA_HDF5_LIB_CORENAME}")
- set (HDF5_JAVA_TEST_LIB_TARGET    "${HDF5_JAVA_TEST_LIB_CORENAME}")
+@@ -278,20 +278,20 @@
+ set (HDF5_F90_C_TEST_LIB_TARGET   "${HDF5_F90_C_TEST_LIB_CORENAME}-static")
+ set (HDF5_HL_F90_LIB_TARGET       "${HDF5_HL_F90_LIB_CORENAME}-static")
+ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF5_HL_F90_C_LIB_CORENAME}-static")
 -set (HDF5_LIBSH_TARGET            "${HDF5_LIB_CORENAME}-shared")
 -set (HDF5_TEST_LIBSH_TARGET       "${HDF5_TEST_LIB_CORENAME}-shared")
+-set (HDF5_TEST_PAR_LIBSH_TARGET   "${HDF5_TEST_PAR_LIB_CORENAME}-shared")
 -set (HDF5_CPP_LIBSH_TARGET        "${HDF5_CPP_LIB_CORENAME}-shared")
 -set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}-shared")
 -set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}-shared")
@@ -31,6 +36,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 -set (HDF5_HL_F90_C_LIBSH_TARGET   "${HDF5_HL_F90_C_LIB_CORENAME}-shared")
 +set (HDF5_LIBSH_TARGET            "${HDF5_LIB_CORENAME}")
 +set (HDF5_TEST_LIBSH_TARGET       "${HDF5_TEST_LIB_CORENAME}")
++set (HDF5_TEST_PAR_LIBSH_TARGET   "${HDF5_TEST_PAR_LIB_CORENAME}")
 +set (HDF5_CPP_LIBSH_TARGET        "${HDF5_CPP_LIB_CORENAME}")
 +set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}")
 +set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}")
@@ -42,6 +48,6 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 +set (HDF5_F90_C_TEST_LIBSH_TARGET "${HDF5_F90_C_TEST_LIB_CORENAME}")
 +set (HDF5_HL_F90_LIBSH_TARGET     "${HDF5_HL_F90_LIB_CORENAME}")
 +set (HDF5_HL_F90_C_LIBSH_TARGET   "${HDF5_HL_F90_C_LIB_CORENAME}")
- 
- #-----------------------------------------------------------------------------
- # Define some CMake variables for use later in the project
+ set (HDF5_JAVA_JNI_LIB_TARGET     "${HDF5_JAVA_JNI_LIB_CORENAME}")
+ set (HDF5_JAVA_HDF5_LIB_TARGET    "${HDF5_JAVA_HDF5_LIB_CORENAME}")
+ set (HDF5_JAVA_TEST_LIB_TARGET    "${HDF5_JAVA_TEST_LIB_CORENAME}")
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
similarity index 65%
rename from meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
rename to meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 7d75f0e7dc..79ce8a018d 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -4,24 +4,18 @@ extremely large and complex data collections"
 HOMEPAGE = "https://www.hdfgroup.org/"
 SECTION = "libs"
 
-LICENSE = "HDF5"
-LIC_FILES_CHKSUM = "file://COPYING;md5=adebb1ecf1b3b80c13359e18ef67301e"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
 inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
-SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
-           file://0001-Fix-CVE-2025-2153-5795.patch \
-           file://0001-Fix-CVE-2025-2310-5872.patch \
-           file://0001-Refix-of-the-attempts-in-PR-5209-5722.patch \
-           file://0001-Fix-CVE-2025-2924-5814.patch \
-           file://0001-Fix-CVE-2025-2925-5739.patch \
-           file://0001-Fixes-CVE-2025-6750-5856.patch \
            "
-SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
+SRC_URI[sha256sum] = "6e45a4213cb11bb5860e1b0a7645688ab55562cc2d55c6ff9bcb0984ed12b22b"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
@@ -58,11 +52,6 @@ do_configure:append() {
 do_install:append() {
     # Used for generating config files on target
     oe_multilib_header H5pubconf.h
-    # remove the buildpath
-    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/pkgconfig/hdf5.pc
-    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/hdf5-targets.cmake
-    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5hlcc
-    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
 }
 
 BBCLASSEXTEND = "native"

