Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE008C43219
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.26112.1651346316998133995
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VT+nGoyW;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id n8so9706363plh.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vFtziuy3sAX1xab4SSJ92dVbWTb1Y4HeCzOJsUivwFE=;
        b=VT+nGoyWncZvo6ju9vBX8nGJVUr8KYJXV6uFRlHlHDbxxp4JYaJKF6vP7R1gteGf7d
         RCYzfXar9tf1rLj5MtVfropbIiT24Udap/mD/+5M8M1WqSY6R3UBUunhWtbj8zMWFOzX
         uxSpguCS+9py2RVs2Z2rsak9q2sVcc7/c0uOxTO6cEWSZei1R4OMR5MxpPIo7ugls29q
         q5zXSf9bnnu2eMC1QTbl1BfQhWxWXm8TEzJDYIwQqnba1XXLge/W10Vv0obObh8+jR+K
         njwdCHNCIaOtAlefGFIN0cQQb92PRrG8ZR6Jkd+DNfhl3r6k+lml9CMtDmeVqRBQULYx
         cjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFtziuy3sAX1xab4SSJ92dVbWTb1Y4HeCzOJsUivwFE=;
        b=kpi3W8XtskHePc3h17k1+0Ti0pTCXbPGws1Ms8vDIQkcRV31DlQqz0JXP04i/EemqH
         Qfb97CjewIrzabV01IHBV/C6//uaoasqCFtgIFvYY6eGDbVb/jzdbJrTnrhZEc6bUE7R
         9zfh9gjZDAboPJ+4SWedS0OKRklQdje5W4e9/0nTTYBWvPzL2pNKP7y2ZqFu5tHo1STZ
         B9Z8LWqFZd0onG5LCr0M8x+FcY7ccjHCO7Y9EQEY/I3ffZSAtay8bGNuVcUBd98rEg4c
         zZULlOD0Ue5iI/xkJ95XlL+UCgd745CasrD1eQmlU4UZQUOgu6CFc5skgRtOJCP+6X9J
         OXFQ==
X-Gm-Message-State: AOAM532/JQJYNT+FFo1Xpjra5EG2ntcLhVZg24caV6j0kEFHI3FmlBxs
	SEeNm87SMCtTCvcftqHl/alW7MrUNIb3qg==
X-Google-Smtp-Source: 
 ABdhPJzqMlN7JuXVnCBhcM0RVYInmP7KB8O3HBeoiW+Z/oEAIhHaR1zRt0GTf4VgbPZxUyvLf6YbLw==
X-Received: by 2002:a17:902:b7ca:b0:15c:df6a:be86 with SMTP id
 v10-20020a170902b7ca00b0015cdf6abe86mr4857845plz.70.1651346316257;
        Sat, 30 Apr 2022 12:18:36 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/39] tomoyo-tools: Drop md5sum
Date: Sat, 30 Apr 2022 12:17:47 -0700
Message-Id: 
 <8b09172ce65fc1883e741f197428e785a465286f.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96874

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 984bc7eaca68923299797fae0fc6f89e2c6749e2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
index d9f09d1744..2fcdb6bd61 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
 SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20170102.tar.gz"
-SRC_URI[md5sum] = "888804d58742452fe213a68f7eadd0ad"
 SRC_URI[sha256sum] = "00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283"
 
 S = "${WORKDIR}/${BPN}"
-- 
2.25.1


