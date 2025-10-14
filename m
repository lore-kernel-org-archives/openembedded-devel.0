Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E279ACCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.18809.1760453734476339812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dU7d1Dim;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e2e363118so46503555e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453733; x=1761058533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDLBWH7XV0hI+ScZdGRi7Z/y/QhZY1nk+crgsvYpsQk=;
        b=dU7d1DimtuygNvKF3jRPlVKDu7TLFIjhtjSM8JY1FRUsgiUnqfaNnTleP1RGIjeSKO
         OCz1rDmCzwm4a68IkJuKEbtEHG+xEal4enpXeuHHhwuaNF7mun15Z++bMFzulxh6APTc
         5L7QpNRymS3K739Jb2MeX9r6aCtkxYZo8lag4q9WMlIHnW+894Z4sjvohmvQLIfSyP0d
         41ePiideBFexu/973C5IoYBxmV0RKyUtSGB6HCvj1EEFZwo3quEoFGodYQI9QN+LcAxb
         xiUikS1IsXW0wWKcn9XizGA02KLAcm1QmlRLgVqhP2O/idsOyxpsZIpAJ37t4O303F7s
         b7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453733; x=1761058533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDLBWH7XV0hI+ScZdGRi7Z/y/QhZY1nk+crgsvYpsQk=;
        b=Rbm4HUP4Qp9gfzkhOxYLepYdfxPK+Aj0Kn4v9O+NS5byDliWaxm/+KXpT1jjkcm+6h
         6WCp8TcZ5nMGPBaOLo9Jw9/8z/D2B2GW0yaexEz5MHIyQBM7Lmk7G+9l0xGfO1UuXaoV
         R3y58kaZkNc5NPiLMpN59FC9dm6iCoVBn66EK2hNII/kIpwNqTQ9++K+ggPezt46urVb
         EktTtw1ylWONlQNJDdGlXjAFWVhsGbUD4QRfcnxcbVLv6wfo7GfWnuHcmTwkK/OUDziZ
         99eRBA6S+zAXLCZtCEY+qhkhKlS6Mpw6kDZwgV7jApKsVRnsJJGGCpaW+H72X3Y4sIHG
         YE7A==
X-Gm-Message-State: AOJu0YyNOla6S+eoK4/h141bE4icMvNeH2S10BXjpFDg/DqyUvg2L1qO
	T5nsfmIpDPt3suKgOzQvQFVm8ByQ8F7gsqDNkUUP5NF1+YpCzIsehjJ12+3B9w==
X-Gm-Gg: ASbGncupXox+7tzHUy0nOf6Q+C23W023Ob0NwGAtOL46KX3a2M5DGEpU7DkyzEjCoT9
	cL3934F+WGAS8ecJNlEAzK/FxRASdvgQ5voNy754md5nc5ZJ8dnXOT7N0aibhpgyR7zHWl9WKf+
	wc8SVcocOxK1r3+g/MfZFcxp2wRfBlaqb4gTSUI9xw2ze7Ga8aP3BuN3llOab5/H4aR44X5J8/p
	UNpKG27Gve02Uv2x29l10fYkuTH+C/Zyghtyew0top2YSaR75QIFW1wKRXl0n0PZyR+n05BhmBg
	h5G8x+CMeKO0sgmuYAGJqe8Khs6SrlugyxOzZNqzBLWdaGcGSw6YjpsGcAHAVq2/TRMioH8woDT
	4j5Ub6Q+EAQ82EAKhzpe4IgletWFRTv72542EjpZUCVrCttRwFA==
X-Google-Smtp-Source: AGHT+IGLHYGCiZN/gF2JowybsgWRdzWYwVGPuEICZ57FZj+fa7UDho+nKqVTstoum/XSnDMrCZ/9mQ==
X-Received: by 2002:a05:600c:46d1:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46fa9a98e73mr153563675e9.10.1760453732782;
        Tue, 14 Oct 2025 07:55:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] hdf5: patch CVE-2025-2914
Date: Tue, 14 Oct 2025 16:55:26 +0200
Message-ID: <20251014145529.1078084-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014145529.1078084-1-skandigraun@gmail.com>
References: <20251014145529.1078084-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120614

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2914

Pick the patch that is linked in the issue from the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...efix-of-the-attempts-in-PR-5209-5722.patch | 47 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch b/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch
new file mode 100644
index 0000000000..bb18879b5e
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Refix-of-the-attempts-in-PR-5209-5722.patch
@@ -0,0 +1,47 @@
+From 0354419c3b5c6832c994b005903372f156b5fddb Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5Fsuper.c  | 2 ++
+ src/H5Ofsinfo.c | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/H5Fsuper.c b/src/H5Fsuper.c
+index d9fe3a7..1c8dc6c 100644
+--- a/src/H5Fsuper.c
++++ b/src/H5Fsuper.c
+@@ -746,6 +746,8 @@ H5F__super_read(H5F_t *f, H5P_genplist_t *fa_plist, bool initial_read)
+             if (!(flags & H5O_MSG_FLAG_WAS_UNKNOWN)) {
+                 H5O_fsinfo_t fsinfo; /* File space info message from superblock extension */
+ 
++                memset(&fsinfo, 0, sizeof(H5O_fsinfo_t));
++
+                 /* f->shared->null_fsm_addr: Whether to drop free-space to the floor */
+                 /* The h5clear tool uses this property to tell the library
+                  * to drop free-space to the floor
+diff --git a/src/H5Ofsinfo.c b/src/H5Ofsinfo.c
+index 5b69235..2bb6ea6 100644
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
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 52727cfae3..9327c8cc91 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${
            file://0001-cmake-remove-build-flags.patch \
            file://0001-Fix-CVE-2025-2153-5795.patch \
            file://0001-Fix-CVE-2025-2310-5872.patch \
+           file://0001-Refix-of-the-attempts-in-PR-5209-5722.patch \
            "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 

