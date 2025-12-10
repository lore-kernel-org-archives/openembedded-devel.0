Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1FBD3C54F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:25:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15610.1765373148801545996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DzcV1p6K;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2958db8ae4fso66447345ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373148; x=1765977948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hHXcybmv2oCFvdNrXvaVyeYH+rpK5sQ8T27zJHaHxA=;
        b=DzcV1p6KE6DTcAhePqVJf2QlVPId++906ckvBrS+0xcMMaIt9/G6B7TQjgegVZjMjl
         cIGjX7se+rdDd7jBtY77UZeaBrErBcml4p1N8intc2ejIGIkHelFFKHVDiLmZ1aBFuq6
         lsb+3Yk8wiGpratWi8ne5rbD1MmN9T8wZAIKCB5p5ztCtsGTYDRJg92WVuT/Vwr8GKpL
         /eP4YVI4AvLxpdsfJqWpxp29l3UxBV3s5WDt0uDfdcDEAOKUTrmwCUbUsPk69aiZKhVA
         bgLKrpWjZ87dUeIiNUmO+I8yaqkw5dmwS4AT0CRM0cwZoYOl5tsrTsDezUyiIuo+rzG/
         2ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373148; x=1765977948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hHXcybmv2oCFvdNrXvaVyeYH+rpK5sQ8T27zJHaHxA=;
        b=sGdpFAkjbTb8RrJBzbcdIy71Nbojb0gzhtHFxgFYlTSh3ntuqkqaFTgqIBltce8gJz
         QuOX+FXFvSVkMRlU/0GrgYzbBc3jVqG5j1mrdDGDaGuN2lna52NQ/xU60FwKzxy7cxxx
         Po99oZgkmrsiafaZJtruzw8FVLHAw03n/o6SjMWaHWwSD7qRRyu+i9nnYox/xiWvF8iy
         uHMOqu+JRGEHEJioZi9Z7JCVKE0NXRft2CaMo1rO0fKU9+/aqghlIMjqzHiNWE9bSf40
         uy7+jdZWp3AZu6CTSq+/GepRvSmTKjRgMlA6dMBCygaDKQ6EfugiVP923mrPntNoO0UQ
         3GnQ==
X-Gm-Message-State: AOJu0Yymz4iGC9ckvyPLA0MlJ6It0KkaWqwlLqvzFGDshTXvB/m5gdAG
	9LJQSCzdGGvHpgYztav5d3kPWYTjGXuY/6HKFTraPImunc8a4JAclGY7UPquRA==
X-Gm-Gg: AY/fxX421n/fSJ5X/y+oq5wK0BfXzMlwa1c3lIRvEYXn6VOuINYG4y/NyrLhY42r3Ac
	Ap9MeTcfig9UMkrltzTGK6Yz48FKXHBOFKnE4OUiOtxo50NqcPC9iX8oIWiIq+gHP3+B8v+u42B
	uXRJExMx6Db6TKgEdkpOVPbsI0yA313DwsIuDc2wR7/i+uysu/jjhQ+OV3Ki38R0aHWbTW8mBwR
	RkPfvtkLKTV1kEr9UxK/eh5v7VyDe7cfqVncvQW9g9hHbdODLqSetm8IEm0dLpCZXFkqKfZR6LA
	7JpARqbEOqvIbM0mD+z/YoelrVdOXSJdxp0yCWGTTebyR+Jp7JelUbyhCjES7/KfRLjlH3DPr2b
	/K0Kz3zPzrCH30FKewgerWYLEVTGeRhmIP4v6RrBlKDfWdUsWHO1Ii6qWQz8DCQ/ApD5SL9O7cS
	Ho/hVdB0GBAlDg50hITPmGwyS9JglFbLqlxQ==
X-Google-Smtp-Source: AGHT+IF9SEReU4YSa9zZmaQfczCwFtlHjw93GsdF9RK0cmUTjPuFkP1qsaBmW8ENhtscOMr2RHFidg==
X-Received: by 2002:a17:903:3e0a:b0:297:f793:fc7e with SMTP id d9443c01a7336-29ec26a9060mr14560955ad.19.1765373147917;
        Wed, 10 Dec 2025 05:25:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm184283485ad.79.2025.12.10.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:25:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 20/43] openjpeg: Add nativesdk to BBCLASSEXTEND
Date: Wed, 10 Dec 2025 18:55:30 +0530
Message-ID: <20251210132530.306506-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
References: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122524

From: Leon Anavi <leon.anavi@konsulko.com>

Add nativesdk to BBCLASSEXTEND because python3-pillow requires
nativesdk-openjpeg.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c40f787eb07e2c0b0b92c9f457a10922dea1008)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 23f46c45cd..6d7d87f5f1 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -17,4 +17,4 @@ EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/',
 
 FILES:${PN} += "${libdir}/openjpeg*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

