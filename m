Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B21C77B75
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:15:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.13232.1681218928445611685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=v1BynTEK;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id d9so7602945wrb.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9NY/wm5EIWsVn6RCmDeqPuWTsoNLHho0/yGW6UzLSE=;
        b=v1BynTEKr0uPOTSu8DyEK6GO8UHPy/UBSQCkUzVY6lmkhfAeU+dPLWjY7ZPxH1UR0I
         1FsHTOA2zhEQT01PW8m2gjH/mpGPPkct1i2IyZFzkgs/2sFNBuhG3AxZi21UhaKANMpH
         cvAup2DNIImFXtFoKtczVXicPEtZsPx66EWeENlT/ES+lIMwsENYSoDhh/kV6nqrmQbE
         YkCh8Ewsxjjpn0yxEMaJ+jitTIAXUcqS3UCURuI8KmfJZhvmtp+4PhNy8FKkpoW5I/U8
         3gjugfLvmQQFNdCLiQZWLe7nJkelFRIUaYyHCS0iD2eyA6Gz9s0sZyJKAI6V88HeU3QI
         BahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9NY/wm5EIWsVn6RCmDeqPuWTsoNLHho0/yGW6UzLSE=;
        b=NJP0b3KMNxfkauwSB/A0kyUA+mHh++UmJ47MwrgDBxTIrDhp3U20ma4ln7o6LSE03u
         Me7UFuZiHkOph8ldbLh+e6PubiBuhjNYVZCwfgPIW9654VmUYeAXzj3DebPo5ToDOzyJ
         28K5Of4BTxdFn5iU/0zeqD66B3HoFEsSGDgUNkZRQp8VxgO/kkP+kEthojkwtiAopBjP
         L2YmbfLf31c3welAq6odcBuUGCM3bnjbaxNAW0VpY4lixFbLm7n/T9s14pqxwhOqcZBQ
         QtbJYdLMBCnhsHwsgS1jFyZlYkwWbZL+dvpP7kiMKkaHzrL18V3h1EXNvZIchPPj2saf
         CdMQ==
X-Gm-Message-State: AAQBX9cHBiOqJpUdiTvXGgY8euqRriW8dScSt9oJB8KUm913vGRwuoIv
	6mdtQWq42R5K+RZ+jqEAvmnjE5Jb1yGuL5rPZns=
X-Google-Smtp-Source: AKy350Z2FhdqokpoyMiW2Evg6n8hKXzaSkiSiOLWmGTs1jTQHmGSbHbGVHmvoka2LQDLD81f/pANyA==
X-Received: by 2002:adf:ef05:0:b0:2f2:86cd:3e11 with SMTP id e5-20020adfef05000000b002f286cd3e11mr2927767wro.36.1681218926873;
        Tue, 11 Apr 2023 06:15:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b002efebaf3571sm7995168wrq.64.2023.04.11.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 2/4] libgpiod: drop unneeded S assignment
Date: Tue, 11 Apr 2023 15:15:16 +0200
Message-Id: <20230411131518.401912-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411131518.401912-1-brgl@bgdev.pl>
References: <20230411131518.401912-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 13:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102055

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Assigning a value to S is not necessary and it will in fact break the
recipe when updating the version so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index 5b882149a..4397641c7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
 
-S = "${WORKDIR}/libgpiod-2.0"
-
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
 PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
-- 
2.37.2


