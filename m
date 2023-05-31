Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F48C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9132.1685521575001045183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=zCsQiJva;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30af86a966eso1183052f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521573; x=1688113573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaJLcjlVgIwDtAmvPFIDK8E2RaNxU31h6haXrsL5oiU=;
        b=zCsQiJvaciXLprW7672KcCCLVgbEyaWxF+CSOnNvfDSEs/WG3xTHGgPnwTWBaSnTte
         G6lXC2BShO/sHfW3D4oHlLvIkKWQk5fRYifAnNj/lcfN156XAqDlT3ZvjZJVZQ5nBVEm
         9NYV+5bv9squgEIfSCRLmPfbSxKH0wUcUYcFyp73NTqDI4e5MlzwaY6hj6eV6+iuh5IT
         n6NHy6YlgckDO9afjRzam/W3N5g7b/neR5G47u/E4KY4/YSfhPpzgtoLna9bcQ0PEWe/
         LM7zmv8HouUqXujujs/XacRl6HAiFalglFVO4n15x+48XnXaOtdDOfmEJoL9XB/LI0sh
         VXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521573; x=1688113573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaJLcjlVgIwDtAmvPFIDK8E2RaNxU31h6haXrsL5oiU=;
        b=bmtaQlEMV6+jEOppoqszzofkg3gaPNKCsfpA2Y9n2JuVT0voMSr9/RGKFnUCQA6xmo
         MFHEqiqQlVdu3s3GsBvVestRDAX7NFWBQsWSbyAduEGbT5El6OI7PTxLSlG0PbUtJEqZ
         V4X4ed1XPeiGVp+EKKO0iG01N55XJ0AE+xX0JbddISwS9bQhm+Tcm41PaEp9428hD12N
         XfTB7Q+RQrZ+4mCrPFBMcj0koAbfqlhyLtbZceuwsz18/UJddWH26uwKCj45DO9/QWW/
         2t4ufzc42oaW8sPupuPxiRpGagXdUX8d2t3dl8GRvDB5YPcTsbi9I0yPc/Mz88TSZ4f7
         XepQ==
X-Gm-Message-State: AC+VfDxnDTXLanKK/MmBgzlcHboryLOaN4+F8bLwEkcukOB6r/eIlQ7/
	BZGGGT2pNqWcmw36qY1YW9XZr5Eop6cfMA32ka4=
X-Google-Smtp-Source: ACHHUZ4zay47P6Rm9mqxxMH3xwBIApoeObQu8qby5eCyw0Cx1bwrKUfe9vwS4UbYDpIVLd8lBqLffw==
X-Received: by 2002:adf:f00c:0:b0:306:2a1a:d265 with SMTP id j12-20020adff00c000000b003062a1ad265mr3058422wro.58.1685521573591;
        Wed, 31 May 2023 01:26:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 060/149] python3-pypng: new package
Date: Wed, 31 May 2023 10:23:08 +0200
Message-Id: <20230531082437.10646-61-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102987

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

python3-qrcode has a run-time dependency on pypng but it's not provided
in meta-python. Add a recipe for it. It has no run-time dependencies
itself.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pypng_0.20220715.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb b/meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb
new file mode 100644
index 000000000..9e30f67dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pypng_0.20220715.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "PNG module for Python."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=5b60f319c8cf51f825b4f40aadee3243"
+
+SRC_URI[sha256sum] = "739c433ba96f078315de54c0db975aee537cbc3e1d0ae4ed9aab0ca1e427e2c1"
+
+inherit pypi python_setuptools_build_meta
-- 
2.39.2


