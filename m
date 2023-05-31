Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA13C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9066.1685521550326919156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=kpS/CDxp;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso513372f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521549; x=1688113549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYQERKvufHYVTkqrQu/+itjIDPTPzWRjK6hJp0sHYxw=;
        b=kpS/CDxpfP7PC47G97w/u9pSYVzZYHmlhPsRFL5gvu5AqUMqJcjJxittcaNyDhP3XQ
         wA3apUDEMDXXnjxiRGo/PKlB90iVd9oVDgBWXWTm/Gw4dZ5h3q0O/80Yfufl2WtwU7WX
         94ZZ4bQ+WPnPSIVvtTLUlSWExlQCJyrOx8u5VJwHj2HScPw4oZkao0twm6bFSMLcjyyz
         dCq/h6D58WxW8ZNdw9rC/whPFI5Phwz0x1L0/8UAeqr2SC4P6shEwvrtZnvxjByYOnaF
         rCO64EP0U1ORNqU69RgSsAzNAHM+DG6zYNf776Z1FC6Jyi+a2Xof/hNKqMkXb6wTHEYo
         vb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521549; x=1688113549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYQERKvufHYVTkqrQu/+itjIDPTPzWRjK6hJp0sHYxw=;
        b=Vcrk0grYrh2X5sYQGjO3Z+U4e7vUWZlJDMceX7s9K3EoxFjRA1VtPdxndclFC0Hb38
         RgdV/t8vK02JggN/LEXXwYT7n4b29dx94kcIVAazfe6ingfbCv1pZpg0K5CpAiaJi1/0
         hFISdAZPTAL71Z/ZnfzN6iKLm+87zdHYd0F1Dh0bN2WB8suKEYp1qb539DnGNbtuUuCv
         Crrz5GV1EWLNVJST3ETboQXfwc3VuUAxNpvsaiXm/7l2rBiHvd8SOemF7jJBWbHFSbq7
         OKiw9DqR0Pw0eDL/SzirTCnxkATwhSaqtmB3HFRSR467Q0m6hBrDKMpsHi5V9Q7CmRlO
         XcZQ==
X-Gm-Message-State: AC+VfDzmW6q3hK6qXULfiZomLC8+7KG9NZpSJ9l6AFlUW9Tu0HRTpoGp
	EoDg96GBnNiniNS1OBgsDEc4aHwuj+hSlLVWuc4=
X-Google-Smtp-Source: ACHHUZ6SwAgtZNLT3bhJWlC8X3y3eZS7G5SMe4jrY3ie9fIZDqbz1CkuHBIWszClGskDxpP+bqGsCg==
X-Received: by 2002:a5d:4cc2:0:b0:30a:f1dd:697b with SMTP id c2-20020a5d4cc2000000b0030af1dd697bmr3541920wrt.6.1685521548903;
        Wed, 31 May 2023 01:25:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 039/149] python3-tornado: remove the testing submodule from FILES:${PN}-test
Date: Wed, 31 May 2023 10:22:47 +0200
Message-Id: <20230531082437.10646-40-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102966

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tornado has the testing submodule in __all__ so calling:

  from tornado import *

fails if we don't include the ptest package. To fix it: put the testing
module into the main package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-tornado_6.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
index bceb50956..2d9606bb8 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
@@ -32,5 +32,4 @@ PACKAGES =+ "\
 
 FILES:${PN}-test = " \
     ${libdir}/${PYTHON_DIR}/site-packages/*/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
 "
-- 
2.39.2


