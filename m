Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ACAC77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 00:44:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.21358.1685234637870754211
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 17:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RIdD6XYS;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b01d7b3ee8so10274165ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 17:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685234637; x=1687826637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5X3t5eMbbbT72cBeCxK3nFGzfSwjCZzzhcfbrixGqI=;
        b=RIdD6XYS5oH7FQYO5M+pd1AhAvSmRrnX/2bYvn/HcWSR4KrZEBWVTpnqYn0ao457lw
         H3IH4A04EYZf0cJXcA0IuLYDK9/KR5flfRuna/BdJJr8wZSuZnKUqe5kn0rNGxMPTDHB
         F17Umpav2655oT0KVZB6drLOVfuQtrE9JP39iVYqXan0iWvNk1rM2w2zzdAufjDUUznS
         UohvtQm7WT/JEU+MX9ol/AWZ5EaKnfUlY9xduGLXmtEdwy1YuvwSUdmHRjTTuDw2eskB
         885dY4mb1M1NQ/lKfKa7xxUwdoN2fmWfhQ6pRE2vBg5tCdM9R7EwpSLcmNjBKeo+10N8
         R4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685234637; x=1687826637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5X3t5eMbbbT72cBeCxK3nFGzfSwjCZzzhcfbrixGqI=;
        b=WzaX5ltuGGD77NGiQ2YYcJkLxLSuqL1G/QO1txUrHaIJzuRs7ZLBMbVDAkUHh8manC
         NuUq6HhJK3gOT8KxB0G/jsow09E1esQJU0UF2VlIDIw3fbp/WPvv3a+6TjV6xXrDLi1R
         vpUvZYqNB+ZhYuae62xbaXOfHefsg7psfHISPK1JMZZ5T/Ey75+c4a6KlILyF9hcizyT
         BhA+Eu1IAGMvERrtMrYJdHSEdAV1HI1sbYAKSWhUqmrWE+SvrlwIELdkabFkB0J7oaGz
         +Pmy7/hYoLTGFKsJQ6TaCpa+H2uaouP2tNFWkEVbHwAjIN4/r09vpamn2sCw2JD0PnsV
         VhGQ==
X-Gm-Message-State: AC+VfDzANybqZ7mXQMu/ck5XC+rb97PsRwT8mo34LMHDPHwZgzIzP8aK
	PgphPw6yOxrXgyo/66+RlmbPgvmqyzs=
X-Google-Smtp-Source: ACHHUZ6mmgUfCCinLH7oXr7AzEvdne8WrFimn3+MYu6bZySrwH8HqM6ugSM6PEjhlVduUgCOYYogjw==
X-Received: by 2002:a17:902:d2d0:b0:1af:b678:5168 with SMTP id n16-20020a170902d2d000b001afb6785168mr9467437plc.67.1685234636838;
        Sat, 27 May 2023 17:43:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027d8b00b001ac7c6fd12asm5415735plm.104.2023.05.27.17.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/3] gnome-online-accounts: Replace filename with basename
Date: Sat, 27 May 2023 17:43:52 -0700
Message-Id: <20230528004354.1655629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 00:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102884

Fixes

WARNING: gnome-online-accounts-3.48.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gnome-online-accounts/3.48.0-r0/src/goaidentity/goaidentityenumtypes.h in package gnome-online-accounts-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-filename-with-basename.patch | 104 ++++++++++++++++++
 .../gnome-online-accounts_3.48.0.bb           |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-Replace-filename-with-basename.patch

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-Replace-filename-with-basename.patch
new file mode 100644
index 0000000000..9bb1d6bb59
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-Replace-filename-with-basename.patch
@@ -0,0 +1,104 @@
+From c4a2951f8a75c4151f009e42b26639e4f456d5a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 May 2023 14:41:28 -0700
+Subject: [PATCH] Replace filename with basename
+
+This avoids emitting absolute paths into generated sourcecode, it
+improves reproducibility. See [1]
+
+[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/merge_requests/125]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/goa/goaenumtypes.c.template               | 2 +-
+ src/goa/goaenumtypes.h.template               | 2 +-
+ src/goabackend/goabackendenumtypes.c.template | 2 +-
+ src/goabackend/goabackendenumtypes.h.template | 2 +-
+ src/goaidentity/goaidentityenumtypes.c.in     | 4 ++--
+ src/goaidentity/goaidentityenumtypes.h.in     | 2 +-
+ 6 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/goa/goaenumtypes.c.template b/src/goa/goaenumtypes.c.template
+index 3150fa71..c2bc4b0a 100644
+--- a/src/goa/goaenumtypes.c.template
++++ b/src/goa/goaenumtypes.c.template
+@@ -5,7 +5,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/src/goa/goaenumtypes.h.template b/src/goa/goaenumtypes.h.template
+index 040428c3..14548cb4 100644
+--- a/src/goa/goaenumtypes.h.template
++++ b/src/goa/goaenumtypes.h.template
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/src/goabackend/goabackendenumtypes.c.template b/src/goabackend/goabackendenumtypes.c.template
+index 6d2651da..05156bdd 100644
+--- a/src/goabackend/goabackendenumtypes.c.template
++++ b/src/goabackend/goabackendenumtypes.c.template
+@@ -5,7 +5,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/src/goabackend/goabackendenumtypes.h.template b/src/goabackend/goabackendenumtypes.h.template
+index 7321076e..51ce84bd 100644
+--- a/src/goabackend/goabackendenumtypes.h.template
++++ b/src/goabackend/goabackendenumtypes.h.template
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/src/goaidentity/goaidentityenumtypes.c.in b/src/goaidentity/goaidentityenumtypes.c.in
+index c0286907..8aad7ae4 100644
+--- a/src/goaidentity/goaidentityenumtypes.c.in
++++ b/src/goaidentity/goaidentityenumtypes.c.in
+@@ -5,8 +5,8 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/src/goaidentity/goaidentityenumtypes.h.in b/src/goaidentity/goaidentityenumtypes.h.in
+index 35d4d5c5..8719282a 100644
+--- a/src/goaidentity/goaidentityenumtypes.h.in
++++ b/src/goaidentity/goaidentityenumtypes.h.in
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index 948a738881..ca78fa0119 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -8,6 +8,7 @@ inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_c
 
 DEPENDS = "gdk-pixbuf dbus glib-2.0"
 
+SRC_URI += "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] = "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a98d45d266175bf"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud lastfm google windows_live"
-- 
2.40.1


