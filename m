Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86D9C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.9136.1685521588666026683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=yKQfMzSV;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f60e536250so4865385e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521587; x=1688113587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7bUwVs/qVMdHtRUFa9h+rhOfmqryTpwOmtUgOm9NmI=;
        b=yKQfMzSVIsJW8cgGdjgoAMBvtsANH1VwXZOZSOwqlW3z7QxsKdtFPbYaqyFPTa8afu
         L6Uv4JrKFFzJeH/ifYl9B8lg2q6hN5V0TnhfatGPMMfm9IN49ZjVbel+/K+z2tuEcItK
         k0ZxX08HNZhAfUYZ5NvmBOxwbsuxgnoU9yfBJpqeVjAR78BnKJEcRYrIYbhxQpx34K6f
         XAPP2F1Qh47X1SvMX8RV4nIv19WJUHVO9bYinLbuE37LHLMX86TToDCaFeVl5bugc+TV
         XUYkAHKqw9+jDCL94jymWsB+TOIhVG4LqOuq3cx10aRoZAtxGfZsQUCREtbsez1mJU9O
         I1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521587; x=1688113587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7bUwVs/qVMdHtRUFa9h+rhOfmqryTpwOmtUgOm9NmI=;
        b=MnOjFJBEk4Uw3wxX3SChW9XTZJJkkvruI+AKvutvM693sY7fGVO/MwTb1KGkG94M2B
         st47X09vvhVI7jSMJT03DUKgw0vg2QhVYylxp7XMn7QMPLv7BhWc12BJtIr7/RslTHky
         vt80UpUulWH4QOku5GnmgtPb2BWIZ7EMn2o2ulym+upZ7E2f8QFMD+cIVqRxalawvpjR
         gGem6eb7tHc2qiwnJABwkHil/EAQSIyixwvF0fYx2wciLTZvGIzDoUxIRZLMFf97uAuK
         pzge5NDdBSN8WoFuAun9zkDJd+GB8CMmlYuNy+ttq4RzMwHfVCSyAEKkQ6+bmxorGBKv
         wPEA==
X-Gm-Message-State: AC+VfDxVOaf7L7nu//a8fzndNVo+SweAUfPAzr53I2zigE238JfU58oS
	SrkKnpp8ND346GtuXBv3czz/cw==
X-Google-Smtp-Source: ACHHUZ5ZgJS0LHuMocuy+fjQZvC3Ete6pipDx9bzeof14lQDRTKgRZovAKfRWVid8nkXA1FM45U9/Q==
X-Received: by 2002:a1c:7301:0:b0:3f4:fe7f:3d18 with SMTP id d1-20020a1c7301000000b003f4fe7f3d18mr3875905wmb.2.1685521587245;
        Wed, 31 May 2023 01:26:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 072/149] python3-pyjwt: stop using PYTHON_PN
Date: Wed, 31 May 2023 10:23:20 +0200
Message-Id: <20230531082437.10646-73-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102999

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2, so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
index e1e335869..03cdfe6dd 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9c
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-cryptography"
+RDEPENDS:${PN} = "python3-cryptography"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


