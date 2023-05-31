Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4E6C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9117.1685521545500770069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=pLOL+1fJ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30aef0499b6so2273304f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521544; x=1688113544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SlJ9dtiVpkwiGyT2919c3zg9n/1i0N7hNsLn20+mxI=;
        b=pLOL+1fJlWGQKLC+C1dLzd2Edt8sopDgk4k0ZEDKGBqLHOWgoC8E+YyJwbPyatCkV4
         lHLGxMI4oQ/oI658ZvUzI25W2a64bR1FJfC1ZhxzNNeDIvVlseBoH3au1nU6dAeohJt2
         xdL/TctJwTSkvPbt8sP61du6LkFt/io+6zVWz8sjhegvj+FBZh6Q6OHONfQk1Ol/l7E5
         zIUsga7IlNCkzddrROz+qy7o29gPFcxqCOkilkEZexKPSXQykDh+C0dhEnkhy3q7SYiY
         9zf6Cu0AdGpb+A7qCmGmtAClaIZNV3Dsz2yEJKV7XMPJtqLwJADpKRPGNcv59ZoyoSht
         uAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521544; x=1688113544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SlJ9dtiVpkwiGyT2919c3zg9n/1i0N7hNsLn20+mxI=;
        b=HyQIUS5TtFr63S+eCvfz7V+EGx9jOodbDETVCJnJp00XTRC7+DHhJ3o033uz1jpzs7
         b/JoBjuHs+YIcp7l40yreh7G+451ZZASJ3HI8sWo2VaVk1rH76GJHOF7SNbP1d5B5C56
         Ex18mv9rCxprussZANpgMio7s8TURJ6j7sleKK4snRcLM6Mb925n2KTYezEF+DN3Pie4
         OYoVH+XcrGftKmw9csfdzm48jQ/B1r1OxWa9IoOlSZUaV6qgj2U7V1BM5tXf2HsZyKC/
         7mzwjCsd4jehWhY1tnVw5PBtLnBGlmUveut2erw+6Z6UqIXYJe9/w8taPsbCxDm+X/E+
         f9EA==
X-Gm-Message-State: AC+VfDxz+ex8OlS4DK0fhJlqHZJ+4bGWre/DxtN9GmgIDqTROo1P8Ccj
	6VfaNrXXRdNqvvMhznmdDVw4hg==
X-Google-Smtp-Source: ACHHUZ6E2WhCO9uDyG+XoyTfY+5F8FnyeusdE8iVs3VDnw1QbhLNJQXwqjAg5XLM7owahwA2lp231A==
X-Received: by 2002:a5d:4b43:0:b0:2cd:bc79:5432 with SMTP id w3-20020a5d4b43000000b002cdbc795432mr3490768wrs.25.1685521544101;
        Wed, 31 May 2023 01:25:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 035/149] python3-thrift: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:43 +0200
Message-Id: <20230531082437.10646-36-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102962

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
index 93b225348..9bb305388 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
@@ -11,6 +11,7 @@ PYPI_SRC_URI:append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
 
 RDEPENDS:${PN} += "\
     python3-logging \
+    python3-scons \
     python3-six \
     python3-stringold \
     python3-threading \
-- 
2.39.2


