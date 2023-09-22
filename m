Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AFACE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:18:18 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.10097.1695421093726530802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-79545e141c7so95421639f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 15:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695421092; x=1696025892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlLWfV6DxB8iu4K3DVfCz/X/0ZOqMw/fHDHLJ5S6JBQ=;
        b=J9ulxTga09K+nL7xCyirEIpixtEdSyxBYQZDYqiEknbho9wK+qYI93E/cIp/2wpxxt
         Qwlrwux6awEzivB4jWAY5/6czYsE3ceqJbPIu9p3XbUmgUSMIgIhjPJaIBmzqiUlqAyG
         beBikdWOpG2IR2G+bafhbqL34g/DCNR1iE4ko4Oy1vYHDaFTPEiBaKZuZWxkYJY4V43S
         2pte3snPq/wDjVyvV0wnhCWYPeW038cyyde4KpZU9wo1IGH0dRbQr0WOcTTVdkFqA4Dw
         YXL4RUh8vy9weUi7bkXkxAdZPu+CWygcovqAHtACNSALx5nm6ALAx/uZVDZAH7mabGUo
         dbKg==
X-Gm-Message-State: AOJu0YzRsat+wq275iXO850s/uwLCs/oMxQVdcCtHRbrFH1toXixq9wX
	jpTjF9YFLeSxxSNoR1GKWcHFq7JlyMRu5w==
X-Google-Smtp-Source: AGHT+IG7sAxxuim50bzpY+w7RJ1/DMWw4RhnR0Sjx+B789JbwJ/ZwkWWHaPj4Wb7qDdv++Np7ayRew==
X-Received: by 2002:a05:6602:22c3:b0:794:eb37:b0da with SMTP id e3-20020a05660222c300b00794eb37b0damr900887ioe.2.1695421092508;
        Fri, 22 Sep 2023 15:18:12 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id e4-20020a6b6904000000b0079fa3d0d790sm416677ioc.31.2023.09.22.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 15:18:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-gevent: Update version 23.7.0 -> 23.9.1
Date: Fri, 22 Sep 2023 22:18:03 +0000
Message-Id: <20230922221803.3156851-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 22:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105077

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-gevent_23.7.0.bb => python3-gevent_23.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_23.7.0.bb => python3-gevent_23.9.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb b/meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb
index a82abcc09..0caebce28 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_23.9.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "d0d3630674c1b344b256a298ab1ff43220f840b12af768131b5d74e485924237"
+SRC_URI[sha256sum] = "72c002235390d46f94938a96920d8856d4ffd9ddf62a303a0d7c118894097e34"
 
 inherit pypi setuptools3
 
-- 
2.34.1


