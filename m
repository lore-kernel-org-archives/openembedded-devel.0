Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39456C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9082.1685521593137156636
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ca9z9NbN;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30af0aa4812so2308277f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521591; x=1688113591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEIWFevNmjZtaop/jAvXwOiuQKm5qbGw9EDLw9mZLGc=;
        b=ca9z9NbNpfJRqPf/XibsUvUX0RuagRKkmOGMY5h0AOUwf69sA6un8csFd6bMXgfuwx
         5a8HMvRtpT5y0gdWxi7AAcFWw2fTknmJ8Zq3uLJyKV4yifCCrO3f7w6+8zVsRGQ2yz54
         zYbG90Oifg6Jz6M/4bvxahX/4dOTJE6c2X7Fq86NnJoGyKqcRlkmlRYfCud8cLYgC5Ml
         bSDABmkNIodf/On+OJ4XZIvXeHYxll2rJhU5m7Lcwum1HVz/Fh9q5LxxQk9iJGlJmcj6
         gutn39IAQU9Rp4/Yxz4tZW5KME3uhEbRCshBqR+SP/ugUVrn8U/50bCUpe6RWivs6JQi
         XeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521591; x=1688113591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEIWFevNmjZtaop/jAvXwOiuQKm5qbGw9EDLw9mZLGc=;
        b=iwcukwd878k5jUE5wTNAsWrvVhWwA0SohV8o2EnulVQAaLFvYgJcUtgceQd29MjR17
         DesilKdkZLQjXBPY66SJBqJf3wSZifqQ3C+BTNx38sHsMLyrNlZruLOcijz0AG7Rw9eW
         8OEOq4S16es1qG6NoF9NjjSmNUiGqCswO6zkTdbHcAJJjramXSGvmTCdB52UGb4DiWP8
         SoYC8dgf8P65zLblfP2pER97ZZK+k8Q9WdpISsmpvcY7IBe1ikMXrSEDzsElv+7BgvZ5
         QDtXTB3KK1PpLdqbZzgaLVS3AIz4WNVowQikroJBg6aEy65cdL2sdQX3R9WvVtOy/N0T
         t1WQ==
X-Gm-Message-State: AC+VfDyggLJnGFVut5af7xuBKS4XPgGzNKMYfCHwShYXCERUWiCdIfT+
	e6k6Q57VHK448g96n43M++8tp72uNi3sDiYBSpY=
X-Google-Smtp-Source: ACHHUZ6NPsr/9Jx9phSGPlICYoeE/U8DN6IulqfIrvgvlJi+nTE37wRba4QiUyU9WMMTfSlLUsV0aQ==
X-Received: by 2002:adf:d0d1:0:b0:309:509f:a7f0 with SMTP id z17-20020adfd0d1000000b00309509fa7f0mr3372857wrh.44.1685521591749;
        Wed, 31 May 2023 01:26:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 076/149] python3-pyjks: fix run-time dependencies
Date: Wed, 31 May 2023 10:23:24 +0200
Message-Id: <20230531082437.10646-77-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103003

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This package actually depends on python3-pycryptodomex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index e1b30e3e1..c0cca98ff 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = " \
     python3-javaobj-py3 \
     python3-pyasn1 \
     python3-pyasn1-modules \
-    python3-pycryptodome \
+    python3-pycryptodomex \
     python3-twofish \
 "
 
-- 
2.39.2


