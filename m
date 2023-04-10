Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A7EC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:01 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.52956.1681153079523372654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=MUN9G9+o;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5049a1085c8so1090070a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153078; x=1683745078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LbDnRrW8gk0NVL5mUxUuMezT83fU9Lwy+1ZgDoFd76Y=;
        b=MUN9G9+oIveE2LAw+GE33ACF24x5QpRG9EjcYo9YpnNRbAIrUq1NEqeZbUjNcnoImu
         Li9rYcSoaKLHua4zRHjh2vrkz4t2rExUifn9BXBFX3FfMc9ce7wAJZi2p2RfbcIMNrK4
         8dPle2gUOyERcY1Z3tmMoDwKHdCogHn+RT7/v45BFidrw4oLHeA7mTmWxVaDuIsfzBzN
         LgckP0AJztTPu6s7uaK/EJbyJf/t4jLTHXefOLxku5pleGwKIo6O2Cr8ny+qYz6V9k3E
         JUovPBgwMwxUlWZM2RpLHDyZfLr/y4Y6FeOjc8IFxkrZrhq1uAps4kaZeOlKrsrCnxix
         HzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153078; x=1683745078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbDnRrW8gk0NVL5mUxUuMezT83fU9Lwy+1ZgDoFd76Y=;
        b=TXyRCYE18I6zuxhoA09zbGBfOm65jQAvWk8ykgjssyZuzy7jftksFKJK59TeaLHVsY
         s8j/MCuzF4mlujbO3Fnf3dQ8QFRmZ+kUN4EFUHXQx4GgIvkBZVQkq8i9H20yYGqlAk2B
         KaLT5Qwufv5CXeEia2kijBSPRn7Uh5YE2q878TLtnB+GLDReis+dxQrNAOKD+2SVpBzk
         rhT6BdXof+8Rzu4BMAPXkPBJWHj5h0wkRaHbVM2IF/+5d/5GwOQS/06+8dxeeBHkZ7zh
         sTxX5hveVLcFKqOxZCpq/fxLndYZI8NptDiZRWOcnXL2MMp+RanNPeGgeH0ipZrajw67
         tmGw==
X-Gm-Message-State: AAQBX9d8TP0t1B82yD3WiUwU3XqBajsP1OxAXFxd2jF9bMTvV1JV+uPv
	AZkxTGHYFDCjOYfIg1eRZl/Y21Nfo6A=
X-Google-Smtp-Source: AKy350bIjJaKvOkrT+5TqLvm8DuujrxJrjjegCbPTZngm/TRG7PzCcUww96FJNUclBVWTBominBHig==
X-Received: by 2002:aa7:c2c8:0:b0:4fe:9621:ffdc with SMTP id m8-20020aa7c2c8000000b004fe9621ffdcmr6890562edp.16.1681153077893;
        Mon, 10 Apr 2023 11:57:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cs7-20020a0564020c4700b004f9ca99cf5csm4886837edb.92.2023.04.10.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:57:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 1/7] openwsman: Change download branch from master to main.
Date: Mon, 10 Apr 2023 20:57:36 +0200
Message-Id: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102036

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 84a00df8e7..39a9c52a47 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -17,7 +17,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "0120e256faa255d997d9a49d5207662c0b73d430"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-- 
2.40.0


