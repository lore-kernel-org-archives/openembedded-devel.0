Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2915C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 14:14:21 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.98981.1723644854262081501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 07:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bt5En2w+;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfef5980a69so6692960276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723644853; x=1724249653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VBrn+dGOEk0g6Mif8//aSxziOtDb64gAbWh6y2O5ug=;
        b=bt5En2w+mCrkMRdrQlazbhDa5NhxKmaKc7ptBtPH8jmaNkVg51+QKAv0pjeOJ1+08J
         AknDL6cUqTR5D4rXhZjOI1JCJWmC9YFPPm4ZcXr9tDIIdPfksf2awE8M+o6TBA/oPxQ9
         hmxpWyGrrCz9kQJ16Zgr5sJDWwZ0jpojWNI0m4vtn1qEimSMQ+UskD/ECJ8qTgbkhU2o
         wWVl5drA5niRmsGDQkODi/JNxz5HwD+AtbQoDW4vsidfvsadhSzdjsmdp15gQ2IeqfPZ
         bCUhLOxXqSHl3KxZneVzNrTs+0HgZcMUz1a6MD6GRgSIvoxi/zGrhFPgKIGf4TfYnYG8
         1RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723644853; x=1724249653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VBrn+dGOEk0g6Mif8//aSxziOtDb64gAbWh6y2O5ug=;
        b=HvOfegTgu7FH933jMjDshYK/qt6UmpKE+nHAX71Mtp/SLWGs1OEG6f0+g9rgmTP+YA
         s3JXdJY31nB3pJvpKer0dePNogExElVkmbUkjgZsiEQVWQdbPn9b1bef5kcBsqoAzsgu
         I4PChjIxSbanJlGb/zNpDIwkxiXuZUCC9mRV7CRftnuDEOHKtAP6a284RvWvWFdFsH2n
         SDloJZ8m16tYgLuQu0Hr86vUkT1DYtF1Sk/E4cDss3zBezCtRQuBp2v+U0x0xe6EFAKH
         MIciC+GY6zQOFHExwfZw6/BDLTbqEwFr3bUl+fWaLX8xD6y65KRmw+AriaUeYLqvZi5Y
         WCKQ==
X-Gm-Message-State: AOJu0YwQNBjYQQMZlYMi0szeSKyxNKDqiRWTInQlun6j46OngFHanAxr
	9c1RSRRVAJmIQDMhfl/fXLDr9v1jF8c6s6KnC+0NILyrfc3TXxcUoqsizQ==
X-Google-Smtp-Source: AGHT+IFPn/KDSh5XLR1C31GCRC5ES5u8AX2hBvFwkHAk34/pUZ0Ie8Bi8BYctVqXkl0Tz7QI1+M9rQ==
X-Received: by 2002:a05:6902:e06:b0:e0b:e188:1ee9 with SMTP id 3f1490d57ef6-e1155b9bb0dmr3061160276.46.1723644853096;
        Wed, 14 Aug 2024 07:14:13 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:2e25:7600:d68b:4c69])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8ca5d25sm1996261276.57.2024.08.14.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:14:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] jsonrpc: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 14 Aug 2024 10:14:09 -0400
Message-Id: <20240814141409.44252-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 14:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111804

From: alperak <alperyasinak1@gmail.com>

WARNING: jsonrpc-1.4.1-r0 do_package_qa: QA Issue: File /usr/lib/libjson-rpc-cpp/cmake/libjson-rpc-cppTargets.cmake in package jsonrpc-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb2e8f98b4d758bd7b7f399c529d6d96e7594b97)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index 544922f05d..f0c60e5a86 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -25,4 +25,8 @@ EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO
                   -DCMAKE_LIBRARY_PATH=${libdir} \
 "
 
+do_install:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${libdir}/libjson-rpc-cpp/cmake/libjson-rpc-cppTargets.cmake
+}
+
 FILES:${PN}-dev += "${libdir}/libjson-rpc-cpp/cmake"
-- 
2.34.1


