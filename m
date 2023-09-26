Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB8DE7E65E
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 19:33:57 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.428.1695756836269866353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 12:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a1f00b75aaso7804357b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695756835; x=1696361635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IvIPbEvxFmKFUaWY++pjcjm/xf+0WphqG9TlHHfl8U=;
        b=dhKBD12DDhIc8G+5U5mOdfZXtgcbAnKEAmGhzHYjUoQ9xLDO3UDifi+fXIJgObMs5d
         u2ZnQZFoDQa8e748XGWLuaKsvU4EN0v5HKFNPHKlOuKmbCdmqGKjNkHSAXSPW9ZP4/gW
         bvm2096qBfal7O6BE3Akn6C/Gq533Tr6RexiZoKW4pT8gzMrJc6+HSN3pW6g3Oqux3Z0
         W3MouJlIba4l8b11pL+4O9khuwj3f0qC9sk0CrA+BqkGdNDBWcRwKOKBg5zlrWEUkULl
         UrfivTHinm49cwpVL9jatCw5FtRIzr3qzuQGaqy7sHdxkNeRy2FvHPIXZvYbisjCxTbK
         kirA==
X-Gm-Message-State: AOJu0YwE6km9MmuqM51FcWBDPGbWbs1jirikuzq0za17KC6XVXH0r8DB
	db/yMxXKCNnhiaJ9RTvXex9ejVeCD5gYCA==
X-Google-Smtp-Source: AGHT+IFVeq2UonGDJkqjWEGhZlaayweXzszQKwTkjyDaqXhC8Ny0lLyCAhVjP+LDoq/UH43wcQzc5A==
X-Received: by 2002:a0d:f2c7:0:b0:58c:b845:e4d6 with SMTP id b190-20020a0df2c7000000b0058cb845e4d6mr9941812ywf.4.1695756834976;
        Tue, 26 Sep 2023 12:33:54 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bx6-20020a05690c080600b005928d602f44sm1991016ywb.31.2023.09.26.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 12:33:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-apiflask: Update version 2.0.1 -> 2.0.2
Date: Tue, 26 Sep 2023 19:33:30 +0000
Message-Id: <20230926193330.1562236-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 19:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105146

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-apiflask_2.0.1.bb => python3-apiflask_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.0.1.bb => python3-apiflask_2.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb
index ad946470e..88afdda71 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.0.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "APIFlask"
 
-SRC_URI[sha256sum] = "7ffe29e082c6cc76d8ae78ba2445b5fcd69092fac04f4f8cd23b1c887cb291cc"
+SRC_URI[sha256sum] = "c1ab81640a1ab252888e2cc7ae556272a169b449c582abae309a8fe295f9337d"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.34.1


