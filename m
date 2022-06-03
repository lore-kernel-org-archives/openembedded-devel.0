Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AA2CCA47C
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.2441.1654283966112252072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YITGL9C0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y196so7841675pfb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AN/IsEL1Q36/Ja6pU9cZKonQkNZKkSG2nTNJsR4xyvM=;
        b=YITGL9C0p9CJl/HyUqyUik7keL1JVV53f3s9ZpTtaHB7WAdYMTHDjYD1vZZfi0R+s3
         EGXkCpL6biFOW/06qlZuSP/OPC9JfB3Ks53VlP+s/O3W/VKzQtGEThX8wzI0xU+wCUk2
         SJKksQi7M+fyYomhYKv1jCrw690WPYZ/GRqVNUj5TAWsd3PfXnHwdfh2Y/8S/RXeRz8b
         qlzmIENbTrtPG295BSmO0nviLt1nG1RwKgHnGkA99a7obd+rHctQJvsewD78z8aysXel
         j2zAdCXjzXGfnOikG7nuk26McMzhyUh77VY44KBWX5f4O8skj90gjGgcpTjIQWMyFF5l
         oVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AN/IsEL1Q36/Ja6pU9cZKonQkNZKkSG2nTNJsR4xyvM=;
        b=zNYyjIg2G6QZa0r4Vg0YRodB13IbCe5cCcOSg8SAd3f4yGxROEh6S8aSECwUD+wOPZ
         lrxT1CDVsV5zwdfno1q3Ude4ZV1dVyUDyTeizS/mAT6UVdblU5XhXqgdPuNcSYe1uP8h
         RVmZkoocEmWt8hLzvpysZ+KPblU3Cl2XHVqHcoxzSuWEgZSe0df0fnGbLEabFO0G3CAV
         aJXvewzzNMOVqhI3voqJhY74ZAKkkbmj29Sf3TAlmGIn6Yr7DyDLBwv+npZI2pel17Yh
         Ij8P1qzKDSYA6iQli+X0wve09lU0cOmKOCLtDx0klJaRDhgsDB3+QeqJEJ5H203dIrW+
         1iVA==
X-Gm-Message-State: AOAM5327qaX/NJ3tquCrZ9SvRnhUfKFXDq2UzgyEgSxM4CcNZ7FWP0n6
	Kpc6ZSCUqsD++IT1cAR+T2YoS1r4ycc=
X-Google-Smtp-Source: 
 ABdhPJx80L4y12/zriaDvI93TWVKCthNJl9Z3vUBtBf/0e3i1E9ztUEBcKC6i8Uu0X2KO/D/6s1ogA==
X-Received: by 2002:a63:84c7:0:b0:3fd:862:df17 with SMTP id
 k190-20020a6384c7000000b003fd0862df17mr6131114pgd.28.1654283965174;
        Fri, 03 Jun 2022 12:19:25 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/20] jq: Fix typo OE_EXTRACONF -> EXTRA_OECONF
Date: Fri,  3 Jun 2022 12:17:01 -0700
Message-Id: 
 <2c051c65a4618d8f832af888ac275b9040641178.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97391

From: Joerg Vehlow <joerg.vehlow@aox.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1aa9d7d53d05b01727a8fdc2079f7c00e273fc13)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index d0c70da76f..8b0218c83e 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,ruby-native"
 PACKAGECONFIG[maintainer-mode] = "--enable-maintainer-mode,--disable-maintainer-mode,flex-native bison-native"
 PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 
-OE_EXTRACONF += " \
+EXTRA_OECONF += " \
     --disable-valgrind \
 "
 
-- 
2.25.1


