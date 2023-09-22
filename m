Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F4E7D0BC
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 01:00:40 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.12034.1695344435128984132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 18:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXPUc41X;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d81b803b09aso1908757276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 18:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695344434; x=1695949234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwMkeUryM7DmbDhC1hSBrUnRCOhzC6t3HG5ZXGMBv+Y=;
        b=nXPUc41XnfdmqqTLDNGPzkeuSiPaED4yeJWZKKvesRiCHORmbMP5LacBTcp/VlMprv
         gRj5WBTff/kQyEN/Azn6Bmwqt0SKWFD/uvZcczQOvjJutRTVoF0Kq1vhn7mejSbDccuN
         rJVK+Yxwmhv+cSxjMXxtB2iYRJRRirckxrPlYoFzgqTSoWpPOMhklqwoG7Z7Vtc6nbGA
         +5gNQWnViTYW7UAHlcdDlMT5PEJU42WCZMrahnL9y2oEsyeafB/YAE/3hSCgQLL/t6HA
         dFPbrdwpzG2dGy+Bh5vO9LSTqk1NE5Yk2vDjFKonay8If1zNxViIiOrQNwvTpWfWHc5x
         Yt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695344434; x=1695949234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwMkeUryM7DmbDhC1hSBrUnRCOhzC6t3HG5ZXGMBv+Y=;
        b=wx4jDygqSU8kFTB1Ior4ucxBjqKNeapFMvXJeL5vyL6PJA5RLeBGFH0UJPf5LKlnux
         V9knkThn7/XavR8LrpOQ8ajrbC55zlTcxgOSIxqhttRBnnZZ+YNMdUxhWqC1xyeQKhEE
         XMZzR9GvbhLv+8Av/o70qzwlKXM+ARM4X15PGFYF0CXy7dUU7mvPUtIAKtJ0+9FcAmVv
         bVk6UD3VXahj8MQa4daFBctQbUgZUCTu4H0L6VLfa5XyRCtAwya57JFRa3hXAw5j5tO3
         sIId/CmkxrY+M7W3SG/oy+7XnMDmQ7pLv3+4jiv884nt83EmERVorN6EYf3CAzlg0evi
         /6Rg==
X-Gm-Message-State: AOJu0YxorzpQ+OwgfaGbxbjfJviWDEpA1P0OJbVYBFjCijQ6fEDyX0cH
	3wpK+MNKSf9aQviYWC+SlMNvJBegJ+w=
X-Google-Smtp-Source: AGHT+IEbwJXsMZ+uUz7EFNQOMhXxC8QbzPi8bOWipaRVi4W5b/QZap20aCWpmnsfPiKUjq5traKrvQ==
X-Received: by 2002:a25:ad8d:0:b0:d77:f518:ff59 with SMTP id z13-20020a25ad8d000000b00d77f518ff59mr8127351ybi.11.1695344433831;
        Thu, 21 Sep 2023 18:00:33 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:15b9:8178:ac:c972])
        by smtp.gmail.com with ESMTPSA id x71-20020a25e04a000000b00d8144f0b287sm613464ybg.63.2023.09.21.18.00.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:00:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][nambield][PATCH] meta-openemnedded: Add myself as nanbield maintainer
Date: Thu, 21 Sep 2023 21:00:33 -0400
Message-Id: <20230922010033.725776-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 01:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105044

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README.md                   |  2 +-
 meta-filesystems/README.md  | 10 +++++-----
 meta-gnome/README.md        | 10 +++++-----
 meta-initramfs/README.md    |  8 ++++----
 meta-multimedia/README.md   | 10 +++++-----
 meta-networking/MAINTAINERS | 15 +++------------
 meta-networking/README.md   |  9 ++++-----
 meta-oe/README.md           |  8 ++++----
 meta-perl/README.md         | 11 +++++------
 meta-python/README.md       | 12 +++++-------
 meta-webserver/README.md    | 11 +++++++----
 meta-xfce/README.md         | 11 +++++------
 12 files changed, 53 insertions(+), 64 deletions(-)

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
index 78a4429ce2..49ce350571 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: nanbield
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: nanbield
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][nanbield]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][nanbield][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index fbb0d72476..ef202bca17 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -3,14 +3,14 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: nanbield
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: nanbield
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][nanbield]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][nanbield][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 119293a741..07704abc6d 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -12,19 +12,19 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: nanbield
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][nanbield]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][nanbield][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index 235c34331b..70d46afc82 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: nanbield
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: nanbield
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][nanbield]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][nanbield][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index ce53ec471b..42d5e90277 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][nanbield]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-networking][PATCH'
+        --subject-prefix='meta-networking][nanbield][PATCH'
 
 You may also contact the maintainers directly.
 
@@ -26,18 +26,9 @@ Please keep this list in alphabetical order.
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
-NETKIT
-M:      Armin Kuster <akuster808@gmail.com>
-F:      recipes-netkit
-
-OPENTHREAD
-M:      Stefan Schmidt <stefan@datenfreihafen.org>
-F:      recipes-connectivity/openthread/
diff --git a/meta-networking/README.md b/meta-networking/README.md
index 34e11a96dd..e4d616e3a8 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -18,22 +18,21 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: nanbield
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: nanbield
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
-branch: master
+branch: nanbield
 
 Maintenance
 -----------
-Layer maintainers: Khem Raj <raj.khem@gmail.com>
-                   Armin Kuster <akuster808@gmail.com> (recipes-netkit)
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-oe/README.md b/meta-oe/README.md
index 676a2c8925..ec551ef3f8 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: nanbield 
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][nanbield]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][nanbield][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -28,4 +28,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 13014b0ff3..756de02884 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: nanbield 
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][nanbield]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][nanbield][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
+    
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..6118f2c40a 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -13,11 +13,11 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: nanbield
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: nanbield
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][nanbield]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][nanbield][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d23f6cc65c..9c4854a3e2 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -13,13 +13,13 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: nanbield
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: nanbield
 
 
 
@@ -50,9 +50,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][nanbield]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please using something like:
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][nanbield][PATCH'
+
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 3d6158628f..cd65970a59 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: nanbield
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: nanbield
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][nanbield]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][nanbield][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.34.1


