Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A64FC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:36:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10620.1749022615557510326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pnR1+bIn;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so75273815e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749022614; x=1749627414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3lGpprEN0X5uNl1OuR3J8mY7d9CfLkKTH8FIHvqTOE=;
        b=pnR1+bInvK1OosxIbOal2CO17KAniqNeXHUpxAFJFWvQLisJZIhJ3pCy1AfiuSyCsI
         MCRXVYnFfz/QQNArfGeUHX4pdfpUQ4mjtWZvxECgssVWoGlN31lPpsyWJvuaVnsRz4eG
         Rf/ibdEpe2apNqdq6h4qmHWrI6U1phgwFSHs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022614; x=1749627414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3lGpprEN0X5uNl1OuR3J8mY7d9CfLkKTH8FIHvqTOE=;
        b=TNdzQDOxNl6Dl1XPbyt5K3QBeZMxqyko/gHL43I/XK4bKEuikemSmloABYpe1ZbvVU
         aJHKKHIxjg5r1jlBXWEKjYmYjgI7cLRNfOBK4pLzaV5nkWMXM8Ps1aELhFE9SnArWu38
         gntW+hwslplRKOAExmBDatDz6JbKVMdfAtMfFuISc/RDbs4bnAdYzv+/k97SNwCN+x37
         EdsuJLj7l2UtuhqBIQApmVvoYguXAY21lDuU02f7nWfCPswLeJkd36BoiPIDtR0gzcMC
         0OX3ett8W/QWd/X5ws87/jL7PidSXdGaCDZBBLOCvm8IIOoT0dxfgxlKLlA6Er0O9Zr1
         mjXQ==
X-Gm-Message-State: AOJu0YwPxGYg05QpjsXkoJVrGV1cQEWtoWAPxkjtU/lkSJ3XjzAHbYXZ
	i+JS7X2/yrp7a+G8bZclyCW5PQSJ4lvbExdj5wEa5oryIKELpc/xYMOdifGe/NgmjIBKUaOv7p3
	cS650o6U=
X-Gm-Gg: ASbGncuVzaeDayQsQInNy6hAkfHUTl+33ho9C1hJ7iEsCt8WzY+kLQtRiEEZl2f4rVd
	pOSUY6CGJsvU8VWeA491gYSnOrC+vFrJUqD6AG79BSZ1Ut/zme7FI422zDun6udJ9f/RGJj+oeC
	3WikYLwbH1dTSPVMHK50TbKcOMhxZqHw8DS0JL0Reg6/kGgJxjUFo8zwlKCZVnaLoJwKo3icgjG
	tWKWTzfU98aFXvqz8MUqlXulAY45KWEfwMFoQx6W4Qd0BzMolZTArl6l4BM6uTjFk85ZjGVqzcc
	6BPG6r5YPi1JGLfTITn9Jdh9TdQEARinzh+cbEXK6MKSeeT275grf1U7w77BRn0xljQrVwie1gI
	2nU/szOJdktlAXEPWN9kxVcCMfkhMlYWZqVyFASw50hFYZ7U+Swz6Vv4BOhw=
X-Google-Smtp-Source: AGHT+IF+nQRcPknxDrqqoB80qdPd1zkG+imrhWZz+ZZVr97XtjO2yqSh40At72kTCe5xppF/7PiBeg==
X-Received: by 2002:a05:600c:1c96:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-451f0b0c540mr13152865e9.16.1749022613667;
        Wed, 04 Jun 2025 00:36:53 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc1a84sm192765115e9.35.2025.06.04.00.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:36:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] pcp: update Upstream-Status
Date: Wed,  4 Jun 2025 09:36:40 +0200
Message-Id: <20250604073640.2456331-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 07:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117730

From: Yoann Congal <yoann.congal@smile.fr>

https://github.com/performancecopilot/pcp/pull/2217
was merged into
https://github.com/performancecopilot/pcp/commit/0ca303467ce382127cd9676e288bf7690a93f084

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch b/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
index 48880fbb4d..2c3cf696ed 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
@@ -13,7 +13,7 @@ header files are softlinked, resulting in a build error:
 Fix this by adding the make dependency between object files and the
 headers.
 
-Upstream-Status: Submitted [https://github.com/performancecopilot/pcp/pull/2217]
+Upstream-Status: Backport [https://github.com/performancecopilot/pcp/commit/0ca303467ce382127cd9676e288bf7690a93f084]
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
 ---
  src/pcp/htop/GNUmakefile | 1 +

