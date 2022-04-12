Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A69C3527E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.2457.1649801002972195304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YDUsdbZv;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id bg24so51723pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9WsPQeju77JF3z/HyXljylfrbLIBS95pmdcfMlVnAqw=;
        b=YDUsdbZvJsjj5y8WaTmqJ+vttEJ9dgr029GdN+5ttNe1UGMR8qs0ERxIgt3TZUE/Gg
         7Yeenktwt4s7xyzz+wb2gV/nyhj8KBQvzcz+p+QJN3jfCZE+Gy6K2ijTSXbHy3h7E0tR
         7bRBPKiuriLgOAQonQSYOyLKSXOUB5iRqsoBqxZlNp4jmVHPw//bl24IPN3ap3V6/I9u
         oocAoBdyq2fPFrUtxzh0tu5liYU7dKtmBOl0Be9GFANFaohpdHR4jeQNTRy0a0FnLKE3
         y6DSXKWYRurr2FZm+4pFPByq52mP2z3GHWfXkAY8FTmV7FkZZjfHMtEjTtQlejY5tdOa
         ksFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WsPQeju77JF3z/HyXljylfrbLIBS95pmdcfMlVnAqw=;
        b=YclZ+NvwBqmueyLm9Z3RUvTWYel316MAfgshmOrW9jTqGtGP3q5/oZUMK6jCSNXg39
         PFB0lschVqvDWubhWQ/v80pxyFwN5rJC5FTIWP8Jq/gWvVKL0xyCuuBcHSnxpm5eiV66
         /L90mlPyz8qhm5gGTORni890aFF+ZJPoCt5OK6s2lGfEZonjtoQIMgc/x2uGUFST7kDq
         tHgt7Ohr5nGHdDnXV8HFj5G+qAnTieKflvNg7xvAFX+koHz71bWnW4DBV0aYu73Cu/2v
         X/bk88lnDGCjWiFSWtarQsc/EAylFW3glcKlueRoL4H52aP2uTkFKpenO1hDLi7Io5EP
         A1dw==
X-Gm-Message-State: AOAM530vCDDoCPejNU4OIa/38SDa8V3FsrEo3x3XcP7Fe3nE49LpK8/g
	3AZtddvLvXq1dwsaZbltYEWSTvycHBmoiQ==
X-Google-Smtp-Source: 
 ABdhPJw5h9GqhDC8tJHBfgW4Havf773n1hXJEDWyB13UpCywcq7oO7q8aOzQD7afnjM6nV5gxw8org==
X-Received: by 2002:a17:902:da90:b0:154:4737:a3f with SMTP id
 j16-20020a170902da9000b0015447370a3fmr39505304plx.73.1649801002110;
        Tue, 12 Apr 2022 15:03:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] glmark2: Fix build with gcc12
Date: Tue, 12 Apr 2022 15:03:13 -0700
Message-Id: <20220412220316.3876985-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96597

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...atrix-Include-missing-utility-header.patch | 24 +++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch
new file mode 100644
index 0000000000..959a18e5eb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-libmatrix-Include-missing-utility-header.patch
@@ -0,0 +1,24 @@
+From 45cb02332b38b2059e7e44369c3d8684492a7def Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Apr 2022 11:41:41 -0700
+Subject: [PATCH] libmatrix: Include missing <utility> header
+
+Fixes build with gcc12
+| ../git/src/libmatrix/program.h:43:21: error: 'exchange' is not a member of 'std'                                                   |    43 |         ready_(std::exchange(shader.ready_, false)),                                                                       |       |                     ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/174]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libmatrix/program.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/libmatrix/program.h
++++ b/src/libmatrix/program.h
+@@ -13,6 +13,7 @@
+ #define PROGRAM_H_
+ 
+ #include <string>
++#include <utility>
+ #include <vector>
+ #include <map>
+ #include "mat.h"
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 47d927397c..1406f68b05 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https;branch=master \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
+    file://0001-libmatrix-Include-missing-utility-header.patch \
     "
 SRCREV = "0858b450cd88c84a15b99dda9698d44e7f7e8c70"
 
-- 
2.35.1


