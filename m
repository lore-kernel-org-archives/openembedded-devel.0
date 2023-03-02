Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A3C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:44:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19432.1677771889876399226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=F1KPCYVi;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id l1so13915183wry.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1677771888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtbZf7R6OVEWv4ccWECwTlMPvEx8iiRZTt+YOC4ZOxE=;
        b=F1KPCYVi8iRmZ3M7LC/ktqE5Kf0Jm3WI0V1xpJcd22wtN73KB9KiYyOQ5o9j/x3tm3
         o3RuTFM9iuDZkToce/fMEWfkTvuO6i03h2MMONkVAH4OgWLtYGN6czRcZXANZCALjTHY
         Q/IomX+xn/ChxgHPjPYGJ7DCFYAEHoz5QKLnBKRwdZ5SY1sO9AiUKUvz0oJAHGVcz/bi
         6gEQkxL63UL7qGB3qHwVn9w/g596wx6yclg7dZEgWYCIdg5zrb5AWjBRc7EwL5QBTxhQ
         nO66Tbf2JR7PjQ7tX47VjKfPpu+/m8wg0LRCA6RGN0/uXpAI1usND4qGFP22TXVUsQyP
         5uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677771888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtbZf7R6OVEWv4ccWECwTlMPvEx8iiRZTt+YOC4ZOxE=;
        b=2IDECvC0Rt+fR8KFF9Cg3iLggO/csN77THBX7kdMK07/EvIW0N8J2PBUGDGtH4Unpx
         X1YQfGHvSEgiBHzzxT8CTtvK3PyBJgRNjVbEflPHPAkhWYiu7xOzdqKOK3kFa0wOehbL
         qSCZ0Bc3KEseVHam1v/wxlnX37ROPCQSSiBSKosBHcO28LwZc4XulIN+i4996Sek6l9x
         bQuO1QeWaalrjLyGYhjIUoNUGcTmVZzrCg+1ocrSPpxKlb8ymsJInv1cTiiF2ijFwBDv
         mOM9FF/Etq9XGmwW8r/jur970NNLSf0MYHIFY/67gxP6BYCAyGu6VZRPcoKClLHxea+d
         iFMA==
X-Gm-Message-State: AO0yUKXM6Zpcriwdfk63JOGFNMLHc5ZCKEtDOPfnCbdFaI43fYRciPFe
	Y3gY16LTTjhDFoNhQsE6HR+7KQ==
X-Google-Smtp-Source: AK7set9Xbhi489fXFgpVc9r4IlIy0J7Dg8gjYMcahZFpzouNgLgY7wSg25ek3mKLl8HapEEspI66Fg==
X-Received: by 2002:adf:f844:0:b0:2c5:67e3:808d with SMTP id d4-20020adff844000000b002c567e3808dmr1890253wrq.35.1677771888211;
        Thu, 02 Mar 2023 07:44:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:10a0:b7b3:4dd6:973c])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003dc4fd6e624sm3784719wmb.19.2023.03.02.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 07:44:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 0/2] libgpiod: update library and python recipes to v2.0
Date: Thu,  2 Mar 2023 16:44:41 +0100
Message-Id: <20230302154443.349083-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 15:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101335

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I've just released libgpiod v2.0 so update the relevant recipes.

Bartosz Golaszewski (2):
  libgpiod: update to v2.0
  python3-gpiod: update to v2.0

 .../libgpiod/{libgpiod-2.0-rc3 => libgpiod-2.0}/run-ptest       | 0
 .../libgpiod/{libgpiod_2.0-rc3.bb => libgpiod_2.0.bb}           | 2 +-
 .../python/{python3-gpiod_2.0-rc3.bb => python3-gpiod_2.0.bb}   | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-2.0-rc3 => libgpiod-2.0}/run-ptest (100%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0-rc3.bb => libgpiod_2.0.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.0-rc3.bb => python3-gpiod_2.0.bb} (95%)

-- 
2.37.2


