Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAB8C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9079.1685521589969639367
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=dmwU6acR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so5413434f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521588; x=1688113588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H504L/Q4kaMrotAeFOBUwg0AKEvyzR1sdwIbW7swYOY=;
        b=dmwU6acRb/+2ZD3KqDS9YFRJG9ffIMmke32JqyjDUyV7VpQg/olZ5xzIIaNj9oXtW5
         lfurhz07GM+N1Uhlt3IQpzCZDDl/hPiHUYycuhNO1KW2XrDwwkQQMVd73aJsAh4jTBZ4
         9A6E+c5TfI1miCOfkBntOfTU9e8Lq/quGwma41Qwf6XinPfCZ50GEa+oxQcOqUTRjXBu
         tR/+lehGfxP6be9YC3gKUhJTjougJzQNCWDGNnjvFm/OPP2hbN8mZ7JEMM+zDbEs0xJE
         hS37M0yJ9U+J2WF0Ds0FMy1yENuhTGtZn03QXrOzXTiFbMUHqvabQHFejq3VSmYPWLi7
         5fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521588; x=1688113588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H504L/Q4kaMrotAeFOBUwg0AKEvyzR1sdwIbW7swYOY=;
        b=GpTeyJktyhnqwlxaznIgR8LbK0ThXZ3lILRRlyBJ7XZcU5TqR0Nfe3kHfn1Fvl6Wdv
         dSIYD4OAPmq/cyIvhp8U7bHruVxVkIH/yeKILdM8QFNTyvlxz/gzC3Rphc5D7I7BCO+U
         AI7hhLhIQvQ5E1wmsVCzYcQs5KLkWGNmIjZ2NDGd+9BYCSn8h1RxOBrcDo2XKimRQRgw
         9YEve8/2381b+VRoFWa9E3lX0skmyQcN32EM9XxhFat4x0TFrELqsXUOCTGn4oqJJQse
         WZYFGbCL7wjI1AEZqy90XYhH/28icfILhknvaGu17y029GHvk+Hu5/sRIFX6Bx3wcen9
         yM+A==
X-Gm-Message-State: AC+VfDyOxSNOJjgU+TxjP7nWJ48t8DmC+yHf4zpUl0wBvug0ckLv+6KY
	kqf+RgeYSIkPRiDqWQ51zUchGWmzN46j5Tb+elo=
X-Google-Smtp-Source: ACHHUZ7D9Q5sPUIL4BEV6WwShxibDDtj5apZplK6vAW4XRUIpNsiTyxTaCo3uAl7QPR96v6C/dUrxg==
X-Received: by 2002:adf:f88f:0:b0:309:5188:5928 with SMTP id u15-20020adff88f000000b0030951885928mr3367782wrp.35.1685521588586;
        Wed, 31 May 2023 01:26:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 073/149] python3-pyjwt: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:21 +0200
Message-Id: <20230531082437.10646-74-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103000

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
index 03cdfe6dd..3aa9b479a 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
@@ -10,6 +10,9 @@ SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9c
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "python3-cryptography"
+RDEPENDS:${PN} = " \
+    python3-json \
+    python3-cryptography \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


