Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D57C4167E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.23543.1668873498932968569
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GNvE9X5r;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id z6so4948101qtv.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpgyRT0B4nHd1F5bsWpiFjW3c5kY2OkaVdir35M0h0E=;
        b=GNvE9X5rSB/yLakneVNuFFFFmrnEqmYAMe52lJvS0jh6ikkc/71deoWvO33bE4ztAQ
         yXjeJjZ8OEXA4N+wk42zdwKoaGuY16yHpoT6RB2pTThMMghEpA7dVWNnbYj3L7myp90c
         SD+oXNYTVAWfb65m5twYGjHce6wGqn5xbdx5ok7i3x3xIaXTlxwKcVnkorKomUZT2kfX
         fzh0Lr0f1eeay8iXuxu+1ddiTf7gAiFd/cbA3426Qs47K8K2sDgVZRkWhw+zJVN8zy0k
         uGw/wCtOm1f4xv/SYztTfbY29c+bdwHK61DxPH54klXVhUanHGfZbTKZb6B9Xu9BUK9R
         iR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpgyRT0B4nHd1F5bsWpiFjW3c5kY2OkaVdir35M0h0E=;
        b=f1z175quvniMHDc4PJVWoLZLmmbQz+PIXIDKvEwmYYk9BrQC5s5N7XLrTErYAVkghU
         Xdp6YghQrV4DIZuAqFIXyDEeoNThawjSzj12v+MS+va1LJwiPZSvEmTbhZ6O6jvsLN00
         Tze4uNg9ad6x1gOSBUQC8M2Ivorf0pLWeBz/8/ztDejDBEbnWwnUeO27i3X/YWw8DY+W
         hym+MGEYtnZPg2Uk2DmRRNoQ5gaxM5yD8RxgW+Bz4VjbX4ro9HYjAUs5j6EH8QJQ9/6H
         NIp2HCMqkRaAgWl41bULdJPpmXqDg7DuOX4ZDY3IbXg0KaiXeScg1lCnWJAskzfHA9ku
         rdKA==
X-Gm-Message-State: ANoB5plk+aThKCRgasG5UGKyU8q/IixbncQ+WRzWbZYjp+sruu4LyAct
	sY4rjxX2p5u4iCQQpB5Mfu/ZYqymTqtzNg==
X-Google-Smtp-Source: AA0mqf5Gv6/DsMJCfLpZqvnT5SJnLlXQ/FMNXeNtjkZvpYqe9IqYj7HAdQRB0YKxszeGHQwxnl/6hw==
X-Received: by 2002:ac8:12cb:0:b0:3a5:bd9:5d8b with SMTP id b11-20020ac812cb000000b003a50bd95d8bmr11147962qtj.399.1668873497639;
        Sat, 19 Nov 2022 07:58:17 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 11/35] python3-astroid: upgrade 2.12.11 -> 2.12.12
Date: Sat, 19 Nov 2022 10:57:35 -0500
Message-Id: <3036c2e7c9c5b024cee8ab8fec43e01d5c900d63.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5bdd2eb08be0f33bf636d102f8d390eba21efc9e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-astroid_2.12.11.bb => python3-astroid_2.12.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.11.bb => python3-astroid_2.12.12.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
index b9dc58082a..aa0ce44baa 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "2df4f9980c4511474687895cbfdb8558293c1a826d9118bb09233d7c2bff1c83"
+SRC_URI[sha256sum] = "1c00a14f5a3ed0339d38d2e2e5b74ea2591df5861c0936bb292b84ccf3a78d83"
 
 inherit pypi setuptools3
 
-- 
2.25.1


