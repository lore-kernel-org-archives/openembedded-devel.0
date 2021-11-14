Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8CAC433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 09:25:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.7521.1636881958049129521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 01:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k5d5WDbb;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id b12so24186944wrh.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxEtrliTHhZmxRfSYG4krE4X75zvx85kz2uutf5V8Dg=;
        b=k5d5WDbbNPVy8aRqbibp8Xep7vaAh13UaOyn5/9HM1wowKi0vdw46TVRIzwU3iJ4Vy
         Fh9wZ200zJ8OpNhrJLKZL2YSFkSNBIaPRIlUvD6D9zpnvwXUgdoopDH6mdIhpTiQ5ypj
         pwnIlE/+3FpVr0RdEnKSKJd9hm0m4YXDoClcYTll6vjzzslWZwwcB8H1Ml+TR9CSuz9A
         Lu/+U1eGlAO8uHtsQn03lppGF13g4nsh/MgPatjws2AQhmGFacmt0JheEZSodxDzWjoi
         1pw1I2pDnCIgdQX5UR7mU/FbPoqTRdrgFlTjZMw9gc5ldZb40iHa/EVLWgy3+f4L0S6R
         uTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxEtrliTHhZmxRfSYG4krE4X75zvx85kz2uutf5V8Dg=;
        b=knkQ/hmmPArDdTcXi5+Nvucciic+NtgxhBGz+8U1TEEY29sVVE2OhvU8wrerOBOiXw
         xD+W7kvJq3LzmgTyUCjyclV1c3XQdIZtU5pH2sZWIY1kOQU4n85e3jBNoTfAUzUlbXYR
         mItdxMMWpIfAHaVO544TAG5ZTId1vVJ62/Kc42bhWAc1ph+/b0cvDorJtxXDlxKbxmqT
         RmEq1EOz5NGhaHBc4C1HO06fWM9NBq1IrOlLGY4MbTtSZBWWHWuVot8ieVdF/iDwHx7z
         T7E5pFAACwBHxtaiSzu0aQ5t/kZabdTc4PUjoTtN26nsFfIMh1y34ImSGmBlKLIvXNOY
         z+Ow==
X-Gm-Message-State: AOAM530w5rhkkVQH4NDa3epCzCMRZTiY+0dr+RA7lKv5vPQF10AdaTlP
	MTJ7xpiVLp9OmnwiGQTmbXQv11Lton4=
X-Google-Smtp-Source: 
 ABdhPJzItMUy7aCBssGd/7g5+GYj4oy6WiMD2kkc6GtmFXMBzG3bJypI9TcT01M131VJLybTM01ihw==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr35475862wrt.41.1636881956479;
        Sun, 14 Nov 2021 01:25:56 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 t8sm12907409wmq.32.2021.11.14.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 01:25:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: lumag <dbaryshkov@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] lmsensors: do not depend on lmsensors-isatools on
 non-x86
Date: Sun, 14 Nov 2021 10:25:45 +0100
Message-Id: <20211114092545.7677-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Nov 2021 09:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93942

From: lumag <dbaryshkov@gmail.com>

lmsensors will build isadump and isaset only on x86 architecture.
Depending on this package breaks lmsensors on all non-x86 machines. Fix
this by enabling ${PN}-isatools dependency only on x86.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

cherry-picked from gatesgarth 428d4e6885

 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 890db55bcc..9c561e9f47 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -95,7 +95,7 @@ RDEPENDS_${PN} += " \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
     ${PN}-pwmconfig \
-    ${PN}-isatools \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'x86', '${PN}-isatools', '', d)} \
 "
 
 # libsensors packages
-- 
2.32.0


