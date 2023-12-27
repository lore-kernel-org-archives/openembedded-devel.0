Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7D4C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:15:21 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.100778.1703682918296174582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J6F8qlV6;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cca9a9362aso37134191fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 05:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703682916; x=1704287716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=03j0gMoFgALGfZ9CEFRW1YWd9hHFZG2vLv1v13twXhc=;
        b=J6F8qlV6LCc5kotpIu1GMVO7l/fhZnjTf5IlOiorw3fyOfkmpRQK1IFgod5v6eXHNp
         iCyLiEoobS0JDzydgsEf4pNFCz3RNI7JU2F1OXvGG8TIwPYswE8hRsyzIoq/W8G9rXGS
         KQh3O8bb7HIU5ieGGadbp77jCS2234BpUIIBjufY1uuCJISi/3tfdlJ/lhOPbzHX/+e3
         CBHZ7dzugGjbsROGkvd2YcbACr6yYsWKKEF7yJFhCVNyVACAY46Yh7d3q+kHwADcMjJw
         t9+u7iQoP2Zx4Jz4o11YcKo/Cx4ZcAwVVUAcebArJ3lRe+q1fs3VtCjjoyOApo/cugej
         uo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703682916; x=1704287716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03j0gMoFgALGfZ9CEFRW1YWd9hHFZG2vLv1v13twXhc=;
        b=iHNYyzq7lMV9ZOPFN9ro7UKOD6uBW5zJd3COvOwyTdepPbGg6cYFZAcNSFYvIe5Gf6
         V8sYTI/5R4VIsJIZqLV2xxe9IG/BbsTvBK+WbpGLiuweFC+0hJ3ucD53NVDsxNVb7IT5
         uh09H9DMaqyunDOlzFFt6RIh40tNW+Dos3xYuEaTFqHsWkgWoFyZvJX9BicZQrx9yjoP
         ZsAh2ThK5//DjDfTYdxIMjxsYSvimli/9eKHiwbAQtOneAdj/5axPnRHg4RD6SAHVx6g
         kQWw3VkMqtqdENRrOrYx7CxrFvKhPt4FCe/u4NFr65nqjsSD74FIBehmYKO+z1W7+qui
         xRRA==
X-Gm-Message-State: AOJu0YzDy1gKqOVSlcxXgbIUEV+ULKg1bXTKc7WCvSSffoNH65UNy4cn
	6CEep9XeQZQn1xiX775DmNcjGRcBqiNdghXpsDvSVmTh2qOm2qPF
X-Google-Smtp-Source: AGHT+IH8yu2oRsyTnTO4QgQxCB1TYo/NStXgjKYQAfg9FejvYXhS/UxaDS4wNYwKsWjfRcXWciCryQ==
X-Received: by 2002:a2e:5c42:0:b0:2cc:731d:115f with SMTP id q63-20020a2e5c42000000b002cc731d115fmr1609814ljb.36.1703682915751;
        Wed, 27 Dec 2023 05:15:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c151000b002ccbb712fe3sm1693212ljf.62.2023.12.27.05.15.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 05:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: drop libnewt dependency
Date: Wed, 27 Dec 2023 15:15:13 +0200
Message-Id: <20231227131513.332046-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 13:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107866

With the nmtui being now handled via tha PACKAGECONFIG, there is no need
for the global libnewt dependency, PACKAGECONFIG["nmtui"] handles it
correctrly. Drop the libnewt from DEPENDS list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.44.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 1332a9dfd4c9..07a85b68acfc 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -27,7 +27,6 @@ DEPENDS = " \
     udev \
     util-linux \
     libndp \
-    libnewt \
     curl \
     dbus \
 "
-- 
2.39.2


