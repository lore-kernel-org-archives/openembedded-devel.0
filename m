Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CFEB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.7430.1687180994048382939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=M0Ojsqe9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31122c346f4so3857792f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180992; x=1689772992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pBpvlsjfGf02WyNtINdAsUTRuQS0o/7FAcoOoLn+HA=;
        b=M0Ojsqe9Im8kGEOYxw6L3tTS4eyY6ew0Um71lHk1jL+/MOzQz0Bb7b6kXitHgkiz/a
         IpWcMFNl0/8o+eSigziTa4aieAVHILoYADxxwHRYUKxh52n9vSiXT/x46+XF1vKuHSXj
         1JlwdyuhoZNeuTCgM1/2UizsWNhaildu3NDf8qYNrcIhePpOAL9bsPGl2kmPL+Mx6FF/
         v55B++MZ0j6dTMoBRzAcrxNa4CyOuN7+bmfP55/2wxEyBmyFETIszuGM702plEMOy4+R
         Xu3doFGphcO3sUiE6LoX1nhh7DmgmEOysKpfRsbp5tN20KRkoXZOoJAzvFjASp+2NmMR
         QCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180992; x=1689772992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pBpvlsjfGf02WyNtINdAsUTRuQS0o/7FAcoOoLn+HA=;
        b=FXyK6WC4cQWOTEVsNqbE6kRmLbgQyZIFZxf6rjVcFSFRxjtSo45o+SQtYdjvVaVZwL
         fW3iSiAFNy1XO+wOoXq/837sFLqU9jgxrY7RfVvdYk5i8oc38LLV7QvCJHf/mljTRCwe
         fOdL3pyxKQLf5NbvZJR9zpRn1ZGw20/s6H3KuSklydJ/4nug+gTXw45R4FaThmsnhu/0
         JZBOx33/4006t/B+tPrBkc7r/XTvU8kIEuyt5c4kpbvCFBDIfnb8DuacdYF2FaASyVsh
         IOcoTnjUpWsH12Kb7V05DhQ1cZDBN23GAQ9jjgzIwiwPktLndURkuvZIV91ioiZDAt7x
         0Jcg==
X-Gm-Message-State: AC+VfDwX96UEFQUhnVx5yYR+KeTOYGbtQTqad4snILX1Y4Uy0KEiUJ5m
	hAGDQCMzfqBa9kt+34FqGsEw3A==
X-Google-Smtp-Source: ACHHUZ4fNtvCZ4c5zrKxsVfqOAy2f6EIVQM7I1bG4xBHUhhEWDOAVImVUYNqozLtrqVUf5HSraQ4cg==
X-Received: by 2002:a5d:58d1:0:b0:30f:bcfd:c690 with SMTP id o17-20020a5d58d1000000b0030fbcfdc690mr8915054wrf.38.1687180992570;
        Mon, 19 Jun 2023 06:23:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 50/54] python3-tzlocal: fix coding style
Date: Mon, 19 Jun 2023 15:22:10 +0200
Message-Id: <20230619132214.213417-51-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103434

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, order RDEPENDS alphabetically, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-tzlocal_5.0.1.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
index 43649bf73..97f4f410e 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "46eb99ad4bdb71f3f72b7d24f4267753e240944ecfc16f25d2719ba898
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "\
-	${PYTHON_PN}-pytz-deprecation-shim \
-        ${PYTHON_PN}-datetime \
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-pytz-deprecation-shim \
 "
-- 
2.39.2


