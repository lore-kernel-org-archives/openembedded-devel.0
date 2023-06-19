Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA21EEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7365.1687180954188780575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=EJVKqnHq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f904dcc1e2so23479975e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180952; x=1689772952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V26U/lHLhWFUDOkghOAK5Xorar0mpwdaNP+/i+d7ps=;
        b=EJVKqnHqBMhVBv+yWl1e5Q/vr62nGZhyef4l1c304xynCSbZJXhV2gbgraDDEzx+KL
         jBkU1NkWFDOt8Bz5yOlFHD0pGS0eub4qriYnGUeq0LqWN7RIXjBdPjMywaZ/AsOBHEnc
         THYgx9vy0Sc4WgSMozpmdqYb58uS0807QPg70uQF53jOmSz52KtexJODUM41eMRdn+Qm
         4066P5XkDHk6TqN+YQeW1nEo+gYuG4T/7Qf8pPrjapfA+IX9ckimrM5oqEFlolnrHVCM
         AUS4BDY9zayD2gsdSCOu0tyfabSjK0ELdYpQboVouzc+sr2wbq9IpYScavMg9ZrzO9Z8
         TRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180952; x=1689772952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V26U/lHLhWFUDOkghOAK5Xorar0mpwdaNP+/i+d7ps=;
        b=MlARxSAXf7KxFDEqDO5rGl+7J82TOjZSAQIY7B2ebPyJlgB8lfHhDT5JPVZ2PN3qQz
         WpfQcUMiTdXTp92ne/n0sqqrQOXGFKKyV6oZsE60c/RV4+ADZZ337Ux+600A/pXxAp1o
         SQ1U/xUlzExUXThhtkAvZ26R+v/aAqKmmD6B2a0n0Nhn0CFjGB2zYy8erTuqtFJL6KeL
         wjNe0AaXjtA4Nrb1C4T9Gx+AJvrtnDJrrr9F0x/L8nmj8i3YvhwAKWxgW1dPLKTxf86o
         Rm3Kj/yZXHuIWtkQgJRhdlj5VFaXsm1P3HL+KLP7aFG5x1hVAeVe29D3KITyEJtr/eMO
         8vZA==
X-Gm-Message-State: AC+VfDzVsDNOFRyDVslI2k0oG7AJ/mCef5b1Ib7k3YlpVL5PuQRgxgSS
	PKbXbzb+vqBQPO2FV0EYU40kig==
X-Google-Smtp-Source: ACHHUZ5UcgnFlG+bHkiYrqKaNTCzH942PXC/b6ShW3nkqR0AjktPtF/N74BZcH5UoCbuZy26jstz2g==
X-Received: by 2002:a5d:6a4b:0:b0:311:1b27:74a6 with SMTP id t11-20020a5d6a4b000000b003111b2774a6mr6833840wrw.28.1687180952768;
        Mon, 19 Jun 2023 06:22:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 13/54] python3-et-xmlfile: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:33 +0200
Message-Id: <20230619132214.213417-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103397

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
index fbebf4869..50ae7fa5e 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
@@ -15,6 +15,7 @@ RDEPENDS:${PN} += " \
     python3-io \
     python3-pprint \
     python3-shell \
+    python3-xml \
 "
 
 inherit setuptools3 pypi
-- 
2.39.2


