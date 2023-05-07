Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB75C7EE2A
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:13 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.69125.1683477189810614116
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bDdM1pOL;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a010774a5so56635087b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477189; x=1686069189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jFhzKfinvjesvKqfsKBtAXXypB+TaraaDFfQERoL54=;
        b=bDdM1pOLrlnncPQAKA7ZZ/qdCyqx2xrjZMEHf+rE8sLmxsneEhJD4ZjCxJ3YnP0NbL
         y55VMGWZ2R15caDNx5oWlp6bDGF0eldFfOkV30T4pQtKEebcrI0oqq31g4PmDFMMiLJp
         1+qfxRLw58Jfppk7RASgBthSN0dYsTTwr5TCT36+KLiq0Xp94OWK4pclOaIeGxSDhaQ+
         n5s9uJSFxdkCjA0EzxpBMYFqSuoKQ4AsgxRsR9u6r0swIvcTgML8dHjo80KAzt/PjoWS
         gc4/uMyR33lTA29rfOJ/mxZCkX5bE93Ey+u71WxJDI9Hgi8DnJ4UHFrF2K5tRYPC04Ek
         3lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477189; x=1686069189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jFhzKfinvjesvKqfsKBtAXXypB+TaraaDFfQERoL54=;
        b=hQHbtD+V9XHrJpjT41ip+OL4IDaXkW3Yorx4FxtcPWeGPEyX4xeYTmEpMCTBSw5H7n
         Nrp/a+DHng8+LObfKnlxZD2V+m8VcDb1oQuoPaGqYbyM++A9fv2xm2Wf3yPjRTmqgCGy
         XxaPFZF+ttxg9fRrR/x1WmFOFRepx+cK32QQbH84Qr8n5jnZksluG964OUxRqiMpcldu
         0sgJLEYQAUiWeeOGKQmyqEl9PSa8+LjbVJsr4kYvMsITlslKP+08x32iJ0SLgqImkVqd
         bVXt+dE7F0eX7klkHQmNtyq7T0H4SFW5E1irWW75nxbIXAWcZM8csuFd4qfQUMfL84ow
         AKcw==
X-Gm-Message-State: AC+VfDyQu1KMzw5xUZuv0AGB+oQpv5oFYa9mpblxL8ICqN4AjhFPG+Ny
	H5YMrehT5YyDMzFyz8Q/lfC/z1JFPd8=
X-Google-Smtp-Source: ACHHUZ6LFMhGgbdpwGMfgtItYgg1zj5jptCw/oDoVZyMgKHBTJOrrG9WWenvhcOUSyqTraRu4XVxzA==
X-Received: by 2002:a0d:d581:0:b0:55a:3486:6f5b with SMTP id x123-20020a0dd581000000b0055a34866f5bmr8333144ywd.13.1683477188762;
        Sun, 07 May 2023 09:33:08 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 02/29] redis: upgrade 7.0.10 -> 7.0.11
Date: Sun,  7 May 2023 12:32:38 -0400
Message-Id: <20230507163305.3261044-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102332

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 34153d91b47765eedb3f0010ec7bc367a00c82d6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.10.bb b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.10.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.11.bb
index 5d21f7e877..4626044781 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.10.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
+SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


