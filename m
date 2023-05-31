Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F655C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9101.1685521514667111547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=JzosVMOM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso41052085e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521513; x=1688113513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=JzosVMOM0xfK5GbAGDW5AizMAfqpOwp9p2SdZbfp7R+3gcXGMCQxS7IsG2LinrkzaL
         mht629wvkDu/S7YYuIvgzsmGgW2skrti4eUfXSD3qf1iQMLxtdyk5miaeNPxene3U9cg
         H4XHjQpMHhXriANycaC0gH4KZcEUFDeEdgvMvN+gC9Hs3vDvtMT0JZurPcs33/cfzVg5
         XxPCmhmpRyWVgxaV9L1Kc4TO/gecBNsm0NQmfyb/2RVlCCs0RMOdXeYmi1w4HQmHb5ib
         CWU6E7+d7m5zWNuBqINun2CN3kHAOfbtb9iGkoipUo5rWCXBP0esYX5PxfLhjI1HaOyb
         dMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521513; x=1688113513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=XWdG9inSxF+IabK+Ce0LAGLwEZv6FGb7SAYrDXV/gELGj+E1Hjc2wmZp0g/545cXN9
         wKOyNzKMMrdNstnf0R7HcNH0hfGxV0uYoJEHJKux4M83B0b1M2YN1n+wEb5iuI9U46mC
         tTuVhpxgccYfj1drpygCKnVtqM4tz+VX3BCrOf1zrYS5DMLBBBh6f++o0xc3Mwfn7U45
         EHqtpLsVIypoGvf/4ugpGQs8Oz15dkOdaqe4yhW9qG9ATwqEE8lIAAuKR1j7iYurSFrM
         rZPKwjmXL2nVm6KEppMztv/1bO9O+SD/DRTV/6f2cAoguR7w5UEyQ2b7tCinHiwMeoy5
         hMCw==
X-Gm-Message-State: AC+VfDxflebfU0FcXfoal/JC/dQNE4RttWVknCDpLxHOATzUErkSWODQ
	rX2iBsaN3ig0/xFadZ7H96K73NoeeF2MYJLkIWE=
X-Google-Smtp-Source: ACHHUZ5Jo46VbeniuzvMc1AgMUDGM386qn58X67ekGzhBk+tKJmf4MKIWUzPvW45CKWfq2CCmkMSwA==
X-Received: by 2002:a7b:c44d:0:b0:3f6:11cb:4926 with SMTP id l13-20020a7bc44d000000b003f611cb4926mr3538917wmi.22.1685521513241;
        Wed, 31 May 2023 01:25:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 006/149] python3-pywbem: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:14 +0200
Message-Id: <20230531082437.10646-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102933

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


