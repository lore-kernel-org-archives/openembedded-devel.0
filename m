Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2815FC3DA40
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.212.1687531216536588618
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=W7ZQZMZI;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fa7512e5efso10375945e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531215; x=1690123215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA5UJ5JbNJTnTv4hpQN959CW9FXtN6jhovsQJMLYLzg=;
        b=W7ZQZMZIYvbabcI0AvWBFHHmEr+c66YUa5s4Urdyuy1ZLNJ8H9nGHQmALsnjVPR71s
         KbAQqEcSL3uLBFiocOJdge9FUfkx25qC/UNVOyCEs6EdmKej2I4X+cUFR5qy9y6vKhSo
         Py1jDgEtLjlsZBmRjE+Ii4XwLvpttZutjE6bvRIrEL2KDBaRH+9c1rZOnqcj/0o2q61k
         gmDQe+VAjnF1Wvx/NSR2PJXUNHQVPrOc3YGvH9OerUh4h/wkmttRlLsZsjLjs8hpW8Yn
         AF7xXiaZgtJVm8YQf/BMN+fy0UWNx+K2VpGHTjnsLtkp6cW9k+NHQeI0uWT2oFvdGL97
         /+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531215; x=1690123215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA5UJ5JbNJTnTv4hpQN959CW9FXtN6jhovsQJMLYLzg=;
        b=SLNB/RMHxywoNtnNn9o/qbVLq5VtP9g+sGz+ZgKli5GSaHnYt2HRR9dhlm6nWrgM4J
         j0PN+Q+HWlCm6r6wndhwqy58w1AqFcCASMjklyH5eFD3nfhG7jx9u+I1494CKT4RUrYc
         p+wuitZqgTu0qZ3uAc4/MZtBvIQLm3sS5qsu0LNQuXZ9hU3vprMARY9IfCcIyd1IYV8C
         2WP9T0p3ZT6C+Hnq1aMd6smdymLtb/ua8GKVHFfrOnPAfN3p1k9xWtudmfkekmEGIG70
         tBhZjYUJ1oYOMoQgV9EVGmSiElJBNvCEx60t/0f9jqW3yQwj+ptpltcGwxfmr8Wi4KiQ
         ZaHg==
X-Gm-Message-State: AC+VfDx0OqpYUQgEb7wFpAh6p77nembSqTO2unfpwcBn3xm/FZb3SK++
	wggFjOBJolJ7rcSbsvuBEA5pfw==
X-Google-Smtp-Source: ACHHUZ45jB3Lo2O3+WMbr8sL44rAEN0CF2kj2WaK47oQoyobhmEuA+OIbQ+7qcasq52rGBPVbfP7Lw==
X-Received: by 2002:a05:600c:21c6:b0:3fa:7516:baa with SMTP id x6-20020a05600c21c600b003fa75160baamr5281488wmj.13.1687531214973;
        Fri, 23 Jun 2023 07:40:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 42/55] python3-colorlog: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:08 +0200
Message-Id: <20230623143921.146338-43-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103538

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
index 84b67e784..69f4be17c 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
@@ -8,3 +8,5 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "colorlog"
 
 SRC_URI[sha256sum] = "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
+
+RDEPENDS:${PN} += "python3-logging"
-- 
2.39.2


