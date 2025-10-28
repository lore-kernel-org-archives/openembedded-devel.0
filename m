Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CDACCF9F2
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.6122.1761651185222705174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLE8rpan;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso4916515a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651184; x=1762255984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6mD0rciKSgctcwUuzTmY8rl+ocmnKjko32gTGsATl0=;
        b=FLE8rpanQAMQtvuFp+K2HHBPQoYb9IpsUXNAUAKvQX5Kt5H6e4rz9dfVErbG0/6E2j
         2FguqcvQX1QrEv2iM2D1F/cxpKCgYBc0Eoz2osNUcQtLs829Cij9aAq4PZznjia/Y8Su
         gDOMm1CN4vY5HOWD0CRMD5x3lC5k6vaNuMA8qQ5fJmN/f0pJWg1js+VX0l66vygFzikp
         76352jxUbe6gZLC99Ag7YaTpdq8g8GxvDvGbj0y+MHamGQ0XiBhQk8OFtVSQCxcLvvcU
         Ex12CkQSu2URAE3gn0mM9ED5R9RDAQBmm1eaWLaXPnRWlF+hENJ85oGKn5veeUTTNcBX
         Ui6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651184; x=1762255984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6mD0rciKSgctcwUuzTmY8rl+ocmnKjko32gTGsATl0=;
        b=VFkETORkSSE68C5fi2ne14SFfR144Z2+vI3sIjXEeVDcTWaN4FbAA/9fbU8WwNWQc9
         +kg/Pu13+51PPHEP+GfCdxRWQjuiJpP6ebS7i3dG+UKRAb4fv3oOGNcKqE76/CyMSPK2
         AJvaDAzAAkI7KSRQXBcrMMKZmRKcircsojV6mXLSOYjpI3auYp0AM/mfrT/9pfqJP+mA
         oXF4ob6PkJcGCEiaKfvgKThCSes2g3z8JEQnESb7dK3eRXPXMsLmkW2VC6IrZvKISoNR
         wIICRzFZRiVu1mUwSOwSTVrpqfKvNeS50PVyJ9tLBFu+lG/D7mGaM3dZ3oaYOVp6+U7v
         P0LA==
X-Gm-Message-State: AOJu0YyRKJDjaggvOBvE9R8UH294UA0KV3bQNuAXgfcthIOHfAnH/xPL
	JQcMYTuq7mdCHF/28qGyiqfRqnMiqJswO10Of60FIoZC3Gg+9qTjfA5Aum7buA==
X-Gm-Gg: ASbGncuqygGz4wpCddZ2INycm+Daop5GQPFAiydSvrWZUGxsKqBaozeqytKvp6YbBTf
	iiyfDZSE5RJDSuth5jxDTm+AeuHf9w1bnqZuDZkDZUcBW0ewhgz9iA6Ihor1TwvG3DoDjLMChik
	Si6OLDjVmA7U3RsHJ1nEHPi6lpjhXXzlSF6TlbgDPp7BVRajK+SjHyL1uSzGmRVj6kquHdFFb+o
	xcJPUZm4EEqEA8fCAUjqcAUr99yQJ2zJz9kn5VNqQyb8JUnMnMxyxLlJ8nzXlkrwDX+gdBi5mho
	n5ioh/h0yA0HvF3YdSgPBElMp9jwASGFbDDSnPIMzv04i3pOILYDIfqdY45oPUkPy7pc8lfaLKd
	bGnVPabK2I4aDfhzkJHrxTbhhFGIwiYQRgisV9WW5W18Q4Xhv35WdEFzZmThwiOvcjdCcJunK55
	uCvCuwY15jAXTHjg==
X-Google-Smtp-Source: AGHT+IECr+xHGCJm1bYjptHX8B0eWO+Sonnib11ZlWXBwiBKhyDtpOvxr42nEtsoMAStj0IFq5RGHg==
X-Received: by 2002:a17:90b:4b07:b0:330:7a32:3290 with SMTP id 98e67ed59e1d1-34027c0f25fmr3605270a91.37.1761651184349;
        Tue, 28 Oct 2025 04:33:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:04 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/7] hdf5: patch CVE-2025-2915
Date: Wed, 29 Oct 2025 00:32:43 +1300
Message-ID: <20251028113247.1761834-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121081

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2915

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2915.patch            | 50 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch
new file mode 100644
index 0000000000..83eb8ff504
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch
@@ -0,0 +1,50 @@
+From 2bab8a1ffae567d35effa777dda82d423a80bccd Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Mon, 20 Oct 2025 07:47:28 -0500
+Subject: [PATCH] Fix CVE-2025-2915 (#5746)
+
+This PR fixes issue #5380, which has a heap based buffer overflow after H5MF_xfree is called on an address of 0 (file superblock). This PR changes an assert making sure addr isn't 0 to an if check.
+
+The bug was first reproduced using the fuzzer and the POC file from #5380. With this change, the heap based buffer overflow no longer occurs.
+
+CVE: CVE-2025-2915
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/26a76bafdef3a0950d348a08667de161a19b7c2c]
+(cherry picked from commit 26a76bafdef3a0950d348a08667de161a19b7c2c)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Faccum.c       | 3 +++
+ src/H5Ocache_image.c | 7 +++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/H5Faccum.c b/src/H5Faccum.c
+index 9c4c8cdbbd..145abd1cbd 100644
+--- a/src/H5Faccum.c
++++ b/src/H5Faccum.c
+@@ -879,6 +879,9 @@ H5F__accum_free(H5F_shared_t *f_sh, H5FD_mem_t H5_ATTR_UNUSED type, haddr_t addr
+ 
+                 /* Calculate the size of the overlap with the accumulator, etc. */
+                 H5_CHECKED_ASSIGN(overlap_size, size_t, (addr + size) - accum->loc, haddr_t);
++                /* Sanity check */
++                /* Overlap size should not result in "negative" value after subtraction */
++                assert(overlap_size < accum->size);
+                 new_accum_size = accum->size - overlap_size;
+ 
+                 /* Move the accumulator buffer information to eliminate the freed block */
+diff --git a/src/H5Ocache_image.c b/src/H5Ocache_image.c
+index d91b46341c..c0ab004ec7 100644
+--- a/src/H5Ocache_image.c
++++ b/src/H5Ocache_image.c
+@@ -116,6 +116,13 @@ H5O__mdci_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNUSE
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     H5F_DECODE_LENGTH(f, p, mesg->size);
+ 
++    if (mesg->addr >= (HADDR_UNDEF - mesg->size))
++        HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "address plus size overflows");
++    if (mesg->addr == HADDR_UNDEF)
++        HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "address is undefined");
++    if ((mesg->addr + mesg->size) > H5F_get_eoa(f, H5FD_MEM_SUPER))
++        HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "address plus size exceeds file eoa");
++
+     /* Set return value */
+     ret_value = (void *)mesg;
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 875510b0e2..59506526fb 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0001-cmake-remove-build-flags.patch \
     file://CVE-2025-2913.patch \
     file://CVE-2025-2914.patch \
+    file://CVE-2025-2915.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

