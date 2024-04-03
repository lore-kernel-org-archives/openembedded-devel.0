Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB16CD1297
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 21:25:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.23794.1712179556062235100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Apr 2024 14:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5y7Q5eY;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0b889901bso2477605ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712179555; x=1712784355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVF6wCDj5Dzpt7rXUqowYKpT9xhBCWC4HfgLsxC4MNQ=;
        b=c5y7Q5eYS/WT9/cdt9xX6cfIt187xdDVnoRBlajPuTaKMkC0ElqjBONqWQKUY3EqcW
         LccdQA3w6bj2BtiNlk/ccVe42kgMzcKwxUZZUjy/snyIzq35J9TtwACyQmmhUMqli4G9
         yEDYEM4pPPq9tlJCPcs5ibH3NgxO2nlvkDXYw1BlgoGC1P7LxitY3WHuUgeHQ8ZBwtHQ
         SzoAYHHFYg+JgBJ7qc9oO2Yhooj9sDbK2QWV6gA5CR/b6LpAeImFJT2zREkRkkkre4z6
         99AyAPRLhuxs5IYSR4oTrJvIYMQIpJJnGkHEVNYRW5NO11D3XAQzaty9GFIJF9dFcXWo
         dsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712179555; x=1712784355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVF6wCDj5Dzpt7rXUqowYKpT9xhBCWC4HfgLsxC4MNQ=;
        b=oT63TrVHpab+pUGJlKiWZrzqbyOpGjE5pQtkB9KIYLl4aOD4a/mnuUpZjjYbb9S2zw
         FZPd2agWVdYyL5mmbGNV3WoYgwvKbSbOCwZbWIxGvAepROPdQE7zHfcuQrc4CVGC5diM
         rQU2VPARfyL2Crip4T8lLONXbe7HegyKZ/S+aunBpmpUN2Yj9OOvmhwCh3MbfxZbpAx7
         WKEfrSNa1prYG+W/+pnEbS34xKpM/RgonqxkCtbRqPIk0zv0lCu/7NvtD6cX/sU50C4d
         cv1iYxXMNRHpQEMclf6epgMlA6Kjk11KiecqnS1QMKwyQh3RNsM1BUUfcwlbaA0B1tm6
         EXqQ==
X-Gm-Message-State: AOJu0Yxv7OYfBMYo1JkakBnQwOQ5eccv40pdtAgD5siIMQPydFAebpwu
	UpTV5cbbKt3jncGUuq3zM+w3L9FQEznTGYYqPYb9YrmlaSPg5w8vtojaJ+PX
X-Google-Smtp-Source: AGHT+IHWxx8/0wPNFfmXYA4Xc8loCGJSX7XSnC56GDe6rNFsGYnjanM+5OP1TCA8JGPLP6j9E1WeAQ==
X-Received: by 2002:a17:902:d4ce:b0:1dd:c7ea:81f3 with SMTP id o14-20020a170902d4ce00b001ddc7ea81f3mr570332plg.1.1712179555109;
        Wed, 03 Apr 2024 14:25:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id p2-20020a1709027ec200b001e0af9928casm14074563plb.55.2024.04.03.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:25:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pydbus: Add bash dependency for ptests
Date: Wed,  3 Apr 2024 14:25:52 -0700
Message-ID: <20240403212553.3543144-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 21:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109793

ptest script uses bash

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 7962c4322b..7399ae1a01 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -20,6 +20,8 @@ RDEPENDS:${PN} = "python3-pygobject \
                   python3-io \
                   python3-logging"
 
+RDEPENDS:${PN}-ptests = "bash"
+
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-- 
2.44.0


