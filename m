Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A83C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 06:19:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.45933.1703139564383686325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 22:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TuZWq8J8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33679c49fe5so329137f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703139562; x=1703744362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPKPgqEqMBXeUQmKmwPdAspkSkyXvsCkjFjluQ9UkS0=;
        b=TuZWq8J8mFAXwbBFnvSIMTM9GjYG1gKdfo9G+MMf8TbHgmqhQCBg6ZG0I9ZD7gV/5D
         ok0RvIRynIw9oDuHfpHTh4xInlMxpVVQq2NKpFQYeYm5AHsBsHq9oCNsw/ibPmYuXrMI
         +4chHMkIdVek1QhqbP0Uy0onqI1pMGbnu2PECQw574SmXS1ocjyxCDDMPJo1wqT4cHDd
         5ChH5qChOOrOlheYTFurshita4D2PLorb5wzvg4mnLwjZl4aR0j3pMmNKJ923W6hoBfV
         XdRbB2vmDkmOysksQA4l7qrtLKnZKb7Ug/LgeMaE6jUyS6Howb+uXs4v+HH8/Xi814jp
         3YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703139562; x=1703744362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPKPgqEqMBXeUQmKmwPdAspkSkyXvsCkjFjluQ9UkS0=;
        b=eIkZ7FypK2arZ+HEdO0OM1CKbYQhFdY7LdOPCZjAJxH6gBJDvfX9It4W3/5plPzuXo
         HRqKodDInEsfXRM24eh0V2Knqpcl66135jb9kEGeMWg6mI8kSyPX44hKOtfL3irVf0Nd
         9y+UZExFmq8dXwGj9nZcERhks8d/XHvhT9rXkSgQXqiBo6Tb/WnarrlhRgLXCV2hbl1i
         PlwBTm7g8AsaVGWR2VreNMN3TpuKwxAcHwzEZCn2KRRDddrlCFxTLFPKZG3lNeGPSV1E
         bQO4icyb7lGG8HbK+tUvlOk9lOn3bkB8mEfVP8vwWFILWVXpBKTASgxqgolpm/YywpMc
         HDFA==
X-Gm-Message-State: AOJu0YwOFr7R2psAkUTsm3x4sADD8KuH7TRLXhnYLuYY+P89wtq7ACko
	CtToOKxEVnPUdTg7RZbFz72As8/dyT4=
X-Google-Smtp-Source: AGHT+IGOxIKrR/YAgFNXhuLJ66GXgUoWffHJtZyFGtJmfW09I7dvzYxs0ZhWPWJJlVy4nBs4w/59XQ==
X-Received: by 2002:adf:e60d:0:b0:336:5be9:adfd with SMTP id p13-20020adfe60d000000b003365be9adfdmr466618wrm.68.1703139561926;
        Wed, 20 Dec 2023 22:19:21 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id m2-20020adfe942000000b00336630c31b5sm1199745wrn.9.2023.12.20.22.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 22:19:21 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] cpprest: upgrade 2.10.18 -> 2.10.19
Date: Thu, 21 Dec 2023 09:19:16 +0300
Message-Id: <20231221061916.69041-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 06:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107699

Changelog:

* PR#1982 make Uri.is_host_loopback() only return true for localhost and 127.0.0.1 exactly.
  The old behavior could potentially return "true" for URLs that were not, in fact, local,
  and this could cause security issues if is_host_loopback was used in certain ways.
* PR#1711 Fix likely typo in SafeInt3.hpp, that results in error with clang 15
* PR#1496 Support for oauth2 with "client_credentials" grant type.
* PR#1429 Add constructor from all integer types for json value.
* PR#1577 export http_exception for non Windows builds using visibility macros.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../cpprest/{cpprest_2.10.18.bb => cpprest_2.10.19.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.18.bb => cpprest_2.10.19.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
index 36545503e..aec728640 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.18
-SRCREV= "122d09549201da5383321d870bed45ecb9e168c5"
+# tag 2.10.19
+SRCREV= "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


