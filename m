Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DF8C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:16 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.6216.1738274287782693854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d005bc9f4aso5360245ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274286; x=1738879086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyXPFzuIPeqe6P8PjmTIKiha02IGLUqLyIhYcRhfbqE=;
        b=huVpE77JlaypVy1SdLZ/ws55OqFsLGHYSwMZea/4Rp9Ab3SjVeDOdyn3hG+m6MKCu2
         uMAWNiv25ttB5aMZerGrFdlvNRU4PKDnC7nde2v3x/Z7u77KxPcskdscbkCtuk0kRRa8
         RPxaoMpSe1zWwnPytAzcB8+9Y1KG8C7gTESnZH8dghRRA1NOMMYvng1FUjdlYD6Ej9ve
         ALX3r7U1VcFSNcp5ZuFXn0R5jcGxpZ8BWtpXeuuVHzL6ODfag58EM2zkBhQzJp67WMbs
         foOB0b2HvmIn2dA3NkKCLX1ijgIuSccvdMDO9KlXCmPjfoYjKUxgdayMZcFPaRs8SO3o
         zXHA==
X-Gm-Message-State: AOJu0YyL3ijFjPbfCvn5Nd6uRD2f/8XcBObcIniyF7m5FNcDTgLKAaOH
	DkF3ZwBCufJIWmA9gSQfMCPv4MGrUps+Ie0+vJVil1mTBTK/YgCnJFGDqHiX7RU=
X-Gm-Gg: ASbGncv6NOdiTSJJ1GqHbOXRGGEMdT/toMjSZWRrosWXuy+AStyvR0XQLKRxu4MdYGi
	9aRXK4v25xTypnkQnGTDL/1aFJFdGHgQuJXZ2cQysnz3KGyrOZN9829gYLZ1UdO5PXvE+/BdvY4
	DURgOnJf4rFelZa5of/uYDGdLcvhUySOAABgY3kQuMfOdStF9NsFHeKJtCf64naRA9EWqiA6HjE
	o7c+breBqVq8nBCIeOrOTriDXARJ5GFlbK0OeYv0ksCoPK0bshwcRr7MDXYlVZG4L368hPMfmTw
	6f7k4FhIRShpV67xH6L0QY0ZSaQCflHF6WkVHa7wLdNctRXwBcxafZ/VPvFC
X-Google-Smtp-Source: AGHT+IEwqiB1EULkMIXzipoLKTQXQs7exqNVusg9iK4FXtLlnL+CBRqVFkKF79JWstPKrh8shH8WRg==
X-Received: by 2002:a05:6e02:1c2e:b0:3a7:8720:9de5 with SMTP id e9e14a558f8ab-3cffe3d1ccemr89776035ab.1.1738274286169;
        Thu, 30 Jan 2025 13:58:06 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/23] python3-ordered-set: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:18 +0000
Message-Id: <20250130215738.3280576-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115157

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-ordered-set/run-ptest         |  3 ---
 .../python/python3-ordered-set_4.1.0.bb          | 16 +++-------------
 2 files changed, 3 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ordered-set/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
deleted file mode 100644
index 64799ba008..0000000000
--- a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake test_ordered_set.py
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 64637b858d..2d6b6ca06c 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -5,19 +5,9 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=3bf5e1ad64c0d99032c3143361fa234e"
 
 SRC_URI[sha256sum] = "694a8e44c87657c59292ede72891eb91d34131f6531463aab3009191c77364a8"
 
-inherit pypi python_flit_core ptest
+inherit pypi python_flit_core ptest-python-pytest
 
-DEPENDS += "python3-pytest-runner-native"
-
-SRC_URI += " \
-	file://run-ptest \
-"
+PTEST_PYTEST_DIR = "test"
 
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
+DEPENDS += "python3-pytest-runner-native"
 
-do_install_ptest() {
-	cp -f ${S}/test/test_ordered_set.py ${D}${PTEST_PATH}/
-}
-- 
2.34.1


