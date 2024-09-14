Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0290CC021A1
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 15:39:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.97702.1726328397054534656
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 08:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1I++g7d;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fee6435a34so28170905ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726328396; x=1726933196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbe12PNFvMBFUhyze82i9MQf/+8qWZKGHRe6YyEjAoE=;
        b=A1I++g7dhJfQ7KpLx3UHd+k1ZeppdClX/7vO6/YsPTtZbqwq1bhxXJUFRxDfKr93/4
         vaHGEBpE/jRq09J6UyA+xpicKEqr7v1rC/P37Ow9DZCf8xkxFs+jbVt9q5WqJy9GS6Jg
         wHf5s1owS8aHRXSj5j8JtKZL1aQdnnmLkP4NvbqEnWm/H90OlvwGcdWKXeX+5KHyashm
         mrPUe5PWesoHx97gQnQWO8XbqQI6iceB67yuBU/GrcSHdKrp7f3akEtXadqfPgURxGrs
         SqOC6JrmXNfBYpPK577IfqizPZyziGVKbeMjkp5vYKevCDae3mM/wGJzxBQU8NerOq8Z
         UxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726328396; x=1726933196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mbe12PNFvMBFUhyze82i9MQf/+8qWZKGHRe6YyEjAoE=;
        b=lsKMzoBQIuqJ+Ttewaad+F/d8jV2Ad+SK4yBUYKiqPOqJisa5fVt/e/BRAphew8c4p
         Ngoxri9W7GV27aa2s2WbDdpZR6fydOcBmfRTCegGz2U+4iTbs4qRwU3nJtWqe+viB/PI
         MGxnat4k/V6+Rgiszj+MUCTMIN7PekZpIlUyIudWcH6+d6E85zskmlyGH1jz47tCuYdL
         H8ZYKyqIqH5YSOFgYSE61QLWRxRtPukTA4aikzTItI19je8ufkjxR2zQuFMu7AW/hffx
         calGlaLmFlVlTbJlH2O22zl4FwOpPDChzLZW7gqjkBZUGKbap0IYiraI5yvn+ESpFpIz
         11eQ==
X-Gm-Message-State: AOJu0Yx7BidYT2BzS9pvowT9ogINTb9/Xkr4OTYoL4VXuMLVVFEjRCrT
	+qZMK9MbWnAehWTIcKLIkI+J7IfX8QAwdP3MbHvISm6NRzevwkpXDmuteUuo
X-Google-Smtp-Source: AGHT+IH9M67gg4SerpqTGdEi9OfLg5rwurko6l4Zs61F+OpSzO2+BC8eZyFJwliMhlzg1wb0XRkKsg==
X-Received: by 2002:a17:903:234b:b0:206:b8b7:85f with SMTP id d9443c01a7336-2076e3155ffmr155377625ad.3.1726328396158;
        Sat, 14 Sep 2024 08:39:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::318e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfd271fcsm1694156a91.28.2024.09.14.08.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 08:39:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Einar Jon Gunnarsson <tolvupostur@gmail.com>
Subject: [meta-oe][PATCH] yavta: Upgrade SRCREV to include 64bit time_t print format errors
Date: Sat, 14 Sep 2024 08:39:53 -0700
Message-ID: <20240914153953.129617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 15:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112289

Thanks Martin to point the latest commit, see [1]

[1] https://git.ideasonboard.org/yavta.git/commit/?id=52c975e5542504ac10bed8b1d68df5c75951d202

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Ryan Eatmon <reatmon@ti.com>
Cc: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index db00c67b16..699b5608db 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master;protocol=https \
           "
-SRCREV = "323facd1d5bd6251eec70dd5c1484a12ce01202a"
+SRCREV = "52c975e5542504ac10bed8b1d68df5c75951d202"
 
 PV = "0.0"
 S = "${WORKDIR}/git"

