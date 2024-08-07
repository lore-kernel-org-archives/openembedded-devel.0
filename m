Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30413C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:19:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.32093.1723033191221631822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSl/GLqX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368380828d6so963822f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723033189; x=1723637989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDGFiA89iaztXsGDmxqFl3fDj+tkkSnq+LV7UqCtoc8=;
        b=jSl/GLqXqsT8q00By0Rfs8fQNTdaPg8AQ5KPQmyEddLFrKgXJ1qmUW847c2CMdX+QZ
         /DjfeLuq40yRHoK2ujqyunZb2Odl+mpFVAFBMOZSw1/Cc2kM5fSD9XrHFuyspyDGEo4H
         aDnMlLd314DOKjjpfsc+nXVOICsBsUeZKASzVsU7fCRFGFUl1z3Xr96kOj70mrKRol/U
         0ST1eIMXb9NMFNcOupSt7UnlA5cH02fKWxsXm2Y3xKSRXY+rbngByBNmvO8Bcsf+cldI
         WvxR6Zx/M+BtIdOSVwahHVIWgz/YqKyumXI8yXlTZTIHlVWui41MwVCXwV7E7Pr5W866
         87sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723033189; x=1723637989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDGFiA89iaztXsGDmxqFl3fDj+tkkSnq+LV7UqCtoc8=;
        b=Di0VDX+TB0DQ2PI95sI4z4Ak8Qt7Bsc8U1vnbvzd3ulBl2shv/Rc1w/pi/B8zZM6EF
         NuOTjcqjwlgUPqW6pcgmUuDnkkV1sB5Bi6tLbKOJNOXlQq0tvkR77LDEwHtY79HG9i7t
         ZMNDHiD3pKZeAFaRnytrSJy6mdBC5X9hhJnFBqdjh+2VW2KQ4sZoSo4n8wT0lkl5TKqf
         cyYs0rSFzKOIM+Sfx6UEVOArwdciy4HYBUB0i8/5tPFp+uZS9XS7sOj0wnIWMB/2Bg84
         RUcHK1wWUCFUeLsbQ7GI41N0EGfIIBn2jpy/Howoq9AA1sZ15Iy4y2xQvL9ObuWWzbuG
         TgqQ==
X-Gm-Message-State: AOJu0YwrUn0i0ubf/6EHFXr8rdU8bRuURxew6irrE6EI6rM+FYKCvrvU
	SwqS3a3cX9/J+YBuCCQv3P8Knq3zSRpt6b5voElFxzTPJIbz0xbdnlcmLPfd
X-Google-Smtp-Source: AGHT+IGAd/egSz3Uzmq2LQ3Sn4/QowW0NE0vEJK28fw8MqgSkZVUdI15Y2gTqEM+9f015ad9/3Zh1g==
X-Received: by 2002:adf:e808:0:b0:367:8ff0:e022 with SMTP id ffacd0b85a97d-36bbc1aec62mr10255970f8f.63.1723033189092;
        Wed, 07 Aug 2024 05:19:49 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd075100sm15686517f8f.105.2024.08.07.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:19:48 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-dill: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:19:46 +0300
Message-Id: <20240807121946.106544-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111625

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Also, there is no need to set PYPI_PACKAGE_EXT as tar.gz because tar.gz is used by default.

Fix:

WARNING: python3-dill-0.3.8-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dill_0.3.8.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
index 04e7f4bfb..3481ec06b 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.8.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a41509b57cc475ed93f8cb1dbbfaeec1"
 
 SRC_URI[sha256sum] = "3ebe3c479ad625c4553aca177444d89b486b1d84982eeacded644afc0cf797ca"
 
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "tar.gz"
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-multiprocessing \
-- 
2.25.1


