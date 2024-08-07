Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43DAC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:31:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.31102.1723030279651940353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kw8QpUkh;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f035ae1083so18485011fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723030277; x=1723635077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5vT7XwXd2HqwHADvaVNpsOO0oEVpgfkAOSqxsO7NEc=;
        b=kw8QpUkh88x5AtxDi7cw/6XMyKmWMxT3GiSb7Unp7xaCkQ8C2HoULjDwYOQAxtkHVc
         /xNwdPnmz6qKZ7pG6jYcAXEbQ43FTpJe+YKHPhlE3KzG7UXkdrU1JO1uJEnMa63s88ca
         ZCsT27+cGsWdlA1OThakZW8zfFpuqtq115k4Qgr2oUxKOUO8fkFs4f6f2UTi+r/QcOkR
         00pfHPhbwTNxMQ6Jb5zFTkQl4zmM+f8wYQsD7eXQxnBqVDVOpBPBHBEhnKdJDo9bdhPp
         /s3g1nDpz4u0Jiu4IZwestHZzHJeCkpJY9rS0IMEgx4s08RhklOsKC+q2S8UKFhMXuCr
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030277; x=1723635077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5vT7XwXd2HqwHADvaVNpsOO0oEVpgfkAOSqxsO7NEc=;
        b=SkCIS3F4syTl6XqaYoudLru9/pbS0Zk0+LcwdlDxOiqp/wSDsfxcpBO1GoXp8TLxJ+
         eeQj0GvX+9sAT0ZbjUiQTsY+S8xlZ6QBNmKQxbX8OgZKnA5dZ14d0KVpfpNpwo+ebgZ8
         O2UshzqX5FXEQVU3nYs7HvbzD7rhefrXJFU0BzhbQMpC44K1lv7DV08wEfjn88v+/nrJ
         IidVp48WWkQff5E6jAuNkLjGxLhCYTOL8Ju3uGovdSpmpeqfZpgdaZOd+UXMygxO5P/W
         fT4iC2oN0OkHjC2B5E9JJ2L4tYno3P4Vq1CEOX+SZwxeTGzEzmeMXe+HHNQu1dKbUBmG
         LCLQ==
X-Gm-Message-State: AOJu0YzWyFMtYj4uaw8dN1LDh9itca7j1a0dyIoFDerpI5lj3pwd850o
	P2mxbfFl2UwCBcV8umL50MudnmLbrymrwkU90sGu8Bfh4c3fmdnmqy/zZ2zI
X-Google-Smtp-Source: AGHT+IGy+FsqzvH7xwJVbgYsWJfhCoatxkBKrMfuEeg5Rp0373v9axgNQkkKJdKeYPVl2DXT6LxcAw==
X-Received: by 2002:a2e:9d87:0:b0:2ef:2b6e:f8c8 with SMTP id 38308e7fff4ca-2f15ab35361mr113441801fa.42.1723030276932;
        Wed, 07 Aug 2024 04:31:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290598f18asm24525305e9.27.2024.08.07.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:31:16 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-term: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:31:13 +0300
Message-Id: <20240807113113.74186-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111616

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-term-2.5-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-term_2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-term_2.5.bb b/meta-python/recipes-devtools/python/python3-term_2.5.bb
index 7d508ad80..fe0aabf0f 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
 SRC_URI[sha256sum] = "846fda941dbb8a7c9f246e99bf5ee731910fc4a4cc54b7e36457c133c9f6b78b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\
     python3-io \
-- 
2.25.1


