Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E1FCCF9F0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6120.1761651183239199143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ARo4eTYX;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so4543970a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651182; x=1762255982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX9Qj3ZlkXcgdmsuRrv2T+hKmQUAmQwg7sjshEgmzs4=;
        b=ARo4eTYXD9zf3orUZ4eVOo2//s1bu6NSwLrZ7PxcF54LKfRK6SSu4MrbJ4DTlpCyJ/
         jqno+sM4pVJYwOEzbBZpv7lnmOq+Drp9WPLYhc2eIubhDWa/kIcSSa1wbXlVk1pGeffm
         quwreeXoGU0+/pGixV+IDk7WjEj4PYVSd7ZL7swoINWjje6Jiyo9OcqwORI9bZe96tyo
         nwiEZd+4B98x7MGFTSGQp7HHWiGwgI55lUx+fxdQGidfVEvipkIJaaCAeePppn6cpSkP
         1Q+un4Jeh5IVnBGYMiD8t9EjlyHgfPLq30//uE2TSzio4ePCYMSvYjvx7c8cB7CxWS6g
         V1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651182; x=1762255982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX9Qj3ZlkXcgdmsuRrv2T+hKmQUAmQwg7sjshEgmzs4=;
        b=CWUYXtfn9ai2OxHU2aB3eqerAR02WP7eGEGj4bXI9Nmg823yJS1ePtBI59flduQGUP
         wfGb033ErxIigaXwlOId4xNToSglbaMZsv3E6TFpHkqZ6VrwFKvBEOtg6Px3HMSRLoHY
         z4jWUlto3HvSfzTB/7fwy6iHGKTPct3coYlGLfV8q2PYqKshrp1HnMCgIeLjZHtxlr3c
         18ep7TLaDlfMH4buH7sAf3badLADoEpllRt5ElqjL+0nzROLxEE2obAb2L0ad4m8u40Q
         tfWxU+QwLJFJVDTlQD8FFckShtWbU5WFMiWouCBILM3WjkfXjhoFY3U2e8K5EKEpj+IJ
         bBWA==
X-Gm-Message-State: AOJu0Yw0g5fh57Lg394Di/9ytQp/6r8O2minp3EnzNq8+c/Ulb8RDCuD
	sARo+vPhR5zzzuoPP/H7gBbaPh4nr8D2m1E8yJVWX5lRq8qJAcCWrgrT25fZvQ==
X-Gm-Gg: ASbGncturiXiyRVQ0PJ9Hh4wo1Hjx+NdSgCQkFnLc8eu5zEsxHZohcWKpmRLIe/SuJ3
	sf6U1YmO+J7rgLfTCtEFhwE53iReiXjzsn2o1hhqZdQOiZ/etmTv0tg1xaTGERVHnyAXM2MksTQ
	WdTVNGezq5GfKIwSfTss59bTxoUF/IMKdOnbCCIjU2//Oekat2I48N8Tf38pbcpZdBut/oeEzbT
	aZ+2urUF2a5s/YTuPp8bhIYswYx2Zl9iFiw4ewQ6AiEirarDO8A+kBIBH7WPDva4+UIwy6HveWj
	ln+qe+J2hBvsmn2rS1UzfR8w4l+fhTut46ZID6mVNJwuEBBnHxJPEDPOZ15w3sMi9M621Va/jYx
	wFtaZFQo32iNkVxaX7XPVwLQoaAx2h0nOKpwV/Y5AKlc+tYpkjH8G9B5fC6wwZBkxMSwnFouf5d
	9WEHiyP/rEipaiqg==
X-Google-Smtp-Source: AGHT+IF+en614OnFpJOY2vIUOmImpJtl6GkTY9zv+ssiaI66CKZfeS4goPHs7P2jFLOKuQKzlAEDSw==
X-Received: by 2002:a17:90b:2541:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-340279e6096mr3832702a91.1.1761651182250;
        Tue, 28 Oct 2025 04:33:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:33:01 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/7] hdf5: patch CVE-2025-2914
Date: Wed, 29 Oct 2025 00:32:42 +1300
Message-ID: <20251028113247.1761834-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
References: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121080

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2914

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2025-2914.patch            | 47 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch
new file mode 100644
index 0000000000..c999e39d7e
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch
@@ -0,0 +1,47 @@
+From 20a34d68dd837f83d90df45ead054bbeda999830 Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Wed, 13 Aug 2025 14:45:41 -0400
+Subject: [PATCH] Refix of the attempts in PR-5209 (#5722)
+
+This PR addresses the root cause of the issue by adding a sanity-check immediately
+after reading the file space page size from the file.
+
+The same fuzzer in GH-5376 was used to verify that the assert before the vulnerability
+had occurred and that an error indicating a corrupted file space page size replaced it.
+
+CVE: CVE-2025-2914
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/804f3bace997e416917b235dbd3beac3652a8a05]
+(cherry picked from commit 804f3bace997e416917b235dbd3beac3652a8a05)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Fsuper.c  | 2 ++
+ src/H5Ofsinfo.c | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/H5Fsuper.c b/src/H5Fsuper.c
+index 3e5bc9a3a2..4de4c1feb0 100644
+--- a/src/H5Fsuper.c
++++ b/src/H5Fsuper.c
+@@ -756,6 +756,8 @@ H5F__super_read(H5F_t *f, H5P_genplist_t *fa_plist, bool initial_read)
+             if (!(flags & H5O_MSG_FLAG_WAS_UNKNOWN)) {
+                 H5O_fsinfo_t fsinfo; /* File space info message from superblock extension */
+ 
++                memset(&fsinfo, 0, sizeof(H5O_fsinfo_t));
++
+                 /* f->shared->null_fsm_addr: Whether to drop free-space to the floor */
+                 /* The h5clear tool uses this property to tell the library
+                  * to drop free-space to the floor
+diff --git a/src/H5Ofsinfo.c b/src/H5Ofsinfo.c
+index 5b692357fc..2bb6ea6119 100644
+--- a/src/H5Ofsinfo.c
++++ b/src/H5Ofsinfo.c
+@@ -182,6 +182,9 @@ H5O__fsinfo_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNU
+         if (H5_IS_BUFFER_OVERFLOW(p, H5F_sizeof_size(f), p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+         H5F_DECODE_LENGTH(f, p, fsinfo->page_size); /* File space page size */
++        /* Basic sanity check */
++        if (fsinfo->page_size == 0 || fsinfo->page_size > H5F_FILE_SPACE_PAGE_SIZE_MAX)
++            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL, "invalid page size in file space info");
+ 
+         if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index d195ec2486..875510b0e2 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
     file://CVE-2025-2913.patch \
+    file://CVE-2025-2914.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

