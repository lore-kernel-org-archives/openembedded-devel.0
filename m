Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776B4CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:17:39 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.43439.1760361452984486026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nOk9c+Kl;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b00a9989633so798546066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760361451; x=1760966251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUL2aAgC2h70Zf2NIQ98sSR04vGIEp45XeLCzlg2H3E=;
        b=nOk9c+Kli6lMwebVQ5HBd1gH8KEIOoz0Kl5qp0n6GM+siqPm/VMx1ecuk8JNXH/r8w
         yCoCoUt783RLR1aekuG4tcn5TgtUduaMpHCJXJeAnh0UKIS4DdYKN/Yc5aNuFaa2dUKc
         Dq3JulHmuR8t1sbto8xu5a/lGDiDdtjXYzOJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361451; x=1760966251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUL2aAgC2h70Zf2NIQ98sSR04vGIEp45XeLCzlg2H3E=;
        b=LOCnHlhygyxWQFBAdoWLsVxlP3IdiXwOy9dwzLvdTZwPPeG0Vv7eQcV120PxBSsMjP
         xCk5XuifP+gLa6h/My/KBMRbjthBMApPIeN0iHG/fD9dtB4jV/l65HJjt3HVxJ0QMImF
         6iLGJf3mmMyXbcQBWDhD9FB+tW1NS6vr6F806FIuWebP6I+Ks51UUIaRrRm5j6ly3wVU
         4G+zk7bcJ2SU2i0Lr/GtgVgD2gzeJD+tw1Hfj/RHsA5rWyTxdc3yKCWFbv/srzmm6WUO
         Dun2qF3u+M0AmheKEPf5SGNpEeufoGsruwSFgVek5sfK7q6okTX5cjYrotbuKoENNdZ3
         DoJg==
X-Gm-Message-State: AOJu0Yx3mxICW/RbhDu8Vcm0vA7UPl4d/ONPMWFw3q3iSWmto6+K2T0V
	G3YR74CGRW4fUgdPrYmrP5+MYACjlYpixooROkoYxtJmVTHz6VicSlyLTAiuN9XzCBhY6jbiIZn
	PlWCu
X-Gm-Gg: ASbGnctI30fJ1J2uM5Gk3Q1b2t01SMK7TwfI3s3M2MXiN7MIWqSSyUvQE10aguj9ceO
	aMUkrMosZApKL5Vwd6kjJrwSQ4ndko5vtW64D8mEh1BxLAoG0N2gQFRr+N9GYJ9zNvRNgSL7sHa
	WHY87hH3wCd7raCoL7R+DxjCaVy2j8K8XZSyzTe9Kov1cr7Wp64lZ1FiSse5PhAzBx0cqx0kfhl
	TqLAa2tA1mRJrYOhvbqvwV3Y9UmuqsiCgI+pHFTTGD9qMfxnSbFLBH4KI8Agx4sRPJphj5wJNUY
	bPnbnet8mWXx+8O5Q7fuuhLxGosEm6kL1CoexGm0g+IK0ZC9E07CgwOiAd4kHMuAjIuLP8IsTmz
	RXZm2mjBPlEhjmL5L38+vkUy2SSmjHpi3cH+O1jHwf1wNlwsZFNplORg=
X-Google-Smtp-Source: AGHT+IErAosUzMnVPifkmlHt+gYo4Xd8NRXBuX6mhyohMp4TkBT/WtYVpCQSUDgPrdSF2LdP0iPwBw==
X-Received: by 2002:a17:907:18c6:b0:b54:2c82:40f1 with SMTP id a640c23a62f3a-b542c8241bbmr2119468766b.11.1760361451096;
        Mon, 13 Oct 2025 06:17:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d952a273sm948768366b.83.2025.10.13.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:17:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] pydantic: Upgrade 2.11.7 -> 2.12.0
Date: Mon, 13 Oct 2025 16:17:25 +0300
Message-ID: <20251013131725.2583786-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013131725.2583786-1-leon.anavi@konsulko.com>
References: <20251013131725.2583786-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120531

Upgrade to release 2.12.0:

- Update V1 copy to v1.10.24
- Add extra parameter to the validate functions
- Add exclude_computed_fields serialization option
- Add preverse_empty_path URL options
- Add union_format parameter to JSON Schema generation
- Add __qualname__ parameter for create_model
- Do not try to infer name from lambda definitions in pipelines API
- Use proper namespace for functions in TypeAdapter
- Use Any for context type annotation in TypeAdapter
- Expose FieldInfo in pydantic.fields.__all__
- Respect validation_alias in @validate_call
- Use Any as context annotation in plugin API
- Use proper stacklevel in warnings when possible

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.11.7.bb => python3-pydantic_2.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.7.bb => python3-pydantic_2.12.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
index e603e7dccd..8016b55dfe 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "9b52422377d974ffc3de4e8b0bf7faab1acf2ec4"
+SRCREV = "a7928e692e5a7841c4379d1af1fd37966941dade"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
-- 
2.47.3


