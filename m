Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C039C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:11:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.31938.1723032665865094470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LlMqedvJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3687fb526b9so849267f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723032664; x=1723637464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmjRLn+94oIhS0z0w670JihJ5fbjv+S68clwTtVQ0ik=;
        b=LlMqedvJb38/w5WsZ96IzskLaBtW+yXuvkcR8c8S9+CesfSqLmY54kkSKCb441etTC
         PcouySMPQzKnAWw6fijW9ckKINGu+KL3P9U/PM0gl8a6T/cyF3jawZfahLjq4N13a5bC
         nJNPa6o0fY2/+3v+AcpT7xn/kn4/4j09RM6zKuRjIJll9R6BqlUN1wShrziYpXNp4K8h
         yfMx46ez+6CC7jZRwgy4GhF0n8OJRFnIW9rFFQAB8rjq3QNOYCu1N6NpiI6ggf92I8mN
         b2h8NXG288n4lI2HXaobBWRT9ulfZH2eAERjWUp8hRiT/Wh0BQRY7mEvMRqbSJhYlLJH
         +9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032664; x=1723637464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmjRLn+94oIhS0z0w670JihJ5fbjv+S68clwTtVQ0ik=;
        b=PFR+eBHsTvVu27GNUSF7Unh2Keh+0i+AC0GbhS7C9MHK02hC6p5ijZnjUe82hQ5Mfu
         Yfo/hx5J/e2ZvDGZWlJJl10NJBti4epW1Cr/UQzVg2ak1FFvZzWaqlLPYhT4JQ3sgxpZ
         LtC7yLOODRJq8vU4SHnOqDjstjofnQbELpxwNsgmMXXnpCwPWMudVYtJZRRN4qCNvVCq
         74r0BG0WUQHHMb8/2B+mlndsMRiSSiXD4jfrLMUMsLdzqFNjVu8kJZskoST/jfIYPsMq
         l88k1dJmEVcml4tmm/gPECyK3AggRcYD7foS5GrT3PfzM0mUWiVrotUZlf3CqI9WMz5q
         ts1Q==
X-Gm-Message-State: AOJu0YztBbONl5WSUD9JGSTbVqikbD2xGdGusCI/W6i5ghCbNanJd30L
	FEe4R1qP1vHT2o+M/Ma9sIONDj5Riypsrr4M99PaAzIvJE/QwXFhaw2XR2xA
X-Google-Smtp-Source: AGHT+IHt4a0etXABLSUKwRwuZZIMDXeUL5yKiGmShocOiPj/YEPZaxM/wnKaT9vsa9LHpIW0CHIPtw==
X-Received: by 2002:adf:e40c:0:b0:367:8a2b:7354 with SMTP id ffacd0b85a97d-36bbc0c6c03mr14093600f8f.11.1723032663764;
        Wed, 07 Aug 2024 05:11:03 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1e180sm15739225f8f.34.2024.08.07.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:11:03 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-file-magic: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:10:59 +0300
Message-Id: <20240807121059.102327-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111623

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-file-magic-0.4.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-file-magic_0.4.1.bb       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
index 5289ad374..0491d02b1 100644
--- a/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-file-magic_0.4.1.bb
@@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e949c0b3fb4fd86232f00c6ee0bdef3"
 
 SRC_URI[sha256sum] = "a91d1483117f7ed48cd0238ad9be36b04824d57e9c38ea7523113989e81b9c53"
 
-PYPI_PACKAGE="file-magic"
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     file \
-- 
2.25.1


