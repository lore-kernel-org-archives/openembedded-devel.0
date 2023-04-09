Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40826C77B61
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 14:53:34 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.21798.1681052009045598227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 07:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=peos7LV0;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 72so2622562ybe.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681052008; x=1683644008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SM7qrnhaADP+vnejAgne1GOV4dgGsic6JewLGC3X/FI=;
        b=peos7LV0rezFn3lEGqjVJFoyn51SxF1Ahcz3tIrPdhcuiUuAu/kZV+YeXEBL473x0l
         aNNZjVlbHEuftieGyhW493OFPFIy//ldHgaAXTn+BvdOt75Jw1/bclItQLL6SulDWaEW
         7zCX08v5IjT2fLuZaSzmsTm4mRHNjcOUufkP2QcjFccczUPkjIi38gD6B4KBBn7m/lsZ
         RwgfRwTWJ20AspAuVCoko+ewAB1PYBTn9KG9Zj9nRIAcBxfXuS1Wls9fF4LhLwAOxiTk
         F23ukbnK73vLZtI5WcpGljDZhMr1cIrWw4TWMyJWs2dkq55B0roiz3tyfdZU6ykOra4h
         qAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681052008; x=1683644008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SM7qrnhaADP+vnejAgne1GOV4dgGsic6JewLGC3X/FI=;
        b=vZj5ltmAtClEl5djmvjdAE+pmqu6Tdae2K4PAM5WQmoxbGHmMo2bI2Vrzk/cUjxEf4
         TJV74XSRDQzniVyiVmMoJ809QfF/youvFQhhK92a806B/HXoS/6Xl19vFr0s8RTn/E4D
         ZGA7aLgVoiz8CVBGK0pe7+KmAS9H/nH08PPvmnQHiufIwcXu7w7ttBgCfPIzV/bPsfKe
         FL6NuYaZAq5FkHO8k80TCzyUJfN+u/zv5jgC85fT8ogIvR8wsZNxMBNEtOfMWUhfTg7C
         GXYFDVGUWQnIk5G+b+AMDtqu4lXvOML00IYk3SIJeHwsj2vnILMWu9B8I9lMAj/HB7RC
         oJTQ==
X-Gm-Message-State: AAQBX9d5kr6ZONwYHmp2vpuGnRLKvUq7LYT8V6e8GtZc1ctnuKC0+cKO
	dSpvrTxiZLDtTuzBj8gYmoXFzNAFNNnGxg==
X-Google-Smtp-Source: AKy350YT+VYAHFIa9PA/vEBjeLq93oTJO7OgN05a2d/+gMRuSS1zv1cM2ysoipm20J3e6mkWRTzBiQ==
X-Received: by 2002:a25:a048:0:b0:b8d:ebd0:e390 with SMTP id x66-20020a25a048000000b00b8debd0e390mr5112624ybh.22.1681052007886;
        Sun, 09 Apr 2023 07:53:27 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:47d6:87b6:cfbc:dcc5])
        by smtp.gmail.com with ESMTPSA id k6-20020a25bec6000000b00b8bfb4c4f1esm2041801ybm.62.2023.04.09.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 07:53:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] meta-openemnedded: Add myself as mickledore maintainer
Date: Sun,  9 Apr 2023 10:53:26 -0400
Message-Id: <20230409145326.3758691-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 14:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101998

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README                      |  2 +-
 meta-filesystems/README     | 10 +++++-----
 meta-gnome/README           | 10 +++++-----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 10 +++++-----
 meta-networking/MAINTAINERS | 15 +++------------
 meta-networking/README      |  9 ++++-----
 meta-oe/README              |  8 ++++----
 meta-perl/README            | 11 +++++------
 meta-python/README          | 12 +++++-------
 meta-webserver/README       | 11 +++++++----
 meta-xfce/README            | 11 +++++------
 12 files changed, 53 insertions(+), 64 deletions(-)

diff --git a/README b/README
index 7318f09cdb..82f2e9699a 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+Main layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index 78a4429ce2..4cee9dfa00 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: mickledore
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: mickledore
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][mickledore]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][mickledore][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README b/meta-gnome/README
index fbb0d72476..418f9ec7b4 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -3,14 +3,14 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: mickledore
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: mickledore
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][mickledore]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][mickledore][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 119293a741..a2279865fe 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,19 +12,19 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: mickledore
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][mickledore]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][mickledore][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 235c34331b..28dbaf23c6 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: mickledore
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: mickledore
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][mickledore]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][mickledore][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index ce53ec471b..4fd0cc3ff6 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][mickledore]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-networking][PATCH'
+        --subject-prefix='meta-networking][mickledore][PATCH'
 
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
diff --git a/meta-networking/README b/meta-networking/README
index 34e11a96dd..10884746a7 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,22 +18,21 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: mickledore
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: mickledore
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
-branch: master
+branch: mickledore
 
 Maintenance
 -----------
-Layer maintainers: Khem Raj <raj.khem@gmail.com>
-                   Armin Kuster <akuster808@gmail.com> (recipes-netkit)
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-oe/README b/meta-oe/README
index 676a2c8925..4826efe717 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: mickledore 
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][mickledore]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][mickledore][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -28,4 +28,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 13014b0ff3..16631503b7 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: mickledore 
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][mickledore]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][mickledore][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
+    
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 36c193957c..768c94a673 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -13,11 +13,11 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: mickledore
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: mickledore
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][mickledore]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][mickledore][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index d23f6cc65c..27329fd35b 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,13 +13,13 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: mickledore
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: mickledore
 
 
 
@@ -50,9 +50,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][mickledore]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please using something like:
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][mickledore][PATCH'
+
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 3d6158628f..e4fc10b3b2 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: mickledore
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: mickledore
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][mickledore]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][mickledore][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.25.1


