Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2CEC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9077.1685521583787879806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=MFtVwpaW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30ae141785bso4566251f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521582; x=1688113582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2d7uT4x3RCZvOypOyR4ygawdKmFnxo/nd1afwVq/3c=;
        b=MFtVwpaWl+2xASgfwbqOluSDFJ/Ih5et0TOyYnY2gac1LhTPomqw1y2jQg1wwbOx7Q
         eNTM3GBBt5+AUbsEk1bZntsTCqQRa0ghw6d/gB60Xc0SHa2E8+LNGNd6PRBhdY7tI8QV
         dvOpi0fdyUvA5uUMcUuAX1MQ9kPzEZ4ZGrCiRfJLx/EfTLanR6vTn8MK7TbGe60CY1Ln
         QRxFYzuaWka+r1BP+T4IOVuMp3WcQwkVA8ZWRql3D5iuSZXUfLeXK1qVa4Pyk5C+l0io
         wXdhPoYHxJhDx54de9QH3912vkCeM5+7r1pUjBvgajc7Gb9fLmHeXVqHLgFzczvS8jH+
         rB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521582; x=1688113582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2d7uT4x3RCZvOypOyR4ygawdKmFnxo/nd1afwVq/3c=;
        b=O8nIlPTdONCO0cF+MKSDCCmPh8VdIs+590Cry7KIo7YNneUzivsHaOga7IO37phFv7
         Hr5p63bTFnn/RB+f31UkuHbi8omc0Ap86kaAxHHzO4hEPDaQfzpZa+FTacmVtbQtoM6Q
         84IecERD9HTn2I7DYzpaVWBxe1eYrtFF7NT5gt6c3ORHHSKsL6ukQELLO2TbwHRWczCB
         6ITTEJkupPe4rnMOKzYsiFqo/2FauSgfak72CYIYyhajma7gTTP9gPt5nhtY247fwAUB
         x39xWOOnNqQR3NdADAvcTmSwUi8f9PTBSdDOSCnNhdcz7Yrpstv+tRH9ppqGzg4WKFhP
         3I4A==
X-Gm-Message-State: AC+VfDy/PEF2XtLLCun1Pc2YNSygcOaS31RKzXTPFQePm5A/RdsApwbI
	hqTuqHrxM3ylrP0/zyA9cVuxhg==
X-Google-Smtp-Source: ACHHUZ7XymqWksPqCrCJj6WhBKSGPdgG6UwbPrg4g1vRBsG7t/1uS2nIWq90glleZjfXmdnN5OJ+Og==
X-Received: by 2002:adf:f312:0:b0:300:cb8c:fd8f with SMTP id i18-20020adff312000000b00300cb8cfd8fmr3333667wro.54.1685521582373;
        Wed, 31 May 2023 01:26:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 068/149] python3-pyproj: drop unnecessary run-time dependency
Date: Wed, 31 May 2023 10:23:16 +0200
Message-Id: <20230531082437.10646-69-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102995

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

libproj is already included in the rootfs as it's in recipe's DEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
index 0847a6e91..0285e33aa 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "9859d1591c1863414d875ae0759e72c2cffc01ab989dc64137fbac572cc81bf6"
 
-RDEPENDS:${PN} = "python3-certifi proj"
+RDEPENDS:${PN} = "python3-certifi"
 
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
-- 
2.39.2


