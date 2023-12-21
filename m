Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905CAC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:53:21 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.7123.1703199193285370361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b3708b3eacso51121439f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199192; x=1703803992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uigz/OEkVeQWy1Jut9cTx9tpexcU4DOM+4b00ywiskI=;
        b=ugDd0q6YADtim9JbZXHIgS8CRXqI0WVhgTY4wPTxtbjuSDLHzL0pPHHbkoOrAYEzyO
         8jU19OgyVySMV+7krHRV4Tg2sU+KSE53qPqI05smTbaL7QelMG/EEwhDUz6wBNChycRz
         PU4MXQGlK3KKI1RMldpTFBbzYIEBjtvnr0DhHvIkhM4aVkmRnZJCJ5pSR4ANacYe+9Cg
         r7NvaY9ZqTXy+SFKvLvZXPJPRjK8tnq8vVAzMiPtzovfz309ltIm1L3D7e7XlF3O2LXb
         0nQ3RVWpCwU141BXXY3pUKBtomFeyZy2/w8tfDEhAWvmRxJ/w11A2C7qv4QdylGH0Gll
         +3IQ==
X-Gm-Message-State: AOJu0YzysvIVWoSwBVv9GEfJCb3RRtjhrRwU68ZjCjnLYJL5vJ9XJAWr
	4+JeYXbpWGQYaTnlIm66cbXEr/j23cxJpA==
X-Google-Smtp-Source: AGHT+IEBzerZoeGHKP2I8xNeE1y2rDRsBr89cim8PyuKN5axLn/G1bndh6MWqgLxk41al5FHXz1lSw==
X-Received: by 2002:a5e:8a4a:0:b0:7b7:1c30:bc1f with SMTP id o10-20020a5e8a4a000000b007b71c30bc1fmr595545iom.13.1703199191660;
        Thu, 21 Dec 2023 14:53:11 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ch26-20020a0566383e9a00b004692156631asm728692jab.172.2023.12.21.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:53:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-greenlet: update to version 3.0.3
Date: Thu, 21 Dec 2023 22:53:03 +0000
Message-Id: <20231221225303.3948208-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107740

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-greenlet_3.0.2.bb => python3-greenlet_3.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.2.bb => python3-greenlet_3.0.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
index 337bd95a6..abd6c49ca 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "1c1129bc47266d83444c85a8e990ae22688cf05fb20d7951fd2866007c2ba9bc"
+SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
 
 inherit pypi setuptools3
-- 
2.34.1


