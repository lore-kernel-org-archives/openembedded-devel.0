Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308DEC001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7433.1687180995007543750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=pFIffmBF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3113dabc549so1656818f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180993; x=1689772993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7gtqM15RlAxxbLOLVv/25y9t2kL5mzWjUDaFsA37cQ=;
        b=pFIffmBFe1XRCGpMOD9V8aURsS6JT5a+eLWmLXA6+teVyDaPb9PNrz1qiXVkvFrieH
         4+Y8tTnD7TJ9tcvat4NYxoNfN1BRBbAmkhReptvON7tOld1qiuBzC3gMSQRt0D24brd4
         2vOKZlEPm4CoOeaXcO9G6UYibMtuEnYmsO+18O6WJxI3YkLRFnDcNQglgVvlNjf8xh9V
         1+fCsaJQWjpXpJpbROepaziO2jM3r861m7vNUxr+ccArXc3SH6TMuBRo2rDPu68/mcbr
         XXNfjszZupmpBj+4D7sfbpd+/A/MZmA3BLemw+P7AdRI8Gkz6Zixem29ot6pomJ4JZu9
         W+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180993; x=1689772993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7gtqM15RlAxxbLOLVv/25y9t2kL5mzWjUDaFsA37cQ=;
        b=P17ihGMAWyJYcZX8tFirl/3niZOfHlfTNiXQ7I/UICN4zcJ8BmQqdqZWDdgPOO46KD
         bc+TCKyj4dFqHbP5yh2qN30VUeEUgCgjeX9TeZEkpmF+Lor2OrJKm2erwiZqJP5ar1ee
         r1ADQofCJMmvR+ubj3FTkEIr0X/57tUtBF42nQWiDbcylQlVvkePuBGhOgO1dkOszRBM
         GAfbazW6LUvBEglaQsteCLAx/8JzMTFnF+qxQVw6nKphDgw9YML62WG5TMHo1vUhcis6
         PiCZW+asDY1WZN6TiMKiW2CiZfVaToQTTFuN3wAlOJ36xQ0vM1ayrf6xs5hqChvmr9gd
         SjTQ==
X-Gm-Message-State: AC+VfDxL5zhL3l6vljHthiXboiU5zjhjhEp8HrZp3cFNVKvRlGaIf5ur
	TpKSlfaurZ3HYN2FAR1h/OgXQ3AtIHy721WX+Ok=
X-Google-Smtp-Source: ACHHUZ6DR5Ss3UXy4+yRBc++gzfd7ueOBmjTQps13HgXdpGAKTHqwmhqiej9/M0wPGTZ7xTMehS2Dw==
X-Received: by 2002:adf:df81:0:b0:311:1cd7:68b3 with SMTP id z1-20020adfdf81000000b003111cd768b3mr8968980wrl.57.1687180993539;
        Mon, 19 Jun 2023 06:23:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 51/54] python3-tzlocal: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:11 +0200
Message-Id: <20230619132214.213417-52-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103435

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
index 97f4f410e..a59fd9364 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
@@ -9,5 +9,6 @@ inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-datetime \
+    python3-logging \
     python3-pytz-deprecation-shim \
 "
-- 
2.39.2


