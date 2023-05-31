Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF64C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9050.1685521510292316342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=kiHAoZUj;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30aef0b8837so2318569f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521509; x=1688113509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtSxaDcqbeagR5uUnJeoM3a4ji6bJq9n34yWW1+L6UQ=;
        b=kiHAoZUjhqmPm7bsBwhAvOKRpbAtdVFwTbNsQcqGm8gemr12fVwOO+Z+eCSIku8gnm
         HC1xV4dp4gpqIX8jQzrot66a4xGx4mJllu/eD1EXWHh+39zPKIMIN3uUseDGfFpPRqZv
         dxWrunKSTzOWW9jY3g4wfWc+I5ON16FAa+K2poe1cv5Pz1ep/G5IrQrxjS8H9J1rQYFB
         k8LrMYYbzE56IGRW3DEQa9wnyHmp+kCIzsILd0dDsU/MPJAH2P91ykpHgRzdj49zSpoV
         6StHWRd9IoZ89EoOSUBhWss1GSJzrvuYTyuCKshzKC+hPaRZ7QTUXYlidxTzFde9E3XM
         bJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521509; x=1688113509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtSxaDcqbeagR5uUnJeoM3a4ji6bJq9n34yWW1+L6UQ=;
        b=MnpFvdkxC1mW2xJrnwxHcOg4nZSkkUaDt3h8OB8NogEuC19rWatDTtswe22a4CbZox
         /Nnu89vOphS6dr5/n2W63nNQaoxH0S0WIbfvqHxccRwuG15wRkKY562wjTxAS+OpQyxe
         QWPOJPG58MpdlGNhOxJ6xGQc0X7/edIpz9geM7AFwruHSuQ/GDGWr30jWDI8Y4luG95e
         P9emHVmNeN1AZ12m/G79rX2nPlyQqh9Usvo0PhZN6yGOujwjxdOPgjBtw2FOhBf61ztG
         39AKyrturrk/mboAPFDt5hpN6LIAWGMHfcKFAi1TufIIsbRkdURvFR+J7UTD56neaRh0
         drxQ==
X-Gm-Message-State: AC+VfDwxjomjk0s25FjILjLVLPCeovia6NISJIqSLt4rlKtmxOZ81lX9
	op4FRbp3Wb6zQHF9pC5NUhAlx3wlFRAMs0XimaU=
X-Google-Smtp-Source: ACHHUZ73yqXv17z8KvBGZ2330KRdIT+Li6eQaGNgNsnfCLP8oHprcCqcA3+tDH8ywMADMqLeNbgC5w==
X-Received: by 2002:a5d:448f:0:b0:30a:e9a9:a4e4 with SMTP id j15-20020a5d448f000000b0030ae9a9a4e4mr3185078wrq.51.1685521508782;
        Wed, 31 May 2023 01:25:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 001/149] python3-pyparted: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:09 +0200
Message-Id: <20230531082437.10646-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102928

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-pyparted/python3-pyparted_3.12.0.bb               | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
index 9dd362766..7a0d3987d 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
@@ -17,7 +17,10 @@ DEPENDS += "parted"
 
 RDEPENDS:${PN}:class-target += " \
     parted (>= 2.3) \
-    python3-stringold python3-codecs python3-math \
+    python3-codecs \
+    python3-math \
+    python3-numbers \
+    python3-stringold \
 "
 RDEPENDS:${PN}:class-native = ""
 
-- 
2.39.2


