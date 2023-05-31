Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6CC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9127.1685521562391436468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=tEESFxpX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30af20f5f67so2358615f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521561; x=1688113561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7fdsU03Gz+HIpRYFumL8nLaLsgvpenXgetYsDte4SI=;
        b=tEESFxpXXW3oL5kwZngzssRjRyVxaCQMYq48RoUA+Hb/Zago2uSI6zYqLNjpCEdn5v
         roVvkIY26YIszyw0qtNC0SIIvlc2DnpTkVxfrf+6UkOYU7ry25rX2H8BZ+JTDOrY16Ra
         eGcIbADk3TAA8t9zpZOsMr339tPmawzSBUPuVcc03j5BMKYGSHNyWj4H3h6D/r1g5Jwk
         DdCzwLRgSbkLGEtl5RXerC+lrvR4uOlllMASuioGa6MGzjy4YdSv7nZCHMVGhefKV8j2
         5Vi/2Up1bI2PQLq7E8Zi9CIW2a6z+lHQix3cYnnC+VtQpVM5pLuN+k8Hwu8+qaOb8Uqt
         Pqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521561; x=1688113561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7fdsU03Gz+HIpRYFumL8nLaLsgvpenXgetYsDte4SI=;
        b=RMLKigt3jtLX2GP3SvjyxXMHOf9SVeYvimJbgFL4yfFr6StCWOTBMV85BV/JzzvGDe
         y+C42HMIQpW3d813fHoiK7cDXa2H3kil/Ma50lwVcUdP8Jh1MTJSLIybHAy7m2W2cEci
         zGzcC2VlpdccWYlrx/ElitqMv4tybSGKNDx09HsH1Zxu0axnMkS/mSSnRfQ38WH1bJkb
         hGGFDn27wNNxE0LZTXBRWdrWTCsqEO/UTSdHBgSlXwBmmQivr437te/FAwLpHhq2DDjP
         FeOuroJ812yFEhvfIEqSYDjXlWINT6dLhts80iqUgx5mn/lR6SsLkv56xnWx3a/zuyDg
         vhcg==
X-Gm-Message-State: AC+VfDwoQBD3jFcTRvwVspsiOueMRJP6TjKf4AzR3JTP51cGHPemYBwr
	xaQHGS/oXy3za5ycUjcg7BywPg==
X-Google-Smtp-Source: ACHHUZ69jqezMtmjuyENhgjfkqPHhdPhMmzUbI1fhP5ErEMYHnDPiO1EOwpLBNVaoYaldaE/CwNhkQ==
X-Received: by 2002:adf:f4c3:0:b0:309:3bc3:7d1f with SMTP id h3-20020adff4c3000000b003093bc37d1fmr3213048wrp.70.1685521560966;
        Wed, 31 May 2023 01:26:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 050/149] python3-versiontools: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:58 +0200
Message-Id: <20230531082437.10646-51-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102977

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-versiontools_1.9.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
index ea40d5f6b..02639b590 100644
--- a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
 SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-setuptools"
-- 
2.39.2


