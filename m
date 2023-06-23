Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAD7C001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.219.1687531225658780370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Y6vHUNQR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.49, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso863523e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531224; x=1690123224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4WIZaxajiAKJCcooxrxMC2bfhQwlVw3PfIh4SZrJzM=;
        b=Y6vHUNQROn/tqpYw4kAn2EMSixOmjtpCjURSiTB3B6hkHM9JvUkye7imM6K63uwelE
         Zr4xbZZlsl3Fs5zjZ3DJY8mfyZP4J1oqS5eWH4y1pFEyIv32ILxDZm4FlPPdbi8RHvuM
         FBx0Z1nkvEWi/Ffvb0K1D24B2AyESMbHaZe0i09avjlIS5rNhFq1Rni4yNblK4cNQ9g1
         5ODlyaIFn7WX60fsMCB8Xz4NL4igm6JSkqd01hfsyvS7U8xb0+CEPEut1PQMlcGBtm+w
         22MlXbABRXKI9cRC9JUsHoEn/aQj+6dxwaoK6Pm1t8KK0kQksnohAZvVpvrti0NNTZoZ
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531224; x=1690123224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4WIZaxajiAKJCcooxrxMC2bfhQwlVw3PfIh4SZrJzM=;
        b=XkHncbHNdrb1B8qiJOWUmjsGO+vPjnsyJFiVqQbGaJFOAgKlcJ79JV5U+le4aU1+AZ
         56/zMhElu9ypdGOUKWS5tIEuh3T/QBQYolo8BQHw6VsPi0w7Q370b2TWat5afBcfv4M/
         egDYB/VWL/qhX43gd30+SIHldkfNFOZ35AinhPvjNNTDakWVOPiB8JxcsbHFrtEK7iaM
         rvrSojarbBWka89DD3Evqu5/QvTTBiyrf2RqbtkgKttoXEjEc53b6Dgxws3Kkc4lgVhh
         8vVQ+low8KH/sPVY+wx7XKS79lIuTuKkB/S4C1YLnUl/8toad2mPucuw6jiG6USsZVe4
         c0Jg==
X-Gm-Message-State: AC+VfDxNfdQAXcl7iHGbpJcua8z3V8HewpvXd0QdPv2u9Oig5TYe2rN0
	p5swKoNxkdUpxDbmzU50oiEbEw==
X-Google-Smtp-Source: ACHHUZ40vNfxN21Ma8O3GnLdRY9qxH/a8o3lbJzw0Dvop0YD/waXdd+zYjrugXNtPpSv8WrqRJWazw==
X-Received: by 2002:ac2:5bdb:0:b0:4f9:5404:afe with SMTP id u27-20020ac25bdb000000b004f954040afemr7392672lfn.18.1687531224008;
        Fri, 23 Jun 2023 07:40:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 50/55] python3-dateparser: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:16 +0200
Message-Id: <20230623143921.146338-51-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103546

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-dateparser_1.1.8.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
index 13e8b184d..8b890fb22 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
@@ -13,6 +13,9 @@ CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
     python3-dateutil \
+    python3-logging \
+    python3-pytz \
+    python3-regex \
     python3-ruamel-yaml \
     python3-tzlocal \
 "
-- 
2.39.2


