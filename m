Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3203C87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 08:44:11 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.37767.1753519448380865367
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jul 2025 01:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LDfy4tlP;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1938831f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753519446; x=1754124246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3kVd+jqwD24O+kOLXlrFJ/GhgJg0HCG9/a6APNy0qU=;
        b=LDfy4tlP3eRaWeXLey69nWF8y6phAfP/uZaNlGRUZkAfIyG+sF6stO2U39CZc/tBwF
         wrQ3JXMLRn5bkwLm+NrkJAFxYMoymjdH9ZUEkAptz573UCPt4tJ6PNCMxZJj5pNp90AD
         L+wWBiZvgbdqEqxW4BSP2cXjyHwK+6fGMQjjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753519446; x=1754124246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3kVd+jqwD24O+kOLXlrFJ/GhgJg0HCG9/a6APNy0qU=;
        b=QdeQBeRnTQ1NNs9BmWwjfYL+imUMBtrdK1qk13CzcGWmGIfOd5t8nxw1SwNYAbVoxu
         ojFe7zp+9/uXSDjYV14fxsLwifDKZ8kLjGtHWpzNcO2TsbHCsbdhtjWz9TYPbzzzngtc
         31MfpyNwC2XC7geTHgIMA95nP9rIy2rTsbTGDuxzY/OjXgu/wwTgIpPOjyzEtad3V+o0
         OISqljLP16UGdKrSvbVamPrQ6L8PY0iatz4xTcNzf4WL3v4n8QeMQ0p5GLN2ubKQM89a
         YMTCJYYZSoTtyCIuRnUM9pOJuAHq6yl9kXJhh64YOv3yWJZ4THJs7euARHfTQ+Hs+YVB
         supA==
X-Gm-Message-State: AOJu0YylQxOCsDYGOVrTDteh5U2RsLTOgVsq3blqlluyGCZy0533aNB7
	S2kjvHFCBeFReXInFEo7t8gbHDViR8NS15g6mojmKxoBZVx6rXMQ4B+ANQ+LErCMj6vL9WZuWKD
	SVRckKGPG3+0x
X-Gm-Gg: ASbGncu/HZHqGKwEnwHEnnk5VVH2/92QRQAKm2qCynau9y4Ijs6jPXHofHBxgDCRHkC
	YsvEOZJZtjEqkg7i2LYTxWiMxrlAyCT/mD/oxHrqRXYT4uizvxWKnzQO1D3/Mevr5WgreYUIOpj
	qfDvsWYp8AkSrvQA+9gcCqhkrQoxDHdV/6Z2MbE4amFzaAzUwTIJGSft6++hh2V9xWOPD0xPPEk
	cz9cUH0h8yyzgMMoxNOZvLVSCPh8gWxgG45WCrqQHxaEVx/Ik2KkuYXKbqHopv4wjUrEmGKrKW6
	SInCxIePyogSCWoKiq4y7TC2UJhEl7ajXnd6EF3R6YLLNXqqSVbdIdHwTBZ/jRkO6G70l13XFab
	Rletx3JgUzt5wzHjgx01518oTsQjTHl15D97AvMwB0lqoubREAOshsmcboOtXLbXTuElVFOXelP
	5v/YMeZUtPZL9p2QDkskv61pDMxtlfFeb7I/sgXzTZ
X-Google-Smtp-Source: AGHT+IFrbm9NnBzFhi59gNuVTuqvImj00aKHYMnlUK9PVloC9sO+Gqx17KaJ5jSChc+FAp6xv/do4Q==
X-Received: by 2002:a5d:5d84:0:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3b776799dfamr5016039f8f.53.1753519446263;
        Sat, 26 Jul 2025 01:44:06 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb0591c4a400ed176bd93ed9ff0f.ipv6.abo.wanadoo.fr. [2a01:cb05:91c4:a400:ed17:6bd9:3ed9:ff0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eba2f1sm2193960f8f.28.2025.07.26.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 01:44:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-mypy*: add nativesdk variant
Date: Sat, 26 Jul 2025 10:43:53 +0200
Message-Id: <20250726084353.2046137-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118738

From: Yoann Congal <yoann.congal@smile.fr>

Since commit 9b0015577ce8 ("python3-charset-normalizer: Switch to
PEP-517 build backends"), python3-charset-normalizer depends on
python3-mypy and has a nativesdk variant. So, python3-mypy and its
dependency python3-mypy-extensions also need the nativesdk variant.

Fixes these warnings from AB[0]:
WARNING: Nothing RPROVIDES 'nativesdk-python3-mypy' (but virtual:nativesdk:[...]/meta-openembedded/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-charset-normalizer-dev' (but virtual:nativesdk:[...]/meta-openembedded/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-charset-normalizer' (but virtual:nativesdk:[...]/meta-openembedded/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-mypy-extensions_1.1.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
index 9c8cb5533d..21cb517c21 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
@@ -10,4 +10,4 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
index 0d1e0bd16e..94aaabde4e 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee0b9203fa031dee03"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += " \
     python3-mypy-extensions-native \

