Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D736C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:20:33 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.19545.1718799627330535400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W9UanZNE;
 spf=pass (domain: konsulko.com, ip: 209.85.167.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cc5d5179aso2050082e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718799625; x=1719404425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxXmqI72wwOJsMHXgI1Zj5K6BUtuWibykjv6GnHMaBk=;
        b=W9UanZNE65xs34Yvt0fX6XsYHIBqqrwKNCzpOIWruQg21cDkK7Xv53eZ08mz/Lnniq
         VLXymlzqVzi663uC8r7LHiaMS6WCMJ5ScisRkZWspS3/C8APmGyeW6ZI7KH56oo4DPFl
         aluao8RQLfhEI7hXCTW7HTS5KtndsWosCrxIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799625; x=1719404425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxXmqI72wwOJsMHXgI1Zj5K6BUtuWibykjv6GnHMaBk=;
        b=EzbgmR5qo0hWevuQVrBpiomGZJnAMit+yJcy341ya2XpeRGj9DYCTD9udFvtz/inzX
         Thw6yFOaQegTv3njcfwmfySYLzvkgl4hfjhn91gvELsyx20u/+KNUmAJnHBCWsZSapCY
         yv6et8cCJmEZLcYZzWPbGH7BVVEDFfkyZWmpfQF3XmjRfFxk+bFtTWMDhprmqYma12A9
         Eno9S6umN2ijLjoBunJSjXnEEI+AwF+jUy6LAdBYTGQQUGzMjO/n7AsCvWjExnB4YYZv
         dPINqJ3eWiOTWUyPr/+h9TxQPBq/jhhgKLyiYtFxLQT9WV8tz8/2Mu5B1da3Y4lN4uFb
         Xflg==
X-Gm-Message-State: AOJu0YzWzM3LRN8OIM1w4zwOX/zl3gWGbEBWNDY2S4iCuO3TEKnC4MWP
	GmshorxaQa5VlwKotEmt+tpCi+4VWKzc/mwlo5rYCr5p395qucUIP/xiz9iUl95B7Tv90sJgg0b
	d
X-Google-Smtp-Source: AGHT+IGJ7pEYLc752uXmMgQgx5tQy/+TuIVq7KOYOi9naga50fJRq4KgkNOOYI98QwCrP5PvSQwkig==
X-Received: by 2002:a19:e01a:0:b0:52c:bd55:5b21 with SMTP id 2adb3069b0e04-52ccaa33e30mr1472300e87.24.1718799624961;
        Wed, 19 Jun 2024 05:20:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm266329885e9.38.2024.06.19.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:20:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-paho-mqtt: Upgrade 2.0.0 -> 2.1.0
Date: Wed, 19 Jun 2024 15:20:19 +0300
Message-Id: <20240619122019.529213-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619122019.529213-1-leon.anavi@konsulko.com>
References: <20240619122019.529213-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 12:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110966

Upgrade to release 2.1.0:

- Make transition from 1.x to 2.x version smoother
- Fix "protocol" property
- Fix publish() a bytearray payload
- Fix some type annotations
- Fix loop_stop() not stopping thread when called from callback
- Fix some documentation errors
- Add support for Unix socket
- Fix flaky test

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-paho-mqtt_2.0.0.bb => python3-paho-mqtt_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_2.0.0.bb => python3-paho-mqtt_2.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index e4cf77a13..0c3e6e926 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -7,9 +7,9 @@ SRCNAME = "paho-mqtt"
 
 inherit pypi python_hatchling python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "13b205f29251e4f2c66a6c923c31fc4fd780561e03b2d775cff8e4f2915cf947"
+SRC_URI[sha256sum] = "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4f7c3968fc1723834"
 
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/73/b7/a4df0f93bbdae237e16ba402752151eceee576cbe80c235a2475fbf81eea/paho_mqtt-${PV}.tar.gz"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/39/15/0a6214e76d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.gz"
 
 S = "${WORKDIR}/paho_mqtt-${PV}"
 
-- 
2.39.2


