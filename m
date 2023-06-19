Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B7FC001E0
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.7392.1687180944828544360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=m5HdcBuD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f769c37d26so4384086e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180943; x=1689772943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=m5HdcBuDy8GwjYmR0WteMTPcNtFXfHMXyLW+xLgs32WIZlkNWbtUeWV1tcAgB4jyoT
         7gIlSl4P1HFNYsaZZEZVqWlVDEwsBZmuk89dMtdyo3lAntR2/1MqOK2xdWbzYkYz/JA2
         UCMoG5FY2dW/Le+mB7Il0cI0Csz33Ky2kyxlsoaIwxiB/YfHB4zf/5Fycmx6qqP/eJu+
         Tz63BAL9GcIpt5H97lIMAJ3bFjt9ojUrxwo0HYpizbsHKa9FqeBaqtbC7VSPXgc+yVGb
         nrQyS7Ln7hHAkqJww9JAHEwteeHVBWDlx0Uz/ZRebVUhWBG6kpVQB5zcjvO4dTmcdMtx
         6sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180943; x=1689772943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=VUq20uXkXj/JRNZEXT6b4YIpaqcVbaPgbLVpa0hj6YyfFnFF441LdWHLS3KVoTumPc
         1kEHh5B3646yottmB2BkJxwEk4vEUuHLeL9ZJ/mZCNJZpluhTx+eFZRhXTlxSnPJdWkY
         w2cTufZnSA/jv0Y4Ll9WpSgIBfzGLbyKvCwWfWY5Ta01fBIknOkVL27iDVvp6WGYIMj4
         SOvR+CBmf7yn2rC8BtmpN2uyJE6wgBomqAMXkaCI5XtaOhIUqDNXt+vZrlypV9wbdLDu
         cflZx+TfuevFeH+pSKpaPKVRuvQ/x833idUlwRhEnORA/K/tgGhUoEUgganBt1kDKLgg
         UtWw==
X-Gm-Message-State: AC+VfDzN9fUIPySfH+cZMDrdB45XS3QfCWGWkMMYjl1db2qrDHbMtJAK
	wHynLdUKoKJj2AM0GK9tCAbwSH1RgpWHAw2JbXY=
X-Google-Smtp-Source: ACHHUZ6pNE0LXOIXvl7thWPGryE7UaPkf/IYiCvxX9EEbFcsqq2+xmY0IUKhg2ANtcetimJ/fzzHLw==
X-Received: by 2002:a19:d619:0:b0:4eb:1294:983d with SMTP id n25-20020a19d619000000b004eb1294983dmr4799311lfg.7.1687180942948;
        Mon, 19 Jun 2023 06:22:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 04/54] python3-pywbem: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:24 +0200
Message-Id: <20230619132214.213417-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103388

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 6bff9844d..1ab1bde44 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -30,11 +30,13 @@ DEPENDS += " \
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-io \
+    python3-logging \
     python3-netclient \
     python3-nocasedict \
     python3-nocaselist \
     python3-ply \
     python3-pyyaml \
+    python3-requests \
     python3-six \
     python3-stringold \
     python3-threading \
-- 
2.39.2


