Return-Path: <ari.parkkila.git@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51452C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 11:30:52 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.51746.1681731043320640155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 04:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XakUKaTC;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: ari.parkkila.git@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso1330147e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681731041; x=1684323041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ml76tC69nAquuJbfdD5KfLknZ/1MEfPrjTwnILZIxLM=;
        b=XakUKaTCYXAEX8QoprfcJXy/8MIflUC+DhLOTYns1eiMCIAfE/qzs5hxw/nEd1r5U8
         9wJuj9RlpzvBznYdaqGXhjFfe4BPym78S/sJj0Bx4wAAQdwfy5QqoQiDfyCwbu2RMvLo
         PU49/379tjS0G3eiNHWGyKS2v3xJSW7CnPkxCK5hqQZzgDIWkqBrYFY+jW5E4x4oGPj1
         YcAnaHFpytt1dySXyDz8JTC7BLAg0p9IK6IRGmuuWQ0lyeD1/1b2zSQp1VU8kB48TfCn
         jfd5mtAT6b5MZFqAseyRGHWEEaxx+dqelVps1MicTuxf1w+IqJJBvVTQqK6RhPNyLxsW
         P+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681731041; x=1684323041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml76tC69nAquuJbfdD5KfLknZ/1MEfPrjTwnILZIxLM=;
        b=lghZ6LrNJ+qjer4/djjwLV5ccPQzLrrKmJ5Q+rKDZh98RePyb6EXYYlpZv21zB7ZwV
         Y5N8iJXou0gdkfgJDqBSngNTE+98FSvyio73V7AnRd+3Is9Xr+lu+vKuJRJAEqXpBpfK
         6scihlq0agtyxgdVw/WXeR3MPzGCEqu5HGhACL89R9FjssC9ZZOdeNqUbpGcUrWnAZdL
         rvgKfvtNaHhHwl6KGGKNqz/HwA6aV+BPP/LxJY+gIqRkmaO73WX6ijNJjKfUKgUZlpBK
         vFEtoxI7+Li98NKrRvPnQBnp9GHGu8NzGyJxdJfjNnHfbkWOPjpt1/PICQ6pJ0Ge9m5R
         OwXw==
X-Gm-Message-State: AAQBX9cA/Pkp5TpuWFxEv1SZGkBRPdwC1Exulny33dbPz3tyLFo/6MAx
	YT4ctLx1i3BuQ3hOXoaAEeUwPkB5A3ab45Tt
X-Google-Smtp-Source: AKy350ZFeczRUT48LaiuhLXVNt3eFk+ZjfbdsCtEzJ20YoaH8mD6cLmaMukRC94X5FiRJDohZdeDxg==
X-Received: by 2002:ac2:55aa:0:b0:4eb:f6d:64f with SMTP id y10-20020ac255aa000000b004eb0f6d064fmr1682170lfg.42.1681731041123;
        Mon, 17 Apr 2023 04:30:41 -0700 (PDT)
Received: from localhost.localdomain (78-27-70-251.bb.dnainternet.fi. [78.27.70.251])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004e843d6244csm2022176lfq.99.2023.04.17.04.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 04:30:40 -0700 (PDT)
From: ari.parkkila.git@gmail.com
X-Google-Original-From: ari.parkkila@qt.io
To: openembedded-devel@lists.openembedded.org
Cc: Ari Parkkila <ari.parkkila@qt.io>
Subject: [oe][meta-python][PATCH] python3-appdirs: add native and nativesdk to BBCLASSEXTEND
Date: Mon, 17 Apr 2023 14:30:38 +0300
Message-Id: <20230417113038.22358-1-ari.parkkila@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 11:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102128

From: Ari Parkkila <ari.parkkila@qt.io>

Signed-off-by: Ari Parkkila <ari.parkkila@qt.io>
---
 meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index 977999bfe..95d1ac05a 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -19,3 +19,5 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
 	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


