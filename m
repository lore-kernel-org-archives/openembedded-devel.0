Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3736CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 22:59:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3652.1760050788959105521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 15:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iocEvfCy;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so16581845ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 15:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760050788; x=1760655588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUPB1TkLLM2l5MWHD9HA0Kgt3SdQ9fsIcaPgd2d6Qr8=;
        b=iocEvfCyBP12i5O1uFcCF7FVSaNvVaLhlwMhs7jEMgAHYoY33KYj9viMicf2RjCrwD
         Rx1H2RDYn7KeyEXn8wVLIOYTcQWrdBvKxWNFJZOL5T12VvBKH6A/9x7XjTocSff9I8y/
         Q5SSzhYPw5xA8X4DeJw3kjkAUYdI96CGc2bU14EawCVycgt0c4igMD5x4rIYkV0hga5S
         1luEcZ9GwaNQ3aHrvsBeHoh3bExOlPX4W/Zpg/oRszYsEj/3Huf6ervxRlYThX/4pHap
         RkPOQbU7lqYPTR21nepVrx3peLsPVaxS+QkOKQawDkR3rilvfxajTVK9soQMuCCYxDDN
         8s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760050788; x=1760655588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUPB1TkLLM2l5MWHD9HA0Kgt3SdQ9fsIcaPgd2d6Qr8=;
        b=QQYtg34KkFlUz2F4FocRcAOVPwKw5F0r/3PIq8BeJy8Fe01xlBVp5hlDlmdrbNr30F
         t0MhT8SDlDGCcz9hn1L9R2SVB7xaQlCgxqATN7nY6bhG7r065knXbU3NWzuvP+zF2dxB
         sflJG+39Rukk4Qedbp1tMv1vnTqV7rLnpDnjjL89dAf4haE4hFeRK/6D/8zrDb2lJOvW
         ZL8EwK4HfAiz+VpblsrPZu9WFGngpV/ZyNQ8D/h6mf+xnFlGyxQsbh2mqIsIlYEElWXs
         bcPJSmQXA/NZqcGW/RNJoyzMblcCDc7MSVdJteppR19kiEYXx5qHrxoMCKS94p4O0jTS
         o9TA==
X-Gm-Message-State: AOJu0Yy+UiPWEXGm1cUMZWoIInf5LB2HKMrW9+P/Xf3Fog7Pim4hobZl
	q5VaDh7tjalp/vu+v+H8t9i90sdVhWyoX8dPxigkaTmojwiH31Ji9TEqrxklPA==
X-Gm-Gg: ASbGncsbTgoN2vNZYK/KQA+phl+2K6cR7Q3MP1rEOGBTCZotEMKAvw/1vVNnk3lt4TR
	c3933ZklMKuP0fBTePmUAu5kJyLsyXwbHsY8ScQfNIUGW3gjluI5vrdjlWCR/TqJkCVtJaay79F
	8QK0BkXywnCAuIvXkNmSE89xlVTZGiB5uTHoxFiTHlfjXU5/p25ILJ8BpzPEphSXxMPzmWg5g6l
	fYXBZmDMjFtDoe/ez7WuCuTqveVMGTgv39O2nopAOtAd9lbLmZGmXZ8xnwHrgbzyCqqtRQkWrqH
	EF8WyErwwI1+5daonDCKMQ66GPweA33yDdyI476fPiNPIwHlMA0dNy9+5T/Y9dqZ0wKP3aLQj0R
	dpzQVilBSPp1uccrslUJYzCm/syDqWsRcEbv28085IwGi/cydPPpGOaCbJekx
X-Google-Smtp-Source: AGHT+IGhbWA4noMcRHVCW9TtwUZIBMcHuCwrsBNucagcPfQe6+kOGqwu9/mGlz/ueoSlEN6I0LpZsg==
X-Received: by 2002:a17:902:e785:b0:288:e46d:b32b with SMTP id d9443c01a7336-290273748d3mr127232605ad.17.1760050787976;
        Thu, 09 Oct 2025 15:59:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93e06sm38961815ad.115.2025.10.09.15.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:59:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/4] hdf5: patch CVE-2025-2923
Date: Fri, 10 Oct 2025 11:59:28 +1300
Message-ID: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 22:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120455

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2923

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/0001-CVE-2025-2923.patch       | 67 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch b/meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch
new file mode 100644
index 0000000000..ffaade2503
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch
@@ -0,0 +1,67 @@
+From 951ebdce0098dac1042d5e9650e655c6c1f92904 Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Fri, 26 Sep 2025 13:13:10 -0500
+Subject: [PATCH] CVE-2025-2923
+
+Fix issue with handling of corrupted object header continuation messages (#5829)
+
+An HDF5 file could be specifically constructed such that an object
+header contained a corrupted continuation message which pointed
+back to itself. This eventually resulted in an internal buffer being
+allocated with too small of a size, leading to a heap buffer overflow
+when encoding an object header message into it. This has been fixed
+by checking the expected number of deserialized object header chunks
+against the actual value as chunks are being deserialized.
+
+Fixes CVE-2025-6816, CVE-2025-6856, CVE-2025-2923
+
+CVE: CVE-2025-2923
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/29c847a43db0cdc85b01cafa5a7613ea73932675]
+
+(cherry picked from commit 29c847a43db0cdc85b01cafa5a7613ea73932675)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Oint.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/src/H5Oint.c b/src/H5Oint.c
+index 022ee43..a5e0072 100644
+--- a/src/H5Oint.c
++++ b/src/H5Oint.c
+@@ -1013,10 +1013,9 @@ H5O_protect(const H5O_loc_t *loc, unsigned prot_flags, bool pin_all_chunks)
+          */
+         curr_msg = 0;
+         while (curr_msg < cont_msg_info.nmsgs) {
+-            H5O_chunk_proxy_t *chk_proxy; /* Proxy for chunk, to bring it into memory */
+-#ifndef NDEBUG
+-            size_t chkcnt = oh->nchunks; /* Count of chunks (for sanity checking) */
+-#endif                                   /* NDEBUG */
++            H5O_chunk_proxy_t *chk_proxy;            /* Proxy for chunk, to bring it into memory */
++            unsigned           chunkno;              /* Chunk number for chunk proxy */
++            size_t             chkcnt = oh->nchunks; /* Count of chunks (for sanity checking) */
+ 
+             /* Bring the chunk into the cache */
+             /* (which adds to the object header) */
+@@ -1029,14 +1028,20 @@ H5O_protect(const H5O_loc_t *loc, unsigned prot_flags, bool pin_all_chunks)
+ 
+             /* Sanity check */
+             assert(chk_proxy->oh == oh);
+-            assert(chk_proxy->chunkno == chkcnt);
+-            assert(oh->nchunks == (chkcnt + 1));
++
++            chunkno = chk_proxy->chunkno;
+ 
+             /* Release the chunk from the cache */
+             if (H5AC_unprotect(loc->file, H5AC_OHDR_CHK, cont_msg_info.msgs[curr_msg].addr, chk_proxy,
+                                H5AC__NO_FLAGS_SET) < 0)
+                 HGOTO_ERROR(H5E_OHDR, H5E_CANTUNPROTECT, NULL, "unable to release object header chunk");
+ 
++            if (chunkno != chkcnt)
++                HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL, "incorrect chunk number for object header chunk");
++            if (oh->nchunks != (chkcnt + 1))
++                HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL,
++                            "incorrect number of chunks after deserializing object header chunk");
++
+             /* Advance to next continuation message */
+             curr_msg++;
+         } /* end while */
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index f34e5f183d..4305826b22 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.4/src/${BPN}-${PV}.tar.gz \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
+    file://0001-CVE-2025-2923.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

