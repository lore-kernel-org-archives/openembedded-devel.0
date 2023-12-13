Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D3CC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 19:58:15 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.46207.1702497487427830460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 11:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35da85e543eso27074385ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 11:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702497486; x=1703102286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxU6cbgDuMqIGu14NyVO1dpxNTMOAN3EnEkV1pHOkB4=;
        b=mPJIlAz3PKAJVDqQvBytaVup3FSCh/4W7Wc2xs2bu1gGqJiWB9WxkY9VoyfpwU3yQe
         F+5WN8KdxysgSOu7QMV1IUZjPVYZ0aQTWcQhQgpaKu2VixbWq1iGG5/ZT8kk+4U5glqd
         SEdhEFmmaCkwYOdZx4Juz8UqGLDaedyBkZ5fxX8HXpycA9JvYPFMCM4O6FCg7ZKlaHhh
         6j7Z29P+8GaVyvsHyn7QeWjh73p89stkcuop67Qh0WHz5Q5qlfcOKPmI8X7Q7LpkLwxW
         vcl/a0LakeMXr1xuw4YRmeCoVkRrhc434i/5AgM1Xrcfq3ptIrAzXCpIaFNNbiyz1th5
         uy/g==
X-Gm-Message-State: AOJu0YxOJkhZi4rIf/ItjjJD7ca1xdwIGW74+VE1GFKJJV5rcmknn5EM
	BKo/pCYGFwkTswh10iJSAjIY8dgt9+jhUA==
X-Google-Smtp-Source: AGHT+IFv0IfKI0RGYHYkNUiHW+xVUEO7tT4T9zdCh9u4qbZHOGe2E9Qt5aJS+zXwv5eNVm9ulDdumg==
X-Received: by 2002:a05:6e02:174a:b0:35d:7054:3dd6 with SMTP id y10-20020a056e02174a00b0035d70543dd6mr12146854ill.6.1702497485596;
        Wed, 13 Dec 2023 11:58:05 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id r6-20020a92d986000000b0035f76aac36csm355604iln.21.2023.12.13.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:58:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-greenlet: update to version 3.0.2
Date: Wed, 13 Dec 2023 19:57:41 +0000
Message-Id: <20231213195741.1107961-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 19:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107398

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-greenlet_3.0.1.bb => python3-greenlet_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.1.bb => python3-greenlet_3.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
index 523c2b6b2..337bd95a6 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6eb0696acb24005b"
+SRC_URI[sha256sum] = "1c1129bc47266d83444c85a8e990ae22688cf05fb20d7951fd2866007c2ba9bc"
 
 inherit pypi setuptools3
-- 
2.34.1


