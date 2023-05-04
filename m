Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A210C7EE29
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:33:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.44413.1683185595630287673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 00:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IJSRShr+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-953343581a4so16193666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185594; x=1685777594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=IJSRShr+HKtXtjnZToViBMi4PwprN1LVY7UHCkKGToitwsJNh96BJyUl2R6ijnwlq8
         lRRy3r8sd5WJoaWojGz7kkq9AB1BowXJ3TNznDE1cAHikdFmYA4LE/xI5SrrvYpTOn80
         Qo47XnDPSuIUnidPp0F3wqnMRRyEFceUFDwP3w3znWPblJuvTltkfvNb5DxOsXQ9ArLD
         JLIP2H388AblwhbvwhfiNw9k8HYagTLlcx3zbJbVVhFt59BWcAg4h5J2lNza/DFGT9f2
         +jrLVtgV+6m5TtSRo/l7MfWVKga0oi2GDpXr6flCbJYcS/juNlYd0osqUWpJz5a/+w97
         6ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185594; x=1685777594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLJJ2RyW5Xk75IKfV1Wel0u/jh5JIZW4xVSjxaXuwG0=;
        b=mDNTQRjuNB62plMdMuhhX1yqFTd5FQ4Pp4orywtyk0fKocG7/OsrElyROXQkucFI4Z
         sQQiRQ7xh6ia2aWGxBJoRb47aHxLsC6uRt4jxTXFtF5eGqsJng8+gScp9DQIZpEJExCt
         wPx+DpYtZ3QbBVD+6ujl5/ML2obcYMKhx7Q7rFCS/N3yg+vrBFBahu8AyukNysyS8VSi
         cjay/0i1JDa9L/e7jjrBSgbNkF5nYwVXFt5aj9y/vH7uZxvZsUczmoVqlYhb5lnbyywO
         2tejGCJtoMGwextR+QwrYV4Y5psmr0py+L+RHgojJH75h0GmlXCNYNHmxGrcx5rNyKit
         9YiQ==
X-Gm-Message-State: AC+VfDwIhuy25vAjBwndDc8IOKZUJiXKUB6JncgSUwKwS27esNCl6YXR
	X19NSvMguCD7JXqaSGI3zdQGmMVRryQ=
X-Google-Smtp-Source: ACHHUZ5UVHDOYcJ07ClDEqZIVIm7Zt9jqvBd8af9mlAsH7ZqZ67T223TAC5MKtw1SSddWowmxEQh+Q==
X-Received: by 2002:a17:907:708:b0:94e:54ec:1a10 with SMTP id xb8-20020a170907070800b0094e54ec1a10mr5437638ejb.29.1683185593922;
        Thu, 04 May 2023 00:33:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qw35-20020a1709066a2300b0095ef7268ba9sm10967679ejc.41.2023.05.04.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:33:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] libtomcrypt: pass LIBPATH to fix installed-vs-shipped with multilib
Date: Thu,  4 May 2023 09:33:06 +0200
Message-Id: <20230504073308.1251185-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
References: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 07:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102303

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


