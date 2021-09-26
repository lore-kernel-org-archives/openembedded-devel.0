Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6552C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 22:10:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.23827.1632694204641205505
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 15:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJ+jVQeV;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id j14so10423430plx.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23EZ2mU/leI1aZLUDFXeIkmVB92yuEZaj0PCm/z6DtY=;
        b=kJ+jVQeVtBhBe6/FSByI6OAVaxfAGOAxyCT/6NViobvs+7eH3Pm5CGpVqs59olYOLs
         LNnXS6MPH+s7atj2Uj4/1fX01Cc6Eazx3o8hR/8LLuEl+Zp67yarfENOYqCWmm/c+yiy
         vtsDraYo1jZagav0JQNBgGUeKoGJ+wXENGmaLU4TyalTgewiM4QuOT3y8vwqGXC057lr
         1uYtzw89bXK6KYCuQEJBM/AQvWKOJ14Hmc6n1ReHQubovl/sA/XeEO/eCreztpopHHs1
         Njv/SRE0SFS3FYt531Dbg6i9i9BWQVBVA0Ruo17e2r+kRF41f3vEWjer6dF61+I/1wUW
         JtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=23EZ2mU/leI1aZLUDFXeIkmVB92yuEZaj0PCm/z6DtY=;
        b=Dn+qJoxoNElW2T57aFT2MvO9jA8Rrc7iGhwCp/4L4Cn+D3DROD6bdmqIg/d4jsRd8B
         9ru0oH1QnWK4VkR7s/DmYHEZfPf5lEE/n9gHuaaFnY+dLOGYiquiHDcW+BIUs6ZlPlXS
         ZPuuXMR7tlLVFJC6NeCWY4TztnMirU2huM13QrwBRt5X1MfKgnb7hauIcUQHzw5fxrdS
         nSEApTJ0W+YVoxlRFl5rUyaz7WVCeAlhxhJIWwrpzuvmPYGIHvtosCmWIy78RymEAHIu
         JnE8HECd1QXporB19d4Gx894x76yxtYvmh4CFkEvKrl3YjyDMCAA0oNNbWE7pTX8jY5K
         H1lQ==
X-Gm-Message-State: AOAM533Kq2Q+lxvYKzj8IWjyx6b8EFoCbMNfBB7wClZpKv6LICEztuVB
	huFSkR1oAbX1VUu+VqHTdnIWVDUsAU8=
X-Google-Smtp-Source: 
 ABdhPJyEgqbV0AEM7gbYrJViTwqJiVO2tE9COh4LKWGOCYetM4eqfDE560RianSR6ojmHNgdxmmGrA==
X-Received: by 2002:a17:90b:4f82:: with SMTP id
 qe2mr16137382pjb.131.1632694203621;
        Sun, 26 Sep 2021 15:10:03 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:87f2:a984:b0d3:3684])
        by smtp.gmail.com with ESMTPSA id
 bt19sm1180254pjb.31.2021.09.26.15.10.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 15:10:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] README: update to main repo
Date: Sun, 26 Sep 2021 15:10:01 -0700
Message-Id: <20210926221001.1834800-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Sep 2021 22:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93131

The main repo is sourced from git://git.openembedded.org not github.
Don't think oe-core.git exists.

Lets be constent across all sub layers.

Drop Revisions and Prioriiy from repo references as they are not used.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/README      | 6 ++----
 meta-initramfs/README  | 3 +--
 meta-multimedia/README | 6 ++----
 meta-networking/README | 9 +++------
 meta-oe/README         | 1 -
 meta-perl/README       | 2 --
 meta-python/README     | 2 --
 meta-webserver/README  | 6 ++----
 meta-xfce/README       | 7 +++----
 9 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/meta-gnome/README b/meta-gnome/README
index 1a91050004..fbb0d72476 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -2,13 +2,11 @@ Dependencies
 ------------
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://git.openembedded.org/openembedded-core
 branch: master
-revision: HEAD
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
-revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
diff --git a/meta-initramfs/README b/meta-initramfs/README
index a8f17ba859..119293a741 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -11,9 +11,8 @@ Dependencies
 
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
-revision: HEAD
 
 
 Maintenance
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 9c649ff87c..235c34331b 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,13 +1,11 @@
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://git.openembedded.org/openembedded-core
 branch: master
-revision: HEAD
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://git.openembedded.org/meta-openembedded
 layers: meta-oe
 branch: master
-revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
 
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d83b..1aea8a6613 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -17,21 +17,18 @@ Dependencies
 
 This layer depends on:
 
-URI: git://github.com/openembedded/openembedded-core.git
+URI: git://git.openembedded.org/openembedded-core
 branch: master
-revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
-URI: git://github.com/openembedded/meta-openembedded.git
+URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
 branch: master
-revision: HEAD
 
-URI: git://github.com/openembedded/meta-openembedded.git
+URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
 branch: master
-revision: HEAD
 
 Maintenance
 -----------
diff --git a/meta-oe/README b/meta-oe/README
index 98f671d7c2..bf17415391 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -5,7 +5,6 @@ This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
 branch: master
-revision: HEAD
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
 e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
diff --git a/meta-perl/README b/meta-perl/README
index c519dff524..13014b0ff3 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -53,8 +53,6 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   branch: master
-  revision: HEAD
-  prio: default
 
 Adding the meta-perl layer to your build
 ---------------------------------------
diff --git a/meta-python/README b/meta-python/README
index df6abe0e2e..194bac39c7 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -14,12 +14,10 @@ The meta-python layer depends on:
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
 	branch: master
-	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
 	branch: master
-	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
 For Angstrom that is:
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630700..d23f6cc65c 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -11,17 +11,15 @@ Dependencies
 
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://git.openembedded.org/openembedded-core
 subdirectory: meta
 branch: master
-revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
 branch: master
-revision: HEAD
 
 
 
diff --git a/meta-xfce/README b/meta-xfce/README
index bbf4b2edf2..1e9acc471d 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,12 +1,11 @@
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://git.openembedded.org/openembedded-core
 branch: master
-revision: HEAD
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
-revision: HEAD
+
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
 To avoid dependencies on meta-multimedia you need to mask recipes by adding
-- 
2.25.1


