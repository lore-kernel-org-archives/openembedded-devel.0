Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5E5C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:36:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.32371.1723034170174835713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WXPxoEvX;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36844375001so989534f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034168; x=1723638968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEPicOr+wXQm2d7JF4RqHmWE0OFvT/KNqd6fOAWUskY=;
        b=WXPxoEvXgJ+4k6Xjbxkds9kocqmyJSJtLESoI4+U395CrHhD6DqYHdBJtw47KmMuja
         5tUO7+/OPEbPVhIVnabWu+zMJIi6OV50JZLfSytHPhMIkrwRky3leykIbUHorumRTK3c
         mFaduxlzn9dM7xTSCTEP7rDtxct/ngdLsslZ3jTy3cG2WjVkumAJGMoZZI7zh5kj4cdQ
         riE/xvNThRr+8OqgQIuJkb0Mo58Zy5/FIHZDVUHHTm3Wujq8GfSQAIB/HLALg2EYmONU
         FLUeza9AJmeC94ixeg7JsQGv5UWcQUovrVeKSxRWwbqWiWGZ/h49MMjeedpBXGs7WobS
         LYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034168; x=1723638968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEPicOr+wXQm2d7JF4RqHmWE0OFvT/KNqd6fOAWUskY=;
        b=AobZyDoe4qykMJOtN0aDgzda9vooUkpW2QkWFUE80HOpYJyLY2Ob5UeB6w/Dj4yMq3
         Nkn6Cl02hO1l/6OPliKF4tq6Hwi7fhiof91q9aBtriEt1HTyCo2OEOOAWZx/ZSKXGXVl
         0XZxXULElyBeevSAI0yewYE8g9iuujxTFPnJBlXuzZayvLtiAGGOuvvtijyXeEVrC2Ba
         /6Yp+4egsoA3sIL9uWEflYjlI4/nXTb+sDcmKHdIFlQRh0eayeId1f7ftUKfil+7q7Oh
         J1gujxBZIPXrIJGMkOMUUziijxJ+JzPaH2HDKoLmHZvoSN+q2LT1niy7/S5nRlmR1Cq0
         IPfg==
X-Gm-Message-State: AOJu0YzxoqDXyOfxGf93lvPcqT223tERshd1bxns33hcc0xsa1SN6xpT
	eDO7vHONgOIySJklVjuXIHqpDUzvLaJv3CW1/gI7RHqstWJ0Isv//RAEgw==
X-Google-Smtp-Source: AGHT+IHpZMOCLxzexODpmzE3CC8s+Jma0TeQ1M4Ukm75cW8A9RONcOOSyQhrHb3zFTJxfpRwla/0AA==
X-Received: by 2002:adf:a3d7:0:b0:368:4bc0:9210 with SMTP id ffacd0b85a97d-36bbc0ca7a6mr10743952f8f.25.1723034166733;
        Wed, 07 Aug 2024 05:36:06 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1dc58sm15807135f8f.28.2024.08.07.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:36:06 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-xmlschema: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:36:03 +0300
Message-Id: <20240807123603.117140-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111628

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as xmlschema, it is by default.
- install_requires is a keyword that should be used to specify what a project minimally needs to run correctly. Elementpath is not needed for the project to build, but it is needed to run, so it has been removed from DEPENDS.

Fix:

WARNING: python3-xmlschema-3.3.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-xmlschema_3.3.2.bb     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
index f927bd622..33244d98e 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
@@ -5,12 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
 SRC_URI[sha256sum] = "a2f021f21d0b5ab371e9bcb5a1d5c34b9ba2c74ad3e32854474c4159bf94e158"
 
-PYPI_PACKAGE = "xmlschema"
-inherit pypi setuptools3
-
-DEPENDS += "\
-    python3-elementpath-native \
-"
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-elementpath \
-- 
2.25.1


