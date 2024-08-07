Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425DDC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:13:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.31987.1723032837734036997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVzDwdyr;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-426526d30aaso11735265e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723032836; x=1723637636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2w5WnC/TTxKj5L8jN+oHiV4uT/aleJ13PRujwo6ZqY=;
        b=PVzDwdyrd52F386u/gOesoQQ3H+C74N0nbVTNKcQOVng973Ee0E5jsia+RDCAUh70c
         FOZfaiqGe/FD5CmU+OW8+q+rvyrzQPK5vpD9M7j5+Y1ebjekFGQWhKGa+kR1JkmUo9yD
         VJB8U+lIzQb7VPDG8WIzhhWK+iN8Tz1mRGqMn3WjqXdlKWdsOkcT/UF1KGLktMRh5UYM
         mcDdmg8vHU/kFgmE10twETLYDRToAHYvAtWuJ7vH4RGWCXxhfRHCsOsGYqu7QdLKWfkN
         oW5m/1d9fKahpYPHBs7IGlR9VqLtRHTVw0aIa50QDZIxbd+IIAOe2Pz+24LSQgcyk4zT
         yAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032836; x=1723637636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2w5WnC/TTxKj5L8jN+oHiV4uT/aleJ13PRujwo6ZqY=;
        b=MimSxsTox6A9ea0b9HxXd4BjtRsb5PGU9EklHm+ZpY2HwOx2lm4tS2LRaNPo8Q8evr
         Umn8c17I1i4G3/Dp/skWKDQ4c9LoQ/lYaRmsrciemSCwdK5WJKP9EjJeeW+LDgpJAWiV
         Pw9mTV2IexmUY8axUqvG8ZyrisbwflptftWEzBiI5RzIIKhhJDx+1hwuBgJ1CncXF7hC
         Kz6OnmGhmvEflOypmUxMey3jo9Idmf/uf27CMtyii//uoyFvHEeXuznFeJltraZqnF8g
         qysI92AyNM696pV9AE0J6eiPr4R8IZ1tQvJ/gBTc7Cx99nQdAHoiHvqSA/B4vOZCqXhg
         WrnA==
X-Gm-Message-State: AOJu0YydpXI9HA9GExOyAeiWcLLz6Xow9OZ3kLZp80K9q0XomcufSVu6
	/LTmfO4rC0KmaVgqz+7scnzGVdBiZ0A3VivTOKsBplhm7NWh6HnmcRr9pF7w
X-Google-Smtp-Source: AGHT+IHBSxuq4WOPXBYgr8FVWprOy9KZVwowxIrEId6i6VmRl6p5TgJxSbTPc9OHtOLk6lR9LBNOVg==
X-Received: by 2002:a05:600c:1d8c:b0:428:10e3:a000 with SMTP id 5b1f17b1804b1-428e6b9664emr110937785e9.37.1723032835342;
        Wed, 07 Aug 2024 05:13:55 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c8afsm26992425e9.42.2024.08.07.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:13:54 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-joblib: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:13:51 +0300
Message-Id: <20240807121351.104181-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111624

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-joblib-1.4.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb b/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
index 13d2a448d..399ccd22e 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Joblib is a set of tools to provide lightweight pipelining in Python.
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 SRC_URI[sha256sum] = "2382c5816b2636fbd20a09e0f4e9dad4736765fdfb7dca582943b9c1366b3f0e"
 
-- 
2.25.1


