Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F2CCD197
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18754.1760453736927562901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGUnugg5;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so28517475e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453735; x=1761058535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDDmDohyHW5NbEtsJ1pbWkdqgDQMt2doyR83p+avG/8=;
        b=mGUnugg5miBjsY8GGq22oL3OM8U9EAZ9gigC45bs9Ptk+rz5jpwLZlFlF5B4xfyr9x
         +b6nAYs0Rj8jXUk3D4CaCUjWkXDbxz4Q9fKj3LFUrmcbghatejoxdp/mwRFd5Fgh8qRB
         jOGWcPTa5Ljxy/WnyY8U5PAfMO2Gr7T4ItyG4ANiQ0LWAT8Vz7AGtzYaXU8WAbs9Iz/c
         vHRzdNfLvPV0ojqpDXNqXzUADDO/oWoZUOd1vEX5E98fvpnGGBn98WUuhtZA6f5O9WeH
         fo4qcBBGzSOGCRgMVBmDpfzWm+0WIaC/y0bAS6QgB6Rjiek30NXnrtMr7xfsK1HYODZZ
         NK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453735; x=1761058535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDDmDohyHW5NbEtsJ1pbWkdqgDQMt2doyR83p+avG/8=;
        b=IU09v681WY2HINEqdG7Mdq1JiKa8kCt2RE1SeyasRfEB0MrW+v3+imMtbBtNMFpZiR
         0jfCvpPCO7uf2D36SupWvYMvwKp/QcNXpBWnZnOOpR52ZTu0/IJS+szLN/wgyd5n7KJ6
         X/eEGkH12h33JYk3EjDZH1qoubLcK4CqzG5HFPGI1prRdJkhSzIGCTO0twqHAWJK8MW8
         6ZRE1NKB9nKUEgDrVr+XJNUhfq0Abv+2htraStp5rgFPsHQqsyXomge2Io/g8iRn2ZQL
         J5DzYX71/ORwnG91vvQgsdDX37W1nZifLt2hooZSEaOgFLwwC2V33hPBTiMhMBg0vIL4
         aePQ==
X-Gm-Message-State: AOJu0YxldRWoO0iVaDkny1TYvJBts8TJHK6X8iyT0aN96eGlcnUtDS2Z
	PrHHlnSNdfN3YG7BhDTSZH7LR9NFxoHc4vCv0/tBW04VkBtxXHXxv4z8i4Mc9Q==
X-Gm-Gg: ASbGncufmdxPxjT+rxMIyUWngcLUAiR4/R0swi/o836VNFN4zkDi312PVF8jtDisgpU
	tchQ6cx9q4gfkryMNtUgY4HhSblecDwYtuV/Z3y9v/DphLTJeLp2pgDSY3ZTDhuzEdJD3rvFhhq
	Y6W1IbsR8pBHZC/zeDxIP7Gbb3Ia7vi1eWmY6tGR7UrtO7aeFXc1pbymHgQQDa0fuCtxnnBVijB
	5/OwoQJw22qHG54nIEI+/EwDiAFcp7Pm5EjO0qFue6R9B6m0Ieb3JiVaKQoGxMKBh58ch6fTLCF
	/PW3zEqap+o+MIvG/SYAg2mncd21ChgfHaMZwdpiQxiYBneouL/lEwH0NjqGrtE+b1zxTWaTXkY
	8fISrreEHllrGEBaPDwa3n3ZKcY5hYkyfT35C3u8=
X-Google-Smtp-Source: AGHT+IH6dSBQrgiuMcu0bvY6WleO9U9Tw3bSti8yJQ6y5wiyBwu0Ww8cHei9WdiJKZfvxe5Mwv+L8w==
X-Received: by 2002:a05:600c:458b:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-46fa9e9a2e5mr206696545e9.8.1760453735089;
        Tue, 14 Oct 2025 07:55:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] hdf5: patch CVE-2025-6750
Date: Tue, 14 Oct 2025 16:55:29 +0200
Message-ID: <20251014145529.1078084-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014145529.1078084-1-skandigraun@gmail.com>
References: <20251014145529.1078084-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120617

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-6750

Pick the patch that is marked to resolve the issue linked in
the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fixes-CVE-2025-6750-5856.patch | 87 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch b/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch
new file mode 100644
index 0000000000..cf8687f010
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Fixes-CVE-2025-6750-5856.patch
@@ -0,0 +1,87 @@
+From 7159488b73fb429a78f79763f7b3775a3c160fad Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Fri, 26 Sep 2025 11:46:50 -0400
+Subject: [PATCH] Fixes CVE-2025-6750 (#5856)
+
+* Fixes CVE-2025-6750
+
+A heap buffer overflow occurred because an mtime message was not properly decoded, resulting in a buffer of size 0 being passed into the encoder.
+
+This PR added decoding for both old and new mtime messages which will allow invalid message size to be detected.
+
+Fixes #5549
+
+CVE: CVE-2025-6750
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/86149a098837a37b2513746e9baf84010f75fb54]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5Ocache.c | 41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 12c30cf..e6095a7 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1265,6 +1265,9 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
+             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
+ 
++        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
++            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
++
+         /* Message flags */
+         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
+@@ -1297,12 +1300,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             }
+         }
+ 
+-        /* Try to detect invalidly formatted object header message that
+-         *  extends past end of chunk.
+-         */
+-        if (chunk_image + mesg_size > eom_ptr)
+-            HGOTO_ERROR(H5E_OHDR, H5E_CANTINIT, FAIL, "corrupt object header");
+-
+         /* Increment count of null messages */
+         if (H5O_NULL_ID == id)
+             nullcnt++;
+@@ -1449,6 +1446,38 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+                     HGOTO_ERROR(H5E_OHDR, H5E_CANTSET, FAIL, "can't decode refcount");
+                 oh->nlink = *refcount;
+             }
++            /* Check if message is an old mtime message */
++            else if (H5O_MTIME_ID == id) {
++                time_t *mtime = NULL;
++
++                /* Decode mtime message */
++                mtime =
++                    (time_t *)(H5O_MSG_MTIME->decode)(udata->f, NULL, 0, &ioflags, mesg->raw_size, mesg->raw);
++
++                /* Save the decoded old format mtime */
++                if (!mtime)
++                    HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, FAIL, "can't decode old format mtime");
++
++                /* Save 'native' form of mtime message and its value */
++                mesg->native = mtime;
++                oh->ctime    = *mtime;
++            }
++            /* Check if message is an new mtime message */
++            else if (H5O_MTIME_NEW_ID == id) {
++                time_t *mtime = NULL;
++
++                /* Decode mtime message */
++                mtime = (time_t *)(H5O_MSG_MTIME_NEW->decode)(udata->f, NULL, 0, &ioflags, mesg->raw_size,
++                                                              mesg->raw);
++
++                /* Save the decoded new format mtime */
++                if (!mtime)
++                    HGOTO_ERROR(H5E_OHDR, H5E_CANTDECODE, FAIL, "can't decode new format mtime");
++
++                /* Save 'native' form of mtime message and its value */
++                mesg->native = mtime;
++                oh->ctime    = *mtime;
++            }
+             /* Check if message is a link message */
+             else if (H5O_LINK_ID == id) {
+                 /* Increment the count of link messages */
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 3ff96d7301..7d75f0e7dc 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${
            file://0001-Refix-of-the-attempts-in-PR-5209-5722.patch \
            file://0001-Fix-CVE-2025-2924-5814.patch \
            file://0001-Fix-CVE-2025-2925-5739.patch \
+           file://0001-Fixes-CVE-2025-6750-5856.patch \
            "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 

