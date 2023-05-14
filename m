Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B03C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 23:32:48 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.77370.1684107165238933547
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 16:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OOEhQeIh;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6aaf9180636so449263a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684107164; x=1686699164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFoyprtl3gyqIcOU5eluetX/hd297nfNPBeoEJx+lMY=;
        b=OOEhQeIhGrUcRX+6wFZMBlkinIr58Fo6V0AqumvWcpAEacnBfVoSjRk7Kwf4IBggeK
         H5p6J52uX1KO3prg30W+P9zqKQ45mIvlax9QvCDO95LBAiPuZwQUvQ7wk1FYUD0d1Urz
         g5B4Rm2x/PYYZd4zXTP7bkfTCgcsbSZVlLD1YTs1YfvHSBkfTA0OMIv6cEWSeaf+DrHE
         +UAq/4mJ/Wf6dUleCUQ0GCsT0ORpBuPQN0WzPHSG0Hx6WpzvvQu7Elc7ZL8BtXxi8mjE
         jZPnfegv1TifvYi+jWLRtRTji/9Dj8u2lRd995kUid1ZOucWW8nfu33SuiozlmrX1zwQ
         UNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684107164; x=1686699164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFoyprtl3gyqIcOU5eluetX/hd297nfNPBeoEJx+lMY=;
        b=UjOW1COQEV/fdi5qHie6akgRkyYt3gDMTsqlEWQGMf0G7osC3lcKqache8+DRTTqoa
         ag6iUNdejs59K5YB/Hq/yZyKjac6A28e3N/ymTBxm8JH3qBPJG82p334IdXCrHUoSECE
         GjB00p1eW0qjgcR+2y2MP+4z1C1cCHxnMdyelM+hHSxW8LsVTpHfDL420Y3v/lYaeT3J
         EevULmaUk0BrsKAh2Rna5jkie+XOOKJbqdstIuMomotHDzslm0gS3g9zTbvJYvi/o8Uf
         HoJJU2lgXuRDbTo2PvwnL8RdIpcK1kRbe2OuoS5Qa3VIlZXHFWOknvxjOiNs2MvbRSXM
         sOtg==
X-Gm-Message-State: AC+VfDyNr5kcBSah5vrEpnUYIQvC5N900nuymu8YWhDmkMrV7l4rBBsl
	CzK5Pbmo8yh/D9dRLOSMcnh00ecH6JGdcg==
X-Google-Smtp-Source: ACHHUZ5iszxZYnNxH+Du0WHIZgkNeb6RxQtB/Gf1HjXaECJpZ+e7q1O/2OhBrbUfqpmvNXCnzQOVzg==
X-Received: by 2002:a05:6870:519:b0:18e:2bb2:3f95 with SMTP id j25-20020a056870051900b0018e2bb23f95mr3626487oao.4.1684107164121;
        Sun, 14 May 2023 16:32:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:5edb:8aba:d5e2:1f1d])
        by smtp.gmail.com with ESMTPSA id s9-20020acac209000000b00395f5cd1a0dsm1334193oif.9.2023.05.14.16.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 16:32:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] lvgl: lvgl-demo-fb: Inherit features_check
Date: Sun, 14 May 2023 20:32:33 -0300
Message-Id: <20230514233233.169181-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 23:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102591

From: Fabio Estevam <festevam@denx.de>

Inherit features_check to fix the following QA error:

ERROR: QA Issue: lvgl-demo-fb: recipe doesn't inherit features_check [unhandled-features-check]

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 8e0b91cac119..1dfb199ff300 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "fbdev"
 
+inherit features_check
+
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
 do_install() {
-- 
2.34.1


