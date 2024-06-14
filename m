Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D367DC27C4F
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 01:57:05 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.1857.1718330218814156902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 18:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KAcagbZG;
 spf=pass (domain: konsulko.com, ip: 209.85.160.41, mailfrom: tim.orling@konsulko.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25528eb4078so866610fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718330218; x=1718935018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vty01P2Puw2VdzyCMCfBZJbKV7q2GuvdOwAr9BNvpMw=;
        b=KAcagbZG2W4mYIFezvgnhzYbM506fWLtRUgqNPCD5jFw5odhaOf98euD65nUHAS8N7
         JIWNRvbXgsix5/Fh2MMCyp7qfqP+YGeuSvPC0MbJH0jBBl7fuZM/FaNYisk4tGW61coj
         acZezOe+OCyPxIwy7879TxmZBMGA0N026efSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718330218; x=1718935018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vty01P2Puw2VdzyCMCfBZJbKV7q2GuvdOwAr9BNvpMw=;
        b=Ps/NgHI8UJPUn6LRjqpc15LloKMfoQxrg0/iMKCm/unqADyMI+vaepye7LemhrbbQI
         8TD20gf/9weTdAYW/WzJ4JE/YwDIxGQ9Nxyirex6EiHlRAGdl7jS/JoYrY7GtZBcz8ob
         9e1A+CgqDRUHQ3fiCHcpQEgbw22FZYresYz4g1X0QPBILpbbQPKhc+JNpaEuX+XemQ00
         pkotWXHUMzL0pU/A5RFdt7MDEXhYQCF4eEtJSU776peWFxKsyXM/dID1+1Pk0gmbhLXs
         MnYHdQyVqZ0/yRcl+gDKzZW95VrtzVrVabplzqEC369rzQwqnZb4X0j26lOfADHpipY7
         8h9g==
X-Gm-Message-State: AOJu0YxA5LM6ourGdGkXnErF0jL3tBJJ4Z3JWYcq+S3ngHr08K4Bwqtq
	9fgns65Cq1CtD5iV02FMAwMx3SFo4c33HWRSSOgNXrZAZq2bViFxVGMxMOgJXKEQA6J0jlbNrxy
	cqPw=
X-Google-Smtp-Source: AGHT+IEq0AxOslOgT7FLxv49a3HheorsCejqd8dKgZjhWv8eVTaU6p64OklvUZKfBhBRZx2MG6nELA==
X-Received: by 2002:a05:6870:70a4:b0:254:826f:a9d1 with SMTP id 586e51a60fabf-25842998ab6mr1371942fac.28.1718330217511;
        Thu, 13 Jun 2024 18:56:57 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d1f8sm2002475b3a.113.2024.06.13.18.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 18:56:56 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-pydantic: upgrade 2.7.3 -> 2.7.4
Date: Thu, 13 Jun 2024 18:55:51 -0700
Message-ID: <20240614015550.2632671-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614015550.2632671-2-tim.orling@konsulko.com>
References: <20240614015550.2632671-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 01:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110900

From: Tim Orling <tim.orling@konsulko.com>

https://docs.pydantic.dev/latest/changelog/#v274-2024-06-12

What's Changed
  * Packaging
    - Bump pydantic.v1 to v1.10.16 reference by @sydney-runkle in
	  #9639
  * Fixes
    - Specify recursive_guard as kwarg in FutureRef._evaluate by
	  @vfazio in #9612

Full commit log:
https://github.com/pydantic/pydantic/compare/v2.7.3...v2.7.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with meta-python-image-ptest-python3-pydantic on qemux86-64

 .../{python3-pydantic_2.7.3.bb => python3-pydantic_2.7.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb => python3-pydantic_2.7.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
index 423fe7673..04c9c91c0 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
+SRC_URI[sha256sum] = "0c84efd9548d545f63ac0060c1e4d39bb9b14db8b3c0652338aecc07b5adec52"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.45.2


