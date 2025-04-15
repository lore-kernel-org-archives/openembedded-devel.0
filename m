Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E04FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:43:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.19057.1744720983647369039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ht7HXnq1;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso1058698666b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744720982; x=1745325782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3zo425t+j1NHxSW2S4Uw9T8+LxOB8vc6bLEKJZdSgQ=;
        b=Ht7HXnq1XIWRx3cRCnScyyDMuBoRwclDVKnK3hrlDh+NZ7pe51UvO1PH/88Iq7L4bm
         EOR//xNFPYYk3lncHl/obY1Uvo2izV2V3majT9KPNSsPa2Bq0BuxuO2uIKRkKu3aDPTk
         Sj5qWF03OutnivMq1g4NUW/UmdjJRnG0wVHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720982; x=1745325782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3zo425t+j1NHxSW2S4Uw9T8+LxOB8vc6bLEKJZdSgQ=;
        b=Lk4AL1F8F81r8ob/koh+2N2lx8sZOH3NXH/q1FsM3T7+BP7+lu5VPvrJS2BtfE2Qpx
         kVSPt5LkKg65JzjFZ0kewBkVMVMx+YeBVK24ASQNT7dPg7fdz1JrWZxYXdtWhXzMv8fz
         RSL/OiQYIn4pYfv7KWe7Ty/yVNoQgcgGKgYW5H/LMFsKVBVHkk2Tu+zhBGRi1kz0eGGh
         d3LNUvDDRkcOl4KS2DNZ2eE2JNNUrPqdzGHoU/Yw+/womZlHol/mSg2kTBrAQrBov04C
         zwJUCCX9Ja9X7wlKT6UJfxfzU5lTHYcB+kXDvFVIYc3TzdaixCZtp7oz7D3POiU+oyG2
         B4ig==
X-Gm-Message-State: AOJu0Yy1ywQqiqfnaYAHJstJFkwv1Jm4ldWKr6F1RJmmdQQ9fXzkD+4N
	c6bqkRAjoXmeMf/sWDl8Rs+i3XikEl1vCg5tXUKCoKvHOk/SuGOtI7ZuE7ZLGkuXSV1ocXsFZh1
	N
X-Gm-Gg: ASbGnct3Dm9VnP1fcjAKDguXJCs+/7fkFSvZwEDgaW07qPBq+EjswPWFUkY6p9ewNiZ
	PSxj9TBaNWJCciQJbz3TUTseuEUVgl29AEzX1lqdeO/bgx+p9XvBf/mZPWyTLZ3wlsR8sFJzQ3F
	gw7uprAk9BTUWtz12PpBFnw0gkHdRxmqaHl4VQFE3tUNMCt0hTXPi+4Rh+0nxpAU5KdLRph02By
	8iplNS2v7JpFOoSNLfzO6Ts1Jf+wANqxSosG9fsADwU9eipcjGbfutlCQGm2E5t5WKRF+OsQJuJ
	u8AdXSeJL7ckDaEo1nNHa3nXXXWr/x2eBYf3wSnnmvj4Kzw6vozgluY=
X-Google-Smtp-Source: AGHT+IFu0gTauW4Kg0vAFzBCeaye8amEioyjxyFPqQwC2n5LGrolLeN1Rzt9pTUY+7nJGaTcn2Pnug==
X-Received: by 2002:a17:906:c106:b0:ac7:c584:e691 with SMTP id a640c23a62f3a-acad36d9a9amr1423447566b.54.1744720981703;
        Tue, 15 Apr 2025 05:43:01 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm1069660766b.47.2025.04.15.05.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:43:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-starlette: Upgrade 0.46.1 -> 0.46.2
Date: Tue, 15 Apr 2025 15:42:57 +0300
Message-Id: <20250415124258.1202166-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250415124258.1202166-1-leon.anavi@konsulko.com>
References: <20250415124258.1202166-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 12:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116862

Upgrade to release 0.46.2:

- Prevents reraising of exception from BaseHttpMiddleware
- Use correct index on backwards compatible logic in TemplateResponse

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-starlette_0.46.1.bb => python3-starlette_0.46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.46.1.bb => python3-starlette_0.46.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb b/meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb
index f14f0eff57..cdbb951647 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "3c88d58ee4bd1bb807c0d1acb381838afc7752f9ddaec81bbe4383611d833230"
+SRC_URI[sha256sum] = "7f7361f34eed179294600af672f565727419830b54b7b084efe44bb82d2fccd5"
 
 inherit pypi python_hatchling ptest
 
-- 
2.39.5


