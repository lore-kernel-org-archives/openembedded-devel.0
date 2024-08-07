Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DCFC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:54:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.32593.1723035282021850424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sd/CyFJc;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so957417f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035280; x=1723640080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEsdg1DNUUCoZHPQAqHEaTAyVKp5iMekrh/CKvS3RgA=;
        b=Sd/CyFJcRCw7vzD8s8uwDLXwDJZkKcm4iPgCIKDHcTFoH+R8RfnhFWauoeDhs6KNfa
         U3x4QMbvIY+khviokXJZm1Td7AQm0uPsdC4cPU5TdsBk0vEmTdvdiUpO4N0KUASYjXCK
         VOOILVxdvrOmpQ+JE1f/Zthrh7vUCriGvi1jW4ij7Bgv3QSC1/jaSFSB70kT4Rzszd+K
         0AToe0ZF6RCPBn9xUIXrevkxrrFt6Fk02IiKOBFRMYn7K08zmCG3QK9c8HNm/6B/4QjA
         PLYHLhcxOBVsrZeW8IwcbdLLvOXjEKV3RzGdD4VRitx7yABynw5pkDIpY2UvdvUVwkI0
         RTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035280; x=1723640080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEsdg1DNUUCoZHPQAqHEaTAyVKp5iMekrh/CKvS3RgA=;
        b=XhwQV7kYJ3NkapkF81Y8R7OGTWZCgPosP4EJZyOrVFieIi3fRkyocLoZoHjj+Qjao1
         qrl9pPCRBm5lOlx+e6gPEglgOpoTJvMVJcYMMMXQy3tHYEaGMNO5lxJVRUyTOn0Kf7+r
         5NDMqqi8qC/H+inrqoT9CdvkmHrDqKb2fipAKAaM2v8Y/ORCaxhENS3XAQiqpmI0+CZi
         ShjJoHtijd/yl530NfQbVMUJyJPeOpQ501WQMMVHMzkFV1odYViBG4P16Zagd1ZabJpz
         GtPe4txEogaT/EXKwe9GJPF6cnvxEdWhFMJO3CG1eliXtxG0OfquupU+krFyi+XRAWF9
         pguw==
X-Gm-Message-State: AOJu0YwrsdibSDLoP/3n412IlGtWpisJdwF5fcyxN9+p1FHvR/I857Tr
	ekteINnVpVxhZHT1nXEovf2D1cBN4slzxDPXllJVP6sLxJsCrFnoUPBCndKM
X-Google-Smtp-Source: AGHT+IGhu0M1RZyEuqglE4Kfg7ONI+DjQp9wSkyqZlp3L+gK8AvQqugFAJBWFfHHjvTuXD/GWESRaw==
X-Received: by 2002:a05:6000:1569:b0:36b:bb61:f576 with SMTP id ffacd0b85a97d-36bbc170d40mr13236598f8f.44.1723035279921;
        Wed, 07 Aug 2024 05:54:39 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0cc41sm15842202f8f.14.2024.08.07.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:54:39 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-lru-dict: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:54:35 +0300
Message-Id: <20240807125435.130284-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111630

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- There is no need to set SRC_URI with PYPI_SRC_URI, it is already used by default in the pypi class.

Fix:

WARNING: python3-lru-dict-1.3.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index e9535fa6f..64d50c308 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -6,6 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
 SRC_URI[sha256sum] = "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea11079e3fd07b6b"
 
-inherit pypi setuptools3
-
-SRC_URI += "${PYPI_SRC_URI}"
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


