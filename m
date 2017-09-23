Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E137677E5D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 14:45:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j16so2334680pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mUAiWWIHuvJMgdIV8CT8uWamcvf9R1yRJAGml5NgXI4=;
	b=t6wOqnFs6Q9Rn1dEZ13VIAm7d4R8jx2jcI0NkWMbgYnVZMuti/9MTpBYN45szWqb0t
	yddrdK5nQ8FRWNBqPpx6GnIMNV9Vntcwpzd18ERJA2N9d79oxeilshhnYZHx7WtqQBSw
	VJlssGurPtQPMZVojqV3eC8Kb75atvOdpqh/ccGsf3jMiBYtJzNrAVJ9VAFW3uRKZTHI
	SrYfrqbswqAm1eTaMuSsGZ880rJezqf8F4Z1qk5KjA71yBCmwQ6lS75ZyNTib8cMc181
	VCgK7BLtgT/Aj2bToG5RJ4tH1AbqHhBnm1K6vKkUyIPPD/ISpgtZ2YixAojuIWZa7xyS
	f/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mUAiWWIHuvJMgdIV8CT8uWamcvf9R1yRJAGml5NgXI4=;
	b=lBkXUk+6daH0+Am7/iZAEuA0/6n9mbmuveKc3xhLYs+yckUa9ZcoBBrXNUV20kfdG6
	YwFls1MLcLzZypqLHMB2Dkf0wsNbSMZ+hit/phFcb90tv22c4SmM7+l5bWBGxQcn38xi
	25W/SfIzMjCWHkGFDEd9j1RQmZz6AJY8cYjVoojUZE5qQaqe++2a0KZnvSthuiiNeCuV
	uk5IADZWL7f+DRkRo5r36GfUYj0oAcA13b8xkv9rnna6Yaytr5FFyv3tglXqhkU5drVY
	JmEuVHMsW/pqHSFjXhJlP/veZX+9NrVy2LAk3N71voET4yrh3IzaomPm13kENNLtpZW4
	a2+g==
X-Gm-Message-State: AHPjjUjjwV8nELK/cw6X1Tl0IR0PYAvzPWPtGqoTAKn8LPFkz0d4e+Qt
	a7TX/Ywj/9t3XosFY36uC2uHIA==
X-Google-Smtp-Source: AOwi7QBDxQPxVDWlQ9h1rgV7Qdf5ibKQvpanbJ/0NTcg0JzjoMhi4h5hYQ4BTGorFiwAKzkQIRNPtA==
X-Received: by 10.99.3.19 with SMTP id 19mr2470716pgd.113.1506177951772;
	Sat, 23 Sep 2017 07:45:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:d126:a20b:717e:18a0])
	by smtp.gmail.com with ESMTPSA id a1sm4609103pgu.47.2017.09.23.07.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Sep 2017 07:45:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 23 Sep 2017 07:45:49 -0700
Message-Id: <1506177949-19355-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko][PATCH][v2][Maintainership] README: update maintainers list for rocko
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Sep 2017 14:45:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2:
bumped bitbake version in meta-filesystems

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 15 +++++++--------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          |  4 ++--
 meta-webserver/README       |  4 ++--
 meta-xfce/README            | 11 ++++++-----
 10 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..0f7cc9b 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,22 +10,22 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.36
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: rocko
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: rocko
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][rocko]' in the subject.
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][rocko][PATCH
 
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..25ef85d 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][rocko]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][rocko][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..b7dbfef 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 
@@ -20,13 +20,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][rocko]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][rocko][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..b59dfe0 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-layers: meta-oe, meta-ruby
-branch: master
+layers: meta-oe
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][rocko]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][rocko][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..771c73c 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,16 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][rocko]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][rocko][PATCH
+
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 You may also contact the maintainers directly.
 
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..dabed2f 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,15 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][rocko]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][rocko][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..cc965af 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: rocko 
   revision: HEAD
   prio: default
 
@@ -75,12 +75,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][rocko]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][rocko][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 905d5ee..43740f6 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: rocko 
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch:  rocko
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..f2928ab 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: rocko 
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: rocko 
 revision: HEAD
 
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..3367797 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: rocko
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,10 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][rocko]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][rocko][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


