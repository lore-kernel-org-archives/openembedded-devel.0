Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6BBCA9EBB
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 21:40:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6466.1791582026457458871
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 14:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zara97Yf;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86aecf49833so92311b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582026; x=1792186826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2mroNgXCjWb0DUGga54BzEbdtygFiP3E6llww/7/18=;
        b=Zara97YfTPM9TowrhT2ymFiG98hbh07Y7xi/nr4P7HZrGylw2SCOCuetTJcqpUOQiv
         a10lp/Taaf5J+m/s8uVUTonnf8OKsulL4sIar4Ld7F422YFpL506MncuV0KM21qYHUbX
         9w0h75xnCFzP++4helGqW6cDg/yEKi5GFRQ4KfwNqQlJxyN+Ak4VS5C+7pFTaazjIl3D
         sC2qXs30Bc0FxLYPEm0B1t5E0AwIoGFfxC3lsxahHH9hyQmZeE2n480RLuTsBpIsYq48
         0ArNya4geA/cFB5FAHOMErPSFndEF45j0VbqtdjK8PtI9WXeVcirkaAJX0MRtIjz2lJ8
         KfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582026; x=1792186826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2mroNgXCjWb0DUGga54BzEbdtygFiP3E6llww/7/18=;
        b=PmSYbD+Knc9W7WbN+pdcnNqopAghUNOebDDJAY0NkaK9FX3YQb/UK2/qVEpWDYhvBu
         Cpjj7DUoklNYiv68KoQJq0U95bBN7bWoN7tgfsKU/mYsekIC/8/gNPHlIm0DGE1H+cig
         E6FPFUeqRQfxOprrYl3XzrudWDBya9OwK7vzL9xMkV8h/uBULepbh4e38FVMa8CbuUh8
         UzVBmJl7eOwt17F4vhMlyNhNuN0NadQklfwjmlaEpowgGytsv0gMb1mvS/m8dvvaQlJq
         FHL/SA/rpnVvCVomdEsviW8851vu/Q6PX4OETZTZF8F53yYW6k3DccOVb59+tRXMKQwC
         a4SQ==
X-Gm-Message-State: AFq9FYI3aj2knE8e87Lk6hDyKeorNiv3fVak0XgADupqBNSPgAsEbobK
	Kxim291B+pbE3yV5mxMG1XB2JgK6oKi0VOtS9WoMFfFDq/elCxbtzyQ+XFo2Oeyl
X-Gm-Gg: AYBFou0KRrvW0etqdkZag0utsKOU9GtESzC0mbYu7E57sYX5B1+BIdcEJkSZdcMyLAJ
	5CODWAS1UjqlZHP+Aj1ePsGR62VrNiv9lH0N5LGwSQmEPmD9LLjSkrHxOUn6KxuFOL2wAZt1KT/
	nl0cRn4KhssMWlwcoZE9mn3dn+g0P9kSZBQayXeIYQ+5rbx3DxWHPuBAq2SFbdF1AO/bIf1uJLx
	k1qRNZE9EoMbNQ/oLn0zwA2rLJ9ZZ5FGz5MkuGsCWDk+1XdJz9gfTv/htSQR+3lHbWMhnwfu9w1
	7q+4D0sF8gyuBm/WhAjbYFW/DHnWxKdgL+lO8SrB89Z1XMFcj+KdwkIHJAO4kJh45PaGwmVaVKp
	3KRObme26vGSB/YGGj/CVnzr6h0UN/tHw+dP0iC0fvKwCeJRjF/a6HWRYpu+qiuyyFbRmQLmYzv
	1VPXTgSYSmAnkm3QnFqq9jkrkOLTnQvr2tYL7yk/eI4z1A/oZSK5bovPkrEXeUC3FEASfGncl++
	QB2Vcn/8LxjfRHAs0v7VAsLkDJq71qxpNc1vVs=
X-Received: by 2002:a05:6a00:1706:b0:88d:4241:9fa4 with SMTP id d2e1a72fcca58-897d3836047mr1968627b3a.11.1791582025608;
        Fri, 09 Oct 2026 14:40:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ecb01dsm1638877b3a.36.2026.10.09.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:40:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH] readme: update maintainer
Date: Sat, 10 Oct 2026 10:40:17 +1300
Message-ID: <20261009214017.2589019-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 21:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130710

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 README.md                  |  2 +-
 meta-filesystems/README.md | 10 +++++-----
 meta-gnome/README.md       | 10 +++++-----
 meta-initramfs/README.md   |  8 ++++----
 meta-multimedia/README.md  | 10 +++++-----
 meta-networking/README.md  |  8 ++++----
 meta-oe/README.md          |  8 ++++----
 meta-perl/README.md        | 10 ++++------
 meta-python/README.md      | 12 +++++-------
 meta-webserver/README.md   | 10 +++++-----
 meta-xfce/README.md        | 11 +++++------
 11 files changed, 47 insertions(+), 52 deletions(-)

diff --git a/README.md b/README.md
index 9fc30bda95..f445aed152 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+Main layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 This repository is a collection of layers to supplement OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index 78a4429ce2..28c2f14733 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -11,26 +11,26 @@
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: blacksail
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: blacksail
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][blacksail]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][blacksail][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index 6c23b4e671..7d66dfce27 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -3,14 +3,14 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: blacksail
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: blacksail
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][blacksail]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][blacksail][PATCH'
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index e074142be7..cca1b5f174 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -12,19 +12,19 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: blacksail
 
 
 Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][blacksail]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][blacksail][PATCH'
 
-Interim layer maintainer: Khem Raj <raj.khem@gmail.com>
+Interim layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index bda470a6f6..5f847c259c 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: blacksail
 
 URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
-branch: master
+branch: blacksail
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][blacksail]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][blacksail][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
diff --git a/meta-networking/README.md b/meta-networking/README.md
index f8337b0c5b..094a85b9d9 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -18,21 +18,21 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: blacksail
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: blacksail
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
-branch: master
+branch: blacksail
 
 Maintenance
 -----------
-Layer maintainers: Khem Raj <raj.khem@gmail.com>
+Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-oe/README.md b/meta-oe/README.md
index da6c4cbe79..345b3ca903 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -4,7 +4,7 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: blacksail
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
@@ -16,10 +16,10 @@
 Ubuntu
 sudo apt-get install gcc-multilib linux-libc-dev:i386
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][blacksail]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][blacksail][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -33,4 +33,4 @@
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 9d56dbe8c6..9fb1d7d864 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -52,7 +52,7 @@
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: blacksail
 
 Adding the meta-perl layer to your build
 ---------------------------------------
@@ -73,14 +73,12 @@
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][blacksail]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][blacksail][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..36255167b6 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -13,11 +13,11 @@
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: blacksail
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: blacksail
 
 Contributing
 -------------------------
@@ -28,14 +28,12 @@
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][blacksail]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][blacksail][PATCH'
 
 Maintenance
 -------------------------
 
-Layer maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Layer maintainers: Ankur Tyagi <ankur.tyagi85@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 565269648d..1562365e47 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -13,13 +13,13 @@
 
 URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
-branch: master
+branch: blacksail
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: master
+branch: blacksail
 
 
 
@@ -50,14 +50,14 @@
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][blacksail]' in the subject.
 
 When sending single patches, please use something like:
 ```
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][blacksail][PATCH"
 ```
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 564590ff39..d032d1b076 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -1,10 +1,10 @@
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: blacksail
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: blacksail
 
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -13,10 +13,9 @@
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][blacksail]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][blacksail][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Layer maintainer: Ankur Tyagi <ankur.tyagi85@gmail.com>

