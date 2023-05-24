Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6627DC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 16:30:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1716.1684945800871563529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 09:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SFL3ip2a;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso853546b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684945800; x=1687537800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MVPNuCjWqt8pMCTe708MXY/kkeMKVTj5Gm2Yh4GCgM=;
        b=SFL3ip2a9necIPdLvSYU1zd6xAQJi73PooToUJFtXF6UawJyi+lkGTzEn3D/1iTGeK
         og9KRegsUPjJIdEIpQiFxYh1F7LvCy9NgWM6aeVOFajDDNxKqcugle2qhpZcw/SUGHWE
         yaAs/yxXhpasBmVCoBx9eE3VbHP4jvF3bynmJHhyD6ceEG+0LG8FeEoQzuwMBiQwBvc2
         dEqDXafvLeKGN0ktV9lLpvZBTNCTHmAak+sq47AwnXATkM67owV3bC3Bm8QbsJ/+tENw
         S/PwX3ZuhDFZSciKNHNQAKMhE7LvUm6QBJo94U6+DOqxBMX9ulAGpQ2MyQRb/6L6rSNc
         1geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684945800; x=1687537800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MVPNuCjWqt8pMCTe708MXY/kkeMKVTj5Gm2Yh4GCgM=;
        b=I/YX7X89Kp9Xu01INPGBTHiYP/2TmwWQ2A/aV8DoD4xqZDcNpOAJ6edyNU+kPm2Ozy
         AmeT7xqdAFdxj9SghoG/Sdaq0/dexyy2ozgyPFeETbSv1OjnqYJPRFWkpMTP9Da+FYru
         jdiFPSKFBPajGcPGcMgmwB3MMp+yi3+PNYGyMp/lisFPoTnn3xtFBbTiElthcBU2z1Ub
         XbT9+9svlNW+Ea5CjMCwnIHfFgBt0fSaHqqihytIJnCK8THgoFxjnuDW2GuqVrC6UcVm
         XTYU2Z+bp25FZxSexCin7T1fYhge+0N/VifBoneLFh9SuPK9pC3QsFMX6/ellAr1zIxw
         ddTw==
X-Gm-Message-State: AC+VfDwvpnZB3qZKHjLmhPsIfYkH0iUnlXvNGFVclN03wXZHa2tDouu8
	Hy/6PIjbweUSG+KB9//6lqhFaVYRBA0=
X-Google-Smtp-Source: ACHHUZ7tw347OpS31YmBmG7wOGnpiNceisSD3L5EGA7uNoBw9MQ0MbQIHA7ZFSiiFjVGN26hbob3NA==
X-Received: by 2002:a05:6a20:728a:b0:10b:9527:7127 with SMTP id o10-20020a056a20728a00b0010b95277127mr11614034pzk.20.1684945799779;
        Wed, 24 May 2023 09:29:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id w5-20020a63c105000000b0053ba9ddbb62sm4754067pgf.91.2023.05.24.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:29:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] nautilus: Fix buildpath QA errors
Date: Wed, 24 May 2023 09:29:57 -0700
Message-Id: <20230524162957.966829-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102783

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-filename-with-basename.patch | 46 +++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_44.1.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch
new file mode 100644
index 0000000000..dbf42a9ab9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-with-basename.patch
@@ -0,0 +1,46 @@
+From 4ec1f99f170033138036d6547dce9b7dcf541338 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 07:56:33 -0700
+Subject: [PATCH] Replace filename with basename
+
+This avoids emitting absolute paths into generated sourcecode, it
+improves reproducibility. See [1]
+
+[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/1211]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nautilus-enum-types.c.template | 2 +-
+ src/nautilus-enum-types.h.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/nautilus-enum-types.c.template b/src/nautilus-enum-types.c.template
+index 9d8ac83..a757949 100644
+--- a/src/nautilus-enum-types.c.template
++++ b/src/nautilus-enum-types.c.template
+@@ -4,7 +4,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* Enumerations from "@filename@" */
++/* Enumerations from "@basename@" */
+ #include "@filename@"
+ 
+ /*** END file-production ***/
+diff --git a/src/nautilus-enum-types.h.template b/src/nautilus-enum-types.h.template
+index 399bbca..7eb6c54 100644
+--- a/src/nautilus-enum-types.h.template
++++ b/src/nautilus-enum-types.h.template
+@@ -8,7 +8,7 @@ G_BEGIN_DECLS
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* Enumerations from "@filename@" */
++/* Enumerations from "@basename@" */
+ 
+ /*** END file-production ***/
+ 
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
index 9c60d15d86..f7eeb5f5d0 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
@@ -26,6 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+SRC_URI += "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] = "360802a595e3edbad962c8cea353b62baa8be407513b5162c89c933ca5387aa9"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.40.1


