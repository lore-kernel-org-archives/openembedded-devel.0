Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C8C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:27:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.6746.1654086421941112790
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V5Aj+Bis;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so6102720pjo.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pZZ/tjVMMkWNLhjYEWHGqrK8WDoJ643XrMdRLon3w70=;
        b=V5Aj+BisNrYexemWykAJg9mK2ZRacjEe6d1BVFYd5tLagOUoaI0YsbAW7deA+dU8Hc
         PIKWZfO3YdcjGxlROqmFgRTg+gAkQdGDd1LoamO2tQpReA3emcfysbk46IfKpkYtCGFg
         UkxZ4/cWM1lJAdlJxXiPTkt9ELXyyTGmApwS08draLLzdqChfSoK2eHF52w3CveQvA2v
         CA2bqhnWliQznqvlkwc6nrQMGsA89QwEa/4HY9XNFpXgcLgGVamjGnWfb8skFj36wjZc
         QTpcjvWsWmkI+sy2ROxTj3hAr8hWM2auMLx06rncajbUQiuVeuy82qZ1dWEh1/p6Zawa
         epIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pZZ/tjVMMkWNLhjYEWHGqrK8WDoJ643XrMdRLon3w70=;
        b=MC163hM4Wa5sZ1nyN+gyG/CuutHW7kz+D3YWeiwAYGAeKnCGoMCm6PnjD80czeAWyA
         94zius3pd0Eg9wJokMK3OrJs+omNMcL6KEtPJJIuTXsSdQZS8waN8uP6locf8roEVxWF
         Dc3EW/3tBidMSQRN+CMz9dR/5JEpmN7+YuJ+p+nZQBLMOvkRCWW0cqC44LswRG/nzazS
         eF/gj4wMXYBrL65fUGE/IaWyWpEhcqMATBhXJRYdawkJJ0r2BD6iTQeTv2UhgHs8s5eP
         mx80YryqYfSwT1K1HhBAff9fTwHJNlPl4g5P8ap4gSi4Gvt0yhraGNjjoC0WqaWfB5Bj
         luhA==
X-Gm-Message-State: AOAM532RspPGNhs49J9RtyC/Zug1LNFxTdhFGgEegsztgsIUYXOcCt3r
	NpFcDVGIrQJTWzynubI1vJ5jRzWyi6JSTg==
X-Google-Smtp-Source: 
 ABdhPJyueLN4RcxVKlp0ILH6KkPmwF8xhCqqvBzGGIq3nzgtRPLfNHNdek1n4ECYTcELyqNCUOSp+g==
X-Received: by 2002:a17:902:d5d6:b0:162:64b:96b9 with SMTP id
 g22-20020a170902d5d600b00162064b96b9mr54682331plh.94.1654086421155;
        Wed, 01 Jun 2022 05:27:01 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:27:00 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Xu Huan <xuhuan.fnst@fujitsu.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 9/9] python3-pillow: upgrade 9.0.0 ->
 9.0.1
Date: Wed,  1 Jun 2022 17:55:27 +0530
Message-Id: <20220601122527.19987-9-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97367

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:

In show_file, use os.remove to remove temporary images. CVE-2022-24303
Restrict builtins within lambdas for ImageMath.eval. CVE-2022-22817

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 91e1461a2844e7d82287b7b9b3212678bcf67408)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../python/{python3-pillow_9.0.0.bb => python3-pillow_9.0.1.bb} | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.0.0.bb => python3-pillow_9.0.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
index 346071d1ca..1f0fdfa349 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
@@ -38,3 +38,5 @@ S = "${WORKDIR}/git"
 RPROVIDES_${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
+
+SRCREV = "6deac9e3a23caffbfdd75c00d3f0a1cd36cdbd5d"
-- 
2.17.1


