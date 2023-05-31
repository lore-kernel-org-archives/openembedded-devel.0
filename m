Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBECBC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9066.1685521550326919156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=On6tz5AA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso513553f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521564; x=1688113564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chFAbYWs5Y9P76BrpHvWfwW2oocmMrxfELtiJzA6y58=;
        b=On6tz5AAadIU8xSBUB+m0YQGW2zBIGTxymqy3prOoiJ9394xq6e18LRNDPCgI7jmZ5
         5/gNOtgemuC8eJnMjsgm6adDui//OIuUihBBDA4j+oFcNZNUHRrodhbGxXxtxzoL87oa
         fr1RZa1i63/1JqkkTCPa1TQH/jtX5T51uJ9g74P359SINklnO5Gzk8QJd6HA4o5W/fw9
         db6itUQJbf+HQ5gboEerxScJaP61ubHr7oT4gk2aOFEJbciYd5YhQ2OujgkaSSLg/TF0
         An+rLvfJlIrY3DTZZRy+qdMmjVlt3oOFFe0KcHBr/m6k3HrUZZFzNRCrirnvGw4J6wZR
         aAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521564; x=1688113564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chFAbYWs5Y9P76BrpHvWfwW2oocmMrxfELtiJzA6y58=;
        b=POe7VnxoKdKaPHuh3GrBmYe2fyispSWjLTbjZriTWEVnAIB9+mjumoVMbY8eot87hr
         P+igWcP6loKqAVZdsGORkM6AJwJ+56kLoE0z6ttfx647DP9dm+1oiZMcjKldeA52AowB
         yQ4HAERy0IBt6nJqFtlGQdKGL5ZpRHXK81I9U8K6irpPt5JXhtrOpPLw0iw46LosXrNR
         e8EL9jUftheZcUBzYVFKH+z/krWSICxa+39iN8WIBoo7hsXRu8o1UQvKMpkF+Z5H6ftB
         mcI9SSx7T4TpZwvd6TZf26cMvp0c/4NDy+sVmdCOol/ziRI7mnWvX+ioWwVsGYYhB9Ka
         7HPQ==
X-Gm-Message-State: AC+VfDzbzuT5bqfbdUQGMWnoq82wP3rv2mdXXznBZtGF9k7pOfoHFVsM
	E9xJFQCy8KGylf4aDiJrouz+Xg==
X-Google-Smtp-Source: ACHHUZ61/gekG0uLoSJglgQv2BkZCb0LhsIfDWm1KT0ZtKKFMn4Zq5bgEsEBVldBLIMS+sICPD9LQA==
X-Received: by 2002:a5d:4a4d:0:b0:30a:f68f:9b94 with SMTP id v13-20020a5d4a4d000000b0030af68f9b94mr3173437wrs.21.1685521564676;
        Wed, 31 May 2023 01:26:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 053/149] python3-pyatspi: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:01 +0200
Message-Id: <20230531082437.10646-54-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102980

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
index aa3000bf6..cd0e12ec8 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
@@ -20,3 +20,5 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 inherit pkgconfig autotools python3native
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
+
+RDEPENDS:${PN} += "python3-pygobject"
-- 
2.39.2


