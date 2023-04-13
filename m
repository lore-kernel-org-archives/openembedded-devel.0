Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1A5C77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 08:37:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7657.1681375046893590580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 01:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0V2ngG86;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id v6so13385866wrv.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681375045; x=1683967045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNB+X0SOJztGPI6SGPOTTSPuY8ZjG+0JAgjsAjC0vF4=;
        b=0V2ngG86wtJwUOpOKSl9YwxObLBfbVUYN4Y8wl2tPLb2b6STZa0+G0Z18jx2Jl9oCQ
         1KYLP8gZFlQN7jfnBizqm2K4H+Azpg3t4B5HM/12Pg9cjTqBKtJ18e6NVhk/qNQg2mRR
         /KgHPWiWfdUjIqxnoC4rCXh8Ku6Zk1g8QAxCTEqI2sFlAXYU6V5lQTjXaS9Ydyj3Wnmn
         Pg5/yUaUWG/51HVgyRtyNxFkuVUO9+AXDPNNt2QTw/yrjI1qHyZQZN6QKj3+tx/qok84
         V0po4MTNm064i4hVk84K9JNcek7TezOB1Qqbh1X8dAgSQTLfIDeb8t6DDxPJ1NX8hpY0
         bW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681375045; x=1683967045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNB+X0SOJztGPI6SGPOTTSPuY8ZjG+0JAgjsAjC0vF4=;
        b=QZP3zFvN1FxtgDe3Q08YCqCIavDRbcZhBYdZzQwBPpaIxqGpleGiaBQJaGTUl+LePN
         OUNGfpuuHytasnCaA1FfgBtuFdjviKOVrLKrYal8q0U1An+dTbAGATUPiQm9ouZgknRU
         h+xDpsfTb0WDyTx9HGUupIVjdlsGG5EOc36i3gLwcY4yrhv9h6cBjf5lz4cjwoNjjZu9
         kgd/wE+ZHJ7xFJho6Wrtj+2zeTX4lTCxFEY7skVscSa5IQEqc89outbajNr0wCVZMBth
         jyhiWV3YyKvy2j4AV+unmXeySMOVgNx4eDdsYplmRy4YZTbZKhXgxUKNVw1ygz2BvzdF
         UB7A==
X-Gm-Message-State: AAQBX9d8fzm7lGD5dwcjoeJN5b8QUH9+rHB5OuRQiSSlTyCpvB7J5Fs6
	JqAeCq/aLgXKw4aaoMcNXewyEw==
X-Google-Smtp-Source: AKy350aAixPJgH/L3zR2CNiE5NSAB7i8YQxAiT9p9wrX7ARybpHefvHcW3TclRpC6iMCBmhBMSrGEg==
X-Received: by 2002:a5d:6dc1:0:b0:2f3:1be:cb02 with SMTP id d1-20020a5d6dc1000000b002f301becb02mr1034552wrz.13.1681375045136;
        Thu, 13 Apr 2023 01:37:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d66ce000000b002f103ca90cdsm758579wrw.101.2023.04.13.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 01:37:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 1/2] python3-gpiod: add missing run-time dependencies
Date: Thu, 13 Apr 2023 10:37:12 +0200
Message-Id: <20230413083713.9643-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 08:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102076

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The gpiod package needs some standard python modules so add them to
RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
index 93b7b935c..e39d5beb1 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
@@ -18,7 +18,11 @@ S = "${WORKDIR}/libgpiod-${PV}/bindings/python"
 inherit setuptools3 ptest
 
 DEPENDS += "libgpiod"
-RDEPENDS:${PN} += "libgpiod (>= 2.0)"
+RDEPENDS:${PN} += " \
+    libgpiod (>= 2.0) \
+    python3-datetime \
+    python3-profile \
+"
 RDEPENDS:${PN}-ptest += "python3-setuptools"
 
 export GPIOD_WITH_TESTS = "${@bb.utils.contains("PTEST_ENABLED", "1", "1", "0", d)}"
-- 
2.37.2


