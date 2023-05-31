Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F8AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9115.1685521536521548193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=IprMBIby;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so5485901f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521535; x=1688113535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUh+yq3fKNDUhLjDNktPIEQt3i0GGcaAbosALF2fiLg=;
        b=IprMBIbyHj3MURCrQp0eBQYC4iEpmLQCSklLFk337SkCELdJNCjyFivyQINv/D1lff
         6Zmlh9Oh1sIVIZkom6SToyf+agmxL6PyM554sJ4D5a/8m57m1X/6m+ghKxaSOPQBgND1
         Q5lget68rAJSjCNKGgaC3mOfIdGsbuW4W/6pDZLwPFXWwBQ+QtLL8q5M2iRvmuXrQVTC
         oGDLsHuMvM9HR14jJV6CQUKQg9sBLD0yR3FZoAYR4LeI8aYXsDQwNSmAz37X797LgUE8
         MXxKGPAT4HhuZ/8YXbtGW/ZrSyl20qJGu37cqR3OuM9LEXekI9UYQJhxePYKRzgWUq/v
         jRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521535; x=1688113535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUh+yq3fKNDUhLjDNktPIEQt3i0GGcaAbosALF2fiLg=;
        b=lSigx5vE4DPdbkTJ9QCdzlt06bSMY020WmstwGO3z6om5kTMR7g8tf1oPDx4rBB1E8
         pXL0u6w3iF8kMcx8rLCvXMARcGMJv30LhY+PTcqxf5RlRkPqsNJvsYIpUCuQvZ2w54Rp
         q2+QdteiiHXS8Oi9WOOkdHWfn8ktAdgy+XTTCWAqAACkvs0VAm5KlPHDB7ZnSUR7od/G
         hpUMaa9RemJ4aihpaoWxbDnG0qIHjOpyXOTLhYwbDGVNI93bbXD62hBnEd3wcQO3HK9B
         MhgAQ608E+xwddHV11J1+5TE2ZEY+6TSYk3VM8/V5nZ2ptFyjRtRKbdwjJZhp7FZZWL6
         0GPQ==
X-Gm-Message-State: AC+VfDzoSevDRiRmvFxlkVEwehsuLV6PXNgOra9eKTbbFcEfaY3s9M2j
	Kb9vsYgW5T05SEPALmacrbx+E/8iFkPhodpo3/A=
X-Google-Smtp-Source: ACHHUZ5N3Cam5AxbhJBPLCosy+2Rrk1sdZcrX6fMZA/bjGU/2+nkTfsQTXE54b13AM/b9yaCEu2m7w==
X-Received: by 2002:a05:6000:1287:b0:306:2b2b:8c56 with SMTP id f7-20020a056000128700b003062b2b8c56mr3275607wrx.37.1685521535067;
        Wed, 31 May 2023 01:25:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 027/149] python3-sqlsoup: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:35 +0200
Message-Id: <20230531082437.10646-28-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102954

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
index 592ba7204..e7f329e9b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
@@ -7,3 +7,5 @@ PYPI_PACKAGE = "sqlsoup"
 SRC_URI[sha256sum] = "2fafb7732a663dcd59b37e64d1c94d5fb20d4fad32cd8ee260aa1cd9a10340d6"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-sqlalchemy"
-- 
2.39.2


