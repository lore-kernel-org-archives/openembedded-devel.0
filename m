Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1294CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.18752.1760453735335492755
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zx1pNiPU;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ece1102998so3504133f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453734; x=1761058534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXS5Y5aiGj5ZQ6Yg1FkiGNLuGzpCB1cI0l55FXHAuIA=;
        b=Zx1pNiPUADTRvjguGM+4GYJLUkitQIRwDHavmXhses4wiT1kZariYhL30lbaT404Gu
         yv0F+UJlw05HAlpqk7e6J/4ZVjGjxPINg61TtG97Aq5lUnKReAMgQZ4di/MS4qju65uw
         7juxZRTxYeSf0nGw8ibSv8i4NoWMB2RGvXMypiwszgapOBDuHcpOtLaWa8yWRzqs/zTr
         tZVBVX7+cpbby/Q0XoH6iGD2oL3JzTUgQIInmgBdMo8bBseA1HsJv75ocDaI6l80Ejpc
         XeFhskjh1N/i9biDIV4UEnBIZmDabqJST3u7I32jca89l1eBrXHddblowVUyYc+405FI
         hIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453734; x=1761058534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXS5Y5aiGj5ZQ6Yg1FkiGNLuGzpCB1cI0l55FXHAuIA=;
        b=LZl5WITZjsvTyrjf4fqKchkWDyrmdXWlI+0TnP5UP8GuEgxaehyWQH/V6egDrhFsFo
         5iGOOAInVrrZ20232n68MrRe6rXt8qn9nnh/sQo6nhxbzQuxj+i50MjHD0+mu1tRQHDu
         JxkbjEhTDfHBFF7KxbWuT0n9K/HESkDUylLK7sXK0SBiYOFVUFlWqcC6ZOrbWIM4JbFy
         ELcNUCxwrZzZkyhzEyqf9JagFB4gpSOyOOWQCY0OGdLc49TQTush7cD58psrODhoHeho
         Goo+j1xB114JFJeEc4ACLrvbs7wi+fE3Z4Rtr5yrQfwN2AhdO4UycQ21F7RImf/V5pk+
         E7Rw==
X-Gm-Message-State: AOJu0YzvHZ9g2NqM0d8+FGw6zfCK//WaPUtevm+QpWmNLVVvWLNzXAlo
	GKfloge3d0km3qSD+buTqhfQohZiVoqLRARaVe2RM5hOx/4AvWE4Ce9QsLJrTQ==
X-Gm-Gg: ASbGncvrvqbgQi/r/6f7oDjlCLL8cFhEWiugDJpJlZDHiAx6x4IcQpSmrRyXKoWAW5L
	mscPZKuW7tM1CT2Q+Zn17+vjp5qEf+ZlNUYrrVFWjkaydkIhWFr96lvgTJZi/TVMRU0GSe7K17F
	0RmSHGwEzdJNNDKq8J2XlfmDGzpONUA2/hbA45wppIg6NumIGvv7lI/wLtYrwJVGHPKdWj8xsFt
	YondknKWwD+K1QfIy4gn9DlkILGmpYY9KXjOS16IYR4ylqcW+Sseaf1OZ6Dab9c83i2AGt2v1PK
	EAMVGWhg+ezpNM/l/u9cFNI9kgwsmB5DzLbM3urasMWdSGkxxsbUkgNPzrQWgDpJVv4XdKGWF/V
	2E9MH2BMePH3BSgEcZf91yAMD+pKmh3mUcZFytpk=
X-Google-Smtp-Source: AGHT+IHklQMFDEd0dMb2n+XNCvVlKPcfFa8q0JxdU2Fm4/b1QMv5knXBQ2qIRYuJ3jgnyekE4sXHqQ==
X-Received: by 2002:a5d:5f93:0:b0:3e7:4893:f9be with SMTP id ffacd0b85a97d-42666abb485mr14896071f8f.12.1760453733653;
        Tue, 14 Oct 2025 07:55:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] hdf5: patch CVE-2025-2924
Date: Tue, 14 Oct 2025 16:55:27 +0200
Message-ID: <20251014145529.1078084-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014145529.1078084-1-skandigraun@gmail.com>
References: <20251014145529.1078084-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120615

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2924

Pick the patch that is marked to resolve the issue linked in the
nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fix-CVE-2025-2924-5814.patch   | 36 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch
new file mode 100644
index 0000000000..a86b5a491b
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2924-5814.patch
@@ -0,0 +1,36 @@
+From f76c5adea55edec75680fdd7365cc97abc112d0e Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Mon, 15 Sep 2025 07:56:54 -0500
+Subject: [PATCH] Fix CVE-2025-2924 (#5814)
+
+CVE: CVE-2025-2924
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/0a57195ca67d278f1cf7d01566c121048e337a59]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5HLcache.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/H5HLcache.c b/src/H5HLcache.c
+index d0836fe..7f412d2 100644
+--- a/src/H5HLcache.c
++++ b/src/H5HLcache.c
+@@ -225,6 +225,7 @@ H5HL__fl_deserialize(H5HL_t *heap)
+     /* check arguments */
+     assert(heap);
+     assert(!heap->freelist);
++    HDcompile_assert(sizeof(hsize_t) == sizeof(uint64_t));
+ 
+     /* Build free list */
+     free_block = heap->free_block;
+@@ -232,6 +233,10 @@ H5HL__fl_deserialize(H5HL_t *heap)
+         const uint8_t *image; /* Pointer into image buffer */
+ 
+         /* Sanity check */
++
++        if (free_block > UINT64_MAX - (2 * heap->sizeof_size))
++            HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "decoded heap block address overflow");
++
+         if ((free_block + (2 * heap->sizeof_size)) > heap->dblk_size)
+             HGOTO_ERROR(H5E_HEAP, H5E_BADRANGE, FAIL, "bad heap free list");
+ 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 9327c8cc91..39326d3072 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${
            file://0001-Fix-CVE-2025-2153-5795.patch \
            file://0001-Fix-CVE-2025-2310-5872.patch \
            file://0001-Refix-of-the-attempts-in-PR-5209-5722.patch \
+           file://0001-Fix-CVE-2025-2924-5814.patch \
            "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 

