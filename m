Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295FCCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:42:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32789.1792042971651557341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X5tmFoUa;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5d0ee1951so30918445ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042971; x=1792647771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B2mroNgXCjWb0DUGga54BzEbdtygFiP3E6llww/7/18=;
        b=X5tmFoUaTvUPdu0HcVwgIE63wF9wpYb+QHw2cM8U34RWRS/SE9F2rFCsnknRQSCXTi
         AeIqBnDqduzoaueoQsAVZW7Ih/TYJ5n3sUjnPnXRV+qOFhTz+5UTbzC4+wXQHrompHnA
         vu7c4V+/wshaQZ/lwz7LpT6JJ4+B0YUd2e+fXrz+zbKNe27P4qEQBIae/MmlyGFsQZwc
         t/rjLPD52YRxZN61IN3cfrMt/LtffLSIbdApuNauY3R3eEENXhTuttYi5g5ys+JScch0
         nj9KcU1zlZGTQhnymgyxnKGbnXxrKt3oQzF6ccx8AJIyD95DJXRXz/dp9saPxjiRMOHe
         1zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042971; x=1792647771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B2mroNgXCjWb0DUGga54BzEbdtygFiP3E6llww/7/18=;
        b=qKX5HYKc0y5UHLENEKAslfRMi6YIt+y1KUgoUdgVUenSv0aRVOn/Hr4pnCyvQwMtto
         +hRUoAOtWKLhWxEQ+S7G8Jh4nf6EW4sGqAwXEnk+3211Cpk3WLVlqwCImLcr6tQEQ+1y
         Opj0k7jEqAfw5eprxPtRqJ9U5xkdOslBIHR8A2tk6GFIQVcqTcj1G23bH3yfWlJF+lc1
         NstvTfkdq3gLmWdVWfnG9UniyUzQ0QXknAFKAkqkeQ+I8pdCews/BZmLQvY0naHI/xCi
         vsO+ZC2yKZJ+lDNZ6g4SBPxHgy/tLwpmuEeMTbD005aA5PyuZhHegBIdFza5m5yRXyOq
         WmmQ==
X-Gm-Message-State: AFq9FYKZ/q7Qsy45zOPJRsVLrW1TBVs707PO1tYm6H+59urT/3LP20Zr
	9P5ebj/FoxFjry31S9aX/+/OnDx+uDHPL5LgbHbIpoRN9jD2aKRTJDUuCgwoMg==
X-Gm-Gg: AYBFou0AHtrsZFh1/Yk8F5ny3uAb0MwftxEq9cTzxRPsWRyZfvq1cOgHNeLFHgk/1q6
	r/xKubHrle+F4F4wrrFySYUKjkWn2rFpvJaRxO2c7GGf6/4rU1WMSeeETa2SRQitZrtCNNMJKEe
	GwyMXHhaZt3NYW+4KtvZjngK6nn8dKWw9xeGkZzS88UQCg2lFtgyCH8hgHjy7LAV13yFYxgAleK
	MMtod3obdwHn6QMNL6DZ/lnn8OCfhsbBcJzNquNmRHam1wKMU3TzVP+YM5hOMN7iZhOMLYl1y3i
	oYZs1ucDi+EvftwS1RtpdK4eKepFfQkq1b61xQnpV4y+CzkHPXuiZF08DoxSNWXQ9mEZfd34kqp
	PA1/uOaTZS6tDHvqu+zp2C6Ltt1oIZr0KgYNQueI+E7zOwh3xNepu3vgqLwiHrfS+7HlwO6J/oj
	ucPvCJJ2MvdYINnCf9EbHr/MHC3qHHMeqEuZeWhEbXhkMiFuqfRVbQ1NQUNoMZ/UE4Asd4R0g8H
	OQoZnC2cG2niQ7C7GIRoUg=
X-Received: by 2002:a17:903:1ac7:b0:2e9:60fb:5e41 with SMTP id d9443c01a7336-2e960fb6555mr7594415ad.50.1792042970797;
        Wed, 14 Oct 2026 22:42:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/82] readme: update maintainer
Date: Thu, 15 Oct 2026 18:40:49 +1300
Message-ID: <9dd6d4a720db5a84f08c956c5ff6de0a51ec709e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130921

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

