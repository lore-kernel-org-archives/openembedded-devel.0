Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B44CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:26 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.311.1760475258389832533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SdB39oFu;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so196212a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475258; x=1761080058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os960+YvAPECZcOnkZ8D8wTgTbF9vHvo7RSwctv9RwQ=;
        b=SdB39oFurXkx0/7/tkJ4WE+GxL2HCPCO3USlytTUJBoB0EqPzezyUFhQM3wUoFyuYP
         Nv4JEJMhjYGPyuAP5qLIanZ3ga9fstybHntQtXCoakw1usyQjeJ8uE8j5zYCeAlgkCue
         VxKvZ7e79v6+Xz5QDfoikuC93pEWDsyHoYOjwnQAvibCfOKbkvfcvH+P4PnTTdE37XGP
         Dpz3zkwbYD9cnhL0pn8j0UyG6C5nJthzOivmbtk0bkU1bi8+2N9oVyO6OJSBmBephmZQ
         ripZTfEIoFWTudslmxd+mD2gX0UNVI9QbCMBEsKJIruFdoMN3SBYx2joxN5kHfLdgkae
         zGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475258; x=1761080058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os960+YvAPECZcOnkZ8D8wTgTbF9vHvo7RSwctv9RwQ=;
        b=KmPy669WKYi86FDvlgu7aE3JhBRr8SswcrcGfW+GZH04m9uR4EHda+Hfkb2Y7NJLkr
         tf0Whp9krFYqUopu1Qnj0xoq/6EKR4B4G1F1HEQ2fZ4XR94tt8NSGj1nBqUSK0+BCL+F
         I/KYUBS+CXOSWHpR8UZGbpVYOYTj/VqxvPCzKpDEqpUX1q4enrbk2z9K+Ngi0kBhxAFj
         7BmJmFhP64erJeiV+mQjBHN5yI1wBK58rYe0aqYi6lHgEc0MC0VtZ89KTIaYJPkAqgP9
         1+yCA5/LSERmVCmHEn6peDt74JVEYaBdEol/TjNWdg6Qf8W+6IWBtVoZQvI2ea2AWgtj
         rAdQ==
X-Gm-Message-State: AOJu0YzBO0tzelmSYlwqZGN8aNJXwLVvFxmtYCTrjxpqQkqS1+cfY/Jr
	P5dTEeFeFaIe9FWTD0/uH8nU2lksjlD4g9MDeRvbaEoNnCtgOeOVzgmQ9vVdDA==
X-Gm-Gg: ASbGncuACTfFYeJjv771aFemy/snNj3DEXYYP5X7jb696IxzJrZD9TxqNBZEMdLaahD
	WTHCTRZVISpp0UeFyUyq7fX3wK8XQSSwO5hguZyHsGfF6KznhJ4ASapALD/UqwudDl4PhFMzPGQ
	uvxV1uVcf1N1dxqk2olXzkaJVH+bCg2wczv9ZO3xoyZfK3D+8zl5Y5Dvdj6B3keHA8MtcFV5Ld+
	uRgCQREYKej7/ZMmq1n0g8uhKBLm39GdYmtM+f+VcWK4PErDnfk+C7GyoIri4RtkHzlfjYPUUKE
	6dmjVxeEQjwhFtOKg+BHj1A/IwPWtWC3JCxV7eH67J6PhP8auT6Pu0jB/uxp7YQrhpdyQZlXogU
	UCJoKgduQeaP9BFsNvzKr+C9FgwRf0kDiOlTg9XuLIV/RxhthnlIfXVGbZoBwgZNaaw==
X-Google-Smtp-Source: AGHT+IHqyY8be3RPtFfSaB7O8yGO7GgoHzNChCtB1fufO6LXNfEEbHY6Sn5jrQ4Lm3UCSySHfZWfiA==
X-Received: by 2002:a17:903:faf:b0:28e:873d:8a with SMTP id d9443c01a7336-29027f0cd0cmr323725165ad.15.1760475257616;
        Tue, 14 Oct 2025 13:54:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 04/18] hdf5: patch CVE-2025-2924
Date: Wed, 15 Oct 2025 09:53:47 +1300
Message-ID: <20251014205402.1487867-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120637

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2924

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit f0cdeee91832709fe78b1f2af2a0504af80c41d7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/0002-CVE-2025-2924.patch       | 39 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch b/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
new file mode 100644
index 0000000000..73ee50db1f
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
@@ -0,0 +1,39 @@
+From 3a6f6c1f57c09281d4a9d11a1ae809fd21b666dd Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Mon, 15 Sep 2025 07:56:54 -0500
+Subject: [PATCH] CVE-2025-2924
+
+Fixes heap-based buffer overflow in H5HL__fl_deserialize by adding an overflow check.
+
+CVE: CVE-2025-2924
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/0a57195ca67d278f1cf7d01566c121048e337a59]
+
+(cherry picked from commit 0a57195ca67d278f1cf7d01566c121048e337a59)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 4305826b22..06a375c673 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
     file://0001-CVE-2025-2923.patch \
+    file://0002-CVE-2025-2924.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 

