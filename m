Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EA8C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:21:28 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.31101.1723029686623084839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3gkwsvW;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef23d04541so18898061fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029684; x=1723634484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vY88kup9i4U8ZBlCQyXLK1xh1lErmMH0LwkxLjZSijw=;
        b=F3gkwsvWMfKoOEznzQuoZjraPF+H50fkFhtq4lXqKSdKilKVnQJ7OyW9oCBzJvjD3/
         D6bzK7nTyXuUaNBFHZKZ4gINOk3OnzFkw9MKhZwvbTHSdHbehf4M/upgU4jYbDyTRb/a
         qXwTtXIft1MaDXAvMJOviock91DxMCVewXE8WH4N+JPPXpULnOoKsd3rEOIm4szZz9tz
         C56ONWTggOmJq5lfzRkhJzgdzubR/1U1IvD1E0MnXjNJJGKqQtCadcF3io7dAQjYSKo7
         hkuDWUymdp8TtQcLS6G6YeGBhbsk+cvYP3Bocv1oQuwNeI3wpHH5IIJgZ/fY8A0u9QII
         MNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029684; x=1723634484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY88kup9i4U8ZBlCQyXLK1xh1lErmMH0LwkxLjZSijw=;
        b=RL2zvhOFookpBDjvj6gfJtp4V8O/IfLDrVaKfM/v+0SH4cVQo03SgonVjAMlyQ41sC
         V/FDwQezWdbH8gYBp31002+9XzdCbe48hnCR68M0EdZY0gSuzJGp9+zj1t8BGs1+/hfH
         I8Nfr4eu0ocVbo8wyahiZmtfNcQq13IqlsudEOgbrsJWe8fz/wyxRzcR5yJMKvTPowSx
         t14jrbz3cCuil0uwBs0X6MK7tuJFPMwXqHj5i/DUdKAgzJI+FBdN9PtBzYi2Hujkw8KN
         W18zPBniSF88lj6IqWA+xYf0lHtPXsdPiufFAm3XqIVblyAP/ZWtT24p89fOUrjwEdZv
         rwZw==
X-Gm-Message-State: AOJu0YwsnnS+RSk+iZikUcfdx/UBXjNWZYiMyPhgWqcFUPbw6eykwUgU
	gvqgFLH9DJT2wcz0c6eDR89z6j7zfOeNd7VtzjqHKWw6995bXo53Ckju3LP2
X-Google-Smtp-Source: AGHT+IFZlSukbrHXRK1uMDuGA1nCZUM7gDXptXocqaazYVjESdnd/mvxYcCrl1XMCodGNFsbkcPGWQ==
X-Received: by 2002:a2e:9b4f:0:b0:2ef:2dc7:a8f6 with SMTP id 38308e7fff4ca-2f15aaa451cmr122419301fa.13.1723029683994;
        Wed, 07 Aug 2024 04:21:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm24040545e9.44.2024.08.07.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:21:23 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pymongo: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:21:21 +0300
Message-Id: <20240807112121.59828-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111613

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pymongo-4.7.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
index ccd364f72..baaf3847a 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI[sha256sum] = "6354a66b228f2cd399be7429685fb68e07f19110a3679782ecb4fdb68da03831"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGES =+ "python3-bson"
 
-- 
2.25.1


