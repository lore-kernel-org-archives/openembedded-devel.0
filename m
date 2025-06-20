Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D93DC77B7F
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:03:26 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.3608.1750410198782792203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 02:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W1/XtDfA;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso3020604a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750410197; x=1751014997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AcBONUT5C17FpsgEuS57x6+4E/COIICAXisXbbqv8w=;
        b=W1/XtDfAmM8FldHIJKnyyt7vZdA+wST4yO+krsxquGDEDnIA8pXoB++4hiC3YiVNt5
         qKOQd8cuNndyTIOP/jnrLfLIPFn0GGdFPFl15ypraR6tlYPxGaNOgPI5Bj0WjQ7eJl8C
         vk/DQTcJ/lBTGC2VQjhy+FwhgjwzbbwCLqj4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410197; x=1751014997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AcBONUT5C17FpsgEuS57x6+4E/COIICAXisXbbqv8w=;
        b=GrIkr/DrA15i75nfXdnMt6RtUaF+jHAzCTiJfEmlTe2yhNiKFarPm6Ch0n6DlZYsqY
         QI4TNR1jxERmIXSYIi87HWKyID+i39qOV8o7pS+fyRRuyJK35B8cAD/X9pAe6k7hP5TL
         u5lYWcSzyWvHDbXyRD60cDYDeb1xOnTqChooFRrJ6mcEu/D3FV2hDOjDkey2N9bezkwp
         jRFDsSIrFl7qjscl8JypuYSTcrIKbh3mneu4y40f6yxwlp4DREwTSr95m+eQiz6/6i45
         m+VKDlGt7IDd/Jplh9Dl8XMdCmqszY7OeS8fVId5ClYAePwu0x8ordiof7MYCvZGtnl9
         ANJA==
X-Gm-Message-State: AOJu0YwQu3nOU7eB5Gfkdp0jltcBLFGsc5yum3kQGBXa2ftAEmOzDnjM
	GZdIpjIi9wbtwlW3ayrIdAEM2K/Aq/CDzKIc/6I6ckpT0kDhWBKLOokzZOEIgeNOI8kZzJ9IhHs
	NaLNt
X-Gm-Gg: ASbGncsJewumJQ+jnfMmy5kGUsNtaR/Bc5EpsjDjxRTFqMnkixHhzAYtNc3+oAs9R/W
	C1FVM44K0juCdFn//XPMCdwkwYv1lVAVVt0S6kPYJepV1Ww4roycRjXBOIvOEScNYTEo/vy8Cri
	JzIcS1wSO+RdEATo0RIksVBzFqV7U3mx4NEK1MaQcYbvxQdxfGBJClNb/5bITk/9QNJ355kwoQn
	eV5dH+lmMgY2Ahsds04i+teF3zKM9Em5GakogdF06VcJ7jVv57JdGyuvCEHN2LITrZterApG0Ex
	0X4Ze850g2cdIcX6nbShgAKQNJtGGtGnnEDlNHtseB4zg95SWh0RhWsLBfPN9Not+A0XADdosSd
	u
X-Google-Smtp-Source: AGHT+IELxGIkZyZ4vUimT9PMXXJHXocCNavhUYBvYG6cSkBK9z4KIA7sWF4KeC4+Jba8G9gQ2C9ecA==
X-Received: by 2002:a17:906:d7d1:b0:ae0:4254:a8ac with SMTP id a640c23a62f3a-ae057ceb181mr186963966b.5.1750410196730;
        Fri, 20 Jun 2025 02:03:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm130551966b.102.2025.06.20.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:03:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cachetools: Upgrade 6.0.0 -> 6.1.0
Date: Fri, 20 Jun 2025 12:03:08 +0300
Message-Id: <20250620090309.1619406-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620090309.1619406-1-leon.anavi@konsulko.com>
References: <20250620090309.1619406-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117965

Upgrade to release 6.1.0:

- Improve LFUCache insertion performance by switching to an
  implementation based on the cacheing library.
- Update CI environment.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_6.0.0.bb => python3-cachetools_6.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.0.0.bb => python3-cachetools_6.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb
index 1032fc0b06..702f87f94d 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.1.0.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "f225782b84438f828328fc2ad74346522f27e5b1440f4e9fd18b20ebfd1aa2cf"
+SRC_URI[sha256sum] = "b4c4f404392848db3ce7aac34950d17be4d864da4b8b66911008e430bc544587"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


