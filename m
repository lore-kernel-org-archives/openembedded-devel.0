Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8324BCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32812.1792043030388307726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sgeit8CQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e49fbf92aaso28796115ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043030; x=1792647830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HUXOn3qsWVNCOr87aigwxMuF+HRMeyStlPLbm15s6CU=;
        b=Sgeit8CQ8XR6XsYm0/4gXz9Ga5leFRqjfh2wGJkTNqQWnjq8+TEaOEqYupFy+hoeSe
         T6f7VYnWRnYVMiYXUHvY8upr5J5eNK9g9LptmAe3YbT8M4n8MaTfYin6UHv0AszQ7WmT
         nY7iAqGKOiF+rlIsiV/XHDf3iV0gsfbbWbNDMfnTdn3+N3BCSApKS6gGkvOElt6dvE+I
         iXSE0pkozuvdKrb7Gz9PqZr/EcVFK8wJhV5w0JeKNoaYpLyaO15kA4h8y6mbhzqLSN90
         FYNPPRFi8CYJyXwCocghKNX80BzAbSfre62EEOAgvA4M2PN9+sP6zpQMTxB/QxK5Mzbm
         N8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043030; x=1792647830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HUXOn3qsWVNCOr87aigwxMuF+HRMeyStlPLbm15s6CU=;
        b=plL5XV7QlLiooeYQE+NsmlUF+UBgnESMbfDM9k7dwJ9Azvop0xb8+7L0b/noFzRA05
         EutrymrFLj4zgRP+gL3WgJ+z4dva1cTM6baPdatVVFMT1EOoOoG6/3gywfafjSx4xzfI
         jcQUoIIeOFbr3ISR44erTv1PTsC4rD0ZG1Vt+r92iJC2d0I5pN0SN2ATx1J2Hs1uEgpd
         lktNSEw4q7OVtsq4dqfiL/t3LR+vTzvoY9gJYVpWszgF48NxB4kCCJ6DQ9Xhfwou26Sp
         BaS/U2by7hTPHA6uZmoO2aj5NDVN6JzmOZkoN7pNuNWX8M6uALZmu9m8xCJgUA70jQcl
         YU+g==
X-Gm-Message-State: AFq9FYJ6DEO0aK16Y8yaXJ4op38r6FDOQ8HVwdPONfxgDq9I5VTtnflp
	/7LYkkJZelip18+tJVj06oRDcr1E/yuQT4XJzGjGmL0JrrBqVfrRD25QmzDymQ==
X-Gm-Gg: AYBFou0E8wbeb7Oz3ic/e8aDUhtXkQBCtj0OUeJBMKTBAWcX8t07ziTl+p0+CKnnJAD
	H9YPSad8JQaLFRqJQ4lv5VYx8MTzjUaMHg6vcbMR28f0vFsXbgHGeo0uwxPH1JmsE7uDtYW7cbV
	2RRcJHOmDLUVrHXCO7YCaxoJf0cu87ShQ938VjRk19y2qVu0QweSAUZX1cGvapClayfdZSPBujN
	91Iq1eT4sxQpwQByNpPWEAalF34bo4nqnr0DdhjAGcSbWQcOtOPiUbEBhaS2yzIi5wDpkHD0riU
	O6PsQWCFPALZf1C1AAaxsNJ9ShEGo3w4ZF3wJJWMycIBP93AlKR4CTYe5iHCaPLm+c/VZT8sjfC
	SPnatkrCIPBW5IZOtKH8rrzb+tZhRhVeux1DelSEjpQdzM8ttdV5GhLmOZu/XRLW38aRCA1uiwF
	7Vi/iXedUS2qGq89/YdQ+c6Lw0YLAW2K2rcBJeqA1DqF5mOLZOUPEuKHWkt+ru3mAGkLXh6NWcm
	fi2L7QhEZCZ5n/TpnQWhJE=
X-Received: by 2002:a17:902:f544:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e8427f11aamr154644455ad.1.1792043029524;
        Wed, 14 Oct 2026 22:43:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 28/82] hdf5: patch CVE-2026-19025
Date: Thu, 15 Oct 2026 18:41:16 +1300
Message-ID: <38078503c1f4cdef2cebc046be751e502d915afa.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130948

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from the PR[1] fixing the issue[2] mentioned in the NVD[3].

[1] https://github.com/HDFGroup/hdf5/pull/6508
[2] https://github.com/HDFGroup/hdf5/issues/6491
[3] https://nvd.nist.gov/vuln/detail/cve-2026-19025

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit df3f814ab84f9cbdcdaeb7cc745e0c61c90c55e8)
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
index 12c9852fd0..a0eb5eb155 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
            file://CVE-2026-17574.patch \
+           file://CVE-2026-19025.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

