Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCBEC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5177.1669792760226155629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gra2gUMv;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so1078367pjj.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuTQ1D+vDQfOspmOfJtyOnG/rO80jBaRn2tJiafVILM=;
        b=gra2gUMvnfjLYsreVINk6So+Tm0dGzBDhBfn3oAxDDI641sOM8Q0vE3D5H2fc3oaq4
         TKz3ux8FHVKXEzYQgB3AHXTTZfP8oFO9hDF547ZtdHfzXuT0RPl4oopH/ylXm8h5G4uk
         PcoTCE9oMe+v2fAkgFUaFuY7Uk/yPaGLuCQtDhRhs4ydZVMdPD3KFoFxHe1y8TXrWe1t
         sfBTgXNGQqikyQOLh51LjAaISSJrcQJrz9vOQT46DKDM0Pot43eS1vXx6i56ewfDadPy
         S+xNuaIhm32W/wEcs4DeaSEww9QQqle3ZMb9Bkdg85djBBZIUL0ApVVeTh/ukgHSR+6v
         myYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuTQ1D+vDQfOspmOfJtyOnG/rO80jBaRn2tJiafVILM=;
        b=lUYhHJibY4+HmDRYCardcJ5MgKj3991NgTR/AkovFZWQr2aRQ9jEhDPS5wME61B8jJ
         EOPmMabzCLJIB5P3RyBqceL9036CVCdXUh+EA+p/kza1FibxlIW3GYNgcyLgeEiqbBsC
         mNh2VcY5pXlEt5v6mxxjDO4fnLO5gGz/pYdc3R/yCuKNVfi7royvfs6WbQCm7c8uC5lE
         2Y7O0SL2weplJP9D8aKzORfQwYLFEtEfcH0JZXRaoAH7GgKVdV7eyJuVa4QNvsd8ZvUg
         e2B+GLzysCxIHCEf2zdmP0uDXy825bbgmdpJDm7GZ6tj1STlZNG0vIC2qcTIU1Cl71dt
         wQ3Q==
X-Gm-Message-State: ANoB5pkHHwO4iUJl3DV69zryUTzuVYUcK6Rrue44VSjDmZjHBhyNpbM7
	/vBvSUwWIs6qv32kgwFosS4wAFrg1D0=
X-Google-Smtp-Source: AA0mqf6s4oJekEuZPWHy+K1A31V4iypLj6Ym8XV+CcMssztst1fEJmMmYVwKF/GFCoBuimgZBZ87gw==
X-Received: by 2002:a17:90b:258:b0:219:396f:8a09 with SMTP id fz24-20020a17090b025800b00219396f8a09mr13582683pjb.20.1669792759444;
        Tue, 29 Nov 2022 23:19:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/10] satyr: Inherit python3targetconfig
Date: Tue, 29 Nov 2022 23:19:08 -0800
Message-Id: <20221130071913.1805812-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99862

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/satyr/satyr_0.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.40.bb b/meta-oe/recipes-support/satyr/satyr_0.40.bb
index 5b44618b72..1ce28f1f04 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.40.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.40.bb
@@ -5,7 +5,7 @@ space, Python, and Java programs"
 HOMEPAGE = "https://github.com/abrt/satyr"
 LICENSE = "GPL-2.0-only"
 
-inherit autotools-brokensep python3native pkgconfig
+inherit autotools-brokensep python3native python3targetconfig pkgconfig
 
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
-- 
2.38.1


