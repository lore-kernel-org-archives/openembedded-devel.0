Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75597CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.8976.1727245467119709432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mG3BKG9T;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a1a90bd08cso4476995ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245466; x=1727850266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grNFQhej6xfKSCZh+UqfXospN3/eC9ydJxFGG0JEE7k=;
        b=mG3BKG9TQRIj1I0PfRO7U7btQnC3pTtpWpUmi8OqsORNy9PvOelMURqfu1RYKnF4SK
         Vno8ew/3h80eLC43ty5J4jF/gfB0zk/UUgmmncIQFTg+rbqIu/5XqczXxVQpYPXBwNJx
         7d1GrpkKoNMnwWSe3G+RqQmZObCEmxlLm3weYhQN8vRKf3rWBSvG86KYki8yg7dXusTR
         g7863v2IqkK2qmb6vV1d5NFEVdiv/6r/rJmCgU8mNMpuo23839s+mvkB0L0U324xLCMn
         u9DlRax3M11fYnMOBOhzSNXF2ki/ZgwrZBXxJUdwMmI8N6KdryJ1ngA5EXkFkQ+rKATv
         BItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245466; x=1727850266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grNFQhej6xfKSCZh+UqfXospN3/eC9ydJxFGG0JEE7k=;
        b=heY+I5HUqES57BCEf7OjmxrY2HQNK5nxxCJm2U+QeHy41G3cxU8uDp0cHfOQ/KOhj7
         plBBX3C4Jz/YggxyIS64qmqYVELdYeaP2CZtvyp/FmBlwy6h/62bEZIdFVV3P+ovUCnI
         OPdf7mIZ5ygMtsNlgdug3YxvvVuYVSSk2ZEQeDbFVP9Fxo0eEYhly+mGmpZS72RhXrMY
         qAgGe2LDXcsQQ/KXhinWczrGTIBFKd5f6thBtHWYuCw+c6P4awKdHhaOMEUcZVW3DI8n
         buhsbptG4o0mLKJrSIHUzreAaNvdNfQzmbet4iTIm0nqWVQ7+kQ2RCrU1pmdcRsU49EB
         tMvA==
X-Gm-Message-State: AOJu0Yxv7zPl9FqAplGJmJAsC9wwhyLtvFX6+OTlSl1iGyD25nhr7bh+
	YRyIVE/8bG1gtlv1S+b6fAu+BKT+W981pri4Y/6oI1hzuolUph5QOPHbDMrJ
X-Google-Smtp-Source: AGHT+IFLcRzZMYfcWT5/6upPjblejwLQJHT66NERwt+pJMpBYQhaujPEJOKj4g7IbuPcP6WkPhBjUw==
X-Received: by 2002:a05:6e02:216e:b0:3a0:9aef:4c2 with SMTP id e9e14a558f8ab-3a26d7aa1e2mr22187515ab.19.1727245466071;
        Tue, 24 Sep 2024 23:24:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/9] python3-pydbus: Add missing rdep on xml module for ptests
Date: Tue, 24 Sep 2024 23:24:14 -0700
Message-ID: <20240925062422.3146738-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112484

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 5754fd2adf..cfdacf53bb 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} = "python3-pygobject \
                   python3-io \
                   python3-logging"
 
-RDEPENDS:${PN}-ptest += "bash"
+RDEPENDS:${PN}-ptest += "bash python3-xml"
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests

