Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148D6C77B7A
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 11:52:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7404.1681473114270508304
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 04:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=CQB+QU28;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id v27so7999414wra.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681473113; x=1684065113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNB+X0SOJztGPI6SGPOTTSPuY8ZjG+0JAgjsAjC0vF4=;
        b=CQB+QU28NbTfpu8P459c+VFgO7Gi6/Iy9ohzOckaJ5L96FUlztiPHHh54Xg4dzqMGY
         bCARuivBNceaEEXl52WXhyt7mGjxZ+bBF2mIp5O9Skpv5UvaOdVb+k9QrY3dZyQYE7ux
         suhN0w8k9AS7GRXdeLxuug60YB8sN4SY9P+uzxK8rgGwAoQm9RuHN/TCJxBUU37UKxZ9
         VQJjrN+QczwA91Rb7s233SyTKmtuZXfizWi/GcMk62092cT8BnURM77lE+r6UUfDGcCU
         sznauXe58Xl0fF4rbTA83teZUGhH60lJ/i8EW9jqnWNY+mU71WlOqfRRR5zz9fUDmx5C
         QE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473113; x=1684065113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNB+X0SOJztGPI6SGPOTTSPuY8ZjG+0JAgjsAjC0vF4=;
        b=YlTr1S0f+oQPkCFmYqpGgKTbp16DRyY+nzGtSXroTCdGYZsVCar6QlAxWuegKNnmOs
         CrcbzWxIqeTMEIWxalJ8I7N7esZF+4QZXZ4IWQqfwbsQVpJPUlXQc10ixOFAElOs5Hju
         NqdIe1cfIOci6CTLLHd3jSOb24yf98tI60xm6jmpXQRhaSmf/ZX6xFPoD7/wiiyDCSuM
         AxIjE36et7tRW3/KP0yt4OUbhsS37uDwT36nvvdGcIRSv6JoAnxg6lDuFGe0l4C1MOYo
         qII8e5CTqI4Zs2bd3bNWPoFYB5Zy7UcBxBOLK24Ift9PGtxdMxrUiX29HQjItNenUGcC
         JW5g==
X-Gm-Message-State: AAQBX9eIHxY9ZbnbRHyZHSf3vrr4u8kPnyXHvzNCLKbNXJzao3pk4EIz
	ROlrEQD2QYeNCLgIHbuisvGt3t4oTcvIaWRmeyA=
X-Google-Smtp-Source: AKy350aACcd8u4iRM85/rCGaGAunLBvJtBoH3ta2dBkNFv5X6DdY1ysoxPGwlWYCw8o86AFg5y40wg==
X-Received: by 2002:adf:ef03:0:b0:2ef:ba57:ee2d with SMTP id e3-20020adfef03000000b002efba57ee2dmr4143261wro.51.1681473112702;
        Fri, 14 Apr 2023 04:51:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002efb3566b0asm3379523wro.52.2023.04.14.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:51:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH v2 1/4] python3-gpiod: add missing run-time dependencies
Date: Fri, 14 Apr 2023 13:51:44 +0200
Message-Id: <20230414115147.136593-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230414115147.136593-1-brgl@bgdev.pl>
References: <20230414115147.136593-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102094

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


