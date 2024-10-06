Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E20CFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 20:32:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.38461.1728246748276320523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 13:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=io6ZL+Ng;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb806623eso32946785e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728246746; x=1728851546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg0H1eO6O3yChiZLyzX2spiolJDDc7/8dDE7ugoKxmg=;
        b=io6ZL+NgaZjGtD9H484kiQO/Y1wLsRr5D3I99Mz8S5Ph4fAJDPyLRUwyd9/MGVmrwD
         tN1fGGi/q2ArtVpBE6hBs8NCqCClt8Zy/3/EiLsAaRbZK/PbsqnV8wgk/M9oRX7rKozN
         molSYtAfojxdj285IQpyi8iIf+MgmCkfnvOeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246746; x=1728851546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vg0H1eO6O3yChiZLyzX2spiolJDDc7/8dDE7ugoKxmg=;
        b=NKNvBPdOHd1hElu9QBvZ+zwWfjuchdkilOTMz82mfbXjSOCg8bW1AfGcL5Paf21KuZ
         kx6nwSQOFI2qkrl0WVchzWy3nvJi94n8exEUzhhZOXVIT0l2mQ4pz2r1Tpt1/AvPS4Z2
         XiAjhySvy8XulNiVLgoitCx6W9SVeAuAIuuIYcr575AzmI7q9T4nj6u5mPhBXIAr8xyR
         g3lTerAGhrdY8nqUSTU3SzjnbQ1dtOVrKoGtTtVrpl0UFvdLI6YJJzxSJjTVL+H8SSPe
         nMxsAvpY/nFMNgrrru4LegoH8snwEGyre4tH0Mq/6DCI0BxWM7i9TgjtoZj0q9mUb7qD
         wSHw==
X-Gm-Message-State: AOJu0YwEtASrTPzEdxwrEfmwA+a5AOiirfWb6NgV+s8S87H2OmXfIWTh
	fdfhHxjL1MUd9BchqKPZjTRVXOokECwFQte8vWycDwldKD/apNwyqKLR4z/LNWH+1d2H8Gur5FA
	+
X-Google-Smtp-Source: AGHT+IFS7HDQ/yiFJzqN+8qItPsUERjVxM8MLQAAP1/AhzqHtP3xPW4damGlwZjat7wRZ/XNR+4SkQ==
X-Received: by 2002:a05:600c:3b08:b0:42c:bc03:e765 with SMTP id 5b1f17b1804b1-42f85ac1154mr73115325e9.16.1728246745969;
        Sun, 06 Oct 2024 13:32:25 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1696f921sm4216807f8f.91.2024.10.06.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:32:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] non-repro-meta-networking: update known non-reproducible list
Date: Sun,  6 Oct 2024 22:32:06 +0200
Message-Id: <20241006203205.2981121-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 20:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112689

From: Yoann Congal <yoann.congal@smile.fr>

Add ncp, ncp-dbg: symbols are not sorted the same way

from: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/46/steps/28/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/conf/include/non-repro-meta-networking.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 6519ef33ed..7497ed4b03 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -14,6 +14,8 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     libruli-staticdev \
     mosquitto \
     ncftp \
+    ncp \
+    ncp-dbg \
     ndisc6-dbg \
     ndisc6-misc \
     ndisc6-ndisc6 \

