Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3696CC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:25:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.32180.1723033515497891937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SYH81G4E;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42812945633so12733725e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723033513; x=1723638313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4eK+phFLz609xNrcq1/7XXib7BDTQ1lZXa35gXsYEhA=;
        b=SYH81G4E6XkF7xwlOSBJNaz64/TnwR9THpJqPhLcn55a6lWmimyPbFXLUqyxglcu9G
         zGI54jPWSaXYlkj2KTLkZAnbjT/3f8uPxT3tmpyJ4Q1afeUTWttve9AXTziUlPZSKQDR
         4J7mZYwn2hSi05bKckVVEeo4lZMWBRqbzK03CykB1fRLh7Y+fccZK2H4blazQ7vuXWza
         4KYHqSsoSyokiKSE8jQm0HeaLqaMBJrMmJ2PAUUBN8i/5u/8kWGKA9tTZ0PbbsX25Sml
         +Mq7AiXu/2r7PWke2AV0v5nGyrDwKjJSUM/joyj0ZmiTKflHlOAKrCES2Lo21KiafCgu
         YHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723033513; x=1723638313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eK+phFLz609xNrcq1/7XXib7BDTQ1lZXa35gXsYEhA=;
        b=BPiDqN38FHRV/8LtzcdIaMilqcv929V/jfftGz7M53yOyJNANkticWIHzOm/GZVdQk
         y7JzT8SoHSPicIj5Jh/A8fFj21azURSIKIMeNnVPwr9I+Cdmauc75dQoM5xdOssSqxQr
         o3pRTTJzb+CtylSVgG3zA/M0DRlxgvRhJoAZM5bRmsEcBAnxpKMH6BWbkf5eGHTuy1mU
         OQDaOSAOJW7AAg99K5UWgOD6pfjHO679D5aO7pLFTENuIPsqDFYNUu2hVhe9I59QRcBh
         /mIvdz6v6MMbsWxkMM/hSL6qltrsThk/G7+aNf8P91iYKrkj8eV1nVzJZ7kr263bJfpM
         lDfw==
X-Gm-Message-State: AOJu0YxocX9DVKSgXWXEXQCLtoERBHlMuFHEv7HzZXzcpdxLaKD4DsZT
	TI5C/sLj+YxSKvN8KHjVOGZLJ+RSkFDFuvgQoHlqBygjV5eL8edEASMq0Vm8
X-Google-Smtp-Source: AGHT+IH1aBTuoX+4WS74KbjY2xvBe52M2t5CPOGuXIqLm3KqKFxNERgm6MSlel5j7W9jGtXWyr/KiQ==
X-Received: by 2002:adf:fc03:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-36bbc11bb28mr11429007f8f.31.1723033513256;
        Wed, 07 Aug 2024 05:25:13 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05ad0csm16002234f8f.79.2024.08.07.05.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:25:12 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-luma-oled: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:25:09 +0300
Message-Id: <20240807122509.111659-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111626

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-luma-oled-3.13.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
index 95f066aff..74b9be502 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/rm-hull/luma.oled"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5ec447eb69733e20a55838de7e8cb991"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "7e2a0d6a4c968c64980255d681ec27914d9abd5a66a9019b289bf3ad050c2125"
 
-- 
2.25.1


