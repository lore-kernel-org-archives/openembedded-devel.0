Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB51CC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9075.1685521581761215997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=1qWn1w6y;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-307d20548adso3821856f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521580; x=1688113580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edrH4+hq9+LODJ3dt9slp6otq5H36oX+XR99TLpMA5o=;
        b=1qWn1w6yT9ll8vaDQmL8ZADCrClB+F/2S26Y7kFbpURatw6BgGqjt+FqLCUMCUBbRG
         VPkALrqz5/kTk/AnixcFm1YtXu/pVGeae/LUqfyAzBayo0ajq5VMQeSoA9TjrjM5N1rm
         erdWPUonZQ0wQBaLEW/JvSye0+gYXp03ZKuJNSAN/tg5wT81Ft5+Ov52s+qjcm6RMZHS
         cV68sOHm33oT0cK2ms47daQ9WSCiu40yPq/xPNF54KUAxU1OPiwLuNAej3kTd76O1ZJA
         XctjNZWn0EDh2+7oMxszH1uLB5R5m0y2BmrcBfN1xCadBG0WHC+a5DEDdtfPK+RQdARR
         jPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521580; x=1688113580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edrH4+hq9+LODJ3dt9slp6otq5H36oX+XR99TLpMA5o=;
        b=GypHpA5sg1pGwVCx0QMfgTYH19PEpeVoRPiiENalWqRSLJVu3U2zaMZW3EII1O/2GN
         sB5T6zjn96kVcL0nZXbmhzYZFANm92K63SHyDw17BY3bbI1rBR7VZnos8WosC8paIYkl
         pmyfpTfOq8vr2B12k+Hly4kdSvn9iBcxobcrOJzzBXJvYQgrNVFCAH7qKDoy7MDPlDw3
         jNbQHIsJ7LfbaOq2JCtKpDEThBzzbdypeJSPPLBPvLR4N+37aWW3MNjnIW9LqhnALvzC
         hz5Ea5zcR/RYPz9L+lZXEZFYUmjUaSJdz/RWHSLJFW+Cs5EIQwCDTv992hylWz1bqXuj
         4XHg==
X-Gm-Message-State: AC+VfDzKq3CyGFiOgBFDZFp3gvzpN7nxaQZChRcEx1uPOiQQM2SHDC16
	ezDN/Zc4Jd+/7H2CJ8fmJVKQ2g==
X-Google-Smtp-Source: ACHHUZ7dE3S4iLDZJsRhRsXqgTQdVa8zyUpTNzE4eBNds4cZpLL0mYua5zbcqMAHK6dRtlt92rpTlA==
X-Received: by 2002:a05:6000:1148:b0:306:2841:7abb with SMTP id d8-20020a056000114800b0030628417abbmr3002113wrx.20.1685521580335;
        Wed, 31 May 2023 01:26:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 066/149] python3-pyproject-metadata: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:14 +0200
Message-Id: <20230531082437.10646-67-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102993

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-pyproject-metadata_0.7.1.bb              | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
index 32938421d..9887af78d 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -8,3 +8,9 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-logging \
+    python3-packaging \
+    python3-profile \
+"
-- 
2.39.2


