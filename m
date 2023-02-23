Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9305C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:01:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.696.1677182478212930192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=a3bF86RT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id j3so7887977wms.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOi1dnM7q2h0LX9jm4TT1rk33OMfb1tOzLV1YznFgU8=;
        b=a3bF86RTq72botvZzcF9mqnbZsYbcXnFKxCgLj2UVhu1ghTe97QQmmt9db/9HD/Ev4
         e+OtiIhFxCBAqVOKQsQqLUWqVo81CuHskLvYeEdEVKkCzzll1PbvOzc9/5w4xp3tfR19
         IJU3OgP+Y2q77OYWZPfefnk3EBkKl09lAbKVB+w9JxCKHNCHhkFcWesovhGAEjpX2BYn
         zSsm/ZJQpB6qCOqJEL+YvHyRJ/81YEfLCKLMRi9HrFCyGwT623srnnjyps5MhSuIlTu/
         O2Qv81NrM0iNi8WRLErb/hncE7+RVXscbsnnZrDat2D5j95k2VrSkK1cvrzw5/ZTCN1C
         zEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOi1dnM7q2h0LX9jm4TT1rk33OMfb1tOzLV1YznFgU8=;
        b=0btuVZgBfYT+kpsRijL8A/ywn5FQutEw+4rxpVEdmygZFF470goLLVxQgjH7LgacPH
         hFGXg5zMdxxPo8R3N76wWPOfMYOHGfNApqqmYEuNwuN85TCsWMw2XkCiVy7YJvgUbodQ
         9V0VnzvOT+NEKS13+G5pOykJhTDDmYqqu9UE8XMHterO4U7AC3+CFIdZEV0vbL7utTfQ
         Kw2qD6C0TwMVrkTjqN9Xk9V1bD2hXcrY21JhWo/M8e7sQg+3Py0HAHKWie8SJ9B4feiR
         LJjhn/xsoy/rVWTikkAng8tNVoCMAp2Jg1la+CvAjdhYhOB2pd1aoteZJCniynPvkr7x
         BEzg==
X-Gm-Message-State: AO0yUKWY3kfRGiEUEtmBGji2dpHK8FZ3kAaeYmg00dJqBvGbLEPGOK0c
	rk1bT2uaFqyXd/QNum1bpj7GBI9VNjVAZyUg
X-Google-Smtp-Source: AK7set/1lzthIO7939S73+n6Od3aET9Xr2e2T1w0OtZbNcLUC9QlERbfb994Hatw8BUqyZHVdJlbtA==
X-Received: by 2002:a05:600c:a294:b0:3d9:fb59:c16b with SMTP id hu20-20020a05600ca29400b003d9fb59c16bmr10046463wmb.36.1677182476761;
        Thu, 23 Feb 2023 12:01:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8c13:2082:dde1:8880])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003daf672a616sm324270wma.22.2023.02.23.12.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 12:01:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/2] python3-gpiod: bump version to v2.0-rc3
Date: Thu, 23 Feb 2023 21:01:06 +0100
Message-Id: <20230223200106.35281-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230223200106.35281-1-brgl@bgdev.pl>
References: <20230223200106.35281-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101240

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

One more RC before the final release.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../{python3-gpiod_2.0-rc2.bb => python3-gpiod_2.0-rc3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.0-rc2.bb => python3-gpiod_2.0-rc3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb
index 0a16ce06b..6af1542bf 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb
@@ -12,7 +12,7 @@ require recipes-support/libgpiod/libgpiod-src.inc
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "1b931bfabef897911e59d45c80b8930c43fa72f08aab9c03e8dfd4005881c09e"
+SRC_URI[sha256sum] = "1d1756d465525deb668526571dc6ed7e08f7b8e7745b10fc028208a22fb7adf8"
 S = "${WORKDIR}/libgpiod-2.0/bindings/python"
 
 inherit setuptools3 ptest
-- 
2.37.2


