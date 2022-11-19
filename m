Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B5EC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.23536.1668873486121725625
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IjfUdc4M;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id cg5so4931525qtb.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wURVexJ2xYI1INp+vq56hWsqsIvTwpOJMrBrSprnuc=;
        b=IjfUdc4Mr6h5DuFAAFtUJC9ZdGQqBOeL1tuvHcBJzdbR99UIJ2sdTd7Q6t35EGrCAe
         oqQpKqlU+JBW3Ll2p5eSrvgcRY/KzA16aHO2Lvz6Mq6/1Ag/XVbPoZ+kuEf7znhrM6ax
         5LqKbkGvb1UEm9xmdrkh9KbzwUawxCxyIiBwajuugU9gM9Uax80GxDzA+0Hc5e1Yph1a
         zwrKzgjcV56Ua9BdxnlmSiF1uzWpZ7I1QpYH7JaAfyhImrtzgW8FMPC6lJRJRxTxgC+3
         jwvDyl96PBf/5WHiQkTGYhZwy9k8cP5kjLgsJeEHYEDS9LrIf4dOz+lAzMwdKm7zpwp5
         JuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wURVexJ2xYI1INp+vq56hWsqsIvTwpOJMrBrSprnuc=;
        b=2BSj3OzZV9jNd/+O4fl7Xb/N0X9XTRahItsacbLniQczdU9gFAFVWu5Dl2IkoF6wk2
         oLZIlGOrqQ/9RXtiKQkS/sHfMchDFGGMGY5ISL9CiYLwE2U7t6gque2jGE62KQXuawUh
         CoyaGNYwCFoSwkVmrEzJpDuctMfleqUFdQ+QIz6FbUAiYNb0tLlA6RkdY7BgiS2iezkh
         83q2/obzIQcNR4GEFZPjrXg2nL9li/asAIXo6BYhXPLiHwiUdpUw5ErMHa4TMOIt6r9v
         Cs/A7D4JiRO7LhXgy7l2daRdcv4QwaEsvlgt/l1MeKvyJ+nFVkLYVGsXu3rX9nlS7uqO
         9BEg==
X-Gm-Message-State: ANoB5pnCmhbNNcotMW2MlEmFo5SQDKaB5WaWqgoFS/v1f+6xZ4AMEQId
	BbUC2keagNbPPHKmXb4ntHwB9H7FP3E4NA==
X-Google-Smtp-Source: AA0mqf7zd4SOkR6QQGMn1BETh4vvMKf5TyA5UxE5IO0sPLjkaJ80qmhVqx5Wi0dwoo6O8szrJ2pyyg==
X-Received: by 2002:ac8:74c8:0:b0:3a5:4d26:9596 with SMTP id j8-20020ac874c8000000b003a54d269596mr10978756qtr.614.1668873484875;
        Sat, 19 Nov 2022 07:58:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 01/35] lldpd: Upgrade 1.0.14 -> 1.0.15
Date: Sat, 19 Nov 2022 10:57:25 -0500
Message-Id: <e9c99dbd495eda906e8c073280e79e6325dfdfe0.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99640

From: Alex Kiernan <alex.kiernan@gmail.com>

Add github-releases to make new releases discoverable.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c782674d3f4575817c2c7222adc188ea5aca44f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lldpd/{lldpd_1.0.14.bb => lldpd_1.0.15.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.14.bb => lldpd_1.0.15.bb} (95%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
similarity index 95%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
index eda0129feb..6a3687cf72 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
@@ -11,9 +11,9 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[sha256sum] = "a74819214f116a5dbc407a3d490caa01ba401a249517ac826a374059c12d12e8"
+SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
 
-inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
+inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -g lldpd --shell /bin/false lldpd"
-- 
2.25.1


