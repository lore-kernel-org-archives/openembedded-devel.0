Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64FAC531DE
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.87195.1723218541101889522
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J52Movhy;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so14968795e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218539; x=1723823339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIcChNfDiuK+kopr0SgGIRFFlMKcUVTjosuLwW1lIUU=;
        b=J52MovhyxHCwFFYy3GSoh3xuo1Gs5xeSmAlaKyUpPW3rRSPeIcXRsVWldd5M9Xlzwb
         BMhCOLpn8PMs6boMkrSmoTMTQt/m26VB0HAbshfx/yFH2pTDioVGf4xhz0lqTmJKwqeW
         2lXmssPskA8zHlw1u4IhhuqxjgxW4oLCEWQUWDTScdmQBHjKctLXSSRpRVWOohs5NHYN
         3h/g2f6/WjPVeGgUu4Xw8tvBSOk2SOobvB1TSXPqFA9UJEjWNSOHq60t9voIRY7LcPeB
         hKTdJZzoOWIjGmpFRKwMVq8Eg3J3SM462h1x9UycR5uhbwaF4Y1LTj19WhKj0R3t5SLA
         qAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218539; x=1723823339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIcChNfDiuK+kopr0SgGIRFFlMKcUVTjosuLwW1lIUU=;
        b=W8N+IA9aKeyiboYqwAZaKu1lgp3HvXqVG6T43NSyvh5RM50sqIhFfSTcm8K691R5b0
         NFsveG9GCsjZhyI+Wd/5HGd2CDEwHHLiUg/7qhi6/v0IHUDA7xJQhuazPOOUhWtlC8BB
         8R1Ersr7qF+lIFWHE+b4dTHeJDLNT5g4AQf7etTb5LUa+6WZnOAWe6ftn2Ja6rOyn1Fp
         Ye3wnL6uMgffU7rUoEyh/U5+OBaeSVMgkzFmas5Retd6j7l3FlWhRZ9ItRRO7ym+Ei3q
         VXnhNq3iIFGB70w8T+aoTdOOFBnu9Xvn5GF7U0ZuPMeuX8E2ahFmVie0QWQOzWxcBEUX
         wwxQ==
X-Gm-Message-State: AOJu0YwABBDPZD+V3ybbq+S8tGeT+7EagClf7QfHUuUGZojnS3eqrhLz
	PJHMqnpKNxUtBS40MUu009ukHPZZSzI4C6N8s9JtTFTKn/cSvDB0il2/qDoh
X-Google-Smtp-Source: AGHT+IFO1pnJkDGtb7fk7MQQ395Tl2RGWoaS0TH36pMF3rTf5vXvs1/t7/ruwOka+JZk4HiCBnkAQg==
X-Received: by 2002:a05:600c:310c:b0:426:64f4:7793 with SMTP id 5b1f17b1804b1-429c3a25183mr14929775e9.22.1723218539078;
        Fri, 09 Aug 2024 08:48:59 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:58 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 06/13] python3-pytest-metadata: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:23 +0300
Message-Id: <20240809154830.14927-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111702

- The project has a proper pyproject.toml which declares the poetry.core.masonry.api PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as pytest-metadata, it is by default.

Fix:

WARNING: python3-pytest-metadata-2.0.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with poetry.core.masonry.api, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-metadata_2.0.2.bb  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
index 163a363f8..9243f6646 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI[sha256sum] = "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
 
-PYPI_PACKAGE = "pytest-metadata"
-
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} = " \
     python3-pytest \
-- 
2.25.1


