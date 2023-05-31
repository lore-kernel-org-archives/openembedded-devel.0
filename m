Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DF1C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.9098.1685521513455773069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=hNQ6Aihx;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so6135786e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521511; x=1688113511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=hNQ6Aihxh0U79HYqpReMzzRPXP29KsgSTST3m8xtCWHpHEGrw+rQsSK9JsE5LogPlJ
         pbPtQm8k1XncxS+kX0YDoVZsyiGbFToTtMUNmP9g1M1PkvtCqhpd427IptBk+68McLmL
         54TOga0zAyz1HBjdjgl4skquZtVV57KNpmJOo8Kuzr23W/oMvpaEFeUgSq6xdcGqNvFX
         jP5SXzylS6QLqYCDLEX0eaWZSjuPfI/254xJowRPx1iXgL5EIiW4bxSjWmLan+Z0DyQB
         2izoD4HtPVoEmldzygLYRwl82U5J0hA2SYphU9T9xja2gtyM10lazFyC2HodriX6/ktb
         bLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521511; x=1688113511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGaYEXmq7ygUBXIyGHbRAM250L5wrkFluS93Yw2Nuwk=;
        b=SEx4bze4huLZOEHyi+BhVSQDQ3Jux8DRHHhzpizDQIGO/kjzdHNC8eT6zAtzYD4S6L
         x2pIKCqiB+rRqx7JyVrrQhahTCNalZ0P+PuEZ8brqQrz359LG3orZVW0U0p401fAYwBk
         YZFsIxxelCRhRvlZNshksDyLe+jT9HPom11wKyAKJKwAxNduUsIMpaFhbusCNRXW/96C
         2MDa3rVy5NF/IK5SbouN3K2YjgtyTwfcTPLekLMeFKlMUJx8gBsXDwkatuyDE2l0p3Yi
         m+j+mPPFq6z8Yp9ccRAtkoHM7FYZPQjrhEMtamfiaTcZvxg6lg6KR7j3eddJHnlnM2rQ
         7u2g==
X-Gm-Message-State: AC+VfDyHYAo3MB3G0e05+4h+4wj1g+lY5TbFzYq3sA4FpLik1BeU6Sft
	sE95RFAJ0dUW16kPQKS2qftLZw==
X-Google-Smtp-Source: ACHHUZ6eIcE89J4itHhHNnfkvPLH6WRYxJx5rFF1M/jQz/u3u04O9Wo7Ul+k1rx60s1I7aJWagrBbA==
X-Received: by 2002:ac2:46d8:0:b0:4f1:42ea:c242 with SMTP id p24-20020ac246d8000000b004f142eac242mr1945691lfo.3.1685521511387;
        Wed, 31 May 2023 01:25:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 004/149] python3-pywbem: don't use PYTHON_PN
Date: Wed, 31 May 2023 10:22:12 +0200
Message-Id: <20230531082437.10646-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102931

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../pywbem/python3-pywbem_1.6.1.bb            | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 8b0383cf6..c84576382 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -21,26 +21,26 @@ SRC_URI[sha256sum] = "abdbd6ce08b6c597cdd6c7730e6b49a842d913f2f6b3cc62b585c58ec3
 inherit pypi setuptools3 update-alternatives
 
 DEPENDS += " \
-    ${PYTHON_PN}-ply-native \
-    ${PYTHON_PN}-pyyaml-native \
-    ${PYTHON_PN}-six-native \
-    ${PYTHON_PN}-wheel-native \
+    python3-ply-native \
+    python3-pyyaml-native \
+    python3-six-native \
+    python3-wheel-native \
 "
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-nocasedict \
-    ${PYTHON_PN}-nocaselist \
-    ${PYTHON_PN}-yamlloader \
+    python3-datetime \
+    python3-io \
+    python3-netclient \
+    python3-ply \
+    python3-pyyaml \
+    python3-six \
+    python3-stringold \
+    python3-threading \
+    python3-unixadmin \
+    python3-xml \
+    python3-nocasedict \
+    python3-nocaselist \
+    python3-yamlloader \
 "
 
 ALTERNATIVE:${PN} = "mof_compiler"
-- 
2.39.2


