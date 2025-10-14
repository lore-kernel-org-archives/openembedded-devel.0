Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77B7CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.310.1760475255904882054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWL1RUT/;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782023ca359so5926112b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475255; x=1761080055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z49fD9FWj0dDkLy5BiLkXDPG/f0qusOHTxWfpEkr4FY=;
        b=DWL1RUT/aY3DuTC+urNoQXfL7RJQ/gBIVfrejJQYCp0XYPQQin1YiGN2u/oqmStyg4
         PsvbmOjfKbOCdy2eroWxxLbLiAApRosH1UlYWQWYYTecb1B8MingwoYtgp0IBVhNizn7
         xgBuJYVrOzf/8hd947lBw/U/czhkXYG1plwsJ7scRc4ajDkSmciCtICSVFqZ3cH+D8F0
         ATI63DahHSY5zqHeTaYMnrnob5X6fz91g3CzS9Z/DUCU+TLCP8g3Vz6Bwewpg0IvIdmi
         LbhjbSUCoVQPs70CPSHojUjKT6chz30l4uabIl0TZmqCFL7sNIzYPgJy9BXqgfyB1voJ
         Dg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475255; x=1761080055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z49fD9FWj0dDkLy5BiLkXDPG/f0qusOHTxWfpEkr4FY=;
        b=ComDbjx+8IaQwU1/nRvk+vghCfIBoNOxd7tP1ROOEIkz4shvc+Rvde2UCvjLbO9jIp
         Z6JUeWQ/DnlH98kfP6T06cqlrrQyUGG33kq4KjtTUARlXsOqpL4UqmFgnle7Y48d7LmO
         jwUDNBGi+0VmUrEfsyBrJCOcjjHnX4DMvQEgK3j+7mQQ3wR4Ymkfexzrw53EGI+z1JQA
         GfdA8FusF1b/anuXbqikEEJ93TlGHLineGgDxDS3SPDhzT0tBwI6K6twaBicdYJYRRYP
         YtMkVaFV6t16Ki3KC3XTDNZfIKFZGg2Kk422VgeG8iQ+rCVAWl0uEyXkOE/QToxa1Mig
         a8jA==
X-Gm-Message-State: AOJu0YylRhzF0RfMDTa7q4HjLDU7azdYcQsKtUMLrzTb3z6rt/PkLgjk
	Qx/n0QXpvKPzVdg4zfeGyDVWuBVvBdqtn3V+yaMqAbedXhWVAV9vP8TUvNoyQg==
X-Gm-Gg: ASbGnctqYmLb6HZGJ4XwJcW4LLMiCTXmUT56xXC69hqGugx9gfMFjcefAtsKO6N2hm3
	Bv4EihvImKe15WC52NUYMQEFGtqB2gNzNeiWg7Jm3ndZBIDTHTjFa/W+wjucqZQ3FBV2A5KT3rs
	Cm5vUkyPJfivnfvKejf3znrQh51T8VLLJqVgcPfwk/m4RxGwPpkG5kLxyICgJKkdMb5P4WAjcHX
	uEnTeS7j4am1A0QHlxqv4MrSXTPbrbuWhw17OAK7loaBbC6Ix8G9adZIolNSreEHEjRsU/RuUUt
	iI/aal7BAEODa+AbDNaKq7dLPTxaNfqKzQBGRceC1AlP1ewSi0MHt6jklwoXF8O9xPuxQconB+e
	LOAAuDhqzTNV1+aRSKrKe9ncdy2m1eP1Md+T6kJPcuEQvsU/QoSnw9RM=
X-Google-Smtp-Source: AGHT+IHjzlLsUPM64VUtuHMmJZGV7Osg70uaiOw/FH52l6fxTZYXdYsYDKEzc3fyfdFd9phWyZU02g==
X-Received: by 2002:a17:903:9cb:b0:261:1abb:e302 with SMTP id d9443c01a7336-29027373d8bmr306940135ad.14.1760475255114;
        Tue, 14 Oct 2025 13:54:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:14 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 03/18] hdf5: patch CVE-2025-2923
Date: Wed, 15 Oct 2025 09:53:46 +1300
Message-ID: <20251014205402.1487867-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120636

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2923

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 01238545d8f0ac9aabc271538d0ca5ccd9f3d9f4)
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
 

