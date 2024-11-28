Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91D8D690FC
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:39:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.92151.1732790345089328831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Nrl1bvg/;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa55171d73cso327112866b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 02:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732790343; x=1733395143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq8hsrwoHK1r2rxyxt1NisXtRcCDtiLAqut4sQIKoqU=;
        b=Nrl1bvg/yqftwadg47hlxzGqPxmp0oCHtx31TFlCVb0YfipdtVfzS3LWDgS8Ih+uMH
         anJRINEcGfilPxdZoXGe+o5wp8I/uYqha3etezaa04v2LedLwzkkUzJbLEYKt8kH+Ln9
         H6LadtaFC1q4wid33Kzm8I17PKxLPKjfPT/U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790343; x=1733395143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq8hsrwoHK1r2rxyxt1NisXtRcCDtiLAqut4sQIKoqU=;
        b=NofnVKHmzJbKttrvxR05Zt/4qzs3tIOiUDZfus7wNISjUBxrRhw7WB5V4nAJQSio3D
         HhwoXP8eMwLD8dw1VEllQXLaAnslTlVIvt+phCnaPSEfVmiqCAFmgjbHjmNxnRjAjZaz
         vVEPmyTMSmhiAlg3PkDzfIKg8hAryojGCgrHSY05ShED8gD7Rt7Tq5zHnKsYfYP+orvk
         4nYZ2KHn0hqD8a7smY59LyUKZFJwHxsJt70WDkGqZJaI3JqdRBXqFVqiQ0L9VDpHFe5c
         1aDXK+5iZ2PykEPfje3jWyuovQ6h88Y4UXhkThuIdTL+M3jbXx+fWe99W+P/zgeIyG6i
         fAkg==
X-Gm-Message-State: AOJu0YzjPujr288rpoPs3k4/A+xFSTcekFhE+yqTu3jVXVbQoJi6Zx3p
	L+eId0qMv+Uo8pRBQertXy+CNd2XVSrqOCt6s5y5Hc11Z6AkTtBhagGMtNefWbR++t0HsLeS7uI
	j
X-Gm-Gg: ASbGnctKcchc/++xxGJjIgewq7E7Nn7KKC6H7WaRiGaex3J7ECuC2SH1lypbwnJQQR6
	kdombhO/KA+ZrgOMBXuJXjTw6dZ3LP99JWDCDSAJGcLV5FiX2nlC6sTm2aq+5wXBNpYMmxifW43
	SKEmitR3TIoG1D52ZAJ/WMizPZprTtP6nI3h2CDNHuCjZJglcNj4jXheG2LNaEk8e+MwdHHnC0o
	OTRYdHxHu80BbM6pmqWTliUA3eo+t4qP4VW22ECkN66vkGd9IZx/sNHGnJL0M6l
X-Google-Smtp-Source: AGHT+IE7hVVBEcjD04Z00NL6rIKwE07D6QTcp/70CERDj9jEs2j5fqfj1MXGuKEpAy+bizrQVxrXeQ==
X-Received: by 2002:a17:907:9494:b0:aa5:63a0:5d97 with SMTP id a640c23a62f3a-aa5945cdbdcmr307997466b.13.1732790343158;
        Thu, 28 Nov 2024 02:39:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c11fcsm52227666b.39.2024.11.28.02.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:39:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-tox: Upgrade 4.15.1 -> 4.23.2
Date: Thu, 28 Nov 2024 12:38:57 +0200
Message-Id: <20241128103858.4052195-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128103858.4052195-1-leon.anavi@konsulko.com>
References: <20241128103858.4052195-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114107

Upgrade to version 4.23.2:

- Support external tox.pytest usage via "test" extra

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tox_4.15.1.bb => python3-tox_4.23.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.15.1.bb => python3-tox_4.23.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.15.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.23.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.15.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.23.2.bb
index 367fafab49..cce2cf76e7 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.23.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "53a092527d65e873e39213ebd4bd027a64623320b6b0326136384213f95b7076"
+SRC_URI[sha256sum] = "86075e00e555df6e82e74cfc333917f91ecb47ffbc868dcafbd2672e332f4a2c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.39.5


