Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCD5C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:40:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.22431.1636983623969453534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mC6Uu9iK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u1so30789713wru.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lGvHrrqpS9TJ8BKmTpInxOE5gkO6XB/jpJs3hZChPFQ=;
        b=mC6Uu9iKQm3+FkBXnzlA1hgMRdwWVwbD54vnOwE1iE5cH9H6SXeriDXCbFZLYwvTUO
         Qb7zb1eC265cwGg14hkxY+sUw5Pi6NHFlVrl+xjkT4jx540pD8Pk8MqTCvkbW1rTklAw
         sLsSTLjvfksIG2LlJyDORCDEOohBWVNgJEXuMXaDHbGDg+p4zmUdws8zxYf5hmTeFTdB
         W0+3oe564n74A5tUtG0qFbu//j3Fv+l8iUFvkyuUWd4a/2jImyThw/hyttNKFWgsuhSu
         l5xqTn+ZRADekjcrXwb/zfaqD9KrxscTAwCKlXahceeh7mcAZMiMDRrjYgKFjoJSX+E3
         T5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lGvHrrqpS9TJ8BKmTpInxOE5gkO6XB/jpJs3hZChPFQ=;
        b=TfSUaVojPndjeDts8A6cxfEpms2x0n70CkDcTrueOqrGYNZotH3iEStAuNHPAM2WXp
         nd4Xc482LWDc1/0dNRM/n7H5PStrdXyL3S+RSAKHNWrvWM069zoVQ/ePAgoWCvhNBa0A
         +4mW64SvZ9C2dxq0fPwQ23MkH7MPY9FEVJRU26vGwRDJcsHeGPrkl1lxSq7CMupa6rGU
         Ti/qHFfryd3QvM7GHrT6xT2LpTlUm8h0fiJF1dcAYcUlkBdwNkLIdXihn+EYonAU47RJ
         NTV4EHJzCkZ4kyvIPHA0zv67cUrX4zqwnvHfrpbJ1e/bjZG6yqqGEOiz8VijK/Yv1eqE
         cWoA==
X-Gm-Message-State: AOAM530PrXlLv5oZOlDtI88iIjHtBrhhlpGu6tNkZ2mNBrrfP73urE+A
	U89i/lOtWXS6Y5bSN4KHw7i2zua8Auw=
X-Google-Smtp-Source: 
 ABdhPJwM41CqePY4bE2w2byJt3AOfFZsC1+g8f1Ndcd/rS8JuWT7CU+8/8+sVPmNTi96Gi/ArWIY1g==
X-Received: by 2002:adf:eece:: with SMTP id
 a14mr47973330wrp.333.1636983622352;
        Mon, 15 Nov 2021 05:40:22 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 a141sm9663516wme.37.2021.11.15.05.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:40:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] Revert "libgusb: Use the correct args to disable
 vala support"
Date: Mon, 15 Nov 2021 14:40:20 +0100
Message-Id: <20211115134020.20527-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 13:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93952

This reverts commit cb1968b5410fa415f5c6c70264ce83c4112b6d4d.

There is already vapi PACKAGECONFIG added in:
https://git.openembedded.org/meta-openembedded/commit/?id=8e816f6fd17ae4142e67b2224ef88dae97435a1c
which resolves this.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
index bde57e9ccb..51e7349043 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
@@ -12,5 +12,3 @@ PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
 SRCREV = "db9edbd8b45662d551194a0985173732f8f557a5"
 S = "${WORKDIR}/git"
-
-PACKAGECONFIG[vala]  = "-Dvapi=true,-Dvapi=false"
-- 
2.32.0


