Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9D8EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7372.1687180964959870757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=yRsAaDX7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3094910b150so3437127f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180963; x=1689772963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCN6+S2prOKgWJGgHO9vq378aSshuaWaBUWV06XCIfg=;
        b=yRsAaDX7OBwCowTcEXWZU86TUwmt9eTpJa1wMxlN6IzU/2yPsYI34y7LOQlmICoLx5
         wbVfJIdhqNVqIIi1qOzkIYWoP05q6YuwIje8c2kXg4fDowS2Xt8ErfucmW1VmRvLHoFb
         8TIMtBVP2qHcMxb1Uf+QH0EgfBsF78zOQ0Yr9wkiyhlv4iHqS47xOwwJsC/W6OEEJC/e
         GfyOT7gJ1LGt5tS6v2mbfabcG/x+MDlzE7814k7xKH5f1WgQVMkjgCPM+iGOkvlSFVPB
         tuK2mErAyu399XEVN5Rz08e/rkHCwgld9t4B6SATtKeC5Er0MCA9K8C5EcpIH2xvfCMG
         unuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180963; x=1689772963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCN6+S2prOKgWJGgHO9vq378aSshuaWaBUWV06XCIfg=;
        b=CyrGeBCPwTeq7y/ZLM+StH7J9CMzyKa0zZE5IIgwVuxCZJz5Ku3jCr0sGU52ZmEn+7
         ajJ5Vd3aCQbKPc/ArRvfC2k3e6z4Qud9nc++pEXIBuTmnJ1gCSBDipYz6emJI7rsGETx
         hUvNyLlsFuq/PNKvFbACPc069vdjbFXT6PkcZmvQ6GRtognAFcrzumj20kH0VYclpIV1
         EL1RmfJfo6kTvU63JWq50oxjs/nBiuV71UWbvqWxq5zrkphBvJk2qZSBOmkUh0TtaOLI
         ZMvqwHSWiUm1c+GKbGJVdWm8hnj7mPltw43owm7RFZU2NnMTs2CQJD2YIG6TqNsDRE4Q
         n4VA==
X-Gm-Message-State: AC+VfDyIJ9nqcQLzhca0gn96OxFkjLOD3rjMrNPjonuPeQ4N929D8az7
	yRPSpUU58bsJ6SJypZUoM5suVw==
X-Google-Smtp-Source: ACHHUZ6zZcRzWSZsP2ChQN05j4vZ+hc6eu5amXI59Dmigcn6YetiTBlXmZlVrNfHNHYKLvYauhI8ow==
X-Received: by 2002:adf:f611:0:b0:30a:e369:5acb with SMTP id t17-20020adff611000000b0030ae3695acbmr8413217wrp.68.1687180962771;
        Mon, 19 Jun 2023 06:22:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 22/54] python3-h11: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:42 +0200
Message-Id: <20230619132214.213417-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103406

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-h11_0.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
index 7bda0eae1..2bddefa3f 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
 inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
+
+RDEPENDS:${PN} += "python3-profile"
-- 
2.39.2


