Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA82C5B549
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 03:05:04 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2706.1748919900606330502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 20:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aBNK60nH;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-312a62055d0so2219249a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748919899; x=1749524699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfu/kGoCn0C393dqdcBHNU6mqeApIBg2bxOKg+LBIpk=;
        b=aBNK60nHOpXzzG2npkw870DYUX6ScIgqSKraR0iZgOE8DbebU1XLkZCStLp2h7ZfI3
         Jw6l/Q6fjhyT0xVX15v2hZ7odEccNmwZtf/pUrj8tBenEfYWZfbOYJr7HvWksnT+rq6U
         xxxssjo51znlWLuIqRKxx29HXVrVtkGI0zj18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748919899; x=1749524699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfu/kGoCn0C393dqdcBHNU6mqeApIBg2bxOKg+LBIpk=;
        b=swzi99vIRfyR7kIl81ek5debZ3AiV28QDeD366mZH7FLiq/zhMkvGArLs2AYTe1XVn
         yTnePhPUKBmGV1VjtQoG6TWk8N3tPQJASZbHAdUfa1Wxnr1BfAFFHLQrwKL2TiBzfPMa
         vUDMX7FiWcz6WlkOuYcMdGHI7waowv6FJQszORM4aKzxcnIGt+9uQYB+4eBqEh6Mh+9u
         ixN48uVsCEFEmoFRO4OXzvEaqW02I7WdkRyJ35702rbqnPiuLhOgzgDRSQIJVdY0g1MT
         0e4t0hP0Bd9m81h4qvgRcjTiOtk67eN5gWq4VM5wNoaxv6ZPIDMAObwomjzS/8Gx2LGm
         Y2kw==
X-Gm-Message-State: AOJu0Yxcr8BmV62kyVewB0j6/G3kxQGfdvNxd+aJ4uiV+Cp9G56lwgfT
	Le796FE/WmE9f27Qh9F57ctIqw1rZoUaONzcBt9SHZPulsjuy1AjDo0rClkRrIvo14sTETan9Pv
	PR2b56Vk=
X-Gm-Gg: ASbGncsAIGxcQuChGWXqMNiHfyIBK7OSQLmgabo0VNICe3bOzI75xuIu/BQknzhkKz3
	XLcUr8nnHNNtx6T5CR1sZreVBcRoovl1qj8cq1zqU+MMbyqW71KhyLC6hpl07F+PmCnqXw2GnkT
	pD+URTHyHiRn+sau1F8k09/g9ac2kx2FPvaVtw5gOlEfaqMby/k2KTLjR0NOKMwaCRdrHD/1ldx
	jWYiuCkXhKCOJbK/QeF8+JANSrYWTz6nJwTkMhMNAA6fkR8vtqtx/ZXYT1IioC6CxaSNRJEHRGP
	y/cCcWEPhfK3s9t1Zzsv0GsqAgcIHoHkpnIAeChL7Dv5N+u8119e3iv1Gijd/JQ=
X-Google-Smtp-Source: AGHT+IGFZd8zYXj/F5JX5OJuArokQCNHVWwlV3B4oxwdtW19Tbn7nYV/hRyE2Uhm6SIKS+cc2wbCEQ==
X-Received: by 2002:a17:90a:2ce2:b0:312:db8f:9a09 with SMTP id 98e67ed59e1d1-312db8f9a7cmr3118390a91.14.1748919899532;
        Mon, 02 Jun 2025 20:04:59 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.194.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30b693sm6310464a91.31.2025.06.02.20.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 20:04:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][master][walnascar[PATCH] redis: upgrade 6.2.16 -> 6.2.18
Date: Tue,  3 Jun 2025 08:34:44 +0530
Message-Id: <20250603030444.5927-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 03:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117718

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
https://github.com/redis/redis/releases/tag/6.2.17
https://github.com/redis/redis/releases/tag/6.2.18

Security fixes
==============
* (CVE-2024-46981) Lua script commands may lead to remote code execution
* (CVE-2025-21605) An unauthenticated client can cause an unlimited growth of output buffers

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-extended/redis/{redis_6.2.16.bb => redis_6.2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.16.bb => redis_6.2.18.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.16.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.16.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.18.bb
index fbf2f04e3d..171c6640f2 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.16.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "846bff83c26d827d49f8cc8114ea9d1e72eea1169f7de36b8135ea2cec104e7d"
+SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
 
 inherit update-rc.d systemd useradd
 
-- 
2.25.1


