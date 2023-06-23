Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25177EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.200.1687531207105570614
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=vy/pbqpu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f9002a1a39so8029965e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531205; x=1690123205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/t8mAM/HzsIXRiR+aSghHzlVcefKPDKNNl3I7uOHIw=;
        b=vy/pbqpuVriIw4aCk0nyhM8b1fL5t42EtuYU6Q6DF/G6ajT2X+Wmt4hoqd96VYvsO1
         IZh21Ma/Mezl6zLz/hio+9oRJB8RD7Imvo1ZSW2GzQQlpUOar3/k0xnVtughzfYFoPky
         O3Fc2rvDnwIjqIX9P/mBvh0UzIoBDIOj2J23rsrFsUyeihUx/wDXDFU9DAph86nOtoQl
         /XGT1ec8q1ChBfZuPrU2RTvMt2cuGlsH1uxvwD/ahS5eOtmCe5+q9jPcFoYHlv8Z2/7M
         66WSEzrCV903VpguAh99j9XKudFGTPqngx122DI+W3s/NrImXn0h5hRwP2xZZ+C84wvJ
         A4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531205; x=1690123205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/t8mAM/HzsIXRiR+aSghHzlVcefKPDKNNl3I7uOHIw=;
        b=ckXAzp8ZLkmqZx1AVeG3DOJuaTx3UtuxOxaY5Omo9kPyWzT3E4TaMGj+/LdGroJDqq
         1oKlpnZ4RXoTDTwv9wxIT0LpkupuHLWjqxYMGWC7dxdaGb/JSNzPuBka8ZxU+pXOwmks
         G3O1i719X2hSZVUZX/IgaWic/AUwRfG5bcXkxzbZjNnaelgLIM6L/LvU10faOzMm3x0K
         XeicZiLI4PuYMbg68lgfmc1seJTr/01XLsJOPIJy/ZLvU2+y6aWT4k9t7QonCwmLBRxu
         4nPo4TJlx+7IQ0+CzyHKSbIYawFtDT39eOnHJ52Wk4exMIri1F4oRwxzXftYtBQj4u4i
         T2QQ==
X-Gm-Message-State: AC+VfDx/MP1co5OMoqXS5b7CMvf+w+vHc5pH9b5Z9plLN11P40ogvQXG
	YOg+jnl5LYU4TskGFIYR+uiPKA==
X-Google-Smtp-Source: ACHHUZ7kEozhfgf5dYKWIiwlPOUBuPrgTd/IV8tuofARXvK6DXkZjihOhBLEVMlygZDmMiacTlq4Qw==
X-Received: by 2002:a05:600c:2189:b0:3f6:7e6:44ea with SMTP id e9-20020a05600c218900b003f607e644eamr4009796wme.18.1687531205658;
        Fri, 23 Jun 2023 07:40:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 33/55] python3-aioserial: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:59 +0200
Message-Id: <20230623143921.146338-34-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103529

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
index 6419aa9c9..8279f2704 100755
--- a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -12,5 +12,6 @@ SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-asyncio \
     python3-pyserial \
 "
-- 
2.39.2


