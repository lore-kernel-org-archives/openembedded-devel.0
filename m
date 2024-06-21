Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B85C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:35:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.70848.1718969705798947626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eYSyV0kr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-361785bfa71so1620169f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718969704; x=1719574504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21X1Ewq6O3KOM3Y/QP3hB3mWqaWMfKIC9qqPEBuXWzg=;
        b=eYSyV0krgNnuRMFvsmhPFMbf9DM+uMqlBQT7onKvjQCy8r3srZaKxc3L+oHGW05weV
         qaHdsmbIRjtb4vwmRkQf/BEExuSf9+xSvlIuGg+n7IeTv4O34SZhoKOIrYwxwJq6u13H
         TANGzEEk2/SIAIRZmDpeMz8uHYj8SB7BUM9jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969704; x=1719574504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21X1Ewq6O3KOM3Y/QP3hB3mWqaWMfKIC9qqPEBuXWzg=;
        b=s21YF9hd4ByHw6D0d8b/3DBhzDBdrl3bmpbmatMMX5JaZNlX5VTkU9RInjI+gCzWxg
         zQ9b2Onh8v/bzIXgW2QOn7FqT2+/xLAUv9AtjPLBIaQVFiIvBCw9zUD3YRXDAvBSaRY/
         dlLGDK7XgbS5ZGw+BR6jYubY0PzOGZRWeXKa9jnmbqEZXC6CGVeHGmlXpUeLLlIfcwnr
         X5azqcxw3zo1n/XjP45Dl7YNgUlG0QaJok/z1sHj3ClDRBjqyDt+CweoyK7eQ2WL0drq
         99WxeU8DVIncogL1Jw92BYRQjELmCxCwfxgmyckDEVHCZMDV1/OCxQkYPzy1SvRDU5mU
         b6Ig==
X-Gm-Message-State: AOJu0YyapL8RKoFFoQ5f7u36ZmfyCMSY49gx9qjMAnbysl3iOcN5s7P6
	w9MbS4rDVBcQZfLCwOsdfGZNA0Kd/LuCwUY7m8JSGVc6dDM2UecFhFIR3mmx72Oe8N7IEixQo2R
	N
X-Google-Smtp-Source: AGHT+IHYE4mhlOOlr5lwlxjMryjVX5wJIz8dhQeQjntcREh0QVk92AHP484aycmRMoFKHa5S4IB7ag==
X-Received: by 2002:a05:6000:e46:b0:364:94d6:f650 with SMTP id ffacd0b85a97d-36494e63de2mr3585764f8f.2.1718969703898;
        Fri, 21 Jun 2024 04:35:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6d02sm1470662f8f.85.2024.06.21.04.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:35:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pycocotools: Upgrade 2.0.7 -> 2.0.8
Date: Fri, 21 Jun 2024 14:34:57 +0300
Message-Id: <20240621113459.2188274-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621113459.2188274-1-leon.anavi@konsulko.com>
References: <20240621113459.2188274-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 11:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110990

Upgrade to version 2.0.8:

- Wheel files that support numpy 2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-pycocotools_2.0.7.bb => python3-pycocotools_2.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.7.bb => python3-pycocotools_2.0.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
index bebfb128f..c9968ae37 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "da8b7815196eebf0adabf67fcc459126cbc6498bbc6ab1fd144c371465d86879"
+SRC_URI[sha256sum] = "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb205e0a021e1dfb8d"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.39.2


