Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301BFC47DB1
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.1299.1705454009035755922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ta0b2g48;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e734251f48so83053357b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454008; x=1706058808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5nAakrvMcthDpnNWLNGLVnA+ERfOLn4++oW8vU9Bwo=;
        b=Ta0b2g48XM+dbnN75TilvveaGF5Nn6MuYsQ8E+3T5XE/ouwDmSzWfq+DePs/sgNf2c
         4ng4G74xLKLwADS81V+gayQFBAwOrCEku8xG+rFZ1jgzscUmR2Tmc9UmuAWKXHKKxduX
         SagEpO6hug74o1otbhH/oqyRNj5d+qjrUsOoc/82+eOZ/48ThGbsQHg7ncttze4EIKPn
         DLZEzaZ3eehxD7xIF8yZTn8uKD3DEWBZb63oPrI8CORmz8niWcgDbGfvNcTC4nuH/KGH
         BPXy36xgq61jy7Y2znmORhpWBP0crR9THzyIbH7405q5enYwBY3fVrlItHCGuCmB6tEM
         Bgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454008; x=1706058808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5nAakrvMcthDpnNWLNGLVnA+ERfOLn4++oW8vU9Bwo=;
        b=qlC2f+D1WlN+ITYfqqgk4joO+ck4goEOgHmXq2jgL7KulCOfqPbCO/abv3WpljjdMv
         x2g1cc1VAf9XScXjnFLztLIepDiIiwMx0Wo3pGsI3QXjy5ECxsqQpEppePhs2mekB+if
         6do3xN7rSBmIyzV3C4a8xyb5m9OKJZHkmbaKVBRiegr9oXRANLmKb5dhs+lbh2GybXiU
         y1h4BpNxFhpwhWtMy1raJG93AnPQz0NETfiO7JDqRWQxN8DjstmxBNcXJzILbCxClJSN
         i3CKbN5bVS5VkrvCTM6ZZB+SwUTmnEGTVgwSP20lFElywrZksibXdVnaI52mT8MHDy2Q
         bCcg==
X-Gm-Message-State: AOJu0Yz5Ukr+B+CzyZDzgnvDQXKZ9K4paj2ZyoYaY/w/85FEQTZ4S1E1
	8IHCFYGmhr7LCEtoCRZ6tl7w473kjUz/Zw==
X-Google-Smtp-Source: AGHT+IEecjd32SxeSmeKnSoZvLcYklUU6Ojb5O6JpV1Tih6OjyWvgsxEkUiosiRJNyI8l3aFjb1hvA==
X-Received: by 2002:a0d:e80f:0:b0:5f8:8031:3d6e with SMTP id r15-20020a0de80f000000b005f880313d6emr30415ywe.4.1705454007952;
        Tue, 16 Jan 2024 17:13:27 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 10/11] redis: upgrade 6.2.13 -> 6.2.14
Date: Tue, 16 Jan 2024 20:13:19 -0500
Message-Id: <20240117011320.1856392-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108320

From: Changqing Li <changqing.li@windriver.com>

Upgrade urgency SECURITY: See security fixes below.

Security fixes:
(CVE-2023-45145) The wrong order of listen(2) and chmod(2) calls creates a
race condition that can be used by another process to bypass desired Unix
socket permissions on startup.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5b34766daadf8f1e8ef3d55b24e0037c4d0727f5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.13.bb => redis_6.2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.13.bb => redis_6.2.14.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.13.bb b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.13.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.14.bb
index 640831c525..fa430ce402 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "89ff27c80d420456a721ccfb3beb7cc628d883c53059803513749e13214a23d1"
+SRC_URI[sha256sum] = "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81fd93ff267d09bc277"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


