Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16CDC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9119.1685521551547921937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=T+rktN07;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso5426788f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521550; x=1688113550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO6i0HCLOktShiCixKhkAugEm5g/RJ5x7kNdkDurE0Q=;
        b=T+rktN07IkCwuJzmGZL2KBaA9hBn/K0Zw4s/1X7GdCaFfRtjTGYs5zD/2wq9QtVkcl
         i1DG8+kQ4CF9XXHyp0srFu6WgPI8hPLz4KEKxs+vENIpnXQ+RVfIPAodJ3Hg5rUCmdaQ
         JHK+D7rIwwXsigeNz+vsPZjL0Hu+jkDCIzswV/ffVeRzj75a/wGrK7+10CkPZpHj2qNy
         UK74XZtoOpSONBvMw2CiMRX7KF5FrKZxGi7j5gBB+t1fe0v2tb+D8nm6NQSX0PTGj4Er
         w9LUvngEizgsdUMPo2GIaNWBVrP852FE3AP777JFJQOM48vYGe1VErSRzCbQKkxT0tGG
         GFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521550; x=1688113550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tO6i0HCLOktShiCixKhkAugEm5g/RJ5x7kNdkDurE0Q=;
        b=Y5u47cD2MIpGKv7N+w5Tay8MAnQ58e93NddQbg8Jad68W8OVcCmbv7NbxRewGBe71+
         DeMQmdV43+mKahFlqIz3SwdpW4wFXmtNv297XhTpwcngbixQA0mPcxqA6P4annNN8bK3
         jEvSM1EkX3pnEkFMDFoWY1gB11CSEsvtYJCvkTDHdtOT2q0L1bSzFMdiRK7T853CShjx
         UuYVViAAEC2ehXwuv+IBqddgMTeY+Vl9RBw7Ni3S7j1ipA3ouChmM/mJKcFYm195RmKG
         vlISQFsKuWI0GdTO21vtICi6ghRA3qK6IcsSo2jhG50/qgyH0LXpDzUXGzW/RCwI5mJl
         B+Yg==
X-Gm-Message-State: AC+VfDzvfTvslxXX80WISES4FjaOPtaQWSFB2+NI27DyX40EEsEwYRIf
	plsDWZpax6x5w+AKHzZK5sK0DDCqnr6BqEPYJEk=
X-Google-Smtp-Source: ACHHUZ41M0mBy+fQKyI9J4X+TnNHM5xHFEJ1odUWxT5hDP+YXSFgBdiKSBXQCiNkxnyVeqxYQfemTA==
X-Received: by 2002:a05:6000:10c4:b0:307:9194:9a94 with SMTP id b4-20020a05600010c400b0030791949a94mr3238245wrx.17.1685521550060;
        Wed, 31 May 2023 01:25:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 040/149] python3-tornado: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:48 +0200
Message-Id: <20230531082437.10646-41-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102967

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-tornado_6.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
index 2d9606bb8..af5009b6a 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 
 # Requires _compression which is currently located in misc
 RDEPENDS:${PN} += " \
+    python3-asyncio \
     python3-certifi \
     python3-compression \
     python3-ctypes \
@@ -19,9 +20,12 @@ RDEPENDS:${PN} += " \
     python3-html \
     python3-json \
     python3-misc \
+    python3-multiprocessing \
     python3-numbers \
     python3-pkgutil \
+    python3-pycurl \
     python3-threading \
+    python3-unittest \
 "
 
 RDEPENDS:${PN}-test += "python3-unittest"
-- 
2.39.2


