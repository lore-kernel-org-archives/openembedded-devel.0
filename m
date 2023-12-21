Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2F9C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 05:44:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.45984.1703137457095921928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 21:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoBN3pnn;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so1932655e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 21:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703137455; x=1703742255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXaAAM5Gd/o3tlRzSy3L0D//uVbiQdN3xHGfVxjgcow=;
        b=CoBN3pnnZVFhq28UY5lUfmRo/SaMNviD9d4ND4xoQyKvw4wYi9N0FSAIlsnicGrAgv
         q47/fuuKe92lF7PCBQYKqmKpkgeKMcIb3hj3U/wB+5vOC0IguVjfgycC1mfIf1oeelWE
         EqjWXXkyCkCJVvqQeWacvrn/vgEuWAybj5XSyCgahN2Z62dJdPj7zXJSosIXZCPe4pel
         B0A+vsuw4Hp3Kl4hKH7SBV6u8qeWXoH54EDuSxGtck1IPd2TwFDObignSVQpERnnITMr
         H2YGe6UOjfSops8JtRCtop23Atd4c0f7UupiNEux0UCLIfLIscmsfhwM7dkiJtUsgacQ
         qNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703137455; x=1703742255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXaAAM5Gd/o3tlRzSy3L0D//uVbiQdN3xHGfVxjgcow=;
        b=ne/boifQ+GHmTkxKxUkxV5+nBA3p2uVriMPhDVaybu4Mf4q5sNSQRKaVxuPeeU+T5e
         LZASXIT4WAIZ1RjpVDWmaK7bGbXFplLHNOH7JK5q7dGiTVlR4Of+xR+hbn2Ve+cRYumC
         9rydVBJ2RBQQ3tQSkjOmx0t+BEXNwmPMaQ4yLekLSRXq6EAYzNPc8zs28npcLXX7c7yA
         xVkdHyoOqNNEs8SwmVNDa+xE+/AMojlHowfmZabGNPEroJL6fSdOZTR36NPtwiFCKZZI
         G6+NkTMEiFJ0vk3qABrwTdE0nALu+tRImEcSi/AkyuQp/qd31YIdO+tUkL/w5iuC3trc
         V9zw==
X-Gm-Message-State: AOJu0YxdRhH9kPFw9iG4TLfi2jb+qvtemqwpRLg8EQgXxEs37LIFTJy0
	vuClQVAprjy4i52XyLzYcFG1h3zIx4s=
X-Google-Smtp-Source: AGHT+IHqk8xOTG8Eb0vel5umki2KB3xH4otWv4iH2UHpkey1YCdBRrdUrH9cFTOUcD3EUPaWOI1zTA==
X-Received: by 2002:a05:600c:474d:b0:40c:262f:3c14 with SMTP id w13-20020a05600c474d00b0040c262f3c14mr73676wmo.109.1703137454387;
        Wed, 20 Dec 2023 21:44:14 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c4ed300b0040c517d090esm9778477wmq.15.2023.12.20.21.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 21:44:13 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] avro-c: upgrade 1.11.2 -> 1.11.3
Date: Thu, 21 Dec 2023 08:44:09 +0300
Message-Id: <20231221054409.13191-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 05:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107698

Changelog:

* This is a minor release, specifically addressing known issues with the 1.11.2 release, but also contains version bumps and doc fixes.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-support/avro/{avro-c_1.11.2.bb => avro-c_1.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.2.bb => avro-c_1.11.3.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.2.bb b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.2.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.3.bb
index 9b6a52e2e..14a3cbe46 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "44d1c4f221ccc4571a4b4b9edb023ed1e89354b7"
+SRCREV = "35ff8b997738e4d983871902d47bfb67b3250734"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 
-- 
2.25.1


