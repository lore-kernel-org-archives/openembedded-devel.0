Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBA0EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 10:53:16 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7887.1687344788005875061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 03:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NwNbDpbm;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98bcc533490so85443666b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687344786; x=1689936786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0waJ6Rggxk6+LatGQT7HcEYv0b+bYZhAHZjmLbFZXo=;
        b=NwNbDpbmzynL6gQPHsYl7wIuQ9+zkZ8O3kCyLlCcTR4hpehgrOlAEINg3F8i2+bsSd
         9QtldaqfgnFauHo1ltJsMBXd3CpA33gX2vH/wo3EboDIfi+EAAeygqVA7kwqLZLEnm6A
         LAC+WTQKZBchK0f8HgHJ2Rgg1+aZqSfD6ns6gi6aALmnvPDg6QqHndbT0h0oVhIYfXX6
         3gaTNEDBWxVnCp/mzvJqFLaw9VJ5T8rrk0UTIlCkokbC3244IHCM2INJ77lcO4eMJa8I
         lAAJCRmMHf8h658RAKANFdFGCCgNzg8HcGeAnYCjzolQf5IXrKiHzrsDy9ruAj3gnT7U
         MW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344786; x=1689936786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0waJ6Rggxk6+LatGQT7HcEYv0b+bYZhAHZjmLbFZXo=;
        b=ha4w7xaHIxRiYGnNA9uW3opcJHXN2Z3ljh5PTUfx4u65S94uluHGvHj9QKbyAEFaiC
         gDrCqwPLz3YMvz4B7L0SaVNab3E17xIdOiFbmMfqPJsR2clOmYu0T/AGq1IFSHDCD00U
         HqC/T7j3l8hRV58EDviHRk7K1H4ekMWxneWbth9nlBonA4y0JzKDoHoEIvg2t9kXmMwT
         UmFo1F+zGLjB6a+qispcF3jD2xCSXCGSZd0/0Z7j6Dpr1fpkT2dNsXyOE5gg8OuUYLtU
         659hGFcinjYv2NLeWPgNLzxzfJ0PAREJVZl8QPgOsa5u2U6+wBtDvLrL7GClD3ruC+tb
         zdLQ==
X-Gm-Message-State: AC+VfDxqTfMXphvvOZTQSu5FORIkNI5N+WmIZ/sSqL1DAesMf/f8+DHY
	SNDL5sXDBuINFlRj6NCH2SrQb1rqLM4=
X-Google-Smtp-Source: ACHHUZ7oHfVGov9CXHNilsinAsRMQLXgzbk4q05NS365c7KeiEo4icOZNpBs9Maz8P5OT3Byuab6gQ==
X-Received: by 2002:a17:907:a03:b0:982:2278:bcef with SMTP id bb3-20020a1709070a0300b009822278bcefmr14912809ejc.60.1687344786252;
        Wed, 21 Jun 2023 03:53:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709064b0b00b00988c1ef1c68sm2867673eju.206.2023.06.21.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:53:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] libgpiod: fix malformed Upstream-Status
Date: Wed, 21 Jun 2023 12:52:52 +0200
Message-ID: <20230621105255.2608791-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621105255.2608791-1-Martin.Jansa@gmail.com>
References: <20230621105255.2608791-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 10:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103472

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
index 4d49467968..0b2a5e6a8c 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
@@ -12,7 +12,7 @@ We wait for a transition up to 1.5 seconds.
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-Upstream-status: accepted
+Upstream-Status: Accepted
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
-- 
2.41.0


