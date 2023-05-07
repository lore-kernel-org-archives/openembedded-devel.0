Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AC2C7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:25 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.94803.1683499456321146400
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HmCVaDVI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-965fc25f009so404295966b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499455; x=1686091455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=HmCVaDVIYlJWUEUBW2Ko2tc6r7v66XuKANBs3dn2Rp8/frLcclpKfSkzgJSPok0eYx
         Bd/zuCjpwlMzA9QRvJWTHAdoOJKaIJ00etBkYzyS+aJ1tugXcSwpx5N9wAPH5oPX4dS1
         TtSfaO0KszsmAW3Jea/2+zjcOY90Wkl4Nh1yU29RBL1u2/icoHZgAOh8zVSn81dbZlE0
         CQKx7dVj8Un7tcvwbZyqgJNW4fn2lPZVVolAUl80Dxe+Ib3IJ1k09FkfMlceATfYNfBi
         PyYKqNJTDheeZUO9r2JChNlfu47RgZdYmwzeH/5wObD2T70D21sEAxsqrT3N5zXxfa31
         oc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499455; x=1686091455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=ex32S/N1PkfJvEOoxI41Yb4ora18zACUM9QZ6YyzrV+3NT4BE/Z3shwTxYh5zlnkB7
         6aOq1UfZ6ry4K3KVHtciEhFPLJBHrNFh5Jij0otXZEMyLSP0wzEk4wKUy7sRPNT+7Ks4
         F+f+JS3p2EQNCvehadaU7p0cm7/jAn+jDzUb4mtgrTdylW4YpIaxQv/kuzjKGAtG4OjU
         C2ifCmpuXu67mTDFpUam6suO2uyOSw7y8DFTu0q1X2lFqtqU9F4+ZX3vAf7Bc4BQqIhz
         l08LL7nwvkG4k8omahAeTko9LFF1FdFcXR8CcRxiDClZrXT96/3p+eQ5PgoV0vyONNX8
         1xKA==
X-Gm-Message-State: AC+VfDzl99t8eujYVOYJTdq7nO3R9afBUnpQpbPS7AUc3fWrUjk+ZjVj
	E2qWKEweNCcfaSTFN5xBi8e15lRFdg4=
X-Google-Smtp-Source: ACHHUZ4NI6H+s9p5GLo9i6MXHJW9bxNLL4Pr2/jd8XDCxllkHov8rnPHRmlArRGQJ1D8chuib9Gt7A==
X-Received: by 2002:a17:907:9616:b0:94f:1a23:2f1b with SMTP id gb22-20020a170907961600b0094f1a232f1bmr7704801ejc.24.1683499454860;
        Sun, 07 May 2023 15:44:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id nb35-20020a1709071ca300b009663b7c95a3sm1643423ejc.144.2023.05.07.15.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/16] libtomcrypt: pass LIBPATH to fix installed-vs-shipped with multilib
Date: Mon,  8 May 2023 00:43:51 +0200
Message-Id: <20230507224354.1149327-13-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102375

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


