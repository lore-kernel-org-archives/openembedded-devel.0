Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DB2CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 15:39:10 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.11370.1757863214452530259
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 08:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltgdrYGV;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so2224905a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757863214; x=1758468014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=ltgdrYGVH6hDytmn8yinuMKplzAV3wcd8ZHTPCf0x/i0RDDIbP0ai9HchxRzn8oRPC
         BYVZzqpoqr4e4DUOk1cloCs1UpED1Oe0ghdfAUj9CA8jcpJCSF4EjKOzJrruUq3fuV3I
         pPNk3qME+cGH4xM8d5R25GndJUphpjJkahlTvHWKYWYM/KSSeUKw+m3MGrVb32ybe4rc
         mas14L51GlYkbvo0Rncjq0tp+BoluUB6b1oDFcniVKZMW2G8hLYpfZcxPyK2QdFji/OZ
         soM4n68t7TDA2PQbVgy2tU9WNyfAIwWKeFFz9eBVN8bmuXOS4Ijn8RasT2xQFesXvU11
         l+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757863214; x=1758468014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=CzKNEv4EG0YmM4gQcvv0fIf9kSXWaDb4P4m/fFU4VxDx0jHtd0i+ihza8BVtWFME4h
         Mr8DStChk6hYIsEtCZlX0yHSOnAVVce9S/QBGD/go01Ic6ba9yuwhpEtoVz93/mW/fzr
         15nApzVcJqnTeOAi8xnSXl8sr1QQ0N5ffpLZorOV7HGimCViZl0vcZAc7iii3iiOKGZr
         dub3u9+76pSDwXtst6xTqVdzTd7+nsBa19md40r0hO+qQ8V7XoFb8Zz+e9LMOFlMBIJ0
         0HBSXqASNVFXoYZOAZNMPoOxN+Tix8zuQv2WhPT5H4qraLXRBHE6Bh0Yg+PFJBQK0Mcg
         +N3A==
X-Gm-Message-State: AOJu0YzgUmd3wsghSUIrM+5dcuqwrRHyH5cNbb/EyIPP8Ji/FeUaz1k4
	5sVU8/zGki5vmPBrbbkpIb2n/uA1jkLb8ZuKXzSHR7MDeqH99pIBA7GDNeUImA==
X-Gm-Gg: ASbGncvRAGiO4ICxQqeZAAiQ7pnxMEk0mgkTNMtiCrGKZdXVAgDPXYUp2BvGloI7ZGj
	rc866EC6PZHkZ0fQQQZ4gThkoa+T/T+G+oqZHpRBV1Wo23kEPtfK9GX9St53n5pchjBqjOhlG3T
	AMq5YWbvakijmE0ep3YjxTiXxevy5UU0+UzGEy+mXnBc8tTAwjlnSIpmyE7NsdgPwRJcn2jgLHR
	edWhWAhLdjNERgQ8Rj/FMT2aOsuTdgnr4PAlFIYFnr703Mr2YldwIv3i0vhwV81KwYvBeH0oiS2
	6V9xcpmyjv7MRhsRIgVfr2IcePnuMSFOdDmZdZviv5dhAnKuyUpULWPbjF5TvCdUxUqPr0r/OB0
	t
X-Google-Smtp-Source: AGHT+IEt7ySDixGLQyUYgOZX61EmQJiGqipDbrrTpVXegb8IXoEISSlIhIGMRqxTaCFzX4iMKj0iTA==
X-Received: by 2002:a17:903:11c6:b0:24e:e5c9:ed14 with SMTP id d9443c01a7336-25d26079734mr115335755ad.35.1757863213618;
        Sun, 14 Sep 2025 08:20:13 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:6012:935:7d1b:6dcb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25ffff0fd2dsm51856335ad.101.2025.09.14.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:20:13 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] meta-oe: image: optionally remove RAW image after sparse image creation
Date: Sun, 14 Sep 2025 20:49:50 +0530
Message-ID: <20250914151950.20216-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 15:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119395

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

When creating sparse images, the RAW image is no longer needed in
some workflows such as Android and CI pipelines. These RAW images
can be multi-GB artifacts and consume significant disk space.

This change introduces a configuration option
`DELETE_RAWIMAGE_AFTER_SPARSE_CMD` which, when set to "1",
removes the RAW image after sparse image generation.

This reduces disk usage in builds where sparse images are the
final deliverables and RAW images are not required.

Default behavior is unchanged: RAW images are kept unless the
variable is explicitly enabled:

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index d6ea68968e..5416c2a019 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -9,9 +9,15 @@ SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
 
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
     img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
+        rm -f ${IMAGE_NAME}.${type};\
+        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+    fi;\
  "
 
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


