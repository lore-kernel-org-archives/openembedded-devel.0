Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1915.1795113425449664849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fiVS9QXN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a9f9473029so88556b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113425; x=1795718225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QiL+MkQyXfDlSf+K9zP7OAfqo4qnyxPlwgDV8DbqVc=;
        b=fiVS9QXNxpkXEXuwUYYZ/4VBauN3nvI4ltTTKDDdwdOFPUpq5N/hkVR4kDX9Gx4DqZ
         9FK8k4ktNIa3mgP/513eS2ExJyNaYZb2m9s5Nk7faMNLtMHxnajCNvAtt/BeASPxbHhM
         VPEwShqsgjwmPwjNjxw3Re06G5twYi2tBmoF7atuHg7DW75H1sgCk4yS3cYGt4UWGLP3
         0yVQg4c+hei9+Dtnr8sAmVUcgOASK4SozrvQ0xPGu37Vy0quVETrIxPhp4uiLXqsSM2o
         PxJfrnCXTGsObTEXzd7pzRvOetzx1rEhSG3eNlDAv0AV5cs0jspBFxPk8aQqJP0BNIZx
         pYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113425; x=1795718225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QiL+MkQyXfDlSf+K9zP7OAfqo4qnyxPlwgDV8DbqVc=;
        b=HwbT218BVoVbuv5lvA+Atmvpj/i8/maHQAcozAfFhw6ADLhbV1aYDZ+0lJv2xCFggj
         uiUqSMF1pgmgo6O4t7Y1VQ/QSLN9d9Uq6GMNQtZhSUcoKB4tX1/vSKf7RnkqibIAvx09
         tjzxbhDCwGM0TNBolxPBNUcru4bV55DdqMIyvTzo29OHJU9V82YpeRWm82umqS9FlPIe
         e/ysj30lQ71SH+pkL8gs1AhyAQLG2Lb9blp65dVbFBX/FQWNC1JcV0zfLdncxX+Pb2fG
         +n89k2orxfjcD6mNvEtJQlmuvYf2pW2b1Xx+WAfNNWOqTlsjBO8wasrecExVY8A/4g7p
         VCGg==
X-Gm-Message-State: APuU4Z+KeMJ8W4vpmdZlxq7GmlX4+q/SltBovMABCW0x00g2bg4chKXt
	RsOTEfIlp6XqjA+MLHO4zNNjlT8qowN8+QUdPoN3lhTFGRa4IEl7349ngvsOJA==
X-Gm-Gg: AYBFou2nQ5ed5Yi0m4yHnwb7ntYvW4upl+Ma2xPIX9c/S4uwe+EvYkpv29nqR3tr4V+
	7qlHx2Za7uOFl8g1PkqpOL4+dinfr3SDIvU2GnfJ7sVEITCYyk+7LH4mWBduCMOGk8mjquco6g+
	xBaGSIKAB46WF7+0PWzENrSKYjTX5T0c3QuGoo/6YJG6ZwdNEl3zDMmppyEVNgV03zs/9VHERo+
	NXvN8IUzSL6fH8zlFVuAjISBNwIgORw8B8+RIdSns72K55nmvpt12UAabZsHCY/J10VfxOxwWah
	wjqNYhVKnI9AbY2AT9fBzcu0SyHHoRb0gHbifIEYW6elI8ciozP8/Txr7A5gJjpvzU/zoYCO46N
	G2b5zCFWjBovlHPaceiF4VumJLO12URfGAhOCUGG12bx1Ed7rfjou2DsLHnbZK9pcfD50QBDUqU
	vqLVRqrUFMSPJ4+8R98iprAsBBti1LZ54FoI62wGu5dGYlDv0DEdix8IJdfzQ4ylK4hXog2po+V
	nZ5SLsoH0q29MeQfV/WMfqdW0smcUFxmboLs3CHJYy2IDERsk6eQ1DIW4nWtJG7p4byEiKJ/LjP
	phO+yayIl4p1cFuFQ4j7gOUNHmcqHh9yPAaaEDAWcgddpygx5xpfI4LVL8rA7g==
X-Received: by 2002:a05:6a00:340a:b0:89e:848a:fc97 with SMTP id d2e1a72fcca58-8c87c95be2bmr475819b3a.35.1795113424712;
        Thu, 19 Nov 2026 10:37:04 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 27/64] hdf5: patch CVE-2026-120758
Date: Fri, 20 Nov 2026 07:32:55 +1300
Message-ID: <ae59cd88e6262be94a4c2f0fbfa069666ca75d63.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132717
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
index 3cfce91bff..7117c72f96 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-120754-CVE-2026-120755.patch \
            file://CVE-2026-120756.patch \
            file://CVE-2026-120757.patch \
+           file://CVE-2026-120758.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
