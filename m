Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C22C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 20:47:02 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.1760.1702932416522387227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 12:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBtlCvwV;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so2537676fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702932415; x=1703537215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KHwuWoJHEOVaoIAQo+hgB6xoLO8IQTPR0z3V/GL0xs=;
        b=RBtlCvwV5OpD8l9B6IFIb8ywRkxlDgIJAcqAYodNwFyhYkVlEXpI7quUbJNHF+TPS8
         PUQhfpsqwPl3NUMi0TbNJaFaJXuv+9E+jtcQlmzrwhtP4FCLphSnaQIbFJdCDRA/iR2x
         e//0mmoNFT5MehU0tMh4UhpuypgkNi2+eBYQykOMjIUofRK/Di2A323GMoma8BdSwv4s
         KRETLbJHBEW2iRz5kooKKF5zH/jL9Kj0fe2684ytYcRpZVBwRdvau5u1EUy+9dW8sB/S
         LpT5yva7h777JRzy3QBCl3pAwBDUwJeGbP9d4wdkfNCK0FTfgTL02I7AZ1hICwFwlEc1
         YdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702932415; x=1703537215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KHwuWoJHEOVaoIAQo+hgB6xoLO8IQTPR0z3V/GL0xs=;
        b=uK7wM1SU98kDEckXmfrYzgaWmisuYwBgiiweJ0wyy3YfPDmpG72dle7YkX1lnTEEOH
         O9cRFZ2yjR/dQiMOp5sM7mYEoWvkKwG1VC5Kev7R4gy3NQ+k26jaLhkKm/865JlEtHOo
         ZT8FBG+A9tF9D073507tTVS+fcuffYAUkkagyXWaiakc/FC1xV7qbrSiQ8KSgHw/m02a
         DfL6NT+6HQA9a/C+bpDSpA7SH/QYKwncJhxLfgfW35ilWF4h0RZFQt95oeoTbm6VXlW6
         LlDzwbh/Bfe8mnduQlrIZNtjpvLbGYrpgfqJ188/09r8sncdwdhwE50Kkz+G3LSWEChm
         xN5Q==
X-Gm-Message-State: AOJu0Yw5LLjLzR0HaLTv1lMatdaEqc3dXykT/ENqI+rATQsnxaDErpSj
	HrzjxnIifbK9Ipa7i9dBjJl41Nf02pU=
X-Google-Smtp-Source: AGHT+IGCFSpAM//Gp082jNDVl2wumVmFXA8YWFo4AY2/4FZbsLwDmJIHkJUY36+kkqYhLMQFk7ZcvQ==
X-Received: by 2002:a05:6870:3042:b0:203:ae94:3350 with SMTP id u2-20020a056870304200b00203ae943350mr3725884oau.87.1702932414760;
        Mon, 18 Dec 2023 12:46:54 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id lh10-20020a0568700b0a00b002032bb7895fsm2977810oab.55.2023.12.18.12.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 12:46:54 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] redis: Create state directory in systemd service
Date: Mon, 18 Dec 2023 13:46:51 -0700
Message-Id: <20231218204651.4055447-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107549

Configures the systemd service file for redis to create the required
state directory before redis starts.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-extended/redis/redis-7.2.3/redis.service | 1 +
 meta-oe/recipes-extended/redis/redis/redis.service       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
index a52204cc7..b7791d0df 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
+++ b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
@@ -10,6 +10,7 @@ ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
 LimitNOFILE=10032
 Type=notify
+StateDirectory=redis
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/redis/redis/redis.service b/meta-oe/recipes-extended/redis/redis/redis.service
index 36d29852d..f98f2d19e 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.service
+++ b/meta-oe/recipes-extended/redis/redis/redis.service
@@ -9,6 +9,7 @@ ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
 ExecStop=/usr/bin/redis-cli shutdown
 Restart=always
 LimitNOFILE=10032
+StateDirectory=redis
 
 [Install]
 WantedBy=multi-user.target
-- 
2.34.1


