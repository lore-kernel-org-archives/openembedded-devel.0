Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C554FC02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.6233.1738274314670747670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso4839595ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274313; x=1738879113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L100buhVncw2eq60bRHkDveO2mYLFnDsLR0n7IhfIHY=;
        b=N4hlyKybulR8iCNtYqeuAbT4uJGrhHo9rAeEEgiXLzoDC8UrBm7h4rQr3RuwXytF/Z
         f5sRCulUFMcU3tAwgXytOblBGoUPKWeksAWtsU5DZcaYE6NnG5Jee7XN/5d3EyNkLnVB
         k2mEBpURJ0fMpo+AOb3zOJ0W4atSxOnmRHRn6A3wSOQSsUbO3/BaE4xeBd9tqV+trgD1
         VBDpHnWFahm2dvvEe9YA0L4G91jbWDjkuXmF9CEZY6zrpJHVtrQzcayRYgWi09Bp8Ucw
         M1bQY/FG9vMUiOnesktdzJiS4OQoJ5zFoXkhP3I4bDzBnoBarC3oZlgl/TBFOOL0kiRN
         xKLA==
X-Gm-Message-State: AOJu0YwbaJxy2elyFFukdqY62DXVcqeRFxzpkQBGUnqqLNcfluP/GRe1
	DLvopLlQjJsD2QZrxow8XKstDYqzkf2RbMA8iC5NNhN7zhQsai9xVjfv9PI2Ok4=
X-Gm-Gg: ASbGnctkWhfYvK+EmqvrBqKg1rwa0D0OPuydrnMEmSaAdbGx8L22WsQo2wgsHUqbQ0y
	u7tjMR6vKVXYWkU7KVxLlpmY5+RZ8zGy0tuzPd+FCElHAuy36EGXl30NDYjjwBm6H/mcVBFoHhF
	Rn4ce1L0byWSFxRV0VzXsOWevJDLCJ+KTX8SisW1HDJw5NItsEckJMa0Erh9Fbkc3gnGwkTYJsQ
	JISzrGXmXraRdNI/Ijo27WXR9/cGUVVxpwbxWwj++gupgaJhXAnNMajpdgvgvPvDqYfFYCnR1K2
	HYf0N8HBiP3tQMKKmntWzo4o9Tim7nw1bPuCLDUUtWKIhO4qTVo/JOC/dX+c
X-Google-Smtp-Source: AGHT+IG8gzv/aJUh4IYtUPsSx+7foIDMTjQ1jfdFHRgQxbTIIPhy0Dqvm5WmNEHr7Z15CrITowS1+Q==
X-Received: by 2002:a05:6e02:4616:b0:3d0:e6c:e9c0 with SMTP id e9e14a558f8ab-3d00e6cee75mr34697505ab.21.1738274313521;
        Thu, 30 Jan 2025 13:58:33 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 23/23] python3-dominate: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:38 +0000
Message-Id: <20250130215738.3280576-23-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115177

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-dominate/run-ptest               |  3 ---
 .../python/python3-dominate_2.9.1.bb                | 13 +------------
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dominate/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-dominate/run-ptest b/meta-python/recipes-devtools/python/python3-dominate/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-dominate/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
index cce304498a..a0dd638087 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
@@ -4,23 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 SRC_URI[sha256sum] = "558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 SRC_URI += " \
     file://58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch \
-	file://run-ptest \
 "
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += "\
     python3-numbers \
     python3-threading \
-- 
2.34.1


