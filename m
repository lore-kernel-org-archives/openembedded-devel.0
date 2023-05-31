Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED62C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9061.1685521538688831426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=MDF4se56;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30ad458f085so538391f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521537; x=1688113537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/oT1M/Oy0EVzT4fhqqRdcQMtT3bZrKM65GzXTXiI1M=;
        b=MDF4se56LGG1hKflxgatAvW5LDD7p03DCTR42sBH8lXdNax343SGg6Ava07r2vNoxE
         /VO2cXeT6ofkK+up95N81b0nN0N67+JRL4mMeNqUZlxRjcprXVHxdTPEBxU7jTmWgFVQ
         sr3CL3uT7yYUhShxeHGsK6NI6KiB0XXhZNJWBygPyvM2+pqS80ZLh98gCU3fQYVCBojB
         l6FErxv483qEgRH09sj7kUS74OD/Ew+eir3M4Dgusu/h0FAUaAjz2CjHwMwrqPVZUQgK
         BzXWpAY8MqD21xZEBJ6b8wii1jLery+2q4neC09+S1nf9c0XpTuYgi5eAEa6mzOL3nt9
         WUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521537; x=1688113537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/oT1M/Oy0EVzT4fhqqRdcQMtT3bZrKM65GzXTXiI1M=;
        b=CV7kiUnBMEStbpuwactQRlyAh2u2B46H5aFLegAo7Np2lQ+bUSgTTucW79ET/CMYBX
         ukki9mnmV+eNyUhm1AlB1LhHe1VoLF4Mbr4IwCVJ6bOVVEp6UWk/SnngAU7oBjUnvDDo
         ZWfzNTi7zI3J4ivhf/gIxDV+F7VVtIRfm+VoS+BQnNhmaDNdXTR3wJL3Mn8AeN4aKC36
         tO3tssj1w8lyg0d/jra6nNtvUkMpeSZZYGCG4+Bne/T17I/8irNzPWOy1xyrrCdQskLu
         ZJ3gaj5Hz8XfFV4Phyijffc6gIjnnIya40qgZpE0fgJUTDEXk5HDNaQXi9mtGauFhjmi
         ycbw==
X-Gm-Message-State: AC+VfDybcDnV3HDKwjKM1KFyZsOGclfUYO+UOPW+y1xBBeBTCi5itJCK
	cOTfAHiSM8Ek23mJCNknkRujcw==
X-Google-Smtp-Source: ACHHUZ6PfucQeo41BAvRJ3oJfQI6HIu9lyDlHe3Wg8cKEu1sh7p3E+T/u864OX6xac9SfQgZhrP7WA==
X-Received: by 2002:adf:de81:0:b0:30a:d944:b765 with SMTP id w1-20020adfde81000000b0030ad944b765mr4101132wrl.15.1685521537240;
        Wed, 31 May 2023 01:25:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 029/149] python3-sqlalchemy: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:37 +0200
Message-Id: <20230531082437.10646-30-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102956

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-sqlalchemy_2.0.15.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
index b30437830..e6f0d6429 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
@@ -10,6 +10,7 @@ PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-asyncio \
     python3-compression \
     python3-json \
     python3-logging \
@@ -18,6 +19,7 @@ RDEPENDS:${PN} += " \
     python3-pickle \
     python3-profile \
     python3-threading \
+    python3-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


