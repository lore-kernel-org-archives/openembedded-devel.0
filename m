Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EC5CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5106.1791839467317967395
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JPEdxpfL;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so1835099a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839467; x=1792444267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6rtrxU2F0igLKmi1YwTtTAtE+8sinCmQ20pGSFM21o=;
        b=JPEdxpfLj28GTv1QkPQiUMyrebHMNbte7a7ChPj/19a6BEMcM0pYyhdAADlWqv8woI
         7bxnV8uwuyrCb1BDAXnMOBDcS8JZbAdH8K+LGZliUWLkoCHtDvO9TgX8gK6QDcJB0m1F
         Kf39ofvmcfh76aHEou+ZxmtJafoscudcaM2y6/+pzuNlBcLvTGN8reRTBCeRIoOBSROU
         ZYtEVG+AdEKk4VoJyjPKgg6Yh91TBTgF1BzSBKqs6F/GhM5cIDf1QrYuoDq9GF++Tvps
         m2RBgXQGGszStsj3jcwaAnSxZHUXFZ1kV4oO9kOihxsHlQRzUPEu2dXN8Jjzk7gpaG43
         p3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839467; x=1792444267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6rtrxU2F0igLKmi1YwTtTAtE+8sinCmQ20pGSFM21o=;
        b=1mxIbItpulbnT3sRxBn18M3/n2huFIDhC7XB0AaIge/NncriuqysHk59o5L9Bmyc7m
         w7Ktnf8JqbVi84+2i/Op8fmelXVM1FE3b8bT6GnZgZDKUb2LwHtjs5pB+lSmni9EJpME
         uuVvbEL8C0OrDEBt2ha1JC9jr2CVpzIB63Tg7V0EA63kgwf6UCRSOJ9nVwtvgZPKPkA6
         bRxu54cY9wuEBpwqfPveZJqvi6KiQpXIPKDSGvR3GZ5gZP1hroEwLztLqUIasvS6p3pu
         u5yJyIGuGxAXZGIJckKCsAud1Rjs+ozGjT9/ZY8rb/MRqzOuUoIJei9LBKrHbdKOGlmh
         xxJw==
X-Gm-Message-State: AFq9FYLG45uE//eCEzjWcsGTl9iN93iPFMbP9xpE/NGHCwZs5IA4BiH8
	YSzqc0jgCVcer36YKHmYVSsGOr+iMmcSIFFykiz7zTcxmKZ8oYkhkinbk9s+bEA1
X-Gm-Gg: AYBFou3R95YqH4I/ih707CbhxzrXa6UXQ3/t/noupJk+q+YBkbs1RrW6Uhyb+bJk3Gg
	H5NBXjdKcHhxPO6wLjCGWmGVp+bjAFoSbBG8+j0AV5QQTWZeCvBvrOQAMjQEQri8Ffqffq/PslE
	jlksRjyf/LOEB5geiweCqG1JpyKU8mVLPrQVgdITQvGWZTrswc4p+9qyVKYR3Fpgj8aVNYOaHn4
	fhfNl1uqBknltWWaGujLUFEszo0JADCrN3HsmYUbOz9gasxxZRF8GLUCNz0ljez3ylwoNRixfVY
	LQP0mPlqDAChEXjFoL5sfsR7reHUBcSWcbn36EMrjNRUXhNN79ASTdH0IcQPkbY/zvFy+5QWFhV
	5opk6NNtPuPMUZh9bTlkiTQtsuxWlgCD5FkU1Zeccszq0DrTi7LEgM88xWa+7HpuHZ3sC+P9BzV
	z34kaNDHpPB1OfHyETJyE4DYd3GnTqJbrTYIF7v3SmNqVSNatE1qeiR+ktEsCl4j+0cU71qBXY0
	1eVFI3zpWteRqE93CmCskZcezjpUEBCT+/IZkG5moKTwmxdUg==
X-Received: by 2002:a17:90b:1dc1:b0:3a8:96cb:fe8 with SMTP id 98e67ed59e1d1-3ab3a2fe583mr8867767a91.9.1791839466628;
        Mon, 12 Oct 2026 14:11:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 19/43] hdf5: patch CVE-2026-19025
Date: Tue, 13 Oct 2026 10:09:43 +1300
Message-ID: <20261012211009.3352822-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130789

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
index 00000000000..075bcf7653e
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
index 12c9852fd02..a0eb5eb155e 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-17572.patch \
            file://CVE-2026-17573.patch \
            file://CVE-2026-17574.patch \
+           file://CVE-2026-19025.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

