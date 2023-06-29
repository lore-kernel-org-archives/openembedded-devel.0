Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44750EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 11:35:45 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5959.1688038533904929536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jun 2023 04:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=hd5DYek5;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso403449a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688038533; x=1690630533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mml4UtJ7eYc4utWWIWVFS8VQNk4r4cb0GUEy+6g++fQ=;
        b=hd5DYek5cpRhlXw5TTWR0VcDMVRkYXIy9KvJXsPoTcc/fhJSM96l0iMnfjaXmIJB3h
         G2kH6pVlLTK9OfHhAaZvv30LMqHxz0Dl9IisZVuRp0xDQBUn5DJTy8+gTyemDEz91oTh
         WUFpJDbXe8h/BqZWbR1SfMgoS3pAmhB7RUTCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688038533; x=1690630533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mml4UtJ7eYc4utWWIWVFS8VQNk4r4cb0GUEy+6g++fQ=;
        b=I6COaV+RFzG4W8oSVKnmjL2g4UHcgUQzKvwAF5H4as6aEf4alBhOp6DTovHwypxhg+
         Dp0WCMRJT3DcbKRc0rqb2Muid+qms764le+8v5R53tQa6Kbl4ybP1wkDTnXqU7R2VI1t
         AYt0gBsy+NsK+OeHTknjMdqwhQ3Vo+BBoKR3pOED1PGmOhMggfqhtYggDFwtHo2HqEeX
         yCzDDdQZyNcp1qgludA+nwfp6yh4aWUXgH7wHfOspRFl5SSES5V9B1eG8qI0x2y4onPa
         jphmkLJTcdtNI2fNACbyvSRkxI1SBhfJyK1domRdSDAvTRVtV+0TWM680Vr3zP8RmjFH
         eSlw==
X-Gm-Message-State: AC+VfDyx6T7c8abBluyMhXBySJXOtfBcEyN3sbtzGf8xAShq97aBX6ws
	BNvvrngWJW3ZAHR7I0FB2oighyjbnAZuSfs/TdE=
X-Google-Smtp-Source: ACHHUZ5x+eo0riX9rPQgZ7tG4vlE/J+OtEwdM9nnzfmDYuEQlPo7brdFFcTIq1fTymSoejOuzc7Oig==
X-Received: by 2002:a17:902:7402:b0:1b2:28ca:d16 with SMTP id g2-20020a170902740200b001b228ca0d16mr13860206pll.44.1688038532900;
        Thu, 29 Jun 2023 04:35:32 -0700 (PDT)
Received: from MVIN00024 ([49.34.128.123])
        by smtp.gmail.com with ESMTPSA id y9-20020a170902ed4900b001b83dc8649dsm2538264plb.250.2023.06.29.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:35:32 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 29 Jun 2023 17:03:14 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] yajl: CVE-2023-33460 memory leak in yajl_tree_parse function
Date: Thu, 29 Jun 2023 17:03:08 +0530
Message-Id: <20230629113308.59754-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 11:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103639

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


