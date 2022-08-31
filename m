Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA5ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 05:41:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.22020.1661924507819855377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=biJHjOB8;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id m2so13182719pls.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UhDTUHWm0LB1+G8X5S8xb3EqtKUh0+ygIR+LBDRWSCo=;
        b=biJHjOB8xyqs3dz2RQZxmCwwc5WFYAySdN7hfG5cYbzuppdq+torfTTxwcXB4R8qfX
         im0iXcgZKBDILK2ReTJQZGwnGg3mGbd0/ltrT4IQtlWUdDF5Gz84HvWUJkihKM2mASsh
         0FJE8b2bfc+/+NUsH2Xl6kIhpzH1u5T49pm0OvyJC646TGXnitHgWMYaSDK2iAnTahGF
         ouQ59ifPicHBpbnfxwba5D4uoUYrVpoGng+I9xFioxTFIjZkBew+N+t5B+PiokLpQ2/l
         840Mm9NnkE8zXah1Gxl69IFuGfR/HzHZXP4XrgST0I9flCIeUeim0zEycduwIUoq7mBf
         rtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UhDTUHWm0LB1+G8X5S8xb3EqtKUh0+ygIR+LBDRWSCo=;
        b=Gl/QiilEO0QO8ooYvylHJ/7c3+B1vk84wcynnkfUzXMqd3Vp3dH4NjVMHGoR4McCsc
         UblUpmk/N7dq9KxJoOFWAIQmdNAOPLjQQcN+IRXcsRjOzdvnSzmJmQMJzMu2I50oDxqg
         UT32Te8XOnFprm1qYugUHuaxBAfe3UEsxcc49gW7fdE8ZKyB9vvoB7yLHTOyTRgSxRta
         doDldgmSONMO2HLAQK44moBDFSScJgw/2M7pf+OY0UVarqmoGMRFQtSfsXYFWQQ5+9q/
         eBcEz84z4EtS1UkwwnK/rvc6eqgv6Ci3MsZRoCJeEVkTGEYRIBZW6CEl8rYhBpvhxZ3g
         jqbQ==
X-Gm-Message-State: ACgBeo3Lb4WGxBbHQMAddGuncq47kolkr1byEFjbx1DZfCNGlEkqaaj2
	2cq1WOejlkwU6bbwY+AWeZQiJ8JEQICQVg==
X-Google-Smtp-Source: 
 AA6agR4WpR0BgVaG5/XAOf24s+TMLidMK0x6x2eeqCF4bVp9x2gPUUBh+KVB8d3kCHEwrERJHtcbrA==
X-Received: by 2002:a17:902:bd08:b0:16d:4230:cb45 with SMTP id
 p8-20020a170902bd0800b0016d4230cb45mr24312007pls.59.1661924507014;
        Tue, 30 Aug 2022 22:41:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001733c13cc81sm7275181plg.169.2022.08.30.22.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:41:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] geany-plugins: Fix type error found with clang
 15
Date: Tue, 30 Aug 2022 22:41:38 -0700
Message-Id: <20220831054139.3493726-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831054139.3493726-1-raj.khem@gmail.com>
References: <20220831054139.3493726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 05:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98573

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Use-0-instead-of-NULL-for-gboolean.patch | 34 +++++++++++++++++++
 .../geany/geany-plugins_1.38.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch
new file mode 100644
index 0000000000..bb03fa63de
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0001-scope-Use-0-instead-of-NULL-for-gboolean.patch
@@ -0,0 +1,34 @@
+From 9ee9388bc66e6cf68db96b2014dca2115f745dc9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 22:33:46 -0700
+Subject: [PATCH] scope: Use 0 instead of NULL for gboolean
+
+Fixes warnings with clang 15+
+
+scope/src/stack.c:168:11: error: incompatible pointer to integer conversion initializing 'gboolean' (aka 'int') with an expression of type 'void *' [-Wint-conversion]
+        gboolean entry = NULL;
+                 ^       ~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/geany/geany-plugins/pull/1191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scope/src/stack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scope/src/stack.c b/scope/src/stack.c
+index b03909fe..041dd415 100644
+--- a/scope/src/stack.c
++++ b/scope/src/stack.c
+@@ -165,7 +165,7 @@ void on_stack_follow(GArray *nodes)
+ gboolean stack_entry(void)
+ {
+ 	GtkTreeIter iter;
+-	gboolean entry = NULL;
++	gboolean entry = 0;
+ 
+ 	if (gtk_tree_selection_get_selected(selection, NULL, &iter))
+ 	{
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
index fa4cccca03..1ed2993bf0 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
     file://0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch \
     file://0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch \
+    file://0001-scope-Use-0-instead-of-NULL-for-gboolean.patch \
 "
 SRC_URI[sha256sum] = "1c578a7ebb390aa8882f195acd3d8da3ceb73925d291b28dec90cd3e5fd20586"
 
-- 
2.37.3


