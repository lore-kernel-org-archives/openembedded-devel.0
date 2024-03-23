Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85751C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 07:59:16 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.4836.1711180753484143956
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 00:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuRh5032;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7cc77c19a19so120363239f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711180752; x=1711785552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rgc3+gFnw7xDflcrB3OaGXsSh+ivSR0oU+K3HOyJNTc=;
        b=UuRh5032ciwDbh5aTctsOfv/9YlubjLA9RWbMuOgwiTuqIsJShNVz+FnHZ2Zev7N9L
         xErh2h1zIwxYy58E8Z8fNccVsjGFsKeaOwTD1UjyWGoQFH1Y/j3vNGFkCz9Kg8kSLuy/
         nXalOcdFe/D0PQUXFoiy/H6lnxxLfBldKipO+bRQm7IQpqcT1btBmoyoXzic52BrxGh/
         U6akcW2pBxhDB6XzmtkYldWyo/jZAARNUSxsX+R9ChKUWV/Oqq6ObJrRnunxMfnk//QQ
         Ui98Ll9tclaqmRj4EzI5rwXTsSEc0CN5yaYHFumBauHQFzxtlo8T0DZxSAZWUmusGtLj
         J8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711180752; x=1711785552;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rgc3+gFnw7xDflcrB3OaGXsSh+ivSR0oU+K3HOyJNTc=;
        b=B+65sAy4cKuLJwq2fQhV25Kw3BZ5A7u4TiARqmRsP5DsNSXBfVAmJ+aWZZgTvA1RTW
         D72IQJuORobiFZHrTzD/atwTwaHAzB0SoBQdyLcjZhUhWNKVxgi8FXl155NvNHS0CLTA
         4T7cj/JqyEEFd+HB4OoWjDr2UPkwWPv8h2RZLoYaEZjTiaVTJeynfEI18V4f/Fv0Mdp3
         1AXtqXsZwsiGyabbokQVRaeCY+Rzn6b516RwuZbuqCs3w+V5xAJC3pzEWY+3aKBub0Ak
         SgQMTDCRQzD93k8VF7z4282oZKbpMRDffhyTcQP8P5T2w0YAtFtxXI05d8BV45a9T3XT
         Hbvw==
X-Gm-Message-State: AOJu0YyFJj3vnQtknWqwLKk/LUYeC9UFtjvuNnUaAzZqhx6Tfbs2bb0D
	LGaZFFh2ywp/sjg3h46wS3NWHjFpoNllRCa/nf05nH60TJIurhcu0s4wpFw0Tz8=
X-Google-Smtp-Source: AGHT+IHIn3mitrezI2kAIZlRXVAaPcJZsKP3eTPGbymXyBv0nnQuF88JDeah5XZqjC0gJOLilj9jGw==
X-Received: by 2002:a05:6602:1789:b0:7cf:16d0:44ea with SMTP id y9-20020a056602178900b007cf16d044eamr1843025iox.7.1711180752486;
        Sat, 23 Mar 2024 00:59:12 -0700 (PDT)
Received: from NVC4181.nedap.local (187-224-179-143.ftth.glasoperator.nl. [143.179.224.187])
        by smtp.gmail.com with ESMTPSA id g8-20020a6b7608000000b007cbf94d8698sm1122548iom.4.2024.03.23.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 00:59:12 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH] xom: Update github SRC_URI
Date: Sat, 23 Mar 2024 08:58:50 +0100
Message-ID: <20240323075850.453-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 07:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109531

From: Jermain Horsman <jermain.horsman@nedap.com>

This prevents warnings about:
- git protocol which is no longer supported by github
- branch parameter not being set

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/xml-commons/xom_1.2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 42ad957..9b09e4d 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -14,7 +14,7 @@ PV_jaxen = "1.1.6"
 
 SRC_URI = "\
 	http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=archive \
-	git://github.com/codehaus/${SRCNAME_jaxen};name=jaxen \
+	git://github.com/codehaus/${SRCNAME_jaxen};name=jaxen;branch=master;protocol=https \
 	file://04_remove_sun_import.patch \
 "
 SRC_URI[archive.md5sum] = "9f3a2ae827a9f6826fe76e4b7b0c22b3"
-- 
2.43.0.windows.1


