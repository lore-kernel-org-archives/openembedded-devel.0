Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21B0C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 10:16:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.15765.1744798561410016554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 03:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MM6NZv4U;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acacb8743a7so101844466b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744798559; x=1745403359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+LoHLTY43criyFQgXf1+sc1+2Uq7cT/BqMxJxj/0Ig=;
        b=MM6NZv4UBtFkCDciCYZ0JqgpMaWnGoHCk3b0V+y46mtN/K4JwutrArYBVghod91NOd
         eTjqZ5bswJeQr9J8byIdWcFfdSOwEg98YyDsej+/WOabslEk+DJIm2VtL83YDKMtXqjH
         QGGvNB4mp3ou/h1vHnY7bTNksDPneu1g5ZxPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798559; x=1745403359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+LoHLTY43criyFQgXf1+sc1+2Uq7cT/BqMxJxj/0Ig=;
        b=YrOHGS9mF5hS1cfGf1VwGigSPU9J9735zH+Vmm3JlzevrbfKncqckfC9hPZovGW/ZY
         10vBbTSpKlANRV+ODeOzel2YIyqyxjaDh7eZYkqPw6RcRqnqx6m+bHp2eQN/XVdTvgTC
         38xtKzuz5tiElnT0pcpi5F62B/LymGPzKqPgxlvnXv7KjEb6B9ZL8CyWBXh9znRiUhlX
         7MzYPYLNUXBEySHAYm8waOMWpvTNJLxkoP1aV+1tUFGFCkLVHnFh9Ag5MI6uhzLokNeY
         9T9FDcGTd/qPeEvGh9eHXac+SJrhxh6VeSyXA6zAXSdwyrby8IhDiEQCBGr8jbXaDc9S
         /Ujw==
X-Gm-Message-State: AOJu0YyCMHzVIBGmxaaGowlaxkO8CsA0mJSvEYL+1I0I15NTjfG4gEsC
	W4IJwcHj+7M0RUyNfS6IVLaWqHA3F7U0UgdaBEfTl9zy299NTL79bGdSz8vsBekn6W/9raX4wYf
	n
X-Gm-Gg: ASbGncsZg4/hTmAn30gDA/8/PaOcT2/Fncav0nrJtHO2RPyTrK4TVLhrLR0QOqwVub0
	gnjtohcAKIFBOy/o72VHeqC9hqo/8+uQAL+9UBz+2hp7A8E9gXTSvY2Bwn4LnIaYXhYzKed/tWs
	SFOTg/GbktFVI5LO/r/tVwo1sqtenqBwCXkGDSI7cQTcNgsOuSjb773VpsBsqrnb8Nopqc1sSOd
	ReI+zN8wRhrtDLeCB9mnH9lkLeOxQcVKDnTvns3xpyXAy1yFvAkQWYJWXOF+dD6mqaNbdhgKLgn
	o6UBwAnsj3eswVUnozymWbfU52M2d5wsDIK8s8lqHcX8vNXgIb+NsEM=
X-Google-Smtp-Source: AGHT+IEszgMh9MJI+eQzYzbXpVPj+fj3d42kOOX1oUgrn/cq1qBOGRDk/zGaxKR12TW71ri/sQaeew==
X-Received: by 2002:a17:907:9285:b0:aca:a128:f4e2 with SMTP id a640c23a62f3a-acb427202b6mr114191166b.10.1744798559461;
        Wed, 16 Apr 2025 03:15:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d32dca8sm97823366b.164.2025.04.16.03.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:15:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-obd: Upgrade 0.7.2 -> 0.7.3
Date: Wed, 16 Apr 2025 13:15:54 +0300
Message-Id: <20250416101555.1679536-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416101555.1679536-1-leon.anavi@konsulko.com>
References: <20250416101555.1679536-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 10:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116904

Upgrade to release 0.7.3:

- Updated pint dependency for compatibility with python >= 3.13
- Fixed windows COM port scanning
- Minor documentation updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-obd_0.7.2.bb => python3-obd_0.7.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-obd_0.7.2.bb => python3-obd_0.7.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
rename to meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
index cf3daae6ac..8deef31d56 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "A python module for handling realtime sensor data from OBD-II veh
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=176d0f9ad45c10895296260d426fa862"
 
-SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2a43d61"
+SRC_URI[sha256sum] = "27b8f043376ca700edb98bf5216e2912295ecde0e735b260999f2d9ddf342522"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} += "python3-pyserial python3-pint python3-setuptools python3-packaging"
-- 
2.39.5


