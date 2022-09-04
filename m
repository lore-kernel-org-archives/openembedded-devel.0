Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE29C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11382.1662276912373778625
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EM9oIEMo;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t3so700536ply.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q4ssG8rzL4hE853etklZvpsa/ua/HK8F3MaVRDsCmAk=;
        b=EM9oIEMo/IjihF03g5TQ7bvRLaAT+GQ6H16SOR84X8CQ6T1+7klD8BNGflMtoF1LPV
         T7fvVKswtL21GmwvBxvVnkDiFZhGX4ymS3FhdvaPJuHD6qkaViX8gN5KP1tWXsMD2dpK
         CugNX7hD5ZLwpw+lUznz1DC93q2y6bE2bdBhlImxXDDExXQKE/TOHNN0bX+U+SuiS3+F
         mpgZpFwX69PylSTKeqEGEMotBQGcr0BPuSdpGj7C/AUbaGpnYLlZJppAx5ip/yCxSK49
         73PXGB58I9+iaNtXsq8GQlVFfnmIxwvyOz+SSHTW9BaDLZ9eQApbBYHhB5uH7pYg1VJB
         wCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q4ssG8rzL4hE853etklZvpsa/ua/HK8F3MaVRDsCmAk=;
        b=BbHaGAvl1nNaPUZu9JdvnwovqGc14/8x7GFv+lX9iM5jnTiHNfqPNFIIvHYxqORuNU
         SI1bKH9ge2HO5T8N6QJYyHP7XKukfRTtljSnYnldV08bJXGwd62MkGRlrdLFLf+N/7EY
         M2fW3DbQe6JRwiWxl1r4pbD9rK3GSmhrh8vcRX1QMdn3TRkMJB8RDcB753Wdn2KAP07m
         XLIeuPdfjtkDNWr72gWWgJ9FMbAX7DTMTxEPtMKVW7Q5emC9dKuBo4FYpJtT0FHlHI5W
         hviTiGr3ddAR7vKL76msE2JMn1PiyUppWH1dt0ia0b60utC5AB5AyORs0hvIMfqpECJj
         59zw==
X-Gm-Message-State: ACgBeo13mZyLWxnpAG1iPJNePyb5hO2/PQUR9LWQxKYcvfVYNPPRbV2b
	UElFo1t/aYxo8GQtRIA+K6M+asUxDsDJ8g==
X-Google-Smtp-Source: 
 AA6agR73WtUL/9wD1/MISXMMEJbubLUv5qLJ6l+crPLl303XMcL95gDx/27Edk9tg/xyAr+OL/Hhpw==
X-Received: by 2002:a17:90b:4d12:b0:1f7:a6d1:24c1 with SMTP id
 mw18-20020a17090b4d1200b001f7a6d124c1mr13339999pjb.15.1662276911437;
        Sun, 04 Sep 2022 00:35:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 50/63] glm: Disable clang specific warnings
Date: Sun,  4 Sep 2022 00:34:04 -0700
Message-Id: <20220904073417.3251865-50-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98644

This code should be fixed but for now lets disable the warnings as
errors atleast, so it can compile with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index 71a005a564..9edcb2b6e1 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -22,6 +22,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+CXXFLAGS:append:toolchain-clang = " -Wno-error=invalid-utf8 -Wno-error=disabled-macro-expansion -Wno-error=reserved-identifier"
+
 do_install() {
     install -d ${D}${includedir} ${D}${docdir}/glm ${D}${libdir}/pkgconfig ${D}${libdir}/cmake/glm
     cp -R --no-dereference --preserve=mode,links ${S}/glm ${D}${includedir}
-- 
2.37.3


