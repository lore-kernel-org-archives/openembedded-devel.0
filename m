Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69B4D12D47
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 15:59:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.38432.1731254379450841537
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 07:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jz8VUygC;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4316cce103dso47119105e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 07:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731254377; x=1731859177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqb3u3mtIXl59Au42fEd34Vaff81vyiPeIFQb6N8R28=;
        b=jz8VUygC0C8ocq4VfXuuhe8A1G8Z+TBqWlqSekDeXjD0uD2YXId1DpHmxzwAODFPhs
         jvWKSs1pRFYzfQxYxwRglfQEZwULhwyg73TLZYU4WrXAYfZKvKTS+7e1rgcfx3o5YL72
         AT+wpu3gkBMbUw76IjEwEazafCc3h9VX309AyplSBTpEFEjYAQWLcqHxksIqF5TM1Idp
         oAVRMvfYWUZyFiWSCyHCbYEc6OrLtsahwEdhvF0Ix4c/zNRi/eH3WB4FiMAMJRmqnWqh
         PfLfrkgbGSslLXVNPV95WODQUQq1xzoOoJPWcM6/FGiYxkXDiowoBaK63NcaofNQmpyT
         F0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731254377; x=1731859177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqb3u3mtIXl59Au42fEd34Vaff81vyiPeIFQb6N8R28=;
        b=c86GNggyQfbF+CsmqazQM7XzrOM++XCIyu+jQAasdoP4iyEdWmytyyL21wjohGAq24
         g/lcaREfJ0SxPXFScGtNq4slCJNBYm2/s0AWtfHP7FObjj7FF7/CUJJvlzp68GycV+Yx
         bIgekSiRlPPmYhGgEe8YqJtrA6sJZpP9RXoTobaPYmk2wHzHHV1cX3h8zVo5fdO4oSol
         atR60xgpTxnF6iWpXSehNReTQVSk7WjmEu9N1sWmtlF8TJViwAWElqXC5658BR4tF74X
         el5rR1WT152PHUDg2uVIBXmDaKUz9KN9BIs613RKRgtEsmDOSJ1b86fP2Rceh1OPORql
         YlaQ==
X-Gm-Message-State: AOJu0Yw9PZZNN9vQTGQg68F8Srn9PdrPoLWzg8vysDO7GXeHyidd60I1
	PzWRKCwFf+QWTbuq/cF32pXEM+C95twqIIJ/p3m1JW3RMz5r7BxyE4qYPA==
X-Google-Smtp-Source: AGHT+IG6JG5b2gX8HNxWwcMcW191AyDzrdp8E0Yy+zu7tstQrl5uYbCHlpLxq+T9SDtLS/bbvnfEPw==
X-Received: by 2002:a05:6000:1acc:b0:381:eb8a:b81b with SMTP id ffacd0b85a97d-381f1872402mr11210991f8f.33.1731254377043;
        Sun, 10 Nov 2024 07:59:37 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea587sm10851882f8f.78.2024.11.10.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 07:59:36 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-twisted: remove do_install append
Date: Sun, 10 Nov 2024 15:59:28 +0000
Message-ID: <20241110155929.4678-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 15:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113777

It looks like it doesn't remove any files today. So I propose
we simply remove this append to do_install to clean up the recipe

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../recipes-devtools/python/python3-twisted_24.10.0.bb       | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
index 056ddf428..b097cb7fb 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
@@ -10,11 +10,6 @@ SRC_URI[sha256sum] = "02951299672595fea0f70fa2d5f7b5e3d56836157eda68859a6ad6492d
 
 inherit pypi python_hatchling
 
-do_install:append() {
-    # remove some useless files before packaging
-    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
-}
-
 PACKAGES =+ "\
     ${PN}-zsh \
     ${PN}-test \
-- 
2.43.0


