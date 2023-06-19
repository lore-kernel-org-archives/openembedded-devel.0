Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7604FEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7398.1687180951959678190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=2VSogMD9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31126037f41so3107197f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180950; x=1689772950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=162WeV0wQcPL/z3Qwqm9WVHEK5P2KX3fbhEzaOofEYs=;
        b=2VSogMD9EmmYdWBIXfdEmpeut4kuPwOQdaT5w+h7BupcfQGHbiiK0jBrblFWRlMiTG
         3U+pru4SCA9iEejtFMkTkDZDaA71lA59lRj+jpIiyaiZejVK6OgEkUwQnun8eQEZ36pB
         hAVxH28xriVMspf4Uci5znTE9a7UO/GbBkY99PlFqyQJ05vTt4Ok8Ot/S/tfwPO95yWA
         WZ0hb5EKwbj1bpOqLxCPkKZdMrypB+YNG/Em7V3d8rFC4gp/ONONAQLdK0psDBDuFmbr
         yE/tf6r4peALLC8cKhQXKuDt7/46tFSf6YnESvUxsYGeY5pemgjvuJUbZGKk7x04sPAe
         xHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180950; x=1689772950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=162WeV0wQcPL/z3Qwqm9WVHEK5P2KX3fbhEzaOofEYs=;
        b=kvLrgKtx2fj4hlEpQx79gyPf26g2ZKmwdLkKIojVlrgBbSPMNIggSRKeEEalEAKA3b
         LwcZaYkFrJRW9hhkfQjyWbJ9f1KU12AvtB5RsiqLqol15FwUPsVGQnu+g35dNQM5kqt4
         E9R9oVHP8g9ykwUc0pSt1Zs6tZnIYhA1hdbri3IT9Dy5tHE1BQtBldea070YkbJtdzm8
         4A8ifQ9m3vn1WwQGOHAiZsPbHxql/wv7om3EQszMoL852lh7+4ndRB8FhnjSP/RVV35m
         aEW5JkjJKxuc0O5MqK4ydGrvjNrm7h3KxD9aFh9e4t5eTP3iaC9ZCKDyA1yZptJC5qI1
         oeUA==
X-Gm-Message-State: AC+VfDxdyDYh/Gt25prEXp7pLIh10+WIBz1t40sAOpe12tY8H2XZa9aU
	0qHgvb2JYCC8SGwH57DJeq/pOg==
X-Google-Smtp-Source: ACHHUZ60NfCdcqPhdQfh3Gtx6R1jN+OcIU2WIl8QWk7ObRiu1jjocf0W2s/SzRUG0Gk2ZvAIXgOvzQ==
X-Received: by 2002:a05:6000:1251:b0:30f:d32c:ed8e with SMTP id j17-20020a056000125100b0030fd32ced8emr7052390wrx.45.1687180950492;
        Mon, 19 Jun 2023 06:22:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 11/54] python3-ecdsa: don't install tests
Date: Mon, 19 Jun 2023 15:21:31 +0200
Message-Id: <20230619132214.213417-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103395

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we don't want to pull python3-unittest at run-time then we must not
install test packages. This recipe doesn't provide ptest anyway.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
index 6a399a96f..d1022891b 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
@@ -13,3 +13,7 @@ inherit pypi setuptools3 python3native
 RDEPENDS:${PN} += "python3-six python3-gmpy2 python3-pbr"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/ecdsa/test_*.py
+}
-- 
2.39.2


