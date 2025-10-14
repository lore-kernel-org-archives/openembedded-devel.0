Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B985CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:32:58 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.3473.1760484777139256884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tty2v+tF;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so4934874a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484776; x=1761089576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z49fD9FWj0dDkLy5BiLkXDPG/f0qusOHTxWfpEkr4FY=;
        b=Tty2v+tFJ+da8nNSfR59wnxu2sQnpmnNomn8D9RL6/FF5JkYHo83oJB4OS3hEOI07t
         TVk0w2hAvGRkVoaXSS/HJvtvTOX08w+46w0tJViEHHxcHKt/3+i0QaSjyVRqhFa4b82v
         YjRZqSPdQK6OFlHanV98jMNvE/d8V385s7EXS+x5EKWnFsbecZ0eQPcktXl0rHOf93VM
         grqyN0hJ8zwhhIqHCwcckexO822lY/mq9ZcJNrvaNUDNbUiMoV/P0t+1kKF2UjpMgQC4
         lX0p+aKz+TC0JA5wMgRjNIvZF1Sh3SNcKClsvsCgDE2wWihsIzui1YBwg9ZLV3ew7B+6
         na2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484776; x=1761089576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z49fD9FWj0dDkLy5BiLkXDPG/f0qusOHTxWfpEkr4FY=;
        b=o1Z8jjRFUGuYvIBhGlxXvC8LAueD3H0bGg2RMkFOxITd878vR8Wmr2hrV9A45YAbbo
         4yYs7y6Zwomr7bdpIHelAUL3BDzS/VtCxInIAzX1TUUAnWT8bUTivkfonpxZmXeCv2JD
         nogyCKxm6xSIFWR/00L9wCVOzoj3uLAx5EBJUf++ALyin7FONeZvVrQmgEQKKTn3+S/+
         Z4Tl3XHLv51ExNK2f2rAhkkVVNL+K/aKWYYK/wm+aFVmKIYJhuGvwf6casbcha8jemxU
         sx/XM3XgMpn62TGgZhkHXEYyxqn6C4O4tj3imf+T9wk0jDEG3JqWsfkP1wvMrJwsZrYm
         XFEA==
X-Gm-Message-State: AOJu0YwXorNVE2XPhmCPSfGdcuiwiWN7pbaPX1pAMKY9Puj/iOLYjHDt
	af2ofVBbzeJBARmbDMe37TkuAJbvYARGobv9mTPzzx1XN8sic2pqX9EG7a1zOw==
X-Gm-Gg: ASbGncsocvcrBVpwjJUp4yemwJE4k8G9ew2Lo+Dz9/y2+kwA45niIbkxiZ1SjkiX2Vr
	yksSeclr5/eazgJk6YKao53UJpAA/1nFTvobL9YsQXYfsyWhL2pOadPEHFL18omIcxo0+vKrOKb
	QUzPDcExtjzNQbPvzXgrEZttaughEB+h2BGcuIpGgV0WShJt4HiXygBkMBEKMpy+8lWQs8EfKmg
	xrowc8gYxYVpmytPmK3x9ZgJrn63PGyGX//thrnMIBQmLdwU4IvC057VYJfN0MgGlNeQLo+qBjk
	q8i1PUy9Mx5hfjBGyQAGYvL1Pvbgna+GyEm+/YvxN7XGpb4+MItT0Vk8AXR1xtHCw41ZAhwLieN
	8H22TeUTUPndPOg4flM3TzHH+JEeJYyJSi3WjOZizaqEiDH6pmXN5ZYShJ9FxDcBEPM3YkOQA0h
	e8
X-Google-Smtp-Source: AGHT+IFwr8vWTVVGVrtlp8qU1dwB0f/atfjiK/vV7Xyr/uXW7OV+ZpfsO4iruSGcrXx1oil7Os7E9w==
X-Received: by 2002:a17:90b:4b45:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-33b51106a08mr36787571a91.8.1760484776331;
        Tue, 14 Oct 2025 16:32:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:32:56 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 03/18] hdf5: patch CVE-2025-2923
Date: Wed, 15 Oct 2025 12:32:14 +1300
Message-ID: <20251014233233.304125-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120662

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
 

