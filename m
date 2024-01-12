Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3356EC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:27:46 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.7758.1705098465799278575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3606dc50447so34093575ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705098464; x=1705703264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxqAjiEel2qj0kl/Ua58YualT9pF6e/QxANGz5SRzlU=;
        b=a3uhI0YMTMOJKbX3a2T2qUaQJ0y6mdoqI1IhKohv3lqASpOz6vF2mkweuGNtelY44M
         swSRBsZIi0AdDpsAZ/tPF/Q8znGCN4XMNFuULbwBFw4Bga+8GdPvraflEFF+7ttCQo7l
         SBSwEJKP6SSshWUXewl1k6x8y28KfB4VBtSDVao2IRfUiAc9C5scfU1zF6vn/DOPQSpH
         NYlNmgWDm+wu8L78tV2I++yC/Sdxv6O+hRHq4hruKWdynRaxfJJa0YSMHgQE3EKbCtIO
         ito2XeaDgiSvmtqWTi7e29T8tGG29hE3mNHO15euDXUIPc6XIJeQQBNnHHVc++lqgYnK
         wbMQ==
X-Gm-Message-State: AOJu0YwDp4KVxXkPgcYhg/ss8YghjbiglNgBeUiWugLZ5JXUsrNFiMYK
	m+OGDTlV2BKtUeduF/lyYoAxBIYqdU/jwA==
X-Google-Smtp-Source: AGHT+IGLr+BiDG0Ck2mp8uTfSOovQ7NTHN+c6YC1/qEPBmb1I5t2VNFSefVzw8XoLxNqMTFRtlyLcQ==
X-Received: by 2002:a92:905:0:b0:35f:d0a2:f357 with SMTP id y5-20020a920905000000b0035fd0a2f357mr1840278ilg.46.1705098464040;
        Fri, 12 Jan 2024 14:27:44 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bg6-20020a056e02310600b0035fedce3160sm1221916ilb.33.2024.01.12.14.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:27:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-socketio: update to version 5.11.0
Date: Fri, 12 Jan 2024 22:27:37 +0000
Message-Id: <20240112222737.3047072-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108261

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-socketio_5.10.0.bb => python3-socketio_5.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.10.0.bb => python3-socketio_5.11.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
index 68168bb63..72471e956 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "01c616946fa9f67ed5cc3d1568e1c4940acfc64aeeb9ff621a53e80cabeb748a"
+SRC_URI[sha256sum] = "b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.34.1


