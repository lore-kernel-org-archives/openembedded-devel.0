Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA2AC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:39:28 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.2039.1706305160574437649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7bfd5570ed0so6463339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305159; x=1706909959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqfCkqjf1Ptam+Z89jcpxfL1TE9giMja5O4OLyMO/lc=;
        b=w34OqM0UbJFvh3FkV5cXfGW1BPMn4+bmVZiGnjV0UsoJYpYJKPgtHNhEcNL6BbMO/2
         OM4gUNa6z+RCZ92+i0UtF5MYnQgzmWzcHQ77ERTAuf3anSM8xCeszWTynPnDRqFhOFkt
         bZNWNopFFl2LhpgMwheJvTTu+HeQ/KGOiKyOI8WALuhhrEVD8DAWoGcQ/wbCgi7xZmoJ
         p4qRo/sEMiSgO0BMK96CVjGJ63oOP05xJ+fTv29o7Va7DBcEjnUU66ZVjNtluC0zJlqd
         fSsmV6nrU/fc4fO7eIuLo9B4+MMXoffTWXzINt/53eXulR4j8bhYlkZYXVDb09UwLee1
         25ZA==
X-Gm-Message-State: AOJu0Yz+Wy4N8f1aoh8fhfWd1aKGNA5XO4skZUMMTGOQzIG+LFAU9d9t
	+mUK0twEvJSSXwXQboVr5Mv+CgaQYXLHap6AIRzybA0aKq6pklv6cOLyLi946cuBkqAm
X-Google-Smtp-Source: AGHT+IFeUe7h1dPS9Qj4tHBKiMj0zs9UPq3AYyTxKsSbwZtMwKCKd6zJfMOC2fzsPx/ZQICwGGzKQw==
X-Received: by 2002:a05:6602:58:b0:7bc:3ceb:6552 with SMTP id z24-20020a056602005800b007bc3ceb6552mr588602ioz.5.1706305158983;
        Fri, 26 Jan 2024 13:39:18 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g27-20020a02cd1b000000b0046e29fcd2adsm470742jaq.160.2024.01.26.13.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:39:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-colorlog: update to version 6.8.2
Date: Fri, 26 Jan 2024 21:39:12 +0000
Message-Id: <20240126213912.1589460-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108474

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-colorlog_6.8.0.bb => python3-colorlog_6.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.8.0.bb => python3-colorlog_6.8.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
index 6aefef6d1..c26f4bb70 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
@@ -7,6 +7,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6"
+SRC_URI[sha256sum] = "3e3e079a41feb5a1b64f978b5ea4f46040a94f11f0e8bbb8261e3dbbeca64d44"
 
 RDEPENDS:${PN} += "python3-logging"
-- 
2.34.1


