Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84ABC3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 17:53:46 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.33049.1744566821889129927
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 10:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXqPHCSL;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6fee50bfea5so27634337b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744566821; x=1745171621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iL9LIS6E0NYTH8OgruksHHzK1rCdJlqe+gUakaofFVA=;
        b=PXqPHCSLpgJzWHSMj0Q2lG8tjuhJulqJD2hLESAkC8h02g7ICxOy0liJTGZuqSEw17
         p+1I9zgEYkT3yHfinN/UmluvwgxbBta55zA+w+Af4iEqQrG6sqS1n77LtXz0yB2VegYy
         cHzY0MIQL9T3ca8okvMYqJotnvkRIx0Gr/Z4ffJqVN79+YH58uFLgYC0Wj9pHPITtOE9
         +asEbWiP2nH12W+UGEksvCer6YTNgbyAw9Oyj23unOB5yC0kKfJlaPNzGgijMq8CbhrT
         V298nVOj6m5y4IDJVUvtug35cstbu5XkrnclxxeJ/B691wOhOlEq5iyDQNemqLEqRtW7
         5PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744566821; x=1745171621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iL9LIS6E0NYTH8OgruksHHzK1rCdJlqe+gUakaofFVA=;
        b=MpyLK4eWCb//dAahV1t+3fRgcTH0d1dlUzvXGFum10rwS0cHNEnyu/lqoyxJN9wmc4
         lkdYJSSe/G792qt60gD2o6n+KO2pRyuOraSeUwtM7AYXjmszr0K7Jqm2UbB3jWE0lXLV
         Yj+V8MZcoaUJHR0OyK7ENkWUHe44EDUQql9uuEVHgcq8RQd7tfAN0DM8zdNOy3pTxyrE
         a4vFakNrKzAIW/gs+7lWOuRCzVDFfnR19nvRm/mfa4Mm/jvfaIdmsktHvdYtulXIUIar
         +h7vNaag4oU4JTPVfxvOaTyYTSdXWBxC0WMF8wWKW6COG0OBPz5/ii21r3naEK9VqB4m
         VgoQ==
X-Gm-Message-State: AOJu0YzYQkInWIsZL6kjQR41J2Fi2r6GAnSjBdisP0kPpTlxAhX8eA5i
	zT1xRGt/VZjq9u10lfjWkeB47OzZHoZxyXcj8UuSxi/ADYmbXxhGZEZOuG2f
X-Gm-Gg: ASbGnctzjkx6+pXBopBkYnFpLGFuUJ2Sp0dXmbUiZFjVzcIDrWUF/dbRdZFPkRpnxXT
	PFM0YWdBLmZ9Q0MRXFmvA2fo6s6DwhkwZvp38mUR9p5tvGlN6NfqVsfgrrRR+iJkmHvrF5tF1kL
	NBTBx27eVjs2qNIqn5GP1MYmLWc4doAdU7tpVMLZtIUVBOM1vOW+FgMN+t3b1m1+BEkFkiShZnd
	dXNdhzDffn3qWTlNaWhk264dDHJ/4PiR31yYyuOTqdk8W4QLD2ZgNg1pDoIQytsHz+65Zfh0NyK
	ExDXP3V+opp+nvQkT0qK3Ly6f4agoW3a0VlX4cFqtSCOPxVXIzZhOw==
X-Google-Smtp-Source: AGHT+IFMoJPoZQE8bbANVxqcvhWievpaCEl/bzmImkMEv5KlSWtk5R5Hu2Id/TFHP0eMQy0SZAJGyQ==
X-Received: by 2002:a05:690c:448c:b0:6f9:88ba:aa5d with SMTP id 00721157ae682-705599c485emr163711397b3.9.1744566820465;
        Sun, 13 Apr 2025 10:53:40 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:421c:1b9e:a7a8:688])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e3733b6sm26054757b3.87.2025.04.13.10.53.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:53:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][warnascar][PATCH] meta-openemnedded: Add myself as warnascar maintainer
Date: Sun, 13 Apr 2025 13:53:35 -0400
Message-ID: <20250413175339.523216-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 17:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116834

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
index 78a4429ce2..b073700018 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: warnascar
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: warnascar
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][warnascar]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][warnascar][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index fbb0d72476..2a4b630a53 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -3,14 +3,14 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: warnascar
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: warnascar
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][warnascar]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][warnascar][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 119293a741..685e64413f 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -12,19 +12,19 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: warnascar
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][warnascar]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][warnascar][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index 235c34331b..150979b836 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: warnascar
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: warnascar
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][warnascar]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][warnascar][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index dc549d7582..3641f21449 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][warnascar]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-networking][PATCH'
+        --subject-prefix='meta-networking][warnascar][PATCH'
 
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
index c7c14a4507..add5c2fb3f 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: warnascar 
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][warnascar]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][warnascar][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 13014b0ff3..f6089dad48 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: warnascar 
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][warnascar]' in the subject.
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][warnascar][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
+    
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..c91a97c942 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -13,11 +13,11 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: warnascar
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: warnascar
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][warnascar]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][warnascar][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d1b743887c..33cd85622b 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -13,13 +13,13 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: warnascar
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: warnascar
 
 
 
@@ -50,9 +50,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][warnascar]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please using something like:
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][warnascar][PATCH'
+
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 3d6158628f..a0592d21d6 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: warnascar
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: warnascar
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][warnascar]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][warnascar][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.43.0


