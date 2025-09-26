Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD7ACAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 21:05:30 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.2015.1758920726500498829
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 14:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JEc8LFQK;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b29e8a3e453so361789666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758920725; x=1759525525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbUHiHKRnPFfPpaaQztK5M9dImMNTI4fia1A6GmfK8w=;
        b=JEc8LFQKZ+HMNyr/2SK4sk9GMEKldxFd7TJcvsOT/P4jYRGub9MYPkt7411lXUg6Is
         A6eDC4HIrDBoAy35+3pcoZYJYovU7uAhjClK1wABa6M+ZskLkAI1MidXAHZXRsKSvBCj
         qUjQqSI2iDe/JUzePaAqsZZnVSwcsrqd+YV92iVABKIf7dDk5ZHgoCMeCmh8p5zVv454
         prWWfpH0GiH+JQuruADqZf0K3s2yC7wlrZ3bvVIB9TlsURM0UFIG0Si+Vu7kAvpRPJUZ
         2OG/acn4HlbeEHDMl6dn73Jo7UL0oEu0hECSgR4H22f3vnec9HiAU3v4GJfjOb1rpAZ5
         QOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920725; x=1759525525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbUHiHKRnPFfPpaaQztK5M9dImMNTI4fia1A6GmfK8w=;
        b=IhwEGCTcE3Fm1CsohakTEldPyn+/ru4Ut7sslq86e304MSoo73j516DS192P5kHaK8
         1e+xdiqVq2Udyxs0O0ZDCtPr8wa5rcAMrSCmXuIwTHF35eaC7CCueYAoDE9zBWCEMRM/
         Zgdh8aQY1NggDg6+3EXQdVHnTZBHCMUekCsjn/9gsbnjK6rg2mckTAbJO5S1IVVXMXKL
         pEn31kCsuA8iyS5dqMffwGIJhn6LSjtRaN6m4BHQDg7wVFpF2oc9pNsjmELHYttSpIlN
         Q/9e8SJayVnw5mBST+cbmrKXWhP4xjqN6bZ6j20qgM+T8jYdL/qrs9hDA5ZDw2pPKAra
         tW9A==
X-Gm-Message-State: AOJu0YyrIiNg5QA7bW1fzfQ47iPaCkSVLOoDFspFanJu+HPKpyFi6lMJ
	pjAJ7B1uKnjrfgeO+KNLrJnWcsip/Zd5F2xoXu+hrDfN+VI2wrEJsNK52o8UpQ==
X-Gm-Gg: ASbGncucUK091IxWkN1SYARPjRKLxQNCOgbEve2887JYuCSphaz3W51lIb2fdh6G5hM
	bOHarax6CN9uUWz8ByckydVMW8Mb50zXm6SL3HVsmqZbmDHK4b8Noy2RCw5n+TdLmNjkaO6xsFt
	BJ74KsSJDhLmj9PH7vtIslk6KL8o6ypiIhmLNbHAnWvMMX1kANovceVK13EszqsjGru7zZyiy2d
	Dv/pnprejrx0MRJtaL5upOW4g3GEt02Ioau5msLlUUAX5rXdV2lt6RawIk6eMYT2yESstcUccpl
	frRoXyB4arMpqbQX29AlwOc9yKGxfna71cPRtrWu7a7/U9g/OEuIrQVNQ7N4j5iMLEPlct3o/KU
	hCEM1owjhz9D38kALE0AV
X-Google-Smtp-Source: AGHT+IEQ9qlmJPlAQGyOA9NDpuWYAwEg1IV+DVRqtwrJHC3qVgKTLea8CLgYPGzbsXodyBWrik2WXA==
X-Received: by 2002:a17:907:86ab:b0:b2b:f498:e2f7 with SMTP id a640c23a62f3a-b34bc97209amr906602966b.47.1758920724330;
        Fri, 26 Sep 2025 14:05:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f87511dsm438714766b.43.2025.09.26.14.05.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 14:05:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] mosh: set working SRC_URI
Date: Fri, 26 Sep 2025 23:05:23 +0200
Message-ID: <20250926210523.169437-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 21:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119941

The project switched to storing their releases on Github, and
the original links stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
index b4b5aa78a0..ed0d5a4061 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz \
+SRC_URI = "https://github.com/mobile-shell/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://0001-Fix-building-with-libc.patch \
            "
 SRC_URI[md5sum] = "5122f4d2b973ab7c38dcdac8c35cb61e"

