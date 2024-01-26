Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FFEC47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:06:07 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.1093.1706303161576946369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-362a24b13e6so1246495ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303160; x=1706907960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOe5bmgTkpOzOIsChSt5qsO1WLiJq0Xh29hfIsmJqUk=;
        b=MaU18YY7VyTYhCAGWf1rcBYfPAaiILTIKF+j8zMsOncicASncNyulidx7up1pSetPW
         0ti4r3lC3FQVvV1/zDLYxsR65WfXpFaOGJZ1IEkFkiPvQZHyn86bIz3BsAAuWW5hDKIc
         Z3go5PjVtz+HCqv3FPnpUYXvuAUNGV5sMYptb/+LLItIo1g4KN9uJVQdNWb0/wfcPxxP
         G9ztgvEC4ij+sf0FS6uhmqVqEI/1cJWBBIiHH8UGCmiQJ+TWFr+/eUJHhfUUrPrCn9om
         GnBksNAzIx68B98o3h0zHZgIS3LTZ0SsnSvEF9kXB+SRaJ8uxH94ZvQWlXXJaUhNna0X
         YOGQ==
X-Gm-Message-State: AOJu0YzHvMCMihqIPwF9ZIiu2JWpy8dUIyTxPSwZ+x7IreT7YyhmkGyZ
	cXqqwOl9NFP9CBlYO3hCKUvdBvAqnX5B9xlSCg/U+rpyEUhdWlsHsMhGJcae74hjlpiI
X-Google-Smtp-Source: AGHT+IEwMSALAEP1El2LnQ/7Rm/ce5aXcGRKPZ5eNsP1fpYtkctuH6SaDmiBt9e9IqDYHES5IzKtYA==
X-Received: by 2002:a05:6e02:80d:b0:35d:a4a9:7bb4 with SMTP id u13-20020a056e02080d00b0035da4a97bb4mr472528ilm.6.1706303159712;
        Fri, 26 Jan 2024 13:05:59 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m11-20020a92870b000000b00361a24b9e06sm514241ild.18.2024.01.26.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:05:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-web3: update to version 6.15.0
Date: Fri, 26 Jan 2024 21:05:49 +0000
Message-Id: <20240126210549.1572254-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108467

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-web3_6.14.0.bb => python3-web3_6.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.14.0.bb => python3-web3_6.15.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.14.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.14.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
index 177c6fc03..e216857de 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.15.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "a3726289da9eff2ce30f9b1b49ec59e9245216f7aecbfa2007f73dbe94999717"
+SRC_URI[sha256sum] = "a646d1fe5eba00625b5459d23910e472f0d0aa063788422bff2648ca4e1ebc7e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


