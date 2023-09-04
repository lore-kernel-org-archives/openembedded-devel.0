Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18456C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 11:07:43 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.45827.1693825659615592011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 04:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FTH39gtU;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so21172561fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693825658; x=1694430458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq7+l/S8IcXVLcTWJDDUReADFIV1/QiuFk351K0Q22Y=;
        b=FTH39gtUzdimj7OGGAljVh5gAAv3JSj4YwcS0G1DyPFhAM1HxESAgokz44MylirYpi
         iqxWV+MKhJz9LClR6O5qSN3A704PXJJcmGKwiDrp+J00uTJSR7Q7lC9lkCDld2BpMoUy
         1PKGad94jXnbGzXBHrwe1Z6MOJNGMORdGzBZ5kFdQ/gZ8GxeNhXckh8GB/xfSSXXcT5w
         l699S8yIDDUzLnRZmQ+NbOKCUVlck+FiooytO5Kshq7m6htfQGLGXNZjLL4GLGk9pHgg
         j6WsXR+ktQNN+WwtWuZDly7c0C7gJ1bdMqdWi7D2fxb9JBxyU2GXT5wsteZRS53ZMVVH
         5W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693825658; x=1694430458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq7+l/S8IcXVLcTWJDDUReADFIV1/QiuFk351K0Q22Y=;
        b=NcZ5cX1rH9rCfoQoJIv3u+0oMXo1AKxX/ciPsDeSKf6WS7P0mv5YG0idd9hoBRq5mU
         eFeTZbWJwkp0mGra8X52dVp4OZXl+3ELDLsVimsPG4PAWjhNqXJomRf59GR3Nth3EXTl
         eErXXMnTkE/pnDPirxV5tnpeARHlO6XpBOpRDQ44xMx8+cuWMvDAvLmRQ8AJ866k3JtN
         NZnmc2JuYyrxAiiRbQPTuOK4ztTGyQVgoKae3g5M1n+iEEIpeApnI5nTcLcWVc4fmoGq
         TKwfUI8qKTgsQCO2oi3U0QAJXE8WijQDxLFsuDObPJlzRO2kauOv6EbWep+46DSLA9LQ
         3JmA==
X-Gm-Message-State: AOJu0YxL3u8nTi1qp/QcVIwOveaQalJLhdqwdfLhvHojTi78eYcgFzth
	TWRc4umGmojtnqSNa5rJLjlmwlCZWz4=
X-Google-Smtp-Source: AGHT+IFV5B0kU3Pu/3FZzze/BWBvR34xd+u0to7CXb/csaoAFgBQK+/LcrsI2ySbK8/t1YGlLTqWwA==
X-Received: by 2002:a2e:9ac4:0:b0:2bc:db5a:9540 with SMTP id p4-20020a2e9ac4000000b002bcdb5a9540mr7441191ljj.42.1693825657458;
        Mon, 04 Sep 2023 04:07:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906255600b0099cd008c1a4sm5993026ejb.136.2023.09.04.04.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 04:07:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] libiio: use main branch instead of master
Date: Mon,  4 Sep 2023 13:07:16 +0200
Message-ID: <20230904110716.1918408-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 11:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104708

* the branch was renamed upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_0.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_0.25.bb b/meta-oe/recipes-support/libiio/libiio_0.25.bb
index 71fd2047b5..3bdd445213 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.25.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.25.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 SRCREV = "b6028fdeef888ab45f7c1dd6e4ed9480ae4b55e3"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=main"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


