Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A293CC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9096.1685521509908603719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=JvXWZmh9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2458549f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521555; x=1688113555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rU5V34dB3q80UvzduuOgVVB7siA5na2IadeNmqXfUGY=;
        b=JvXWZmh9xivja71K8gb+1wu9/pdoxa9+C7ylUSeZFHReBQyJ6WF7g738ldkOtPj0Uu
         rzUMwnbqNTijWTb/0UX5QhrK2oHRugomaCdsBT4vPV3MC5ZKIYTp/YoSK3slAnaw76FW
         m89/BlOce3k8v6B7tGwQEK31J0oux4Xy7jZK5Mx7sYkAABbSFHCj9YjpaktcypHab5O5
         bGKQLq4CJvWAIqV3nLxLPgtzJgADPVpQnEJhvMFzjzYJBLNTtB0IJMslZ1Zh8N+cVKUv
         UReRL4zTwsrUc1/BjUpnYvP5SFdfutDOjLMGoT63hhuJc6CoB3F9/kaYLZUykNV+phFK
         El1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521555; x=1688113555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU5V34dB3q80UvzduuOgVVB7siA5na2IadeNmqXfUGY=;
        b=F9hcb5phfvEF/48eNr1Fthe4HpX5rRTnPwZTO5veuhvXPBGbahBn1Fpim/BRvqT0y8
         4jiYAdk7akac80q3UWB1rs/SEUHIh8ybc07S0qNNyuyHK0ZZRzky9A+nNdRlLv/sV4qd
         GqSog15zf6bNF5jyYn28TKI192yQdIok1OMXGRggZ0LX0J9oZX5YdjGoemj5YOnX24Xt
         eGPDnDjDkDgdVlWACcYdARUVYKOZLnWGlzndTPDHHc2vWg67UwHpurkoN1TaJ1/laB8C
         55Ngp1+XYFBb/atGodvQXctBMlgjdJ3byZn0mp0cegFN3ee+CVccpMKZlwLJGPkJNoje
         1S3Q==
X-Gm-Message-State: AC+VfDxsRgED8yXQl4EdG/WTlQ9HZ0Pq4KG8qdcfylg+uVtJnQVQQxld
	hf3omloZ5l6RBNH+mah2rgiuTQ==
X-Google-Smtp-Source: ACHHUZ5LlHBEMsfDD3InBei/wOgDAbP+oiZm5Xea27qHIdUSomYNVCQncyG8OqCEzJztFwyCNROK2A==
X-Received: by 2002:a5d:4d51:0:b0:306:2c39:5d52 with SMTP id a17-20020a5d4d51000000b003062c395d52mr2858278wru.57.1685521555538;
        Wed, 31 May 2023 01:25:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 045/149] python3-uefi-firmware: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:53 +0200
Message-Id: <20230531082437.10646-46-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102972

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-uefi-firmware_1.10.bb    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
index 49955c97e..7db7c8059 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
@@ -15,3 +15,8 @@ SRCREV = "dfb15b068960b771e2e1536d34790dac9b5bfe32"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-logging \
+"
-- 
2.39.2


