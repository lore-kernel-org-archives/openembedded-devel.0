Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2815EC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 21:33:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.9423.1647120803315984386
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 13:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tb/JuSWb;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so11151339pjl.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 13:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntxD7iFxx/Cb0VcQ/5d5iOA0Pa+cQuv8CxmQUKAYINk=;
        b=Tb/JuSWbTFlpkdvGJG0Csn3V3gQ1j0bVGv/mkVRsVChUYPaaXq+EZw62qte31fT4ru
         6qbDnjI7eGKJIoWrLjB7wh5+CiQyidiGPwFu1GjJA+wUJwuWmzB7IgqWRMunux4dSRDa
         WGKcQx6TcVDJA/rNdOJA9so51gbGizFaLawYNWPKgDGad3xA4yB7tie6F298rdke/p/9
         F636yj/D5ZLaA3V9f237muA6s/q9DvsxiiC+Bzd/pqSj08EA/Dv6/nUETnlQun/EqIA/
         Rzz/m54C9YK8iB03Jl9bsoe2XekB9t/ZuPC5K4nrhGdoEHAr89e4iwVGb0zv3liCQLin
         fI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntxD7iFxx/Cb0VcQ/5d5iOA0Pa+cQuv8CxmQUKAYINk=;
        b=PcM5M+qeRTr7EISqrbMSfmCSSJDXmJOLno8qidGqeubIcTsSUG2plIcgf9IanV2HUG
         cIeGYa58SRczSzCVSX9lRHMAeHBpInEEK26IGeXxm61gqGsS4T0EOI5B2UUnij4Mktjn
         ViNu7TvZDnLcDMOZfwYojEraSiB4zpIiZcja2+5VY1xBtk0URd5eyvcpswevCywxJ8v0
         46jrLgp6kbU2pHHottFFv2HG7B4yWq6dW82tfZ6zzF8QIzfaIOK36s0d2n1KgQX1/Grn
         t86MppAj+dUe9cCOF13fx8lbpzgw4TwNBZL3ivjhsrHqI9usIZhnM3EdnzFt8rZXtYXw
         Sf5w==
X-Gm-Message-State: AOAM533xX5pStSsAI48WmYdNMRmmjBmredPdgLRlNoZNt6EHoJ93cO6P
	7sYKta32BvxNZBpVPx9TB0a1kkcmqsckcw==
X-Google-Smtp-Source: 
 ABdhPJyXJRr98LXBiu4FK97PlPzQKLTVjRbv2UBG77Bnt9R3R/KGFmBU3b28D7Hx/GbjzvSUVgCwzg==
X-Received: by 2002:a17:902:ce86:b0:153:6ea:89f8 with SMTP id
 f6-20020a170902ce8600b0015306ea89f8mr16209147plg.128.1647120802688;
        Sat, 12 Mar 2022 13:33:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 gw19-20020a17090b0a5300b001c5c937384bsm3102230pjb.52.2022.03.12.13.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 13:33:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-poetry-core: Setting
 PIP_INSTALL_PACKAGE is no longer needed
Date: Sat, 12 Mar 2022 13:33:19 -0800
Message-Id: <20220312213319.1814870-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312213319.1814870-1-raj.khem@gmail.com>
References: <20220312213319.1814870-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 21:33:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95965

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-poetry-core_1.0.8.bb        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 99ec763c4d..22d7076d01 100644
--- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -23,8 +23,6 @@ SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa4
 
 inherit poetry_core pypi
 
-PIP_INSTALL_PACKAGE = "poetry_core"
-
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
     python3-core \
-- 
2.35.1


