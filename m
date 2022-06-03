Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F2FCCA47C
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.2448.1654283991344726754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9QZ/97s;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id n8so7483041plh.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4GtX6ZpTPvcOJym5gWVi/+H/SXpAReXkLdMdoMZmMwg=;
        b=G9QZ/97sZLE9CsLK787lGkBKvE5TVpbrvZ2n3/Eg3PZwyMxJH3mjX92Y3NS+x7mvsG
         K9vvuS/dToeA8Jq+IJAz6JVdO6BFMrU3kj2V2/vRitzaR7e1ldjGYDEJh4006paT/XIp
         aYC9WPAyFe74WzruvJTc1xTO2G0ZIKi8D+rNfaTBPG5dL19tWb88TaiuJeEqcbFlJuSL
         eWEv8Lpf+oD2KyQ7WSLBzOqVnYh6PoIQeqjXU7FWS3ZzalZOdTl4J6hXAABWMZItqhrO
         232tq12bYUtTCIiMWbEe4945hQANTROPNwpn+X9NjVb7V8K99lX9+LIrahcZlftHfYjb
         p6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4GtX6ZpTPvcOJym5gWVi/+H/SXpAReXkLdMdoMZmMwg=;
        b=bc+Ns9tMwOUZKu++PnmJE7ctkek6AzNuNAiee/fRDTo3Rp9az+HkBmOVynlSCRsjC3
         IClZeZ0saxICgYb/1uaUv9+8M5HVT1Kpp6TAqruslC/CMl8j3RnmmhcVq3TLDrRv+WK2
         9C+XsBirODxPyYiu2lYPjwpThH28aHMl98VwPbLyOkCRHZKycqjf7Hz6VeasRhJ+fFfy
         +J/ceqVC5Tr4ojtSYs0HG+U077fatBINF778l/eXmG8Ww9P+QL2mz6erJFlbTlCVblM9
         RESc8kdVugRs2FPK4ktw0wtCTKs89ct8FLxpzBv4hNe3X0hgjscCoEHVOhvr/yd1MqR8
         GNmw==
X-Gm-Message-State: AOAM530WqEUXTD8Yf5dXV7OvIFKF04f6ilf0qChKncuY3gF6C5w46khY
	nUF5E1Yb4PCa96xUrxCDri2MqcCnPEQ=
X-Google-Smtp-Source: 
 ABdhPJxq7QSRS9GmVh0boCtXpUXRTuXEnv+9nT5MOaG5RCWOHaOTjDYp+jsBat5sny4KgJt757uMjw==
X-Received: by 2002:a17:90a:6441:b0:1e0:b413:c290 with SMTP id
 y1-20020a17090a644100b001e0b413c290mr47235229pjm.179.1654283990461;
        Fri, 03 Jun 2022 12:19:50 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 20/20] python3-matplotlib: add missing dependency
Date: Fri,  3 Jun 2022 12:17:19 -0700
Message-Id: 
 <fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97409

From: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>

In order to fix the dependency issue on PIL module, python3-pillow is required.

Signed-off-by: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d4e70a19600bee178d81b467dd9e118cbf057f65)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index b9eab3c931..cd05b455d4 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -50,6 +50,7 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-kiwisolver \
     ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-pillow \
 "
 
 ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-- 
2.25.1


