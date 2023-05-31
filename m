Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F1C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9068.1685521558319128912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=L8OPGHop;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30adc51b65cso4917061f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521557; x=1688113557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXIl9QevftZCplKlDECUY0B52+3EQ/zqjAPpwkh/hYc=;
        b=L8OPGHoptQlWXc23eMld8dOwndimUJeItirybUVQBz1gyCBJXYNWmx/ASobe50H6iY
         M8k0a7CjrXkrLuuoylVFjbRp/eUQqs69xcznDlvUKzLRD9u72hbADG1NxQYUuXB8p7Pp
         zTw4qvAcXPH3mf4LV3ndJvVX48b2Ywwi5bD1Q2o6ngZN7ucD3wMxvTW9Lqsu9e610wZ/
         afT3MG1eWtz24FtZ4h5isMOWNXEmG5mWcuCUNlKJPiG/kPIiJH6nLTHnHcFzlBPMOPUF
         BEHRSfHSnzmpkfc6CxT1qtOYBAItvYNvoJdP/9Qf/GshRxrAVFe1VOI+fqy1ttBMOsdB
         Hb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521557; x=1688113557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXIl9QevftZCplKlDECUY0B52+3EQ/zqjAPpwkh/hYc=;
        b=NKNmkkh70WLDLUQYrF14mDkA4pXd3JHNK4f2mtmqurj2gx745tO/v/SKcwZ8caz41a
         TUPTx1K2NljKI96oBVXHWHjvOfJVp/5LD8sjPGH2yJ8caJf+5D7EHTe3v0+IKxSJadCz
         g2c2icRyTZu2H1GNVeZ0JslX2EZ1aDVoqg159zAolnyMuMzNwAKfBJaZTfR7coVTqRWx
         Vkq4xzXfxA82qfGA6YXm3/DKr1Yr3eocukB/rqTegKfq1G6AKUwTGiqDunwkjhfKBsfL
         TDEEyzrec4I1pgliUICG5E+yHwtOPtMbDEqzwYM/Q3Am+QDOoIcsDiwzcWP14Az5K1G6
         DVjw==
X-Gm-Message-State: AC+VfDxOP7UTmaWcR4nTbBnO9UNmzPp/Jm3zPvVl2wppnL5ZKnkl62oo
	2uRPTDAUtJV+7Fkza+rOLGg3Aw==
X-Google-Smtp-Source: ACHHUZ5+pUUd2VnpPVz1Xw9iBjguecN89WkQ5vZivb/Cdbve/1GqKy0szo1xJzMPST6gYR480NrgKg==
X-Received: by 2002:adf:df07:0:b0:30a:e09d:572d with SMTP id y7-20020adfdf07000000b0030ae09d572dmr5062344wrl.32.1685521556871;
        Wed, 31 May 2023 01:25:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 046/149] python3-websockets: fix coding style
Date: Wed, 31 May 2023 10:22:54 +0200
Message-Id: <20230531082437.10646-47-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102973

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN as we're no longer supporting python2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-websockets_11.0.3.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
index 92dbd20ca..b22d993cb 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "88fc51d9a26b10fc331be344f1781224a375b78488fc343620184e95a4
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-asyncio \
+RDEPENDS:${PN} = " \
+    python3-asyncio \
 "
-- 
2.39.2


