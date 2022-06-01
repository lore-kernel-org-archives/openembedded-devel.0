Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D57C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.6753.1654086381130564077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDw33b+m;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so6084338pju.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RSXBM1NnZNnpA5GBJ6myH5qVu+8IMV0bP/95uvUfo5k=;
        b=dDw33b+mTuUaztAMaZh7sQTZ5VQlBusMeekxfkQNKvGyPiO4wUc1kcFvhN6ZcVjXgj
         NG81h2jbjO5o4XtTttTC4bFaGi25j6pvkzsIc4wDK4GRyoWbcobauINQN9x3VhF5x/iq
         oWO8rlOQgVQuVJMdqXxi4u9g/eYY+XX6GFwCa2kEPB1rtV1bkWjzn5ebmnwR3gJ8+IeM
         AXGxjNpSs8Ve6Z8BJCAVwyqDwg+kpOO3INVWbibztCuF2Cxto7RIq8fB8uxcHjXExIrv
         caI25D0iG+JabD3zqyp/jHKrtgB3oy1CJfbSTIxgKX+p7N7UqiW2VDVHdvXUvp5xsqYA
         /iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RSXBM1NnZNnpA5GBJ6myH5qVu+8IMV0bP/95uvUfo5k=;
        b=7YGGqmPGd1t+rwgfdalcMxuJQ6ERexGcoF4pbZVyZSyZONyTs3lOwD417YHh9oyZL4
         HJMFMw4QTVN94LrN2i92WTAxot5QPtS2DlOwEXkdqajixVdDp+0keyvM1aIPIVw6iWHJ
         Dcke9qkSIB04jmx1pGnIa9reEIfQTztK1SpcMXBmnA6kmFIvybrLezxdxn9KwP178l81
         Fey3Yz87exk8eddJrvlQJuH3hoei8AZY6PNAxOrI2QlBRqnZ57LsnOdkCu6SMaiCIgK3
         ODv/uJRvKyQQO91a9eI6U12shVrsgYmYh/Hs/+KqPdfC1L888PPYNuCgXVkZyYlQiUDo
         crGg==
X-Gm-Message-State: AOAM5301Gzb9YlXM0UPLsoxI3VIwE7OzBvwBdh8vT3qAdJYSjwihISeb
	zXOJv8ZJLC7WLTKIwBnyuvVqYg3470dh8A==
X-Google-Smtp-Source: 
 ABdhPJz/N8QPxSj6eR1hzo95bjOAwZo+nsGY6SPZco37ilNf2gz/6bJJ4Jd4gpJlN5Peg0mHG4nECQ==
X-Received: by 2002:a17:90b:1b01:b0:1e3:421c:90f with SMTP id
 nu1-20020a17090b1b0100b001e3421c090fmr7814692pjb.59.1654086392140;
        Wed, 01 Jun 2022 05:26:32 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:31 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Kai Kang <kai.kang@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 3/9] python3-pillow: 8.1.0 -> 8.1.2
Date: Wed,  1 Jun 2022 17:55:21 +0530
Message-Id: <20220601122527.19987-3-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97361

From: Kai Kang <kai.kang@windriver.com>

8.1.2 fixes:
* CVE-2021-27921
* CVE-2021-27922
* CVE-2021-27923

8.1.1 fixes:
* CVE-2021-25289
* CVE-2021-25290
* CVE-2021-25291
* CVE-2021-25292
* CVE-2021-25293

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb0789998e8fc5d916808421aa88764a1463228d)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
index adbf639b39..de234b01fe 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x;protocol=https
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
+SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
 
 inherit setuptools3
 
-- 
2.17.1


