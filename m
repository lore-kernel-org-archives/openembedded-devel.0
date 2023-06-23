Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8546EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.179.1687531175283855670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=CH8aNog9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fa7eb35a13so4355125e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531174; x=1690123174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=CH8aNog9LUa6xXtNn/6GJloiOajNlFl/z69BFgnO8TV1L4y0VnGnwyMg6es1h3OnIf
         csqn7pPtFc4EU4es2/hrawIw45ftx3iH/s7IuizoQGIvrdWCepljDuetwnwiOgR/jNoe
         Mx2lwv9aj7nuskyf7GmnE5ejckNuHT/vie2kF5GtXVc7GGc0GIBIHuLn9dMRaeOVxwNv
         G4yLqPQ+ByOaqQ8lu7IsfiuNHKcgv8EYCQQZdqdlakGJ/gbna7HBkRWxCN6ZxgL1CnlT
         Ha80xTMxEUaIcMpCvEpkPSLQ/1AaIArtL+9zfU7W28DJ4OZ/tvCtMeHzXHk1lzubreWH
         A9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531174; x=1690123174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=XWxXBG4XheqS7MZE5qBhKv9Tszk7Ea4KrG6ZCdGO4EnHSDUgs/rBtSAfipE8yCazOM
         0WGWBGphtGTtEZ+IpKIUFYGuP0laQTOUYEgdFeVWuW769aVpZyN8X3e23I+U1aSMw32m
         CdugD75ywc7u1rFhhHr3ZFR6zD/8cjviX2lgjqMIyL21AQENmvDhsASNPZYgri9aNaQZ
         agP/CANNb28HNGqgePhU6RweYbicOBUyvIukdc/t6ITXowt8eK4oJy4z1/90pFWNiGET
         FZEiuaKJDwhI4t2k0YqtqCy4zovqfIZ1ho4Z8ETNIi05+io4WiUPiSdhhHoEshJh/5Cl
         kXXA==
X-Gm-Message-State: AC+VfDzc5/27SHV6cA8adOEpBz/U/74YiDLzr3yvfscZBs6DIMMR1yY9
	cbnoDvnNhrNk+tslMo+wex1odA==
X-Google-Smtp-Source: ACHHUZ6TDDyxzY+T1oNvwycPMylplMaFr164nMip1nUFq75J3R5Ep2xq/Gt9yRtgMrtGAUzsmNszWQ==
X-Received: by 2002:a1c:7404:0:b0:3f9:e78d:8dcf with SMTP id p4-20020a1c7404000000b003f9e78d8dcfmr4339822wmc.28.1687531173648;
        Fri, 23 Jun 2023 07:39:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 02/55] python3-pywbem: drop unneeded class from RDEPENDS
Date: Fri, 23 Jun 2023 16:38:28 +0200
Message-Id: <20230623143921.146338-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103498

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The native package has the same dependencies. Even if normally they are
satisfied by python3-native, we should still use a global RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 71af06881..8b0383cf6 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -27,7 +27,7 @@ DEPENDS += " \
     ${PYTHON_PN}-wheel-native \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
-- 
2.39.2


