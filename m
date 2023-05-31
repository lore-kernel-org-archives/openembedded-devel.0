Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06CFC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9068.1685521558319128912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=W7yuwf+U;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30adc51b65cso4917326f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521571; x=1688113571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBnNI/1E3vZDEx3coaPcmPIzFbBWH2Ci4Gjnz7yDJyU=;
        b=W7yuwf+U3h+zUZSWunK6xwc7hbE5qTh8evAAbQ1LMqrB7Qn74jqZIyLTb3sbGvTEK+
         2t9de2uhyiDn8L9k3VTYJbgolwB2Tg+VAaZFqwvOWy4ffPbrtbTfEIyhubrnQT4FR8JX
         Wn0/prkPqfBCGeXa3hrOydgd6FSozxhLEKA7cIop5dTcc0axGlx/2ctm+x3L6gsX8DHv
         Ps2VEJFx2QOi5K2tgEsqtHQgvf37gjFie8XeSCDp09z25Kd2wd4mcC9To1rgolWMMpYJ
         CNefAL9xETBV4wOukFnVHZTzy7bd0tfmTp76h5RZ8KFWUH8eqmRfkURnJIOniNUykI94
         RAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521571; x=1688113571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBnNI/1E3vZDEx3coaPcmPIzFbBWH2Ci4Gjnz7yDJyU=;
        b=PKty+M1ktu3xQvu3XkfnNG7BcQ2mBT5TUmTyfdI+A40RVE8axA9JfMATm0wWeIQoRw
         BQNbDJ4ePy6TB2G8v4OtOB7y7XciKpqffGOHsgLVvBjzIUfPnRxUc9btXJp/1Ctdjq9Z
         RhRIzyxDZnCeSKoVRPkra5fUWJsMTGCLcaxbKUrs3Ys56iYUVStdMw8j0F8NFDSqQHZD
         1RBjRcRtACdbrk4+Aq3WoEJWxmwsHafyyEZRZH3kdZYpRugjx0Ibr6ipbP7Iw7qj9oa8
         j0xv3l827LOskpqJLJGVXg9LgiVkmev8rP+TOGDMjbqNfxXqwj94OM82eym/jmbcDcSG
         eWFg==
X-Gm-Message-State: AC+VfDwA6ogsniCkPrT+u9Z+LYcj+6dyc70ymPWBXHvqJTVcCE5144RU
	YlCFICy3KfgE8QzyvVttSX4Dwg==
X-Google-Smtp-Source: ACHHUZ6GVZMEvFBlvyyNInFVQh48TUfXbIl+fZOb/KP9rY8vOKSc3F7UzfSYAc2ordMVGH9hWRSrnQ==
X-Received: by 2002:a5d:4441:0:b0:306:3ded:2bf1 with SMTP id x1-20020a5d4441000000b003063ded2bf1mr4498613wrr.60.1685521571361;
        Wed, 31 May 2023 01:26:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 058/149] python3-redis: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:06 +0200
Message-Id: <20230531082437.10646-59-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102985

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-redis_4.5.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
index 056a31398..eb407a2a1 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
@@ -10,7 +10,9 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
+    python3-compression \
     python3-cryptography \
     python3-datetime \
+    python3-json \
     python3-packaging \
 "
-- 
2.39.2


