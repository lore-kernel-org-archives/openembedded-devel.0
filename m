Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0249FC7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9076.1685521582945697544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=WEhhJLxO;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso41171155e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521581; x=1688113581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d6OAowl4v5notA8bNtIiVodh9CDkITBYUj4xf7LLSc=;
        b=WEhhJLxOLZnTuqV52k+rgKAARDd72b0fmTY/8pQBq7S4528nlLrMNOGEXTyRxDtYvW
         lCKBdg1RmqrKQj6e64ckQnyPkvuRLhceb8FZLVUqqie9qNJ7VWzMFdBgM3rw7aPAqZAO
         6mLxmdhgxv3uZRSW+4v85D8A42bKKJSt7dw9UWXqkHZx00/fxCPO2srw5JPDA1Vw1Xhk
         GWdriLhSF9AMPL05cdsmN+gO7Y5u8Aa4gTqFGHn0k2+o4FqZr9tm86x+3QtJF3pG6aHF
         jOgE7hhO5ICoyzLkjNPW73kt3kp4sXzagl0nGmvN42HNjKe3T1k4hc7YkNOcoPSu58mO
         xWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521581; x=1688113581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d6OAowl4v5notA8bNtIiVodh9CDkITBYUj4xf7LLSc=;
        b=AZNoIAshT+zDk+7i8uuTXrha9L5q3Cn5VBNocaQB898S8hX/EXeswcmqoqc0J2c0Ex
         sjwqEElLItHUIXiD8zV+g8HBJRJnuT70ht5nDBBw8QxUAXoBs32/wRA46z231hxSvQAh
         fFd3hvodw8NxZyhYTM1pQMuluzozabVM/KYEDB2v1cJ6jMZc17QueJf8ydO/fZwioh0E
         ateiR9LIvXbYacaSM0Djh2ftYJwuUcHvmeiKToSoM3JwOrJUuutWSGU7DwCCLSKqd5vN
         eoeSaJrFTBpIfWrtU16HlvQidBw5sUxZOu9pJYER8QvGjLWNKq5KhwYv8z/jZN5KPI4f
         Mo1w==
X-Gm-Message-State: AC+VfDwdBdoR/NmiQUBXuIEGWdgohwFUe7WyWmjrDKiZGE0YiaCBkxB6
	hA/L/7bjsGSSN/9w3lMk/ZPxAurcduHpw+SGY2s=
X-Google-Smtp-Source: ACHHUZ4xnn5Puc2bvOXy0v+fUjkBhDns7CZYnHfIMHUOUydCl+5rrFL7AmhoUBRmsuQrCh3i45eNRg==
X-Received: by 2002:adf:e404:0:b0:309:31ac:6663 with SMTP id g4-20020adfe404000000b0030931ac6663mr2967213wrm.16.1685521581476;
        Wed, 31 May 2023 01:26:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 067/149] python3-pyproj: don't use PYTHON_PN
Date: Wed, 31 May 2023 10:23:15 +0200
Message-Id: <20230531082437.10646-68-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102994

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
index f67090da7..0847a6e91 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "9859d1591c1863414d875ae0759e72c2cffc01ab989dc64137fbac572cc81bf6"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-certifi proj"
+RDEPENDS:${PN} = "python3-certifi proj"
 
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
-- 
2.39.2


