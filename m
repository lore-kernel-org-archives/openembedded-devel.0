Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC786EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 04:54:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5641.1688100889669932166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jun 2023 21:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B5xDK6dv;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-55adfa61199so1037391a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688100889; x=1690692889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mml4UtJ7eYc4utWWIWVFS8VQNk4r4cb0GUEy+6g++fQ=;
        b=B5xDK6dvPCZ08jNIM9ryarrlow1qNAzimAEjN0Ghty8GUFSOWRXogOeWt+XINMENt3
         9bVvJwUpVdebaLfkqCsgjuIvQbBFGz9G4e5asZIn1iUiKWckNnWDnKjJvj6NrPsY8dhJ
         77ipAJhRAfwOQQ1p6MuquaGooLn8nIkLEXyVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688100889; x=1690692889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mml4UtJ7eYc4utWWIWVFS8VQNk4r4cb0GUEy+6g++fQ=;
        b=WvPwsNNpBVlvAQlJdunfJzyZ7STGmIp0CyJJpGu6zcKUeMuXa6Vpgq0yKvb/8XPfWO
         T7BqH6QTFNNah3x7/NLLrrnUDrUDbxGdlCJjRll88FyaF38NaKjR78dOBXc3zwU9KEBK
         uMoojk97JypsyM5leTvYkrjuOoRMYJFL7iv+mw6nAeXHZ04ef6WbMGQve2l6eTLnSERx
         KRJCsFrBqIWfl1+s4YKArThI4CRCYMpXv14vE64Xq3hU1xKiXR9kgSxRWutNf3ne5Cxn
         Ub3/z/Y4Utu2gPLAdyDMZ2FvxApdknPEEcE026QGMDQpyQa9ZqfWKAYgtdeLBfBjPN+f
         by3A==
X-Gm-Message-State: ABy/qLYZLrLO1q1e7cDcumRusMLaCY0Dao+S5+jollZHm1A9inwvU2AF
	+EMFpuXzLUZ1Jgmj65S24OdHoUoMWPrpitvqS6SX5g==
X-Google-Smtp-Source: APBJJlEXeY7LB7uF5RsbxayeEjaYkGYZNIqVUIcakn27/HJVRtO/kdKo39uEn1B+G4dZegqxNexZQg==
X-Received: by 2002:a17:902:da92:b0:1b8:4e00:96b with SMTP id j18-20020a170902da9200b001b84e00096bmr1580753plx.9.1688100888911;
        Thu, 29 Jun 2023 21:54:48 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.161])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902b19200b001b3d8ac1b6bsm9881460plr.212.2023.06.29.21.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 21:54:48 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 30 Jun 2023 10:24:43 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] yajl: CVE-2023-33460 memory leak in yajl_tree_parse function
Date: Fri, 30 Jun 2023 10:24:41 +0530
Message-Id: <20230630045441.27249-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jun 2023 04:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103643

Upstream-Status: Backport from https://github.com/openEuler-BaseService/yajl/commit/23a122eddaa28165a6c219000adcc31ff9a8a698

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../yajl/yajl/CVE-2023-33460.patch            | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
new file mode 100644
index 0000000000..169784d427
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
@@ -0,0 +1,29 @@
+From 23a122eddaa28165a6c219000adcc31ff9a8a698 Mon Sep 17 00:00:00 2001
+From: "zhang.jiujiu" <282627424@qq.com>
+Date: Tue, 7 Dec 2021 22:37:02 +0800
+Subject: [PATCH] fix memory leaks
+
+Upstream-Status: Backport [https://github.com/openEuler-BaseService/yajl/commit/23a122eddaa28165a6c219000adcc31ff9a8a698]
+CVE: CVE-2023-33460
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/yajl_tree.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/yajl_tree.c b/src/yajl_tree.c
+index 3d357a3..a71167e 100644
+--- a/src/yajl_tree.c
++++ b/src/yajl_tree.c
+@@ -445,6 +445,9 @@ yajl_val yajl_tree_parse (const char *input,
+              YA_FREE(&(handle->alloc), internal_err_str);
+         }
+         yajl_free (handle);
++	//If the requested memory is not released in time, it will cause memory leakage
++	if(ctx.root)
++	     yajl_tree_free(ctx.root);
+         return NULL;
+     }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index cf8dbb183e..697f54d9fb 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -8,7 +8,9 @@ HOMEPAGE = "http://lloyd.github.com/yajl/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
 
-SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https"
+SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
+           file://CVE-2023-33460.patch \
+          "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


