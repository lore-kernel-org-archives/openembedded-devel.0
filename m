Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59142C54E72
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.3719.1710583260867406460
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA/tIGm4;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41409cabd87so413845e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583259; x=1711188059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVXmbdFysuHfKUJiMoFxba6cIippSEUFAoQy1GdEDTA=;
        b=QA/tIGm4/IeynT3LYDGZsUF5oaIRviZOdx3NeAi5flwb27GupvGDbQgXFCN8iZZHoP
         nfsmfKeF7+tOhZh+V7jJHlTuhm9uz9UxzT53pB96Bi0OXadrcFK/gDSkUy0U5aXSc3Q9
         QgfaiW6wx32Lnxruk/DSq6JPzP20ECB7RshxVX/Usq0dUcXdUWJ+s2OZeMhhxO2XSITi
         L49XCVj2NLCOKns8LEF38WqSz2wkwD4MYAO4dUjZNyXcYHXuKe2DRvPzaFpBOxkU4Inm
         79Xc7mKooUxPB6+xAWpNvJRv6+XGLi9fRJjyW7XleA6pkDYKbhmwDa+cwiS9fQRoaWNP
         JjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583259; x=1711188059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVXmbdFysuHfKUJiMoFxba6cIippSEUFAoQy1GdEDTA=;
        b=I/UruUxrKF3vw2i3lEjtVyF+EoJFqXXwiFhDAWwKitMJ4rBkl2jmyIoaM2xTOidH/E
         eTakdQUxFNqU+h+rldS67IeBMCQZ6xToN9RPrFqLBzQS1rsYiUtbafrOoolxw6sGDhyx
         JGaK3BU9tktPq9damkTjWFpmDOquoKCgcso8SB/pJvg3ATSspIBvenKge4zbR9ughTFP
         3dAaY/sUZ+RcU3t54BFwMANRLJAlwAA3kPP4J/PnAmoMO0Q6ztaw+TuJbj1g/wirI1lS
         MlKF6wm3nmonpUn7yR3TxC/e8hhElFJVD9SFsgJCnIiix1La9z/69qtJrfBpfNkOcifW
         l0nQ==
X-Gm-Message-State: AOJu0YxmS9ieuTNqxqy3yRaEo5+gUhpN41qMffv0DOBA4fJWsD/yD6C7
	nPilJn33xmoHqvCmnYr+8BRbFUhVjGZiPTmNHUuO5dTrkoTje1pbXcEZzzZjXIA=
X-Google-Smtp-Source: AGHT+IGmaZdgbeJ5AzjnDlpn1llWjxdqJNGJwuwOw2uRjw+ymnck4sT3zMEbkI6M9mx5Q1FOGXWY3g==
X-Received: by 2002:a05:600c:4752:b0:414:8e7:cd60 with SMTP id w18-20020a05600c475200b0041408e7cd60mr412015wmo.8.1710583258664;
        Sat, 16 Mar 2024 03:00:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:00:58 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 2/7] lvgl: install lv_conf.h
Date: Sat, 16 Mar 2024 11:00:51 +0100
Message-ID: <20240316100056.409758-2-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109357

Add an install append to copy the generated lv_conf.h as part of the
lvgl package, so that it will be found and used by the recipes that
want to use lvgl.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index b84fc5a3d..58053d830 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -26,6 +26,11 @@ ALLOW_EMPTY:${PN} = "1"
 PACKAGECONFIG ??= "drm"
 require lv-conf.inc
 
+do_install:append() {
+    install -d "${D}${includedir}/${PN}"
+    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
+}
+
 FILES:${PN}-dev += "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
-- 
2.44.0


