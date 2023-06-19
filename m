Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE40CC001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.7421.1687180976260255635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=49+01ZIt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so4002300f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180975; x=1689772975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPY4DDQuIK3n3n/NaYItmWKimd9mYA2zdaX/E2wQjeo=;
        b=49+01ZItgGE3yZ8tb63eUJEq5mopJDdDir799wKq2nJif9AR4W6sM6+03Sw+23Gcs/
         rwTHTXWCt+5k19plXDKvjrBLhSabXKZPNc5gSWMlwq3qs3zrDY9nxFnvqI+CHRFlH7yl
         TUlGxB6Pq9YFh0Uej7ad4KUjenpMe2+SC1UyyREluVoLIpss57OOqmR4m7l4po3CpGR3
         mi2EvQDtS5KOBg65bRPOB7LMe1vbSoS3bwfRwE5atCiTC6xhhzUNxGWoRs7xeaZ4+Kdm
         rKV/lVPSrdllvWgE83RhsH2vwWWwAb90jiK9SOlzf/G2KTmZQz2P7dUxw1BPaLRA0t+P
         8twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180975; x=1689772975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPY4DDQuIK3n3n/NaYItmWKimd9mYA2zdaX/E2wQjeo=;
        b=HM0tkaJiAcnp+sCQtNCGfYF5fMHXKae9Gv3ugPZvz88ZNKWr/O/Ll16rhEpBXcR4Fw
         siScUYNMGz9kXhXj0+GlAacCrUFCYS2wIYofZ5C/c30Ddo9hE/kBpoERcrtghEx5oJ1W
         gMII6JXEjqLmALgWDmGFLWiMuVeWHuXDcqbO2RMfMsi1hUf8lVzBt/eJOTs8j9LTYhr/
         wfMF8d/b9q6ttafsbGAGQ5wLUuv3Qm1TR8kajzbly+dOfadX4UdZEb81ZpyEUQp4ehcU
         tELDyXGe21FHyuYTekNy3etTcjkuHm0n8gCR0bLMCYyfEGZsCNmry3G0JmIN2IPlhe4R
         XuXg==
X-Gm-Message-State: AC+VfDw6Cgwf6+EO0zPA22HX8zFtiptzjKXUJaaa35qoenTEu/NcG+wp
	/bwVO9FyxTf/vcmpugAW8tZQQQ==
X-Google-Smtp-Source: ACHHUZ68gTMFAUH16Hd8qpo+csf7aGEaPXaaRrOOOE0mkDC6DIW5YoSduPth8X1XHcX9wRBUJ4dixw==
X-Received: by 2002:adf:f88d:0:b0:311:19a2:e7f8 with SMTP id u13-20020adff88d000000b0031119a2e7f8mr9297569wrp.1.1687180974830;
        Mon, 19 Jun 2023 06:22:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 33/54] python3-aspectlib: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:53 +0200
Message-Id: <20230619132214.213417-34-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103417

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-aspectlib_2.0.0.bb       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index d2b0864ca..134151328 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -27,6 +27,9 @@ RDEPENDS:${PN}-ptest += "\
     python3-unittest-automake-output \
 "
 
-RDEPENDS:${PN} += "python3-core python3-fields"
+RDEPENDS:${PN} += " \
+    python3-fields \
+    python3-logging \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


