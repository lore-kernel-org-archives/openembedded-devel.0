Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A10EC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:03:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.5.1710525802419274946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sq7qwcoK;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413f8f5541eso11173425e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525800; x=1711130600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEMNIYuT6HFCBLlCQpWio72tqdEdrIFsZUhBn9QiA2c=;
        b=Sq7qwcoKQg8ixKXe0mIWeRxfaI6fR6oze7QaA0kcgRljkLkQpbg4cZi43fyTS10snU
         trCOO4AyI9oPinnywYpkSgiPMxPcg/D4Zs8AAiNP+xySQzPMPauRBuavBl55vzlVF4Zy
         /hKnR6ep0rP/a+j2K/76dWNafzGSnJpelZwVv7vt2MX5ZXeOYsBcSTA7LEfYJ8VfJmsl
         2CuSyN4HLXLUIAyHGJSA7Jkko0dO6S2QfJc+X8rlq8rxTMtdl81Q1nbNT05qPe45ClyN
         g5aSA/ROAu9+VkUgckD8GJ0Pqa7TU23CMoxp/Q8Q8d0wp3fHhlw4cGXcbJZ61jibZd/H
         1rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525800; x=1711130600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEMNIYuT6HFCBLlCQpWio72tqdEdrIFsZUhBn9QiA2c=;
        b=CyyUSdPAOW9Wf0+B050v6Js2oygOtZb6aWqLO8W1GSVKbk7NxgEhMpvMQxrqqOngJR
         XpnOfNFslZQ8ECOtkWUJZi/rXEnoktGSggVg7h6zO/9vAuu/7GOWJawvprLq2A5lCt0E
         oLCt1ED+J1AIMTYaYoc5sA95qZ1XcIaZ/wrq7fUavfUSJymhbYJQQUtieeFt7R/LFexd
         Q2idHR2xLAtMu01+oi8rLfW5alAo1oPcphIZ+I2S5tqvdcIqQdQ3+1KWSd4Qv00CoKjf
         jYlPQW0RE7XQIVARbAUiISYvhc3cd7Ro6G24qge0LSgKpUEYQEMWvuw8pTkSBMoWWhHM
         dJaQ==
X-Gm-Message-State: AOJu0YwBsAdIIst8S7Nf74j0wSAlX8MJYWYGYe3hhusxpW/WuCsa5isS
	MA/akAMIzONhM/hz0odq5lMfs16C901MEb7G47tF3+PnFT9fQVTtgDEODH9UScs=
X-Google-Smtp-Source: AGHT+IHxvIwwJJ6O31fKebj6l+uL8nD5ESt4JJf1NzYV8dISKKlBpi2AhaId5qUOam/jyw4FwYwBPw==
X-Received: by 2002:adf:fe89:0:b0:33e:73e8:c1e1 with SMTP id l9-20020adffe89000000b0033e73e8c1e1mr4339153wrr.18.1710525800381;
        Fri, 15 Mar 2024 11:03:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm3366832wrb.110.2024.03.15.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:03:20 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Martin Jansa <martin.jansa@gmail.com>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v3 2/5] lvgl: install lv_conf.h
Date: Fri, 15 Mar 2024 19:03:11 +0100
Message-ID: <20240315180314.9111-2-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315180314.9111-1-chris.chapuis@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109341

Add an install append to copy the generated lv_conf.h as part of the
lvgl package, so that it will be found and used by the recipes that
want to use lvgl.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 3dbdf769f..6bcead628 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -52,3 +52,8 @@ do_configure:append() {
         \
         -i "${S}/lv_conf.h"
 }
+
+do_install:append() {
+    install -d "${D}${includedir}/${PN}"
+    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
+}
-- 
2.44.0


