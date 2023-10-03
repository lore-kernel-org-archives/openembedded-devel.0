Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D32E776FD
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 04:23:24 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.101435.1696306997014451466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 21:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QizsfT8k;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-694ed84c981so342727b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 21:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696306996; x=1696911796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZyXtmfV2tYNJxVSSz+/ZSxdAA09NtZ08DwMUAp7BDI=;
        b=QizsfT8knYFS+MDpNutY4cqQSaH29t4Eh0Cd7xF2HJzRMSE94rgl2Y2evooGD1kZq7
         GmM8G56B7B3TPQcrfNvBOc8aJY8ma8SJRq2lwr8X3rOH+KOa7dLadXvTxm89KQVuBFlt
         oxBTnXWLEa6XXrwESKX52Bzg5w65ctWXCmxqwyNJKU0htgf+EfF5ezdX1okU3AnfjokB
         FfRVMpwb0G03PvNO0wXgq5MIlfKqvobWKPQzJy4beSg70wICmYKXFw6pXqDW3X6/h4Mv
         zXubWvlE3PtbREWxqWLMmt/X271un9rjM2yZ+Rb87rjydey0mU+sxwDz4LcerQpQbYOk
         EwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696306996; x=1696911796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZyXtmfV2tYNJxVSSz+/ZSxdAA09NtZ08DwMUAp7BDI=;
        b=l7lda/it8TA04Ih0+42Mw7Vw8DKJ9v7kSvx8E7ftWKkrKzIpvXeqjoCGVWeszLrUqk
         CuzkznfH07w1AxdPl5H/Rp+Puj67s3MKP5jXD/n65752KDkUsKtI8irLS9Wp7RHjkWRS
         u9X/s8flAABbVeG+FZH598xbhK00eYSIM7mm/76A7uYzS2nzE6erhgh7871dqvyKxVHV
         HqmePUV8LwpV5sKqPe+j17QAvXn/L5C8hXen5kAvBi/imXZ6/ZMnt+1cpGgMjcvQv+of
         iYBqwBmIJX/3ADlTaaWAZ/781BJs62PK0T1Uwd5Xj8+7cNcoqyuoM/hFcdoyzc9s+uhq
         C2Tg==
X-Gm-Message-State: AOJu0Yxzg6vPu9YrC15I5EMoKChkIIes5b1VhiwKFUwy+doPDII6ckMN
	TfIRf2kHrCyW8n9T++wuNG5Z1Ji/OPUMSg==
X-Google-Smtp-Source: AGHT+IFvoiNXWsouWuHrzAKtpzEFHto7JsprS1qy3p5YGKy6kR5c8rGPqibnDtgtf9OUa9LM1v3oTw==
X-Received: by 2002:a05:6a20:441a:b0:153:78c1:c40f with SMTP id ce26-20020a056a20441a00b0015378c1c40fmr14783859pzb.15.1696306996181;
        Mon, 02 Oct 2023 21:23:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8a00d4f7asm320041plh.9.2023.10.02.21.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:23:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pyroute2: Add missing dependency on sqlite3 for ptests
Date: Mon,  2 Oct 2023 21:23:11 -0700
Message-ID: <20231003042313.1153843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105314

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
index 39fbd1a00e..baf3cf8ede 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-fcntl \
+    python3-sqlite3 \
 "
 
 do_install_ptest() {
-- 
2.42.0


