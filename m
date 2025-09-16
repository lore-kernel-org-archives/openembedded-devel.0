Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E8FCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 07:08:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.13278.1758006489917905660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 00:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gp5kGHux;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so816065366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 00:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758006488; x=1758611288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2inlTkPRfomluYXiTsR+PUyLzKxvxa7pQJt+EmJgfXg=;
        b=gp5kGHuxeiTTjynai1TysQgd0qMJuV9Pt+f72CiYjIOh2o2g12fuFiCg+xd92zPFxM
         sDurDsVO2I7j32k7u2JwLEfTfM3IyxYZT2Lm8eztSaiAJoPoQpRGF1KDyOuR+JLtZnDw
         vv1EM3X1xDRJ+0IW8VpzN53qiFGJxlTeHaysuOzjCJGkrIN6GMAW1qyBB1hGUjioQvXT
         TILMeNEciU/Z4yAAjptfoxGw4F31O369LpjwcV5Vl5UvT9RdxJHxDieK86lmCgfQ93WP
         /cdVHtMVGL5BLY0ohtf0Sedb+ef1nlzxNOb0Xpa1BghsA5myBAjLNzgJNBNOs0gqgYzU
         S6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758006488; x=1758611288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2inlTkPRfomluYXiTsR+PUyLzKxvxa7pQJt+EmJgfXg=;
        b=BvKPaqWaorzplN+O6cKOvNlCEMf7/KqKEtek3yz4/H6q7VRJYSmz4THGa67m6w3X+p
         mucBLAOLI+odaMO2uNXXAGY9TrIa1I76n1CPL2MZd1O6+EElcLqB1BNeyv0qClEEedQz
         HPR8NIOpMZgnvMUokN+aiql0j3KUEuesuuCrZ1YbBp09KXNb+RMnpOMZ7OD7MNuYu6Vf
         W07yL1PgiJIe9qtmtHdHu/s95gQwQMfVCIbhFx2KmBboWqP15K/AF5HMtSMWk+B/A1SI
         p43xh1yqUd+Vz8x2gzFfr6sdHaor03TJAAnXLCjuxSTRMgh0f4igoi9SX0mN6vKVS41+
         HLPg==
X-Gm-Message-State: AOJu0YzRLZNZVV8ipOPg76t4Ie3hnOTyOGnfTBAxjC/vVCmtDH5cqn5+
	5/fOvcS211xV4VNCfr3Ko0uutBRr1zOu9oP5Z4mdbWRJAVIqVAi13tobSX4sIw==
X-Gm-Gg: ASbGnctCH4wnB8kYsVLOoUEGTIhUblOKEq8GMdDP3bRuR9+TADK8hXykB8UIvslUyXs
	ynLpHSZfaxgs+Tptzh0S72vischggupJjigUne3QFh4UIE9xqvOoivCvl6uTbTyJZd/sNF8oi50
	K+dO6+O+2itbz2BwjrDKS/+9Xwwe65zIZr4HIrp+OT+iMzVzAQJZH1hyVvUdxbYPgdkfYpD/qkj
	O/Ngj8QX1A6Wke+fLUORk5X/AFUKP9/j87rqQOxGrM9FkNgqZi0Xv8tEUpeiZVvsl1tUBRRfvrB
	bM3AICL7GHUWzyNZ5QgPzbQbXpENMv0OhhHfouCq7XtrGeaqNhxzxl46LxfYmwdvOkG5CasY3SF
	QqqKQ7oyf24Vhfr0iVXvi
X-Google-Smtp-Source: AGHT+IGrRotFLpN1sasJo8QjUc2D/m5BmB8Lq1NwiuTVoEl8UO3Xbe4fjexRK2t2oPRVnG/s/1NsPQ==
X-Received: by 2002:a17:907:bc83:b0:b07:df3a:18e2 with SMTP id a640c23a62f3a-b07df3a1a09mr1130492466b.0.1758006487910;
        Tue, 16 Sep 2025 00:08:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd408sm1091344166b.59.2025.09.16.00.08.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:08:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] readme: update maintainer
Date: Tue, 16 Sep 2025 09:08:06 +0200
Message-ID: <20250916070806.2263163-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 07:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119417

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 README.md                  | 2 +-
 meta-filesystems/README.md | 2 +-
 meta-gnome/README.md       | 2 +-
 meta-initramfs/README.md   | 2 +-
 meta-multimedia/README.md  | 2 +-
 meta-networking/README.md  | 2 +-
 meta-perl/README.md        | 2 +-
 meta-python/README.md      | 2 +-
 meta-webserver/README.md   | 2 +-
 meta-xfce/README.md        | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/README.md b/README.md
index 82f2e9699a..24021b2664 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Armin Kuster <akuster808@gmail.com>
+Main layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index e31b29c493..57437280e3 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -24,7 +24,7 @@ Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
 with '[meta-filesystems][walnascar]' in the subject.
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index eacf40e94b..b97be0ed55 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -13,4 +13,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnom
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][walnascar][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index cfde7a3ae9..5f70177e95 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -24,7 +24,7 @@ with '[meta-initramfs][walnascar]' in the subject.
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][walnascar][PATCH'
 
-Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
+Stable layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index b8e98d15c8..aba8a31979 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -14,4 +14,4 @@ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-pr
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-networking/README.md b/meta-networking/README.md
index 4f9a14b8ce..893d50f714 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -32,7 +32,7 @@ branch: walnascar
 
 Maintenance
 -----------
-Stable Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Stable Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 80e5c84bb7..709a4201de 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -78,7 +78,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][walnascar][PATCH'
 
-Layer maintainers: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
     
 
 License
diff --git a/meta-python/README.md b/meta-python/README.md
index bf1ad0874d..3ec72b6ea7 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -36,4 +36,4 @@ git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-pr
 Maintenance
 -------------------------
 
-Layer maintainers: Armin Kuster <akuster808@gmail.com>
+Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 3c7fd7f827..39192181f2 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -55,7 +55,7 @@ with '[meta-webserver][walnascar]' in the subject.
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][walnascar][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index fb577a48fb..4c532c46a5 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -18,4 +18,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][walnascar][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>

