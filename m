Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE140CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:00:08 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.3657.1760050798869142815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 15:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrDjAeG9;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b593def09e3so966198a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 15:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760050798; x=1760655598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96kv4ddM0UMEs1KoL0voLZ3m0kS4VWBMiXk38jCy6xc=;
        b=HrDjAeG93aXcZUYvcFyJ36O6bGVWh+xsjdN8yLPZ6XrHdQOOrtXdx6Ff4V1JT5dOcT
         wu4xhjMAFxUeFfYnUiu3/6D7jzHqn/ZBFh482zHyqhyQIYl+ulrLcri8rvnxp1owqGh5
         ATt248BdnkNfP8cJ4O1DPZ1qur4BBL+DR9pIXPn8P20ouEDcoOBhMuMq961mDyEzyPzc
         ctRBYyt6gxmmFY71+VnfvmaPyoDVjDt8zy2KT/P9RQB/GlzNYFZfC8t1rwDJ8FL93GYq
         RWF3qsPjrOk0DvppLSW7nNA6Gdp8XHaSrFLOErEKb9Zuz1xXoEclQYisPm80KW6fhKGv
         yPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760050798; x=1760655598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96kv4ddM0UMEs1KoL0voLZ3m0kS4VWBMiXk38jCy6xc=;
        b=urD7BCQO+LQfqlWQJMOo+Zh2MYX88rm81yXLmhokPiI+XwkpNQWMFYjzy7yZSB8wfK
         FiYNh689Sqay82ZvNdJ7bFN3DQWN0D8CEXE/jL2jcZDOoDlkvt3pqi18ETRBbJNkSExv
         f9yhZ1DYbsERq/VpZUTX+V/mw3J/i14nhe8IZ+8+Wpi7FVh5hRMHZ8Z7YxlplaX/DsSM
         3uqfTibjr5egJI/Q5P4Gc9qfG3hdvDP586L0C4tOwSjzcR/EJ9jdwtE51Zl6llQIxwlg
         iCX8UPz/8vsZO9tzbPeHPmWrXennBEd5MT4YqjUbt29PmkN/PWukTEaWTlCHvbqiVWO0
         zd1Q==
X-Gm-Message-State: AOJu0YxzoLXyn4p/qAD1ktNBhvFBkdkY9HP8DBMVe/0PR2GuM0cmKxiS
	mxI7djYf94nJ8IJCvlfb9QBlxDS063gc14TI3CbRqUEO/PwTNZLqGeLs+BHkaA==
X-Gm-Gg: ASbGncuDYnN8ha9On6nOiEuhK/DThioRCZnsXxXqizuzfXJC2MTOy5obFUuXiIkADCk
	TD1u4hCh5VTULxutQEQJO4EJ+JM68yRnS82nU0IpoQjTTBQzRi00QUyVpXcX5DaVJgZcGj38Nit
	PXuqHilkv1qNar7t74dru7qJUHGk4ZbcuS12ZhWeC8Z1tx8bKVCMxeVnO+cHAaqYrzm5gJUuPiY
	g7oeaLRASx8PdoxkwZ/0iGyW2MxCFQDBC9SazZ22PxMTGkAAMlzBXno5WHCNODMqWJjLN8uSS4J
	FwvuZOkYxUt5WlFM4h3nuQBlZxywrmUIyLKUfrV7GTWpjTldIzW/o0PzVx2pvMSvog31nn18OmN
	vOcl4BQVs0VKu2F9CtPltpEciZ8o5VXVNK0GZXRSUxiBX9aInc7LCWD/QkwCY
X-Google-Smtp-Source: AGHT+IHffccx+cS2LBTnOx/ZqCyYgoFAxirn8N5G/o9cDO0MzewOgQ4TiSQv17kKleQyWjMmHTgRww==
X-Received: by 2002:a17:902:f785:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-290273959b8mr107339265ad.53.1760050798044;
        Thu, 09 Oct 2025 15:59:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93e06sm38961815ad.115.2025.10.09.15.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:59:57 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 2/4] hdf5: patch CVE-2025-2924
Date: Fri, 10 Oct 2025 11:59:29 +1300
Message-ID: <20251009225931.3902783-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
References: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120456

Details https://nvd.nist.gov/vuln/detail/CVE-2025-2924

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
 

