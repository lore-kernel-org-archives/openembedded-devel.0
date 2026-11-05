Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6747.1793913789777989986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B80Qxg3L;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so3138232eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913789; x=1794518589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XENQbrtMiXWdjIGUxRAln+jArm1NV/qgRCvtOJ+RpG8=;
        b=B80Qxg3LQj36jpk7/gFNagzRLj0D1b8CRaP4tFfputwZx6P4gIjTqRyyj94FLnniUu
         TLXDLALvPXhvBMz8Zo9E26rE01hQjHn5AtXlSyI1BsxvQL9iP4xtGtAyzb0LlNV9DN9G
         j9/ifGsaUpe0pFiubuMBiLhV9f2XK3yiYaIo6p+DDwSOJgqBxqo98F80Pgy641DTBbMC
         baA/WqpzNCUE0StjYIgM1Q6dGT/iBzTWtCaGXpDwR/PcLpFQ6Ep5hElEADEIvZOHjwuC
         uARm0CbPVq+r18e4YZLfC0u39yhDCk4GbKrmo4bVFQY2TEfdGvMqAsPRZEIavnjMQ30m
         L4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913789; x=1794518589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XENQbrtMiXWdjIGUxRAln+jArm1NV/qgRCvtOJ+RpG8=;
        b=1PHUbhtLEBtADwt7cBhw7hfMbvF5x9OEcIa70kCYdrwlNtHkbL7Yl27iZZLPpW3o9r
         cYMJcvBzFAKdsREjkc8EMXH7PhZZ5jO7YsQqtk8eCj1VJOG85m1oN0rbHIRTnGcj62Vq
         HTDJ7toMqhf2aENXcx0TKxXiEjafmKRlP0Tp+UBQN/dKTqxpMj6V725Y0iveI6hQaIAG
         3ux0opHfOFFxmLug5q7XvS2Y+WQejLr5M7C61YIqwUUjXwHERgqISIhZUmJVpkgrB4GD
         4w6QWB/nJpLM880x2ZwgYVI4327VUs2TmaPcVFxqRdPZpG31Zk4Z+x11OvL+jN7SybNw
         VZcQ==
X-Gm-Message-State: APuU4Z+lWpFSw1bsYc/idIY4jDLpHOA7scAUbgaIOZNMJTWpftBtQ30U
	GYzWXkDbeRTzayopkIMsPXbfcy/1ez2Ffc7kKbDNRVaDGXVMp6SyB3CegLNsmg==
X-Gm-Gg: AYBFou1/u1PchgYH0J8mb+h8DorH5afFHoWD+vU97PXIAK9rOXL0ZcueBBaM9sW2ti7
	hG/H4MdTTD2fT/AD9LfRWw/76x53ppSwv7z+uBB92YEnUNpu/GsezOzGzIAKcq66FynGNwjpWFe
	BkHUmVWSiThS2EwyeCnVnaxFoujEbTJRspLqOEcBqsdcZB0/3Jadem2/Mg4RC8X3Rqx4+TvAj2s
	/WZfM2H2ejW9NB06tcg0Kes6TJnYCPrnI1Wc+/9gfugHiDO1qNXBf3qdBtM6CroRBNF56PksIOc
	4NqrAR2Oxkw4Cq0Ax/MOy3xbm1WgSHPBJu2UJs418kGOE+hFAkXMZKLvWZuOFo5+jS8eege5iu3
	J6DqhqoXEBWVMvn0SHc1CAWSfynXFIIqnZ52nZceKTuqcNauzZqB+QFcEqVGu0JOX7BDOnp6v2y
	UwpjFixy+BuXlSm4kRYssgaiq6mEANXFR3KgNY4kzgrIUFA39IDvuCW5xCuTTN5zCbuuPXSbTdR
	kNVEB2R667scEVX0Ldd9S9Aegqd94ivLy7D7Dp0lKyF89UBnaI/1AgnuETaTfA1s0LJqEakdGQr
	vWZ9MaJett9/eh81BH7VGL8us2dFUK4rD37Zw9jw8EjTtOrB3paSHavYBckHHraFqwX/0O8DcqO
	Otd/Mve4=
X-Received: by 2002:a05:7301:791:b0:36d:f46a:87b8 with SMTP id 5a478bee46e88-36f77005ae5mr471176eec.37.1793913788945;
        Thu, 05 Nov 2026 13:23:08 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/14] hdf5: patch CVE-2026-120758
Date: Fri,  6 Nov 2026 10:22:43 +1300
Message-ID: <20261105212250.490188-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131944
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120758

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120758.patch          | 143 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
new file mode 100644
index 0000000000..a8fb5f72ff
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
@@ -0,0 +1,143 @@
+From 277a6bbfdb8e852b7bbd08ae002907fc559e0194 Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Sat, 3 Oct 2026 07:43:53 +0200
+Subject: [PATCH] Fix NULL pointer dereferences in H5HL_protect and
+ H5HL_unprotect (#6377)
+
+* Fix NULL pointer dereferences in H5HL_protect and H5HL_unprotect
+
+When reading corrupted HDF5 files, H5HL_protect can encounter a heap
+where prfx->heap is NULL or heap->dblk_image is NULL. Similarly,
+H5HL_unprotect can encounter a heap where heap->prfx or heap->dblk has
+been set to NULL by H5HL__prfx_dest during cache eviction of corrupted
+entries. In both cases, the code proceeded to dereference NULL pointers,
+causing a segfault (found by OSS-Fuzz via matio).
+
+Replace the assert in H5HL_unprotect with proper NULL checks and
+HGOTO_ERROR, and add equivalent guards in H5HL_protect, so corrupted
+files are rejected gracefully instead of crashing.
+
+* Address review: drop speculative H5HL_protect NULL checks, add regression test + changelog
+
+- Remove the NULL checks in H5HL_protect for prfx->heap and heap->dblk_image.
+  prfx->heap is set in H5HL__prfx_new and only cleared in H5HL__prfx_dest (which
+  frees the prefix in the same call), so the check is unreachable and could leak
+  prfx via the done block. heap->dblk_image is NULL by design whenever the data
+  block is not contiguous with the prefix, so that check was a false positive.
+- Keep the H5HL_unprotect NULL checks for heap->prfx and heap->dblk, which are the
+  actual fix for the reported crash (OSS-Fuzz 504827191).
+- Add a regression test (corrupt_heap_unprotect) in test/lheap.c using the
+  minimized fuzzer file heap_corrupt_prfx.h5, asserting the corrupted file fails
+  gracefully instead of crashing in H5HL_unprotect.
+- Document the fix in release_docs/CHANGELOG.md.
+
+* Improve lheap regression test for H5HL_unprotect NULL deref
+
+Replace the file-based traversal (which does not deterministically reach
+the cache-eviction path that nulls heap->prfx) with a white-box check that
+protects a local heap, simulates the corrupted/evicted condition by nulling
+the heap's prfx/dblk pointers, and verifies H5HL_unprotect() returns an
+error instead of dereferencing NULL. Keep a best-effort open/traverse of the
+OSS-Fuzz minimized file (issue 504827191) as a smoke test.
+
+Verified: without the fix the test aborts (H5AC_unpin_entry(NULL)); with the
+fix it passes.
+
+* Improve lheap regression test to consider review comments
+
+* Fix formatting
+
+* test: improve lheap regression test for reviewer comments
+
+- Use H5L_info2_t in visitor (matches H5L_iterate2_t signature)
+- Use H5O_info2_t with H5Oget_info_by_name3
+- Replicate matio's exact traversal: H5Literate2 + H5Gopen2/H5Dopen2 +
+  H5Lvisit2 recursion, H5Aiterate2 attribute reads, skip #refs#/#subsystem#
+- Keep white-box deterministic NULL-pointer guard (fuzzer file does not
+  deterministically crash via public API alone; original crash required
+  matio fuzzer's specific cache-pressure environment)
+- Add CORRUPT_HEAP_TESTFILE define back for white-box test
+
+* Fix formatting
+
+* Reject a local heap unprotect when its pinned cache entry is gone
+
+H5HL_unprotect() now reports an error instead of dereferencing NULL when the
+cache entry that H5HL_protect() pinned is no longer linked to the heap, and it
+checks for that before decrementing the protect count so a rejected call leaves
+the heap unchanged. The regression test as written couldn't fail, since its cleanup
+label was after passed and every failure path still returned 0 (success).
+It also only ever built single-cache-object heaps, and didn't reach the branch the crash
+came from. It now grows a heap into a separate data block to cover both
+branches and uses the standard error reporting.
+
+---------
+
+Co-authored-by: Matthew Larson <mlarson@hdfgroup.org>
+Co-authored-by: Matt L <124107509+mattjala@users.noreply.github.com>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-120758
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/91fc37c3325264e67699408e3a190fe4f329bf85]
+
+Dropped changes to the test and CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5HL.c | 34 +++++++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/src/H5HL.c b/src/H5HL.c
+index b55b3690617..838426406a9 100644
+--- a/src/H5HL.c
++++ b/src/H5HL.c
+@@ -416,28 +416,36 @@ H5HL_unprotect(H5HL_t *heap)
+     /* Check arguments */
+     assert(heap);
+ 
+-    /* Decrement # of times heap is protected */
+-    heap->prots--;
+-
+     /* Check for last unprotection of heap */
+-    if (heap->prots == 0) {
+-        /* Check for separate heap data block */
++    if (heap->prots == 1) {
++        void *pin_obj; /* Pointer to local heap object to unpin */
++
++        /* Get the object that H5HL_protect() pinned.  It is unlinked from the
++         * heap when the cache destroys it, which a damaged file can provoke,
++         * so check for it before the protect count is decremented.
++         */
+         if (heap->single_cache_obj) {
+-            /* Mark local heap prefix as evictable again */
+-            if (FAIL == H5AC_unpin_entry(heap->prfx))
+-                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap data block");
++            if (NULL == heap->prfx)
++                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "local heap prefix is not in the cache");
++
++            pin_obj = heap->prfx;
+         }
+         else {
+-            /* Sanity check */
+-            assert(heap->dblk);
++            if (NULL == heap->dblk)
++                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "local heap data block is not in the cache");
+ 
+-            /* Mark local heap data block as evictable again */
+             /* (data block still pins prefix) */
+-            if (FAIL == H5AC_unpin_entry(heap->dblk))
+-                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap data block");
++            pin_obj = heap->dblk;
+         }
++
++        /* Mark local heap object as evictable again */
++        if (FAIL == H5AC_unpin_entry(pin_obj))
++            HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap object");
+     }
+ 
++    /* Decrement # of times heap is protected */
++    heap->prots--;
++
+ done:
+     FUNC_LEAVE_NOAPI(ret_value)
+ } /* end H5HL_unprotect() */
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 8777345a72..fe3c6211a3 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120754-CVE-2026-120755.patch \
            file://CVE-2026-120756.patch \
            file://CVE-2026-120757.patch \
+           file://CVE-2026-120758.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
