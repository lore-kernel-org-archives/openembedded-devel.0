Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2070C4707C
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.156007.1703876557298584172
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3rlepU5;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ec7a5a4b34so36024197b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876556; x=1704481356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d51ihst95eTHVxvzBFSL+i8BV1ssqAgtV4mv9RAZ9Zg=;
        b=R3rlepU5bYrHz0LEOsZqzRiY7/33/MEhJfUx1RuLjTZhdiB1rdM+uigoa7itmtKAG0
         KlBaQOXtb6PhT7BAAC2e3mb9Zr5VRFZ5L1JNB/IJoMq1VpLRBSEYPLSnlV0PR6y53zjO
         NsPXxt0o3XJeN1AfI+Sxw9eDixcavjeErAt4//3nEHBfGg8St+7TmcWqGOrFsPkQajjy
         CidLw8zG2eFzR1J+xNlVf4xZmYNLpgOM1FcWSpVS7jqi7hACuiypiWRKdMQMU6BFO3wX
         C26rNhkWfupduu/8Rrh8+36xItENk8o5K+HxIzKfC65kZRBUQmGEYxhjtY5HYFuh8TQM
         WG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876556; x=1704481356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d51ihst95eTHVxvzBFSL+i8BV1ssqAgtV4mv9RAZ9Zg=;
        b=MKi4sbtkHHWckG8kFn1w1XAiNnv9MMVHXr7dABtT6HTBrvqQFdDjaNrjYfYuYmDoTe
         K1QVMoBHazHVj9U02pRNWqB6byUKMX9XPdd8kBvRTEaI8Qp4Aez/eE+K8k+pYxbMmWvj
         GLZcPV2i1XBAvuQ7f5Y2Cqq4kmPHYm4MvCjB8LIxXRWQUP8PCzWgXyQNWA/TmPsutR1J
         LjXBD14VWqSszHncFU7UNOcn9NBf3m8CUxVmKyodqu/ZlJnutdI0BhDIob4TrfQ7OSbA
         XKFPKCxVm+MPf8aGiT5AXzJfINSiamlNo1y6/KCijmoTi0F3Z6PdDLiapfYlIo+z68ty
         L5tA==
X-Gm-Message-State: AOJu0YxsQ2dY0YbAXxqUAC/tt5azN48a5y2xZ+GFSLPJHON6KOJ2ESOX
	iMLaRL2ifYOpii70EQUx80CrqUzYFN5UMg==
X-Google-Smtp-Source: AGHT+IELO8SGoAUeyQN8c4FK8fxwMH1K4B8G7YXoLu9vMPTk//Z5dRuubsp2j2mqolVR8Svi3qH8/w==
X-Received: by 2002:a0d:fdc3:0:b0:5d7:1940:f3e1 with SMTP id n186-20020a0dfdc3000000b005d71940f3e1mr10217796ywf.73.1703876556235;
        Fri, 29 Dec 2023 11:02:36 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 04/17] hwdata: upgrade 0.370 -> 0.375
Date: Fri, 29 Dec 2023 14:02:17 -0500
Message-Id: <20231229190230.135480-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107886

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 730a12716efce66263da55045eac69554c24bc1b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.370.bb b/meta-oe/recipes-support/hwdata/hwdata_0.375.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.370.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.375.bb
index 56d4253772..b834069733 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.370.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.375.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "21cb47beb1716545b25dfe8ae1b9e079c73b85d9"
+SRCREV = "b9ba5bc9eecbeeff441806695b227c3c3de4755c"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


