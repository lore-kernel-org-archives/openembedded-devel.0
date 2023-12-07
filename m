Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F248C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:25:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.82279.1701951914605392935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCPnch2l;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-333536432e0so792429f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 04:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701951912; x=1702556712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUf6GE+CCwfzyzS9WKDBYM2hy+Wi9qGR3Q66TqiZ99U=;
        b=KCPnch2lLHjyiQVY0CjjxM5fFZUCRhoWkItL2VU+LZjqSytjfOnvH6Zax1IZVImWcI
         J4Ua0EsN0psRzPCcFLaW+qmjmfIiovRRzdn49rh7QmwBJtC8nw13OZbgswmc9CnxAW4B
         7wglYqZ44tYnYB3ZG15XN3kfXhxJ4afmuTos21HiPQUYtn7kLIxgP9upkDfgQ4YDKhxL
         a/q2TXW1HZITWFl5nUb9rS2iL7EXF0d4MrrorgOIwrjmUlxI3O773ToBtwmMHkTEWCNn
         DiROgz/+/e3Naj1Ea+9fSVSGaEl5paa4oG29qRe/8wOQlvsgk3IJKgFbVjlZ4ckDdCce
         pxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951912; x=1702556712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUf6GE+CCwfzyzS9WKDBYM2hy+Wi9qGR3Q66TqiZ99U=;
        b=c1rYuELXApAAERThQzvf7mXVS7TeyHqhbuPOIgrvfy0tTnZxIFknNZ0oTcJihIgGS5
         Vd86GfmbldG/BxhSnLK9hK0EeMb2WBNDIEkaQvvEizd/DRqpdY9A1mzNTuVvXme9PknT
         SaKm3gUOKMs7AU2oxXFnmKs5rr8NSBUNQgqK0HcYMMiutV8vJ6ueF+PrZhVxGlOAPZzR
         R+6oS+V+OPVsoYI9S4r788I+2MIRdIYI2nYQbQ8cRG8H8zuM0xJ3Dlhmxp+3pt1lG/LK
         BwozOLNc3XO1ltZc4C+EvH/7z/lM3QKQQrHUkWEFCnirlLtYXExIi5/zJhAvMNlLwvuB
         RYiw==
X-Gm-Message-State: AOJu0Yz+TweuQb2wV74JLhFWFwfExrgZp5W3ZTLErApvjx83A0RLD47w
	HeJemw7OsbM4sc365ne/DQXGFZwYnkFa/g==
X-Google-Smtp-Source: AGHT+IGG97VMRf9/cjTf0JIXHNGDwxCP7RaLvo/z5d9+vJLgTy1mdzww83DAySB5BbPmqIQxhXKxAg==
X-Received: by 2002:a5d:58db:0:b0:333:273f:1cd with SMTP id o27-20020a5d58db000000b00333273f01cdmr1298313wrf.36.1701951912344;
        Thu, 07 Dec 2023 04:25:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id q10-20020a05600000ca00b0033335d9dcc5sm1322195wrx.64.2023.12.07.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:25:11 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xf86-input-void: upgrade 1.4.1 -> 1.4.2
Date: Thu,  7 Dec 2023 15:25:06 +0300
Message-Id: <20231207122506.1351408-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107279

Changelog:

* InitValuatorAxisStruct: Add missing line breaks
* InputDriverRec: Resolve -Wmissing-field-initializers warning
* gitlab CI: stop requiring Signed-off-by in commits
* gitlab CI: add a basic build test
* Build xz tarballs instead of bzip2
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration
* autogen: add default patch prefix
* autogen.sh: use quoted string variables
* autogen.sh: use exec instead of waiting for configure to finish

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{xf86-input-void_1.4.1.bb => xf86-input-void_1.4.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-input-void_1.4.1.bb => xf86-input-void_1.4.2.bb} (57%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
similarity index 57%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
index 88fb4b99a..54a6476de 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.2.bb
@@ -4,5 +4,5 @@ PR = "r22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
-SRC_URI[md5sum] = "5227013b52b3ca85d6b7ec8adea988d4"
-SRC_URI[sha256sum] = "f96e4f0a622821bf43a74bd419f2a18423343996c9d243c7e1430ba2d142339c"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "a211d8e21ce0e2ed8af5b8a2e8d4409d70c9c7e5ee528f5e6002ad279bf07885"
-- 
2.25.1


