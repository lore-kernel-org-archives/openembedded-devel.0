Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F2EC5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:45:50 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.102279.1709567142879302757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j41MinIL;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5336870276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709567142; x=1710171942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kc1h+hX5mSTWPh6iTNjsSlVnBib8X41ye6Dr3oA45Yg=;
        b=j41MinILHZx7AxR/as1aZKd8dxZQFTffjW+dyPaXkKW1mLdhob3jyuG44b4wv62CbF
         a7Hlhivt0/BdlZoQsVCTWPXaMU1ETKvLGQ6IPHgT1tfIZXMD7qtKumVFI42fSiu1D5gs
         mzGVjLBoMfprijI0YrjD95RwV08Ym0MFth0/6+jTw7wzZO/JfaMZgm8cpGnAxsqj7o0d
         NMncLOVUsm5dMAUHSfZELf6SXE6Hgie1bdX4cCtby0NRWjgr04GwZtOg1NgQbfZZAreF
         BKvydd5nXMLvozkUfyQLK6wvzSRZ9morj9t/HDkxzqoAS1gpjDFuDAr15waxdk4kdo+E
         Du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709567142; x=1710171942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kc1h+hX5mSTWPh6iTNjsSlVnBib8X41ye6Dr3oA45Yg=;
        b=quWWSTdLPQ+yAyShi0mzC1Y9So3mMwogW+hQDdd3rwMaGO4sWIs5Fdi8TWx5Cfo+uJ
         eSMqqAF+FeqLbonzyQhM3SvdOyEKrwJ5LQo8cQxxNYsHNZtm4HKv2CZlqsmx4X4IGhV2
         WJtm9OAyAXFZwYjvJAEpUAr57blzwuOM8gYLh+w0cEh8g58UDgQUSEnXAm/54RSB7VMM
         AvgEiDdstpEqd3+XiOZZhGND/ZyKCg2OynqxVFr3L17tkEWrhSSIPYY2bVNemBhgtuC8
         9xGTmuxE2NpTiSwAcNb7OKInBsnXIfl3vdbu+gWY9BZ3N+zdhZZzGKAWWbQb28otGjxf
         E9Jg==
X-Gm-Message-State: AOJu0Yxg8u/+itZB+BRHqC6M56pS8MXYFnzjikUwiGwvzZomJGF9077j
	ZfXq8Fze8v0yHbvZFVxDshMc+BDXpa4+M+VK+vmkso7tlJhGuDEQHZeiWChi
X-Google-Smtp-Source: AGHT+IGhqBY5CMUSLMIlzC/30R6Bd7N1Aogj7i8Df+cPC2HKqTl/FZGka9ViV2MWdy7fRimTBSFvag==
X-Received: by 2002:a05:6902:2492:b0:dcb:b072:82d8 with SMTP id ds18-20020a056902249200b00dcbb07282d8mr10539963ybb.15.1709567141527;
        Mon, 04 Mar 2024 07:45:41 -0800 (PST)
Received: from keaua.mvista.com ([2600:1700:45dd:7000:cf4c:8faf:cac1:62f9])
        by smtp.gmail.com with ESMTPSA id v43-20020a25abae000000b00dcdb3dffa3dsm2302506ybi.39.2024.03.04.07.45.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:45:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] meta-openemnedded: Add myself as scarthgap maintainer
Date: Mon,  4 Mar 2024 10:45:40 -0500
Message-Id: <20240304154540.747063-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 15:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109098

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README.md                   |  2 +-
 meta-filesystems/README.md  | 10 +++++-----
 meta-gnome/README.md        | 10 +++++-----
 meta-initramfs/README.md    |  8 ++++----
 meta-multimedia/README.md   | 10 +++++-----
 meta-networking/MAINTAINERS | 11 +++--------
 meta-networking/README.md   |  8 ++++----
 meta-oe/README.md           |  8 ++++----
 meta-perl/README.md         | 11 +++++------
 meta-python/README.md       | 12 +++++-------
 meta-webserver/README.md    | 11 +++++++----
 meta-xfce/README.md         | 11 +++++------
 12 files changed, 53 insertions(+), 59 deletions(-)

diff --git a/README.md b/README.md
index 7318f09cdb..82f2e9699a 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+Main layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index 78a4429ce2..bf48806035 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: scarthgap
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: scarthgap
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][scarthgap]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][scarthgap][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index fbb0d72476..2125c36df3 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -3,14 +3,14 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][scarthgap]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][scarthgap][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 119293a741..da7acfca62 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -12,19 +12,19 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][scarthgap]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][scarthgap][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index 235c34331b..66c139ac9c 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: scarthgap
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][scarthgap]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][scarthgap][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index dc549d7582..a424ab9cdd 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][scarthgap]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-networking][PATCH'
+        --subject-prefix='meta-networking][scarthgap][PATCH'
 
 You may also contact the maintainers directly.
 
@@ -26,14 +26,9 @@ Please keep this list in alphabetical order.
 Maintainers List (try to look for most precise areas first)
 
 COMMON
-M:      Khem Raj <raj.khem@gmail.com>
-M:      "Joe MacDonald (backup)" <joe@deserted.net>
+M:      Armin Kuster <akuster808@gmail.com>
 L:      openembedded-devel@lists.openembedded.org
 Q:      https://patchwork.openembedded.org/project/oe/
 S:      Maintained
 F:      conf
 F:      recipes-*
-
-OPENTHREAD
-M:      Stefan Schmidt <stefan@datenfreihafen.org>
-F:      recipes-connectivity/openthread/
diff --git a/meta-networking/README.md b/meta-networking/README.md
index ab2640618f..ef7933e319 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -18,21 +18,21 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: Scarthgap
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: Scarthgap
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
-branch: master
+branch: Scarthgap
 
 Maintenance
 -----------
-Layer maintainers: Khem Raj <raj.khem@gmail.com>
+Stable Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-oe/README.md b/meta-oe/README.md
index 676a2c8925..9bc68a86c7 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: scarthgap 
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][scarthgap]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][scarthgap][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -28,4 +28,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 13014b0ff3..4ad9915146 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: scarthgap 
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][scarthgap]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][scarthgap][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
+    
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..b29ccf3453 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -13,11 +13,11 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: scarthgap
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: scarthgap
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][scarthgap]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][scarthgap][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d1b743887c..caa70acdef 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -13,13 +13,13 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: scarthgap
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: scarthgap
 
 
 
@@ -50,9 +50,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][scarthgap]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please using something like:
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][scarthgap][PATCH'
+
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 3d6158628f..92c2e65584 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: scarthgap
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: scarthgap
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][scarthgap]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][scarthgap][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.34.1


