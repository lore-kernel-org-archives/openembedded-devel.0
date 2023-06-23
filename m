Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658E2C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.214.1687531227659647557
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=pgoAIPMm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f8fb0e7709so9101675e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531226; x=1690123226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7gtqM15RlAxxbLOLVv/25y9t2kL5mzWjUDaFsA37cQ=;
        b=pgoAIPMmGl37znoSFnC3wgAftZ/LlzDtRTvhL5ZXAnImIBg18/Il9ZhY/MTPEscdns
         czqmQjQpoX5hjkuuCow/eR1H380En/DeCrYCoXPDMCnzNlq7q+BI3LK4pMvP8PoqEZEg
         XAb+zAvVl0mOudcbIHetilg9Uqo/rtzM9a6ZP3Aq7wGhfJB736LQDpZ01QJrAxUkJLre
         LZDLgm3dLgS4tUU1HawmuWu9Yc7D+i2KCVCy78/rsdXS168OarOtIM5B8WHJIweMP1rA
         2fsMVRHKD7r+uJOEd7SjGr9HvbuWfM0ruDDrkWnNjeHk4s5wwXFBaq2hHVkbjy2yODbf
         hx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531226; x=1690123226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7gtqM15RlAxxbLOLVv/25y9t2kL5mzWjUDaFsA37cQ=;
        b=J65iahDCuqX8HgzaiVY0Y5ilt6kx6yF7jo795f/fQ8B/sNU5NM65oJQSwyrihhf2yG
         OaYhmVdgMMG+n/5WWBQKGQkee8bB3t34YalEV8XLKn8ukbEy/DRYyavMnPFMpWFOkUh1
         S23W9G5FZodPugUSdztDfQSWEsgqg24JsekfLllJoCWBFSHORjizL8qyQQjoEW6k6UYW
         ivyeM73/4OtbH8A4AFx0GQwSqvi5vDmMmjQ/Vdj7lTkICy+QIXVWZ8QuAXw+/I7r20D3
         +Hu0VcXiMK8qAbDBhMHV+KGKj7NugrXRGZJmZpQtM8XWhYQBjlFzsBj8MCpkcjrxj+CW
         8ckg==
X-Gm-Message-State: AC+VfDwO8STpZI1acdd24c6CnAeeVGbFBi6E8voDv7dRWBGlC+NTxtXR
	21eP9M3DYbTZ06IBn7jkiEJY0w==
X-Google-Smtp-Source: ACHHUZ41bbIDODILu2gZyRBydfdqrDRmrEAMQRuVwg/V0LrK1fkxtxrq1YPyE8PkqB0RMCHo98CsUw==
X-Received: by 2002:a7b:c3d9:0:b0:3f9:b0af:d9c5 with SMTP id t25-20020a7bc3d9000000b003f9b0afd9c5mr11659088wmj.14.1687531226179;
        Fri, 23 Jun 2023 07:40:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 52/55] python3-tzlocal: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:18 +0200
Message-Id: <20230623143921.146338-53-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103548

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


