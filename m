Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BC3C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:24:20 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.155958.1703877858010654336
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35fc6eb9075so18197925ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703877856; x=1704482656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28lrFZGxtmb7eIUjlHPvc0jdx8cF37xhAww0IW23IGA=;
        b=KCtsRdKB9NQNp5zyT9sDuYvklyYpqL7u/YpOeltcirx8TWIFKoLbx2Sp6C6Iuc6eIt
         aa2WH/UYbj/w7V7H14wMj9NQdr62VJ0m66CxCpnLirt1Ynve3DuX3enHjqtRPwyyUwGF
         L0pGJGA3vMCzD+BC48my4OOTkIquW3I7ba29OeV7Kw4tuGOHV2NJ7253nUtWzjNhkuUa
         nkwqEe/nEmN6UmCDMFVffK2GiKozZR96Dmqojry9gsdpfoyV37y4ejmphiv7i/nxoL/a
         +923DB5qxNcNXUKv76eLgpGucwnZYhBsKANjGOMwLZ72i7llMugomOcsJ776sDPj9AAI
         RD/g==
X-Gm-Message-State: AOJu0YwDxSGVQ6DW7BwCQvihyXctCRRjduwWZrGhoqWMJ6/B8qlIjcH0
	2fgOh3/jdgkVyealJuMQUgqJAUTbpsiSpA==
X-Google-Smtp-Source: AGHT+IGEIt0KNYrqSaSYo+dL06UspdK10liha04tVz/yGgx6pQxXA/A6uBnjRw9KRDRIzUdr2/zi2g==
X-Received: by 2002:a05:6e02:1d84:b0:360:35f:55e1 with SMTP id h4-20020a056e021d8400b00360035f55e1mr4271930ila.31.1703877856307;
        Fri, 29 Dec 2023 11:24:16 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cd8-20020a0566381a0800b0046ce5f7e87fsm4884599jab.136.2023.12.29.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:24:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/5] python3-kmod: add comment about update to version 0.9.2
Date: Fri, 29 Dec 2023 19:24:03 +0000
Message-Id: <20231229192407.2736363-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107900

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
index 2ec4d474b..52e1cf6af 100644
--- a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
 
 inherit pypi setuptools3
 
+RECIPE_NO_UPDATE_REASON = "Version 0.9.2 is broken when using latest build machinery for C extensions"
 SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
 
 DEPENDS += " \
-- 
2.34.1


