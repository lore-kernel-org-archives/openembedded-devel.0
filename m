Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C340C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:41:55 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.15776.1702532509648487760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b6f43740b4so307690339f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702532508; x=1703137308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5SYK/b8Woid/ZKIqmmZpN8208UptEoqPmKM4SqwnvI=;
        b=PIX8x9UKfMITmeWfXO4vjy2kbEt+6djW0Y6NriE4LDON0j6mxSHifWgCSiAva2+leR
         UfAxhafXF+vaaNIor74rLyMhQ6f1Id+dyv9F6ykwNIMM9qjCPuPCf8rp1+qLccxeTVFw
         llJ/VU4VDwLg/G5V86tYTfYksqPz4Ls4QIhM2JgdOpfObowOvDYuBzsSRjO3Y5oN/5Nd
         8t14t9sJVw+erolOIdyr0vnBdMi5XlBurcOmHKA4e13EHML5eTqTrbC0deP9cNFK4eZy
         f8o/Kfhs+i1bdtmGcumt/iRMN0b40rGaiG0ngtGjoTpSJ08X93+VhMgbQvW5KtFDYCT8
         2APg==
X-Gm-Message-State: AOJu0YwkwkAqhuUoa3f+yo0LeVilhQwWabpT8vc2vEpFKFSMxGKA+Gzv
	ZEE9vEBYGCvbLAcG2w1AtZVC0Jv/ulhYXA==
X-Google-Smtp-Source: AGHT+IG1vHyCLT072PtihFnzfDxvexSoiV6hr4JbMRwRuQ40vD1qiNgz4uUk7MosV+jrAikXSDTAaw==
X-Received: by 2002:a05:6602:21cb:b0:7b7:3dad:99e2 with SMTP id c11-20020a05660221cb00b007b73dad99e2mr7632950ioc.39.1702532507954;
        Wed, 13 Dec 2023 21:41:47 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id az12-20020a056638418c00b00466a2a9e5b0sm3204399jab.32.2023.12.13.21.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:41:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-ipython: update to version 8.18.1
Date: Thu, 14 Dec 2023 05:41:39 +0000
Message-Id: <20231214054139.1220161-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107421

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-ipython_8.18.0.bb => python3-ipython_8.18.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.18.0.bb => python3-ipython_8.18.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
index aaeb720e6..5a7e1fbc5 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "4feb61210160f75e229ce932dbf8b719bff37af123c0b985fd038b14233daa16"
+SRC_URI[sha256sum] = "ca6f079bb33457c66e233e4580ebfc4128855b4cf6370dddd73842a9563e8a27"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


