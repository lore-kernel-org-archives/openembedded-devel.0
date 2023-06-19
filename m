Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150EAEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.7435.1687180997037683000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=PpeXDJ36;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31121494630so4007467f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180995; x=1689772995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFMUSNmI+3lHGI3GXuzbz9owu5HBXEdUwXTBjrIZic4=;
        b=PpeXDJ36ZckXYinq0uX9YQVLgg0KG3H6cH9pRhpfHIX3381lCBsom61sVV2KTHf4B3
         S2w+OUfppPM8nauAwRJj/Iutf9p40dtY/EiZdZvMaZaCRytCtWHFFi18rn6mBp92frCt
         NcYtE8AaOxIjidcfdTfNKrB4c6KgftEs6Zop7zd2lsYoCN3RdsmbU++2iRNUe2pYqHP4
         Gx6kSm2SCvMyTNgsAKgGXWMAwPAZoV2KmBHd+HXAU5CltN5Ks8uhMnGj/vvChdZOJMAt
         LULqeZDKmkvjlGNisNhD/oro1pPcYYr+HXGmkuUcn7EthvGcdplydu5+x+O822k0d7r3
         pviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180995; x=1689772995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFMUSNmI+3lHGI3GXuzbz9owu5HBXEdUwXTBjrIZic4=;
        b=KhiYMqncqhTSyESXuzF9mV5y5B9ldG+HxoPn/pwf0cyh1mKpg1W6jTBQKKRJtuLfql
         DfP48fLl26AZGOF2TdmkoxZEV6MDnBHZsyMWCfI2/JX+C8FY58w+J2rFyvpfjcpSg4Mv
         3p4pIECt+Afeo0F8AZo5GB596zpS11QQ72XAOjWe73b9PHCQ4OXAjDBJxQqSvdDHdDz4
         Q1qMHlQpiPcl87zLhjj1YlXioH8jSQvdejDijCH95Q5hFmnnbq4Bswu89C2XMlBzOWPg
         ucooO/5jai5flerRVAILN2HNfTjFlLBqJCEQLay8MHx+HYih2wumveJFP3oIRL2A611P
         0CLg==
X-Gm-Message-State: AC+VfDymZeyCTUtNp30pY7QVMFtisyOYayICQ8Uswl3lrFOx2hsLi1EN
	wlD3ISqpVKX/qTPiu2Bg8gwaSQ==
X-Google-Smtp-Source: ACHHUZ7s9pvpJqVcHZa3OczxHzCrj7ZZHgxqs3Fzne3Abv47oLtlsInS/iPWOltu3i8fnMtTItSdDQ==
X-Received: by 2002:a05:6000:1008:b0:30f:c1f5:e91e with SMTP id a8-20020a056000100800b0030fc1f5e91emr8496986wrx.27.1687180995602;
        Mon, 19 Jun 2023 06:23:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 53/54] python3-defusedxml: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:13 +0200
Message-Id: <20230619132214.213417-54-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103437

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index 3396c7262..8ec6680d8 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "python3-xml"
-- 
2.39.2


