Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCFFC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 07:59:16 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.33289.1669017552527193891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Nov 2022 23:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEkGX3lU;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id l11so15054302edb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Nov 2022 23:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P1gDoib+Yy/mV0TZAWnCKEb0f7ihdLHclKCKYPBgp4=;
        b=bEkGX3lURilEo+17EubucAZx6rYqp9zjODaPw/iwQSPgEnBSmcitx7hkA57hETY1QF
         0YztCV5g6H61Nn5RB5y6eIs4FeGaIukBLAm+ruNDjY5GeYvIJtiE4rbyp/ZUueGN5m44
         DTwSR4Chw4OjecN+AW2s/XQZ12nga8gy36ewRj6TpZ6YmTGuCrMMs43duv8fPameaKwQ
         rdsk8w6uMe/smbuQ+cEKqneshGGcnD3WauKJ4qMjlxQGQwHGJIRvd/Sc5wUSdqOxPiA6
         wg5Q2LLrc2T4Jyqoz+CThPvNXyTVWgvULu+bt2V1L5MHcrfV7JJqPKD7paAQN2sYsKPm
         Yc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P1gDoib+Yy/mV0TZAWnCKEb0f7ihdLHclKCKYPBgp4=;
        b=Yz+IriMWZ4ttjvoNryNAqi6KFyOGOI0xCDthmoIp0ot2ZKmodvvLhsLoPZqdQGExQd
         aCLbAXQtfKXdidtNQDNFsoN65nPUemPUaKFwxSlSqsWhBoW6Okn9RM4bNI4itSpL7byp
         x/oVm3he0nzUPzV/vqsOZbTYUIK+olI4pVsz1FwFSYgmebeZmjTofFZtz/hWfchMCilX
         kgHeu8nvxXiEuRBph4aQTxPSYj2JfUYE1aTKOvCeJ9K0wJR/yIZfmcayiZN3nFlcVirQ
         4nhepeN6j23gOgkJ2d5sl6WjhUyVJdTmTpkqnhKMbS16dyhL1zmoEOqUzHTjLfWhEwuD
         uocA==
X-Gm-Message-State: ANoB5pnRut8Y39S93uS6/Qr7OYW6N9HxNLqkVpwQJ1hHcAzzMfcgtX7z
	TkSn0u0XGlMjy1jCfS+Uxoy1j6XnXQk=
X-Google-Smtp-Source: AA0mqf4h1p5Yt353v/bm1W942PC26mVVhRDaj6bLJIav81B68hIqfiyDh6GC5p3i9vJe18Qw8BRREA==
X-Received: by 2002:aa7:d0d4:0:b0:461:b1b9:bed0 with SMTP id u20-20020aa7d0d4000000b00461b1b9bed0mr6745369edo.122.1669017550279;
        Sun, 20 Nov 2022 23:59:10 -0800 (PST)
Received: from localhost.localdomain (ip5f5aea4e.dynamic.kabel-deutschland.de. [95.90.234.78])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090676c200b007b43ef7c0basm2702954ejn.134.2022.11.20.23.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 23:59:09 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [kirkstone][meta-raspberrypi][PATCH] rpi-config: Set vc4-kms-v3d-pi4 in VC4DTBO for pi4
Date: Mon, 21 Nov 2022 07:58:58 +0000
Message-Id: <20221121075858.372-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 07:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99675

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 recipes-bsp/bootfiles/rpi-config_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/bootfiles/rpi-config_git.bb b/recipes-bsp/bootfiles/rpi-config_git.bb
index d9d8bb0..bcff0fe 100644
--- a/recipes-bsp/bootfiles/rpi-config_git.bb
+++ b/recipes-bsp/bootfiles/rpi-config_git.bb
@@ -25,6 +25,7 @@ PITFT35r="${@bb.utils.contains("MACHINE_FEATURES", "pitft35r", "1", "0", d)}"
 
 VC4GRAPHICS="${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "1", "0", d)}"
 VC4DTBO ?= "vc4-kms-v3d"
+VC4DTBO:raspberrypi4 = "vc4-kms-v3d-pi4"
 GPIO_IR ?= "18"
 GPIO_IR_TX ?= "17"
 
-- 
2.17.1


