Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C4BCCF9F3
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.9101.1761651187316561682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYWurvHa;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340299fe579so976765a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651186; x=1762255986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKggt3l9Z7VrEqNMciagynohVPit+PV/PU4sbfCz6OI=;
        b=GYWurvHaAo2cx102aXXZme6MSEZRbqvtMYNtaXttFu6UVgcdZ1bjRdzzZ+TouHwikq
         BWmPG2flZjlVFx19rAl9kBOGO1JLxfjAIv2bNZUswxCpsAh9Ab/+CDi3ZCSHAjTKZKBm
         +59hydtc0BmoumejLdyFJKqqRvtJi4e4r5u9YBocmf5/n8O+h/eLmpQqUdEhCS4jCAql
         tZNMN4Eeoi/C13zyYSLdM/L1Zk2f7ouRhQLf1amGaleh7rNafLckA/FnJp66SzWY4+zn
         iXQbObIXORhbl/IRF/0ZyejGU2TdBGQx0zszPqC41iAWMbaX8F9ZFGaJ8t7gETu4LNeK
         o7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651186; x=1762255986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKggt3l9Z7VrEqNMciagynohVPit+PV/PU4sbfCz6OI=;
        b=On4UQ7iM5RoT/9Y7frZnc23x1+T7vnx25JhQzK81MYrrnsUXJ9oGklpmPa7Pl8loY5
         VuBj8JXYE7Dnj5tOvAX1CCofuaokobgAv2l3ukBKNcM/pjXdhWpSK8vhMS1TeZfmas6K
         ymSSfACKPLfR5ptdU8TI5NEICi09w8In9yajEIX/u3ct8qrXIK3EnH5pRfrRr3/5hCmr
         WdUmsYOgiK2tqiupW0bdO7+EMtlyIBoKOJMxcK3Ho2nCTRzcbn7MW26y3f8V9vwxoaLK
         e12vPeOWjzGWuFc1EAmhZN2MKjozxdv0+ygzvyZuw8rO5SjBz1Bt1Q/+mPvmqsZqYwyh
         9rTg==
X-Gm-Message-State: AOJu0Yybui7Gj+c3cw3K2zKsuY5WIAhp7Q9Q6jqqi5nALatlUuUDBl5P
	kq7ZnpAB4xgQEqjJ8oKlzAxPKDAG64Wvq3k4s+ErFzY0t/cIj2p3mUdFG0WFpA==
X-Gm-Gg: ASbGnctuaM9YehWbKCeWThzkXAQ5rUHrWoDH8SAT8ryemNZ1wHM38YF8eVURCBf7xpn
	20B8xHRstmzUnlcX7sIqNJ0uX693UMOqv0pUsP2xzyXFtO6RBoSOYG81eWmlsfEICSwvZOJW7Ai
	R3LC+5lVh6pJ6zxUnuEp3vcRowE5s0i+HtGSAsmWmCJTNElWIhSgpdTxUp+htPuA2P0VtQPQKCw
	t498duszvFtJQm68ghNo2XgpaXwBFN73S2CzIpShryEAhM4pz0w0rhvi1FNu6iSod6obdfnudK/
	ouJNSeXKMON+iDd2WsMmSiw3QRFIM/hN0QglIcQxzBh2WKxNcO8GgdggMuB7+DwtcWwNuvtk9z2
	VUVWRr2Cg8UZ0dGiC2vQNu4gIkjRtjHO8AvyWZRCEOdjyEvwiCjwtw24clGOH5sgPTYwaSsPvmz
	QwKp7L08sKtGVjMQ==
X-Google-Smtp-Source: AGHT+IGiObeHIDELSaPhcPSb+eiMRXwUtsS+/HFavI0JtQXJ+QLM8n0sFAnihbF0KuK2ZfMbqksemA==
X-Received: by 2002:a17:90b:4f48:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-34027aa6fcdmr3427579a91.30.1761651186562;
        Tue, 28 Oct 2025 04:33:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:06 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/7] hdf5: patch CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
Date: Wed, 29 Oct 2025 00:32:44 +1300
Message-ID: <20251028113247.1761834-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121082

Single PR[1] addressed all three vulnerabilities

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-2923
https://nvd.nist.gov/vuln/detail/CVE-2025-6816
https://nvd.nist.gov/vuln/detail/CVE-2025-6856

[1] https://github.com/HDFGroup/hdf5/pull/5829

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...025-2923-CVE-2025-6816-CVE-2025-6856.patch | 65 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
new file mode 100644
index 0000000000..47dc6b1ac7
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
@@ -0,0 +1,65 @@
+From 951ebdce0098dac1042d5e9650e655c6c1f92904 Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Fri, 26 Sep 2025 13:13:10 -0500
+Subject: [PATCH] Fix issue with handling of corrupted object header continuation messages (#5829)
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
+CVE: CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
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
index 59506526fb..ca963fdc8f 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2025-2913.patch \
     file://CVE-2025-2914.patch \
     file://CVE-2025-2915.patch \
+    file://CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

