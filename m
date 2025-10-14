Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E2CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.18753.1760453736181622137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LAQDSYlq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso4175803f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453734; x=1761058534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S83aKz+WzGp9WndEJMpk60hwY2g2ZNH9Hn1EFXSWNH8=;
        b=LAQDSYlqCovP4zxRB/st42KAeEkyS0sNdxkWhJ1kEXb0I7MbPA9H9LMV0tRvPm3JaB
         EPG50ejxeg3e3RPTOjiUPzR9+g66NYRvfh12fLkaDrAeeWs32Jtgdw+CjWYWx6cOuqHP
         0pBZqC+pHQKRNNeFQMFSzaTuMG9ocWrrpgHcSRlQ06qXHZK7ravvlDlghFz70E24Mswx
         eRR+votXweZJG4Nhu+aLcO4gQ5O9z4MNQG3MTo1nZFZYE61knzpq0Vd+CNFYw1J6d2lT
         sql1B2s6w+Pp4evQOkBw6310JF2GqmmxOQjNz8giKhExr7DxeaZS7fVc6Dd3mtffvKab
         C4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453734; x=1761058534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S83aKz+WzGp9WndEJMpk60hwY2g2ZNH9Hn1EFXSWNH8=;
        b=L1GjyOijfWQJ7Ol0uiOJw3iYyRUCgpAbwtZUaPVhYdVa4Il0rpAUndBwuztZN+Nz4K
         wMaDQYFaVgrdTa6sGOu9PcqLnpHMbIHLNlXx7dNLbwOxjzvssXqa7YjHyobuJ1g1IieC
         7LlBS3LpQIW05bRQP/FRn8LsC7bSZYxNZmhAcKZhwpEBFllV4dZRazrYWjrn5Vp40scc
         Fu9dzSNULoqWjlW9dLUayzAlBFwLGDHGj9sEM3IRTwhKEmWRutVYsoi+8E0Em1y64Mgm
         nCh1QGwU4H1ob7V7Gxl+CbmA1c3c0/OU6OcmZud/6V5/DVRDMFQCyeFynr0rwpuh8ydT
         NrKg==
X-Gm-Message-State: AOJu0YzS3KKqVfcryYqVUFZEzkEDIvhvWDjxgd2CQqrQdLxtnl0LT2VL
	PEVZ0PXvldgjAKlOY89CfNnJ+gMNoNo13jl7k9aHXDg9T9lXCT1U/hh26QRWFg==
X-Gm-Gg: ASbGncvDmhiTJ45DMe5KhM3yyQVh3wW0x2qgqOXKGzAlG7VvaOWvFGMFe+vwm6hiocl
	fNPYstKVM2N4VzJhi99YoTL+/pWNxcouRBgs1ZErxPdjyCYPWpyxjk5ky8QpIJoKnaQt3+kt4HG
	r27+W3MAxoKgAc+o+4cBf0n+6QWuMxWZa8pWvNZLfFWIEJzw41hfaJN8oXcMwqK4Q1fxfIccTVV
	SOnzDV0wSGa8uESzo6zW2UsebBgKi4iWtaEwTzKYf5G38uJdeLAkl9sU1GnGZQgWmDFFwcz69J2
	pyZGyWIGVBZmV0byV155jkcMNB4Dfz6cFBmGw9iqnm1zW4hTWghynclyJidsFhsxYE6UZ8DjG3M
	CFlvllWSH6qBcv30FghlHAA/YjwHF57iZC3yWye8=
X-Google-Smtp-Source: AGHT+IEO97SIOO41nidmYstjjaGNPiyZuzwNTCYuTnN0hGm+5NbGkwVWs4Pe6apFprNsE5wxIR0WqQ==
X-Received: by 2002:a05:6000:4b16:b0:426:d54d:224d with SMTP id ffacd0b85a97d-426d54d22bemr9384695f8f.27.1760453734381;
        Tue, 14 Oct 2025 07:55:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] hdf5: patch CVE-2025-2925
Date: Tue, 14 Oct 2025 16:55:28 +0200
Message-ID: <20251014145529.1078084-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014145529.1078084-1-skandigraun@gmail.com>
References: <20251014145529.1078084-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120616

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2925

Pick the patch that's marked to resolve the issue linked
in the nvm report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fix-CVE-2025-2925-5739.patch   | 52 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch
new file mode 100644
index 0000000000..7a0afba423
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2925-5739.patch
@@ -0,0 +1,52 @@
+From ad959fdac99810ea64504d7bdfc7724c5ca25e21 Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Thu, 9 Oct 2025 14:48:55 -0500
+Subject: [PATCH] Fix CVE-2025-2925 (#5739)
+
+This PR fixes issue #5383, which was occurring due to actual_len + H5C_IMAGE_EXTRA_SPACE being 0. When realloc was called, it freed image, but gets sent to done before new_image can be assigned to image. Because the pointer for image isn't null, it attempts to free it here again, causing the double free to occur. This PR addresses Quincey's concern and fixes the issue while preserving new_image and image.
+
+The bug was first reproduced using the fuzzer and the POC file from #5383. With this change, the double free no longer occurs.
+
+CVE: CVE-2025-2925
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/4310c19608455c17a213383d07715efb2918defc]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5Centry.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/H5Centry.c b/src/H5Centry.c
+index 1ca7479..77bc00d 100644
+--- a/src/H5Centry.c
++++ b/src/H5Centry.c
+@@ -1051,9 +1051,14 @@ H5C__load_entry(H5F_t *f,
+          */
+         do {
+             if (actual_len != len) {
++                /* Verify that the length isn't a bad value  */
++                if (len == 0)
++                    HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "len is a bad value");
++
+                 if (NULL == (new_image = H5MM_realloc(image, len + H5C_IMAGE_EXTRA_SPACE)))
+                     HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
+                 image = (uint8_t *)new_image;
++
+ #if H5C_DO_MEMORY_SANITY_CHECKS
+                 H5MM_memcpy(image + len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
+ #endif        /* H5C_DO_MEMORY_SANITY_CHECKS */
+@@ -1104,10 +1109,15 @@ H5C__load_entry(H5F_t *f,
+                     if (H5C__verify_len_eoa(f, type, addr, &actual_len, true) < 0)
+                         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len exceeds EOA");
+ 
++                    /* Verify that the length isn't 0  */
++                    if (actual_len == 0)
++                        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "actual_len is a bad value");
++
+                     /* Expand buffer to new size */
+                     if (NULL == (new_image = H5MM_realloc(image, actual_len + H5C_IMAGE_EXTRA_SPACE)))
+                         HGOTO_ERROR(H5E_CACHE, H5E_CANTALLOC, NULL, "image null after H5MM_realloc()");
+                     image = (uint8_t *)new_image;
++
+ #if H5C_DO_MEMORY_SANITY_CHECKS
+                     H5MM_memcpy(image + actual_len, H5C_IMAGE_SANITY_VALUE, H5C_IMAGE_EXTRA_SPACE);
+ #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 39326d3072..3ff96d7301 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${
            file://0001-Fix-CVE-2025-2310-5872.patch \
            file://0001-Refix-of-the-attempts-in-PR-5209-5722.patch \
            file://0001-Fix-CVE-2025-2924-5814.patch \
+           file://0001-Fix-CVE-2025-2925-5739.patch \
            "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 

