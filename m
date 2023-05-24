Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E0C7EE43
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.3699.1684914786716675356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lDo+nEZz;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51144dddd4cso1175088a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914785; x=1687506785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuTOkLfz9OV/JgTGtdJfWh+U2/sg3wxip0paX06nS6A=;
        b=lDo+nEZzVOQrKujkJRyvlSRKhXQGD4TeNGELvAfnjmtFhBJh+FRuyLXzFF7Pyj31wF
         ktt5Y49RbZYkzur7X/3siGCUC+DOhUKFCDP1MBKUNnM2G1lFarb2SK1a4GwvEiPCHOJP
         /3QpzW91+BIKWyAGgOjyXHR/taZPglbHUmVU/k0PKiNTsoQBh+wzEOQmCh2mTPO//mXc
         ADVYi6gAe7Rd2jH0o6jwGbCN0PojYqvK3umaauIkeYpnG7o18eN465d3bSiT+PwADcWF
         r0dbfV54Q+0lfBCK5FGx7TmA4RjXa6pNSGMMD65+zKozjf3gXL/qNMah5pznSRQgsN/j
         nNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914785; x=1687506785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuTOkLfz9OV/JgTGtdJfWh+U2/sg3wxip0paX06nS6A=;
        b=MEL903edg5iNXffHllnt8AmvFSwRBAcsbOb7bGJeOBwL2yNEd9F8dE7xB19rYeAi2n
         WBvGn9tYBHDz+F7uwsfdzeBFn8CcTzOVAqdb/2r4YXNQ79/quoJc1QxrWzLlGSWIMzQr
         Y2b0GDIcgj9xOXPClvk7uyL/zQ7CqyBlKWc1KScgoC+iMLVyaORqmaNw+Lw9JjiDemxm
         55GP42EAnLoaUlFOHeIM4T3jvlwjaaqzzJuWOgJuik4PmyDhIleJjrhHF61PhqaOnOG6
         +QHsIlOJ2T5Eebi7hRZ9uRRzwv4plH71GfgoArkAHreoRjnXifPrnVyOrQzqNtY6l+TU
         JdDQ==
X-Gm-Message-State: AC+VfDyAZDRuJ/H9m8ANwfXHDc93/e/FFtVP5LTalnXbMAkeCYZfBhbS
	sr+wQCiknjz5+SkOMeDeFJLO4AmtA5E=
X-Google-Smtp-Source: ACHHUZ6w4N0p3mz+yQCP6K9menkOAnxpplQMcJJkDM56UvDvuLjzOLvUY38v30t/zSaItabpJXXw+A==
X-Received: by 2002:aa7:da82:0:b0:50b:c693:70af with SMTP id q2-20020aa7da82000000b0050bc69370afmr1231608eds.2.1684914784955;
        Wed, 24 May 2023 00:53:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id be5-20020a0564021a2500b0050dfd7de30dsm4785647edb.94.2023.05.24.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/20] gnome-terminal: remove unused patch file
Date: Wed, 24 May 2023 09:52:39 +0200
Message-Id: <20230524075253.1033593-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102760

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=ccde2b0bdcc1110c68dbdb06dff726b3c955aee9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-build-Fix-for-newer-meson.patch      | 46 -------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch
deleted file mode 100644
index 12520b177c..0000000000
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f88447850e162c8d514be367db574c6fa2fec2a5 Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@src.gnome.org>
-Date: Fri, 14 Jan 2022 11:33:32 +0100
-Subject: [PATCH] build: Fix for newer meson
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/meson.build | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index 79d97e5..e0bcbb9 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -18,7 +18,6 @@
- metainfodir = gt_datadir / 'metainfo'
- 
- i18n.merge_file(
--  gt_dns_name + '.metainfo.xml',
-   input: gt_dns_name + '.metainfo.xml.in',
-   output: '@BASENAME@',
-   po_dir: po_dir,
-@@ -27,7 +26,6 @@ i18n.merge_file(
- )
- 
- i18n.merge_file(
--  gt_dns_name + '.Nautilus.metainfo.xml',
-   input: gt_dns_name + '.Nautilus.metainfo.xml.in',
-   output: '@BASENAME@',
-   po_dir: po_dir,
-@@ -40,7 +38,6 @@ i18n.merge_file(
- desktopdatadir = gt_datadir / 'applications'
- 
- i18n.merge_file(
--  gt_dns_name + '.desktop',
-   input: gt_dns_name + '.desktop.in',
-   output: '@BASENAME@',
-   type: 'desktop',
-@@ -57,4 +54,4 @@ meson.add_install_script(
- 
- # Subdirs
- 
--subdir('icons')
-\ No newline at end of file
-+subdir('icons')
-- 
2.40.1


