Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA945C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.25854.1683616030081525095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BYLqhBm1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f18335a870so34416205e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616028; x=1686208028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=BYLqhBm1Ef+eNmOS4iZRIfmyhMysfFd3x8+CYFdEpy8p0ntYhidXtMnCPkUErxdCn8
         tnT62RP8WvkCLY4NNinpYe7zaXXTJPx7ocH65iNNbQNFWVRzlZguWkEs58RNEcAteLfW
         0LfYhXWAJ3tF4JHOCuS+ff0+DGTTxCCo7qjTZJd1nG3iwl7JZpPyP/JXrj/H7Xunki1Z
         WJXDZQG8g51bwuKyWayxni9p+Kh9hbnDwiOL17wdPyjUAWoAtWqUcx900K9eTwXhf9BY
         /PTH4DWleGr6Dmc6AQW9dBEjyKS66cwllRPrTicve/cTWEMg1pZSyIJDsiZhPk4MlfTu
         aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616028; x=1686208028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=JDqqrmSCwEh6tL13wWULle0S3PWJgQ3x9Jh0aPErL7nn/bRqom98S+ad/6vnUiVYpb
         LO1ajtogEegHwKxm9u2dzIL7XHGub2k6JDFP082q1lwZkbAJmmMhW0FFhOVWmrNI+Og7
         3rDcCeFwK1ScMuzNU5NTS0apHFl/7U4j8DxS10OUBy+Nv9QIFd9U3P+plWcBpAn/jtjh
         i7OhqDd3U+EO4EMDz1JrRL72X0+BHMjr5VoMLcpz0JkUiZw0C4amJqiKzmEqLIlu5Nh3
         7P5yFK2QgNPAS/Vz/X2emzANRM6EUM6BvnQneMiLco+1bS665ON200jvDIggFoiGW5Ul
         R16w==
X-Gm-Message-State: AC+VfDyQmCOHhZCqSCWQeLj9Lq7KSs+BnXACf7yZfLhapRMEGxr28tDt
	FCZkLthqtMIyDL7VNRxcfmUSZe8tUtI=
X-Google-Smtp-Source: ACHHUZ5YEethjBezUpQzC67salfOrU5ZVNFnZ1aVI91GziKW3ESKpJyFI4HA/ZIvBucrQmvdhwp5rQ==
X-Received: by 2002:a7b:c8ca:0:b0:3f1:8a5f:a6eb with SMTP id f10-20020a7bc8ca000000b003f18a5fa6ebmr9136386wml.34.1683616028561;
        Tue, 09 May 2023 00:07:08 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c379200b003f17300c7dcsm18710010wmr.48.2023.05.09.00.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 13/16] libtomcrypt: pass LIBPATH to fix installed-vs-shipped with multilib
Date: Tue,  9 May 2023 09:06:52 +0200
Message-Id: <20230509070655.70784-13-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102481

* fixes:
  ERROR: QA Issue: libtomcrypt: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/libtomcrypt.so.1.0.1
    /usr/lib/libtomcrypt.so.1
    /usr/lib/libtomcrypt.so
    /usr/lib/pkgconfig
    /usr/lib/pkgconfig/libtomcrypt.pc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  libtomcrypt: 6 installed and not shipped files. [installed-vs-shipped]

  when libdir is /usr/lib64 with multilib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index 357fd0ab8d..b144338921 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -17,5 +17,5 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' install
+    oe_runmake -f makefile.shared 'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' install
 }
-- 
2.40.1


