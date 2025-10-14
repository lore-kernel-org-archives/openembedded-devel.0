Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7CDCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.18751.1760453733742412303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h4v7vC4M;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso41393385e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453732; x=1761058532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulAmdF6rdWtEAGptHx+4X+xrCn4ji7JiGFv+/lPPwfc=;
        b=h4v7vC4MlbP2ePJC4yqdc6GRSHZC+nbRjwMarXQbMkb2ipt28i9g53CYeHcd3b4zdG
         2rUQPMoEVkRUjw3yAgqFiHA/i/M+kTv5gcrQFudu3sHciJiSIe9L1xAbqTg8JOEr5R54
         zp4RSrBZ+G3vjnjDZy06qC1mklTezQWrf+ECK345hwai2XylutOXBOaWhB8ZjXOfptI2
         0fKWdR5YMXRfvouNdfblKBdGU8I8RobIk2Q1UYLY1hnGJ2CKhEIubrXGAwR5LsvlcEA7
         qJlQHcCsXwdAO6r9TOMuOKqHJ8tl+B/YIAZhbC5TdK+k11mivYsRFcC9lKo/SpQmivxT
         HTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453732; x=1761058532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulAmdF6rdWtEAGptHx+4X+xrCn4ji7JiGFv+/lPPwfc=;
        b=HsJPPh0nG1+zNMl9j+46qvrJhjNo0REzHLzhz8MqTmHSiM8G03aY2MBF3nEi7Pcf/H
         v+uFRDunUNZnJb7rkBp7W0plin3+6PCNPSXjuL+vADASQ/Y3U/q4tHtUeoIIX7T2DPq1
         hKQt5FS5jREg60bY1daIe6ANlfHiqZnSD40SqT7akdzslDsxP2ruamgaQvZ+QqIy+kH8
         c7fskvy4Wtef5fyOPeo8XgP1kelNQm7VKCpy9OrnpwRmeEHn00drQzOKxX/Qioc/nZFg
         3R5/toymlCcH8cf/kMqQvO+MGoCXC5ziAgLg5GXYf3dljwn2sI5Hq+PVNy3kJiorggwE
         kDBA==
X-Gm-Message-State: AOJu0Yx2r0ox9SVk8Pq2LgkiT4hxcQHeoKverVER5zaOu8t+26zpFmBy
	glNpry4Rr1BV4JFu1zanXeU4sW19nTDQRjb/Np7TmAnPhr52TGacdD7SVFnDDw==
X-Gm-Gg: ASbGncvr/tDsyobsExL6L3xRs4Wg8tkLOFZPV7JKitw1RxEma8ZVJvemxULsy+qPzgP
	OwWNvFEeQ0mK/CemsV5Gx25kMD/JYrEzFQGQjWwbhIcQcjlEdHCzTVH7ljfr9qwoxamEHqOlowQ
	r0pxIjJabfbAXB5KgD989AmHXaTf8EnUtfhCabNvEALo3jdl8g2mOav26JfwjVgSD7La5QeQ22E
	jp1iOkAc93/cc4e2x9oGZYZVgholj/HIWWpWS/YLPBhNg8ZwO5K9qTZnWH5y/iXSqkMFzB0uub0
	FOSm4IjcAhm50ZP/LxP5ItjLmFZILTYHgQkuA6cSoxFIt0T6jLtNrDgEIsM1ri/wLpyVKoFIb+k
	jLyvRzye12CY4pBlZ8ZL1yvNm5W/t6u49t0rW2ttPkctJRdZuew==
X-Google-Smtp-Source: AGHT+IEECuNkDslCjP+pNgzh/FGOxfXkUMAr/NlXXBCufZlEQM81EnUktCFb0fvDigMn8mXpJiA4LA==
X-Received: by 2002:a05:600c:a411:b0:46e:1b9d:ac6c with SMTP id 5b1f17b1804b1-46fb1f77c2bmr110615195e9.17.1760453731970;
        Tue, 14 Oct 2025 07:55:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] hdf5: patch CVE-2025-2310
Date: Tue, 14 Oct 2025 16:55:25 +0200
Message-ID: <20251014145529.1078084-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014145529.1078084-1-skandigraun@gmail.com>
References: <20251014145529.1078084-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120613

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2310

Pick the patch that mentions the CVE in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fix-CVE-2025-2310-5872.patch   | 41 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch
new file mode 100644
index 0000000000..f15a7f9644
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2310-5872.patch
@@ -0,0 +1,41 @@
+From 7cc3c76f681fb4ca739457950352654aecd647a9 Mon Sep 17 00:00:00 2001
+From: Matt L <124107509+mattjala@users.noreply.github.com>
+Date: Thu, 9 Oct 2025 16:10:23 -0500
+Subject: [PATCH] Fix CVE-2025-2310 (#5872)
+
+Malformed files can have a zero name-length, which when subtracted lead to an overflow and an out-of-bounds read.
+
+Check that name length is not too small in addition to checking for an overflow directly.
+
+CVE: CVE-2025-2310
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/6c86f97e03c6dc7d7bd2bae9acc422bdc3438ff4]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5Oattr.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/H5Oattr.c b/src/H5Oattr.c
+index 6d1d237..2f8c259 100644
+--- a/src/H5Oattr.c
++++ b/src/H5Oattr.c
+@@ -167,6 +167,11 @@ H5O__attr_decode(H5F_t *f, H5O_t *open_oh, unsigned H5_ATTR_UNUSED mesg_flags, u
+     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, name_len); /* Including null */
++
++    /* Verify that retrieved name length (including null byte) is valid */
++    if (name_len <= 1)
++        HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, NULL, "decoded name length is invalid");
++
+     if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
+     UINT16DECODE(p, attr->shared->dt_size);
+@@ -190,6 +195,7 @@ H5O__attr_decode(H5F_t *f, H5O_t *open_oh, unsigned H5_ATTR_UNUSED mesg_flags, u
+      */
+     if (H5_IS_BUFFER_OVERFLOW(p, name_len, p_end))
+         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of input buffer while decoding");
++
+     if (NULL == (attr->shared->name = H5MM_strndup((const char *)p, name_len - 1)))
+         HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, NULL, "memory allocation failed");
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 345598c8f2..52727cfae3 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
            file://0001-Fix-CVE-2025-2153-5795.patch \
+           file://0001-Fix-CVE-2025-2310-5872.patch \
            "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 

