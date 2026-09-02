Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916C3C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9068.1788343583863305830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SmtTUy/7;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d01663d816so7079595ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343583; x=1788948383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mbe9gI0jjJFZ0xr7RJVarvn2Sz5mNUnrQ8diwcqbv8=;
        b=SmtTUy/7D6/egEHyf9oKNGZTqeImjcR7vGONC76zJjYQ1GR9nJfNMTMz/EH7bgff9u
         viXcoNjr2PVwfezmytrA9KcHm9HsfEIoCEwBUXEcFEMS4Zu4vRSk7ehvzTbwBZWqkUOZ
         VkcylsXyZBJmL9Vx7mXy8tde3FPAwY+CXhRf1BJJrN9kamBfApdU/9eifqpAv9zrVvci
         C17qgepj7XU9+lD5jznd8InYgnPE1OZ/xUU6THnDE4/dvuauMc/myJLMCjL863aUg4Nk
         UmLVotTbyW8HjxUkeMA+rbZIdnSAZcFGODlNabX6Z4ZZ4QW65Frt8t1Eed9hy3D4RdeP
         fYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343583; x=1788948383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mbe9gI0jjJFZ0xr7RJVarvn2Sz5mNUnrQ8diwcqbv8=;
        b=mQnML22qkuwyvricY8zaaNOgP1GAtWE2D4qQ1atiQtpXFFZr/s7JYDHYaUwJhxtVdU
         XVCQLpQ1F2/PuJK3aHLuz08tdORY2SbpoXpYMFi5eunUlaY13k+WQJ/x8/bjwlhS4hYQ
         k0J0xUkQNKOGQrMYJkBYwWk9QHsu5DqgnCaLEGzLa1hMhUEa5I7cJmm6nPfCIXEAcp51
         HPd/b2AXMwSByTetpKj0zXA88nIxfw1u262GVTfTofqUSmckZyNM3/1hexB2KXLinklk
         o6hLAUmnV0qR6BSjmH6V48hqyASsiaqGyGHdTIRZY0ADZShPG3HK+UZCTcAkpLU+SLgT
         1gLg==
X-Gm-Message-State: AFuF++kNqatqFRfcbHy12uXaldguzeBRMMn48czBUZaWZcXwElvBu9tG
	ms394HWtpCtE2JHeoJd+BVnK36OJJpd5481/GkwgFuqmTt4jXedgsFsOZc1hMykC
X-Gm-Gg: AYBFou2r+wu6jgFtxweoP0RZQjK92Mh6pP4vo54osPiAb0grZ6uy3jrIEPcKvfi3vPy
	ZscPKEyjgIEkZIBKjR2aF2iUPLmpUkGUs5kye/M9BTFqVXArVGHhGa/opCjLDwO12MhS1u/43nR
	M0/zCjT3H444i09rAvG1tRsL4tT9goXnU/FYAxInj2U6ebQ73LrWwdyp2A+8cAFRDx4J8x8LG0T
	UbVpP87xYtK+Y5q9Yi9CnitNDBlrXEukIsrZh7C3vcD+4uTr9Wq1dwNZl4qJvjZHXMNU2aMlM8s
	pmCTglEDFLGVepKUwRjrHB1Lfi19EMWGn6KqgWLVnIiOmocUpVDLfDUDgun40WI+XWvv1jityjW
	H82wGoTekGCiS1Hxwzs4X0P0WlIkm7XB6kYhMdVwklcuTY60ChqzdMG4dgxLm9ihevtZVBesAuR
	7VtAqBIA+gBDfa6LawnERum9K6e2YWjwZ12X6Ucw0S9u09BNYrVPMzSknsuoPN4tFnCA4ZIJz4O
	l/AjwUZJVQ=
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr6134212a91.9.1788343583119;
        Wed, 02 Sep 2026 03:06:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 26/28] hdf5: patch CVE-2026-19025
Date: Wed,  2 Sep 2026 22:05:08 +1200
Message-ID: <20260902100511.2105916-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129657

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from the PR[1] fixing the issue[2] mentioned in the NVD[3].

[1] https://github.com/HDFGroup/hdf5/pull/6508
[2] https://github.com/HDFGroup/hdf5/issues/6491
[3] https://nvd.nist.gov/vuln/detail/cve-2026-19025

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-19025.patch           | 112 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
new file mode 100644
index 0000000000..075bcf7653
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
@@ -0,0 +1,112 @@
+From 0cb26cd769d1da3f2ad2c3836dc1732309f935a7 Mon Sep 17 00:00:00 2001
+From: Matt L <124107509+mattjala@users.noreply.github.com>
+Date: Fri, 28 Aug 2026 13:49:02 -0500
+Subject: [PATCH] Fix CVE-2026-19025 (Reject chunked datasets with mismatched
+ chunk/dspace rank at open time) (#6508)
+
+* Reject chunked datasets with mismatched chunk/dspace rank
+
+H5D__chunk_construct() validates that the chunk layout dimensionality
+matches the dataspace rank, but that runs only at dataset creation time.
+When an existing dataset is opened, H5D__chunk_init() didn't repeat the
+check, so a file whose stored chunk rank disagreed with its dataspace rank
+was accepted. During chunk I/O the memory-selection rank (from the
+dataspace) and the file-selection rank (chunk ndims - 1) then differ, which
+produces a zero stride that causes a divide-by-zero in
+H5S__hyper_iter_get_seq_list().
+
+H5D__chunk_init() now performs the same dimensionality check on open (the
+stored chunk rank includes the extra element-size dimension, so it must be
+exactly one greater than the dataspace rank) and rejects a mismatch with an
+error.
+
+Added test_chunk_dims_mismatch() as a regression test in test/dsets.c
+
+Fixes #6491
+
+* Fix typo
+
+Co-authored-by: Copilot Autofix powered by AI <175728472+Copilot@users.noreply.github.com>
+
+* Clarify element-vs-byte wording
+
+* Validate chunk/dataspace rank at layout decode time
+
+Move the stored-chunk-rank vs dataspace-rank consistency check out of
+H5D__chunk_init() and into H5O__layout_decode(), so a malformed chunked
+layout is rejected as the message is decoded (mirroring the fill/datatype
+size check in the fill message decode).
+
+* Update release_docs/CHANGELOG.md
+
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+* Update CHANGELOG
+
+* Pin format version bounds in bad chunk layout generator
+
+---------
+
+Co-authored-by: Copilot Autofix powered by AI <175728472+Copilot@users.noreply.github.com>
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-19025
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/b7b85e7abf9aa9b1dd9693523defa35217684eb2]
+
+Dropped changes to the test and CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Olayout.c                   |  32 ++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/src/H5Olayout.c b/src/H5Olayout.c
+index d230feb992..5dce35e916 100644
+--- a/src/H5Olayout.c
++++ b/src/H5Olayout.c
+@@ -23,6 +23,7 @@
+ #include "H5FLprivate.h" /* Free Lists                               */
+ #include "H5MMprivate.h" /* Memory management                        */
+ #include "H5Opkg.h"      /* Object headers                           */
++#include "H5Sprivate.h"  /* Dataspaces                               */
+ 
+ /* Local macros */
+ 
+@@ -561,6 +562,37 @@ H5O__layout_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNU
+         }
+     }
+ 
++    /* For a chunked layout, the stored dimensionality includes an extra
++     * element-size dimension, so it must be exactly one greater than the
++     * dataspace rank.  Validate that here
++     * to reject malformed files before the inconsistent
++     * ranks can cause problems during chunk I/O.
++     */
++    if (mesg->type == H5D_CHUNKED && open_oh != NULL) {
++        htri_t space_exists; /* Whether the dataspace message exists */
++
++        if ((space_exists = H5O_msg_exists_oh(open_oh, H5O_SDSPACE_ID)) < 0)
++            HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't check for dataspace message");
++        if (space_exists) {
++            H5S_extent_t *extent; /* Dataspace extent from the sibling message */
++            int           rank;   /* Dataspace rank */
++
++            if (NULL == (extent = (H5S_extent_t *)H5O_msg_read_oh(f, open_oh, H5O_SDSPACE_ID, NULL)))
++                HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't read dataspace message");
++
++            rank = H5S_extent_get_dims(extent, NULL, NULL);
++
++            /* Done with the sibling dataspace message */
++            H5O_msg_free(H5O_SDSPACE_ID, extent);
++
++            if (rank < 0)
++                HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't get dataspace rank");
++            if (mesg->u.chunk.ndims != (unsigned)rank + 1)
++                HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL,
++                            "dimensionality of chunks doesn't match the dataspace");
++        }
++    }
++
+     /* Set return value */
+     ret_value = mesg;
+ 
\ No newline at end of file
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 8b5b842fa0..cf199375d3 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
            file://CVE-2026-17574.patch \
+           file://CVE-2026-19025.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

