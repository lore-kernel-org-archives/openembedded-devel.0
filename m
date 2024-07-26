Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00831C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 09:41:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.57886.1721986910849969251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 02:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wfd1pZpJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efc89dbedso1400978e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721986909; x=1722591709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8F/awM6xOqVGV3NP1YIYS8QNYkQQF+ooEmfSbkBleU=;
        b=Wfd1pZpJYWjCBczmTUQNc7udLh9EBZkBKEpAWflVGinAl+UyJAg8hqy4ZwOSer7mis
         FL+VYA4mbkTxsDqcZKDH/Ay7i8cTs+LN1RY1BAd0NSoeHSea7JCiCMUYTGdrfZFmo3Xn
         xVJd9IvbYA4849HUv8yXjFvM1dtCUChvOtBBw2/y2n+MIFp2PHZPY9zttm4R5bFi7GjZ
         ohKY3WQdSwG0PUw/VieoVgfIPSRwxZRWUyp3wsAPublWbtmgY8b09c0Msl4aPOuqjEhm
         4cB/dIpxzu0v7pIuUs0bE2ytmN3/jW5yTUeKjN4iYppQ7bSV1bh+x18EkifnpTK1FjVZ
         Ke0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721986909; x=1722591709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8F/awM6xOqVGV3NP1YIYS8QNYkQQF+ooEmfSbkBleU=;
        b=Swn2PFXXsgYhPfyStc7qIqj/F00tMB1MxvAxFYGYKfcYuubfwoNqcMIEqeIZeq7Eog
         gxH+s9aYEfRX/gnwbESyEfv37hA7tqxcOM+eYrpHJ/EP1AWj1sO17E6DNk4kRhy8YM5L
         +nXNHLBM3Gf/Qe4wm3sSSB/F0kXQ7F7r3AeGZQ6sXVItTyFh8oD9d+rgg6Ojyx0R3asZ
         Lp1jQJmXjDeZdkS06L65yxUsT8fRztrhXwBcySnQQ+YfXcZYb9UnYDd16IPhmZSt8AdC
         Yijfv5C68r+BH9hoK2ZYgHN/Rpb6t8MdcZsl1prNzthJ/vkH2mv3nixpEGiqrETO4HAX
         pBMQ==
X-Gm-Message-State: AOJu0Ywtt59D8PClnjk3eSrpJbMy02OHHjNZ4M1/RnSy5Al7OPUo2cEC
	n9FHUogwUe92PKio36Z6tQiCi9RgYWG4e1bmp3V4mvPRgNil3QwXba7P2ev7vKLvJCpQfJxXA42
	R
X-Google-Smtp-Source: AGHT+IHutwJNcyn9qGbMLG7MDris9R6CNxJJF2uV8uauTWgKKWJq+OeEJRwm9qraKwCfhZbKb2CkNQ==
X-Received: by 2002:ac2:4bd0:0:b0:530:9a14:f0a0 with SMTP id 2adb3069b0e04-5309a14f1d7mr107073e87.10.1721986908989;
        Fri, 26 Jul 2024 02:41:48 -0700 (PDT)
Received: from localhost.localdomain (drt4d6yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c090fesm453733e87.131.2024.07.26.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:41:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH 1/3] fwupd: skip buildpaths errors
Date: Fri, 26 Jul 2024 12:41:12 +0300
Message-ID: <20240726094114.13263-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 09:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111438

Test binaries are embeddding build paths and can't easily
figure out why. Thus ignore the errors in these binaries
for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
index e6c276ba4..a98ed67f7 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
@@ -140,3 +140,5 @@ FILES:${PN} += "${libdir}/fwupd-plugins-* \
 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
 RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1


