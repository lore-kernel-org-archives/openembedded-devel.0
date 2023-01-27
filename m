Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE8C636BD
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:48 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.96460.1674798884013357508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A8nbSMMI;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso7592866pjj.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O9nje3BDhw2Gu0fBw9hn9L5Vel8kyIMTQN82IWaPiQ=;
        b=A8nbSMMIG6AVw/WG3NO7GMY0D5mac9XRnLs43v/VfzUPNXNURKJajFCKV3o4/Fk+BM
         GNSWM47rc29EWneB8B/OlWtpGGeX6mXlIkkbe/Usr843jQMeod9YPnsLX2ejepxzjEhj
         Ss4vCz3ZPjRGJfVzdOXGkmCUtsUgvLk4Fh8/491xy0FCd+Qc6hfil8oBB4951fV618/o
         5AohV9LkGo+yTPHYaWH6jrN4x3MoLD0xI/9QfPn19dyF17Bo8TQulEFhb/fCY5I4NZ+k
         hqkW9MYWFKZ8mfJOQ4d0EJkBSzLmzq9qpyH1vbCgSGGwjTt6lw53DbdiiHOcmdQCCCWV
         xqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O9nje3BDhw2Gu0fBw9hn9L5Vel8kyIMTQN82IWaPiQ=;
        b=ijEqrZVDGjikVrJB3eWbACpo06N5MtN0Az+jj1O1tnXAWQ4jvsS6wG3WUNLrnRyIak
         oPiKkrupQ2XYM7J+8hgG0ggdK9WJrdQXiLAwjgUS4/36ySvgVfkPo7xiIgM7un9FU6sB
         HPZGU9S/e4OnamZTMyIIdA/KuZZZB4hDq5h2QQQNMsO2cHpFXN5JA5Kkw4PnYKgLHJ19
         /dF1AqagPWVxeVH0wXh5xqab/8MD058o3amyQOLVHkdfI9HMYTDYvdxi6Qj+WpibqR3J
         rmPygyXWBzJjBtjIuPNU6gqFnYGl6ZJbN8qdpUWHR28NFPtjMHq02ECbD5kOQXPkJL4Z
         D5SA==
X-Gm-Message-State: AFqh2kojrNpQndV4b/6gWSEtExPwvJJsTskAShJj2QD3rdtQqs/CyQq3
	6iIIgqHw0Rv+Plc+JKkIM54JCt/yyiPhNw==
X-Google-Smtp-Source: AMrXdXsQb9SdExwp/D3Gnyw1k15RB/IePb81ppyZGIBytZKDHM+jORez3uGZIkn/4zk7L2k4oDW3Ig==
X-Received: by 2002:a17:902:c948:b0:186:def0:66f2 with SMTP id i8-20020a170902c94800b00186def066f2mr49034824pla.11.1674798884396;
        Thu, 26 Jan 2023 21:54:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/10] v4l-utils: Fix build with gcc13
Date: Thu, 26 Jan 2023 21:54:33 -0800
Message-Id: <20230127055440.2108933-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100807

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-missing-cstdint-for-uintptr_t.patch | 31 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.23.0.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
new file mode 100644
index 0000000000..032bf00c7d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-info-Include-missing-cstdint-for-uintptr_t.patch
@@ -0,0 +1,31 @@
+From 1d9ce7cd799770981043f656373cbd1bf7558b9a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 17:00:00 -0800
+Subject: [PATCH] media-info: Include missing <cstdint> for uintptr_t
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer
+transitively included [1]. Explicitly include it.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-media/20230127010741.3883339-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/common/media-info.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
+index 53e132f5..1a25a4b6 100644
+--- a/utils/common/media-info.cpp
++++ b/utils/common/media-info.cpp
+@@ -3,6 +3,7 @@
+  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
+  */
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <fstream>
+ #include <iostream>
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index 383be4a543..b42300f096 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "\
     file://0003-original-patch-export-mediactl-headers.patch \
     file://0004-Do-not-use-getsubopt.patch \
     file://0005-configure.ac-Makefile.am-Support-building-without-NL.patch \
+    file://0001-media-info-Include-missing-cstdint-for-uintptr_t.patch \
 "
 
 SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"
-- 
2.39.1


