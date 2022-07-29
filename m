Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE214C19F2A
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:03:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.258.1659107026736590805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i/1bh0zb;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so7358293pjh.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wvlh02croBEJZT9a9YHyecIC4nlZL9pIfv9LpOwJvks=;
        b=i/1bh0zb6K/IsSjVnyamRKBmpb+1cqI58ba5yUdSSBQ0IYCZ1LvZXJkoRjjuNP5kzF
         dmuXnN/Njk5Mjb6aclqX0O4nujBTUExQ26yS1MrDnFCV9g3KmTt7Zvl4Z9YQE4fyDz3c
         eNnjeUmxH9wwW1Hug5OXDTCBUjR7agNXs0VEYiYZnvDLQ8M1HDzzh0KaokPTGLL179DU
         i+XOJvNNm1/JdLiBoziqWrBTxGZo+XOXekSYAgXrfwxZdiV5KJKjIshkGcJ+Rt1sVQLm
         Yy3+rz9ZdF9tJ0AepPBqY97x08sTM3frYJM0RgmcU5Kj2uJnZPhsCPSPQxtykR9+QSZO
         KBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wvlh02croBEJZT9a9YHyecIC4nlZL9pIfv9LpOwJvks=;
        b=xl4f/mAI1TXYUqw7aBkoSyu6HBvxBVV45o78o3Ou09EbGlGsa6/43uXoGDdDAKYtDE
         IKMgGLga1jutr9tN8wKHpGmUJaoXC0XQYgj8hz3nkbjF/9IiMkPvmJzdsDINeS9zpCX9
         PVTOkaOHa/eBdSFpbOUticIew/yD47hRg1K2T6cnuylfgYwmjxYA3lZBtp7kZm7ZYHLx
         8T0M5hO9M0MB0Wbuw56cjV5V1vBQpONJjA4C+LmzBUwd6ir/17vLrCN+8giWljPJohvN
         G5+X9vCupvR38I8P1IqN+1blP95mTjv2P7aaefOUmi152C9zkTA9FIphUWzscxCF5MxB
         q3KA==
X-Gm-Message-State: ACgBeo00WsfWYg1vxAVVCVXRpl2g7iGQ6W6iX5B719cFZWILKQ/Rr/tt
	T/goR85T442aLFuV3RSaqQHq/Mz3tRQ=
X-Google-Smtp-Source: 
 AA6agR6FlQagov0oFH2WPImiN/0xJzN2wahb4EgyOplhx/PnoE7V7ORDAC0Z30MPD1A/PrVMLwSExg==
X-Received: by 2002:a17:902:b407:b0:16d:3e9e:3c42 with SMTP id
 x7-20020a170902b40700b0016d3e9e3c42mr4156613plr.150.1659107025751;
        Fri, 29 Jul 2022 08:03:45 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa79aca000000b0051be16492basm2957080pfp.195.2022.07.29.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:03:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/5] redis: upgrade 7.0.2 -> 7.0.4
Date: Fri, 29 Jul 2022 08:01:38 -0700
Message-Id: <20220729150140.104164-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729150140.104164-1-akuster808@gmail.com>
References: <20220729150140.104164-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 15:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98043

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
----------------
    (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
    key in a specific state may result with heap overflow, and potentially
    remote code execution. The problem affects Redis versions 7.0.0 or newer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d9f8d015a45188c3cf2d6841ea05319032930dbc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_7.0.2.bb => redis_7.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.2.bb => redis_7.0.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.2.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.2.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.4.bb
index b188278e1c..993ff34b10 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "5e57eafe7d4ac5ecb6a7d64d6b61db775616dbf903293b3fcc660716dbda5eeb"
+SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


