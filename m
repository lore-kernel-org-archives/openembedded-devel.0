Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 19:29:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.1895.1634239789890310183
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HuuEqvmJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so468269wmd.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RVIrh9HEEPtuwxIbzuE7dXOtYN+yMYr+4wOslcVE+Is=;
        b=HuuEqvmJbvwPQwxEzY0eEQJEsobnA+chDO9aY45xvzwVxQzBbyg3Lku19ub9tZtxB4
         iaMasIzZ4hOBVZwTOYriBWI1dp02iQJsIxHFt/mVboGMxAaezZQhlcLRsnFbaG7VeU4r
         P9KERIWkZOCvFAtE7PzcN+5QTDT8Rqo8QayGhDePimMi9IEGsNBRwyIwl7zWu9O9HcyW
         XjCcYPF09EPRI9amEUcdDVu++J1sQ2z/8O5aCKn3FRSdNVlFM5bgG1MQsYiyL9gzyWhC
         vDahh5fY8WwoEgQNABpeu9IqkKI+UFM1YXN8JPnA3MS+anRig3cugyuBraopoSjGaHG0
         oGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RVIrh9HEEPtuwxIbzuE7dXOtYN+yMYr+4wOslcVE+Is=;
        b=DavdNt/qceS8V1mNIzisE+PkzJEbasbNEO0+FIeE5QFKInqkQcT/vvEhNoIHPUNkdV
         p4vXKMlIkHBelsHojahOm3pldU2lW0wws5o6p+37OOaQdISjbRL5ImJko0e5FUDN4ulK
         LmoYJyfaBlOVnLwiBKQYdkm8JyX70lW6GsZcN+a61T4Dn1mDf35eHFqwJmC0xXC5Axad
         R+JpEMxeOkoJB9w7cJc3FDFqgGQjU1OZc8IZY2eNECHGgulzAl1khW+f73CSoC5EFWwz
         IRLWUkJwz7j1aBV68BvPzUiY7TcmDdNxLaLNlBhRS+mGykOgSAmX9j/UrMd22+H4KV2+
         bZKA==
X-Gm-Message-State: AOAM5326Xd83mCWA9Myr8UVgaa3LrndJyLLb/YaFZTXe6qCDhWC4s+Rh
	ZiU4UWdf9YC4ma2aHl2+z+Z0ojLBzFk=
X-Google-Smtp-Source: 
 ABdhPJzb8HZC2wyZn/anMZplKSY9wCWHpCNOQ1Nhfya9x28CIyO5dJv7TVFi8H25Z+/nknv2Vi641Q==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr7836479wmp.115.1634239788360;
        Thu, 14 Oct 2021 12:29:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 m15sm3102136wmq.0.2021.10.14.12.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 12:29:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: add -fpermissive also to BUILD_CXXFLAGS to
 fix build with openssl-native-3
Date: Thu, 14 Oct 2021 21:29:45 +0200
Message-Id: <20211014192945.3563892-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 19:29:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93302

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
index a64288d8ab..d468f2518e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
@@ -131,6 +131,7 @@ addtask create_v8_qemu_wrapper after do_configure before do_compile
 
 # Keep until openssl 3.x compatibility is fixed
 CXXFLAGS += "-fpermissive"
+BUILD_CXXFLAGS += "-fpermissive"
 
 LDFLAGS:append:x86 = " -latomic"
 
-- 
2.32.0


