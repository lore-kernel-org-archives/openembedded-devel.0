Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B69FF512E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 18:58:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89170.1775588287571124037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 11:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TtyTq5Bs;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4888375f735so49996925e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775588286; x=1776193086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rwlLnmF+VRZHUR9xve0TNQ+yog2inwx8UHAfmaF73M=;
        b=TtyTq5Bsj5aM70b1oubR4RUh0L6HfiJyUkUqx9t4kK+a8DPmD0vc4nU+vxLhiTx0gB
         L2ejEtaKVocWlKCZ1gH1HUoJWR4v4vddt1nV9eX9bKCKKjBmh/944z7HCdGLKg1f8xjz
         1m1wp1jvz6ZncGYP1+7ewQVd1yWzGUhsiUtpX/zNgnwfEbqaj0K1DBK/mUS6LkPqgeub
         LV0t1KqbfmFdoCwlO2n916sH8/sgYhGL/vPtdcuaSstE3rpNvldVIf8O77sEicJ6w/IO
         txDYKUMsvQPr81BxNUviZ3CetD6VhFwgMS+Z0X854TYsKGMFoVCdDntd3y0lkzcs5eXI
         ggwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588286; x=1776193086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rwlLnmF+VRZHUR9xve0TNQ+yog2inwx8UHAfmaF73M=;
        b=FwFklKh+Y3Zdh4abJSKxBKRluSuJlHp83GU59Ji5DECH6ugjdEWdQ3GOJBrVj2TkiT
         a1z0Uk6oAEDE3BsoVD61FlBLlEX7ddsdAvLBDcjIHRFXI/dJHD02/0JCORfcoCyP1Qmh
         JKYbxV2SodcaglkV1Lnl42YhTrkTgFX4jNw816RyEUUwELmz1ADYFNl127Dkb5GNLXdI
         g1Y4b+obFiif8mfLD0NdZCKnmB3ynu8i5HmFIvNiqVPGYiVvoeJleN5Cl3X05waPrOEP
         Pv2vzPP6SELaXT+rak+JpRTFv8tyUM+4+jX9d8M6Jh5LlHkWsp6q/ns8uhKhVNUcB/Vl
         gf0w==
X-Gm-Message-State: AOJu0YxXlqQ9SIrnMLstU9Ourh8akJwktqZxBKHHYswNX2sootxTyI1P
	3bBEMV55rzOqVDB+HpPlEOmNsZsO0Ix1RURxy750LWKyLM6lRiqibn4sAzzzUw==
X-Gm-Gg: AeBDiesENqo7TGc8F1PXAkDhHZg+aEbMCuaXLiLd29gQW4M4FVZ5BUOdWob9RYr7r65
	kHRJ3IPbNIS2daJQLsWDi7slylVr/Z9z72ZL0eJoMGmR88eoT1rdzRk9FfJFUkoZOoXRG5VQd8C
	29ra9Yqq953vojRGF15hHzq8KiifBwwRMkypFn2fOEWKG/Vb03CGpzz0JoyB0A8RnAP5U7gIGrK
	oNuhWO8M+sAT65lcL93YRzsM1mEYI9ITr/gNjLhMHcdvUJGql+JqBPM8xoENAdeenNCzUB43NcI
	u/sw7qEbLKJJEAqOlL4SUr7xddRSjteGaR/5srP44XdGMA5SP+c50NvY4B9VdojMEGI5/Zg+p3q
	/eup+S8DXInwVsP5zg1DAwNM975Irs20BXfPQgKJi08lfZ2omHLmN4NOQZ9rjxfnRW4AuNCXFDt
	W2MtB5NXNpVNAtO0LGvdro
X-Received: by 2002:a05:600c:a318:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488997dd54fmr173552415e9.24.1775588285584;
        Tue, 07 Apr 2026 11:58:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488940e075esm462975235e9.9.2026.04.07.11.58.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 11:58:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
Date: Tue,  7 Apr 2026 20:58:04 +0200
Message-ID: <20260407185804.4107903-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 18:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126089

Contains fixes for CVE-2026-33535 and CVE-2026-33536

Shortlog:
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-17...7.1.2-18

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-17.bb => imagemagick_7.1.2-18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb => imagemagick_7.1.2-18.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
index 989e87af3d..5ff22332b5 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "3f2f629405c62106d3569547c03634bc46fcd07d"
+SRCREV = "d4e4b2b35a573fb7d96bc64ff1a417415bbe0f4c"
 
 
 inherit autotools pkgconfig update-alternatives ptest

