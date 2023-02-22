Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55245C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:51:38 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.14159.1677084692441487413
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0qzuubB;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id bl7so8590616oib.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Smgz5Vc0Y1FO38/ZTGR3Rbr4Yw5obFhVHnO7Lo8CY74=;
        b=Q0qzuubByLgB7y6W1Nb4remzMKnn+L0+SdpEPZfnOM0HrD+90Jnz8J+digcCH5uzPK
         l2kbYEZfjNTXXtxht2VSREuLOwSWfiSAdIFxRhv01ejmXqBqL++JkLIYGZ3zKXt2E85D
         bT3q8+bTPUB5rm0otH50eXU0QeUaLGcv6uH6m8mKOu4FEw2e3shaq07pHspvlNmezR5/
         uP7LkCrplEE5rQ2Q2JdoZ5uoz7bRCNSrpUi92l8j+9w4wlax74ExXMfKfagWAJ+g/zCn
         +016TuTplbKsui2nVsP8i5VFm8p9tZFfG3GJTddO16mAShfxDLbqjbILtz2YyxSkYb6r
         5+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smgz5Vc0Y1FO38/ZTGR3Rbr4Yw5obFhVHnO7Lo8CY74=;
        b=r5Iz5MP7dJT5ZcTllTQ2ZunLA9Vrl3ROB6bRJvkCQLtV7Qs7SfYnVOsMarzdPt42DJ
         snac7xaPXIoryj9py0ad/nLG8LdcHpK8X4RA4VnDAFAYdCriO1XYNRAcWhQ2XMlptkT7
         Usw//ChT49pNKoXjXc43XU79TWhwOPdVuu1jSdmWc1/xoNariqXlk4NhWthllvGokfB4
         UVImx8QWZyMdxcObrByehNcJCFRHgnNWMmwpfDB53VSf3dk7+uQenrAn7w6Wguty7ZUU
         WpHcajqLGgH8bDrcAoz0uRMZurPwlBynBCS+7I8/63K8V2/fWCeXDBB3GY78gGrAnajM
         7b2A==
X-Gm-Message-State: AO0yUKXZfPcQ0nkCmoRMgfaqSgKDXTNAGqttnRB+fkO34rKvMIWJ7sXs
	bcNikreNkY/qHU+AIdHz2Kty5UgeWYk=
X-Google-Smtp-Source: AK7set+W3YyL/JOBDvi3WN8vaF2Bxdm/OBzXLN65tv3WHllbwksi89Zb2KxBnfAZEgbKMXdFgzt/vw==
X-Received: by 2002:a05:6808:3db:b0:36e:b552:d97 with SMTP id o27-20020a05680803db00b0036eb5520d97mr62689oie.41.1677084690934;
        Wed, 22 Feb 2023 08:51:30 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id w187-20020acadfc4000000b00383b371f2a7sm2052492oig.42.2023.02.22.08.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:51:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] libvpx: Explicitly link with pthread support
Date: Wed, 22 Feb 2023 10:51:22 -0600
Message-Id: <20230222165122.1489645-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101217

Some platforms (e.g. x86) require that the build (host) tools be
explicitly linked with -pthread to link against the pthread libraries so
do that here.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
index 066d7cc81..9c04c2a34 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
@@ -19,6 +19,7 @@ S = "${WORKDIR}/git"
 ARM_INSTRUCTION_SET = "arm"
 
 CFLAGS += "-fPIC"
+BUILD_LDFLAGS += "-pthread"
 
 export CC
 export LD = "${CC}"
-- 
2.33.0


