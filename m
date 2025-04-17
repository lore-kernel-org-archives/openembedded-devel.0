Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB83C369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 01:05:18 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.35744.1744851913856254324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 18:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0yuuJSx;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6dea30465aso239507276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744851913; x=1745456713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf/nj+QsM/lXjg9aRCZgTzH31Y86uLupZaUG+cnH7wQ=;
        b=m0yuuJSxMoKRoUZVkOXDJDIJJq0WY5zs6PF9CyiIILpAzkb4NcSMpdS5Koyt2rq1ih
         2U9xtXW54nuzWacdxmIQnHoX1J0QsOnf5+IHrS58dT0b3Bckix3mDDDYP6IVj9X9fZpw
         7gsDlW7uT4rkb13/yZs+QQIjfZpMutH3RPbQvfCvwL3lzBeGG4LxQFKTEAbI3N3MQOPQ
         AOOq74yCw1nzst292LG39250DF9E1DaYRGoBDZe31H8IH950XHohngtxYG3aOemWKSED
         sD+giqW+Yx8Oej4SmPmHrEtZbzGJn2Kss6QmmqvQrtkcCRoMN7s9qOZJ+peax4J7DAY6
         z0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744851913; x=1745456713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf/nj+QsM/lXjg9aRCZgTzH31Y86uLupZaUG+cnH7wQ=;
        b=JaP2vIFLDPNtfdzE/b++c3bVbuEQNOKm/z0IlTG87t7IBq72DuwIjrgxwUxlxzN3e2
         MS1yp6stEwtzb2PM9v/czRGvqHCmcvZgXDnphxOvHct/n+h7B2/K9bmCPpDAjoFAFTdt
         dM1Sw8gTnGDfzpUgamv+nDEn6CyIOKUm+vY+xLsIz52d+FVcX8ckx0jELKgq6I9Mnce+
         enfdB1azm6TQPcqgGhSNdEMFDqDezuhMld7taKO3sjogPT0L2jn2NlTqOfrltIHvzn4G
         9XClzvQg43clz24Be5HnMI21WnZO36FkxfSJH9RxAK+5pK+Rlv5H5FHARWdkmBMKvV0o
         5F2A==
X-Gm-Message-State: AOJu0YysvyZg2HsLaEyVxj4d047jGtIEc2IzNeDTC6ynGklXPX61mPPe
	mfGg8cDwCWQ5UxOTzXT3AQkt6m/vU3FI5Y/UJnDavHoXxKNqOjoMhASBLXfE
X-Gm-Gg: ASbGncsb5qciCpgpoAUkt7IygXfJubLgkrI7EWkXKXA3PsdqwzJaEHRPxXUbPFEH2f4
	f3GVVMUWwOdTG/00msjAPAe7n8jCyLQYxzt+bpO0nQI0kuWicln7b7S7GN8LKyUjZQAreHdGm5l
	1w+dzLeVYSUOoNKWqfWWQvUrU0JHunU6WY/omZw0RzCuBA34NWCE83igaLK/BJ99DPJHJqz3nFq
	6GiHbwludk+YYGY0tEfbMPG1kX141NMYYbvhuIegnwRiQTLBO4gZ2a4dwMpWIFUILBL7roi4zHB
	/nyg2DNrdG1m471Vv66a9KsMa8wRdXSqJH/st5vng4TQU/f7BtNxFTo=
X-Google-Smtp-Source: AGHT+IF4LPINyiDTrMnojwZsP3bsdGKxwYAAODMaFj/fOolEynkfK+AO95H517bQKopG8+ZFICjm2g==
X-Received: by 2002:a05:6902:1088:b0:e64:b9c:47b7 with SMTP id 3f1490d57ef6-e727593ad07mr5533200276.19.1744851912565;
        Wed, 16 Apr 2025 18:05:12 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:b701:4bfc:795c:7c28])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7032783b9dsm3860171276.53.2025.04.16.18.05.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:05:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][walnascar][PATCH] meta-openemnedded: Add myself as walnascar maintainer
Date: Wed, 16 Apr 2025 21:05:06 -0400
Message-ID: <20250417010511.592579-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 01:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116915

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
V2]
Fix branch name typos
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
index 78a4429ce2..e31b29c493 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: walnascar
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: walnascar
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][walnascar]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][walnascar][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index fbb0d72476..eacf40e94b 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -3,14 +3,14 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: walnascar
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: walnascar
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][walnascar]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][walnascar][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 119293a741..cfde7a3ae9 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -12,19 +12,19 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: walnascar
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][walnascar]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][walnascar][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index 235c34331b..b8e98d15c8 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: walnascar
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: walnascar
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][walnascar]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][walnascar][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index dc549d7582..41c37b58d0 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][walnascar]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-networking][PATCH'
+        --subject-prefix='meta-networking][walnascar][PATCH'
 
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
index c7c14a4507..6bb7e06119 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: walnascar 
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][walnascar]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][walnascar][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 13014b0ff3..80e5c84bb7 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: walnascar 
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][walnascar]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][walnascar][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
+    
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..bf1ad0874d 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -13,11 +13,11 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: walnascar
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: walnascar
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][walnascar]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][walnascar][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d1b743887c..3c7fd7f827 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -13,13 +13,13 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: walnascar
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: walnascar
 
 
 
@@ -50,9 +50,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][walnascar]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please using something like:
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][walnascar][PATCH'
+
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 3d6158628f..fb577a48fb 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: walnascar
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: walnascar
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][walnascar]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][walnascar][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.43.0


