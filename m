Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBA9C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 00:22:23 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.10038.1702513340980829190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 16:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b71e389fb2so241305939f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 16:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702513339; x=1703118139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpCcM0nStkxSussBob8WUCEq8DRTHik8JPPLKRCtlFo=;
        b=fcDuoAG31l8d7PEcu8aQzOe69jSAjqDozjKKH+tXZBvdpizScZdGWZftRSznRjA+6H
         WwwHVlYXzrKwZ3uookzJXZbUFHv8lJstF+aH2lbcVG3lipQ74aFpkp2a3EBFKpR59+ta
         xb9mPTf/wi/Droa//lzInG7ZABIk2ErD45rZc3vtBSN3ipO1k5fBUgZ+oX5nK5svMmIZ
         6Ks2nSOXUTsIAnGDIvX0lJvXIiEJ9KmyALefs5PzY/BeEsPz/osXyhsDQGRhzpdcYmHb
         +nEK/xBOlxfd0lE3ufhAV1oVnpczutNSytHZJG2LYwi4MVV5RbB8UUnmPBVBmLoIHCP3
         52yQ==
X-Gm-Message-State: AOJu0YzmmAL9RSi3CY4m8mDMnNl9N8C7e07k5ihBL0awzA4lWVJSkCuG
	kKnLmt8/VMVAn8+Oel+7jffAS7I+SptDHw==
X-Google-Smtp-Source: AGHT+IHi/yaWdtLf2xBUgmx0657diRlAZUjbxmLSffeY3F+j4ClBYYW7C3QwZQtthpDBcAYa+zxzIw==
X-Received: by 2002:a05:6602:4994:b0:7b3:ef90:a56f with SMTP id eg20-20020a056602499400b007b3ef90a56fmr13821106iob.4.1702513339264;
        Wed, 13 Dec 2023 16:22:19 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id c11-20020a6b4e0b000000b0078647b08ab0sm3399686iob.6.2023.12.13.16.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:22:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cmake: update to version 3.28.0
Date: Thu, 14 Dec 2023 00:22:08 +0000
Message-Id: <20231214002208.1136041-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 00:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107402

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-cmake_3.27.7.bb => python3-cmake_3.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.27.7.bb => python3-cmake_3.28.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb b/meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb
index b613fd3a1..c31161e8f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.27.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.28.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "9f4a7c7be2a25de5901f045618f41b833ea6c0f647115201d38e4fdf7e2815bc"
+SRC_URI[sha256sum] = "cb16c350eaa8543afcb1a9b142809b075f5ee8d94fa07b7c769fbd827c985dd0"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


