Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD4FCA5538
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 11:02:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8930.1694602936046506376
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 04:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fdyGl6vj;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401b5516104so70591045e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694602934; x=1695207734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1ZzS4x58AYfn5DcG7unsfLCSI3qrowHqPhW5SLZLzA=;
        b=fdyGl6vjdQou48KJl6zZ99VwPLpQ+virKSw4tHJ7/pFLbKqDRwkRWayR1PuUrnVgmx
         BfonITP4TeZIdTnUhCmcCxr2jFuPTIylQiReVkcW+i7SvlJPGlfjPgs+5rGQ1NP3dtd7
         5lJvyqm3ytpt98vUTpKEBoMh75eFb3kuR5e6zPJeBjEJ3gzsC94YpYr5ns37BvSC5J8C
         2td8G4NIXHcjcAfjwIO55MFBZ0ivTQ/4MT+Bti2yGcRZ62ghDP6tex5dOW9H/5YBB1Lh
         43Wu8xbFHy2UU+0+fC9/Zt1SegZ4evj0aKFKmgvEjxwoPCGJiIw1NhBeDaNUwS+vSEDd
         mtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694602934; x=1695207734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1ZzS4x58AYfn5DcG7unsfLCSI3qrowHqPhW5SLZLzA=;
        b=DRqIf9B27eJklsQbOIM/eMeBdb+M8x6AMpUqbfNpLXXITBKEQJqSmcDoC5aqYZX/e6
         LtgGuItKUEkrHmSXtXSLUlregrni7GmDzgUbwXIN75rgwN9rllTBnkMCf6bgrA+EUNGd
         ecaJjtpRT8shGQ4QNl9t1XL17JTK8Qkl8vFQc77pclkWfzw1k7xE1Ki3aCI7Fb4aMs8x
         wAoZxgIWfk1FuPcLqzWAEPtDsABy6UPaAPngzeLOqpyZXLsETfJ9QeotKGX8dBHOEARM
         B1ER7RI/Moj/qgmFiVY3Hc+xRMKdA8XKkAlc7S7gf8Q5hdQLc70lyDmfE5mbdwLaHkJK
         hXIg==
X-Gm-Message-State: AOJu0YwdpcMheXrVQvAG0zKrAXyc2U9n2LsgX9A9dk9k4t3tGIB5NNTr
	iUVRgfKCFZ0yT3li3pbaHdOuQra9yCg=
X-Google-Smtp-Source: AGHT+IEoKBVnFgpXYvrZr/nmGNOhTdpQMVIsiGHMbMRNDBuIqIyP0nb9g6W/GIoeeT1HN4H7Q5mP0Q==
X-Received: by 2002:a1c:4c0d:0:b0:3fd:3006:410b with SMTP id z13-20020a1c4c0d000000b003fd3006410bmr1748131wmf.34.1694602933800;
        Wed, 13 Sep 2023 04:02:13 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c025500b003fe1a092925sm1694031wmj.19.2023.09.13.04.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:02:13 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH] opensc: ignore CVE-2021-34193
Date: Wed, 13 Sep 2023 11:01:45 +0000
Message-Id: <20230913110145.1100755-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 11:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104854

The CVE-2021-34193 is a duplicate CVE covering the 5 individual already fixed.

https://github.com/OpenSC/OpenSC/pull/2855

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/opensc/opensc_0.22.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 4590b85fa..3bb79b9d9 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -16,6 +16,11 @@ SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2023-2977.patch \
           "
+
+# CVE-2021-34193 is a duplicate CVE covering the 5 individual
+# https://github.com/OpenSC/OpenSC/pull/2855/commits/7a049fc3922060fb75cb9fea9e58eef9edc357ae
+CVE_CHECK_IGNORE += "CVE-2021-34193"
+
 DEPENDS = "virtual/libiconv openssl"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


