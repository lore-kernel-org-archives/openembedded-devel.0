Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEE8D18128
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 15:25:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.57781.1728919529173028990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 08:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8I60US9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0474e70eso228615666b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728919527; x=1729524327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBPz+Uk4YUZLkRkt/5nv9tii8/6jhGLZS97638nSFrA=;
        b=U8I60US9CksQGTvxeprH4ik65To0LpCYprg2nzt82qbipdZF+9EQbAbKAZkd8y79be
         fPQsoqDvzpVz4V/nfl3rRk7e7uF1CsiNUTtPwuvcmF6muh2lh+nqHwlN4C3Q9dFay6ih
         ow4pJ6qIVh18t5pWlSg7Z8Jx5np+lhYPuj1qn4zIXER18cHUw5sfNkQANGjX3vvXdnVv
         BUehxU35S9T2LljaJeEYHUU8dJFSTHkUjWFQF7NzjIUoIrXTnP9hWDzjkIhcY4ow3Z7b
         MSeQGW8J0E+PI2kbvi8EFq9ntWSMRpcdsebA4Euley0wkzBLzVVqnW4OLPG9EJwMjh6o
         rDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728919527; x=1729524327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPz+Uk4YUZLkRkt/5nv9tii8/6jhGLZS97638nSFrA=;
        b=eOE0R7RTIGh+gVJwTbZizWJ1sQ1ykgZxu17Qehv25ulJoVU6ryB9BbXvx4XDc89uF3
         brKGkzFnvQBIh5+yzhPVdFhE/i+rhQ7DREJMD7+42Mp0gaH4goA39mXob6FKa/pET5Ri
         iWCdkLlBylyeCw+BZB8d6cGegVkOgsNkvf8FaInB7wh8Xsg/+dqdf9Vzf4Wck9uyE15/
         +8kohxrqEdAgwQ4B9ZlNkSQiQJ1ySXxH2rc2iEu8YagK1vlUYh2KmwAAx2/JB+ZKlVrb
         dR5KUTal0xcaUE5cqlqNcc6ZOX5RduniN8z33ZRTL2HMmPfd8FWNOc8/defF9/vn53r4
         6X3Q==
X-Gm-Message-State: AOJu0Yws4EHl1iqzjH1rNsuXN/lDkve/UVgMQwM/WUX4hm4i0LqbMQze
	CApo6PTN0LviLKcHYj/lg5r7GHymuJ1UjkUg6KXRNI2nyDBVIpRpjXp/cA==
X-Google-Smtp-Source: AGHT+IGgTjidT833Kc4QS9qqnBbIcZoZdCS5A+vEvFvoJOkbPlWTLUvRrvnXwQNJ5EsV0nGaVT+MJw==
X-Received: by 2002:a17:907:3da3:b0:a99:742c:5b5 with SMTP id a640c23a62f3a-a99e3b20d4amr940472866b.13.1728919527256;
        Mon, 14 Oct 2024 08:25:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a01b49bf1sm250898066b.100.2024.10.14.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 08:25:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [nanbield][scarthgap][styhead][meta-oe][PATCH] xmlrpc-c: update SRCREV
Date: Mon, 14 Oct 2024 17:25:23 +0200
Message-ID: <20241014152523.258210-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 15:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112909

* github repo was force pushed and git history re-written since 2018 commit:
  69ee98df Release 1.43.07

* $ git branch -a --contains 352aeaa9ae49e90e55187cbda839f2113df06278
  $

* $ git diff 352aeaa9ae49e90e55187cbda839f2113df06278 08b052692b70171a6fcb437d4f52a46977eda62e
  $

* so at least the 1.59.01 content is the same

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
index 5d5152b834..b667507ef9 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0002-fix-formatting-issues.patch \
            "
 #Release 1.59.01
-SRCREV = "352aeaa9ae49e90e55187cbda839f2113df06278"
+SRCREV = "08b052692b70171a6fcb437d4f52a46977eda62e"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.47.0


