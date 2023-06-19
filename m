Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F52EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7353.1687180943469816530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=RSoTAjLQ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31122c346f4so3856581f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180942; x=1689772942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=RSoTAjLQKb9yScGEyFYry4bu/T2xglqgzbzseylnJTtQxm3Yvkekc+sfywX58OaHwl
         UUC4gbhc3ei/u4+CCS8TUGMCnfGfLjKNMv3q/Q6S+U91On82kyGrYMQsV9a6zymEd/Gv
         U50xQUghqhycmQBHa16d0AiU+sEscSoT2Tb/1KZxEtE8XEOlHENJ35+gP5izjswc4bDv
         F4Ss5rIh3bAFlJZrYtCv3M0U67V+Jr77D3TPKy/VYpjlfa7GxLuaE8Y8cMqlJVDbAwlZ
         BbvRXh2y6M+za3hHS9GlLPdqD8ayEjXHML/sbQ2YUkwEQ4BWHxXHIAaroayoDEiw9UlS
         /2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180942; x=1689772942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=Ly40JHA2/KjjHo/KC9oj3O8jF5nAQuR0qXQ0C1QnOhn2DRJ05JDmaHiBP7ioWJ4cny
         FoHp79EEcvihmNmwRWaKzUjE7UgBZbyAj4SVhjhIPk7Hh5C4VNl1Phl6Ic0mR80xmX5x
         44TdVpLksR7ieEd1NaT2xrz4MH1Hl4AYXHIiCZqUrKQ5eqJxh9djSQiylx/a8CBRdkgC
         iLMz9y2Z8SB5lUlrrUmTrxs4q/Cgx4qEHhMI1kjbQFZwOEENKUhJta0sLgfwUWKUcgHN
         W9lduM0auCHQK0+LYahglj5bdI1aax0AFpJlycW28DZq4Ap1kbg70ZpVfd+7BjAaJ0GJ
         LotQ==
X-Gm-Message-State: AC+VfDy4T5zLxtYkraHaoVYStJew3p9nVXq9UxjdKES0/rT1mKqIc8KT
	/VYI9a/t+ivSsde1mv5qvJXru8pt7sG3mtOOUvo=
X-Google-Smtp-Source: ACHHUZ7TIFyDtMnOVp0kRBYukrK4MvO3GTYaTZdv9+Qf8FrOvE8ZS9IUJ3rMtrr3nmzZmC3ob3A8wA==
X-Received: by 2002:adf:ea90:0:b0:311:1568:1a27 with SMTP id s16-20020adfea90000000b0031115681a27mr8504481wrm.58.1687180942014;
        Mon, 19 Jun 2023 06:22:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 03/54] python3-pywbem: order RDEPENDS alphabetically
Date: Mon, 19 Jun 2023 15:21:23 +0200
Message-Id: <20230619132214.213417-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103387

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Order run-time dependencies for clarity.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index c84576382..6bff9844d 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -31,6 +31,8 @@ RDEPENDS:${PN} += "\
     python3-datetime \
     python3-io \
     python3-netclient \
+    python3-nocasedict \
+    python3-nocaselist \
     python3-ply \
     python3-pyyaml \
     python3-six \
@@ -38,8 +40,6 @@ RDEPENDS:${PN} += "\
     python3-threading \
     python3-unixadmin \
     python3-xml \
-    python3-nocasedict \
-    python3-nocaselist \
     python3-yamlloader \
 "
 
-- 
2.39.2


