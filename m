Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CB819605D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:09:09 +0000 (UTC)
Received: by pabur7 with SMTP id ur7so2863733pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:in-reply-to:references:content-type:content-transfer-encoding;
	bh=AKDEnIBoiwqksxA173jEa5HAG91n6ND7BPaSCG9oz0Y=;
	b=Ft8kbi3XcGLvIBk+ysqjThqB5ss2s6vMKw7Uiu6Qb/r/649FUWHVHO5TNSwomYrQQE
	MunwwRmdPHftnlTVsMj3DLotoWNYMoBl3tNdleszWkWoXt6N8xZq5/vXFa6T+PyCUr2C
	PPn7WI7pPdrnNLq/9xjhTnPtwirv5tAg2NnRv8V8wT9gpAVSwjfJg3zyDCp7/tP+2CAU
	72VwOnsPpVGkr3n0C8fc8p4kIlWT0rWkjdFb3NIlv5xe9hIfoEsogFRnLP3Hn+kqKivB
	wB2gj3QMl8ZDN+NamKz+4RQpqciYZktQkJktYymE/BMp5y1srK9UYUNVtVbLx8sctgqi
	B7dQ==
X-Received: by 10.66.119.135 with SMTP id ku7mr3108682pab.21.1444820950004;
	Wed, 14 Oct 2015 04:09:10 -0700 (PDT)
Received: from Pahoa2.mvista.com ([192.165.183.201])
	by smtp.gmail.com with ESMTPSA id w9sm9060420pbt.29.2015.10.14.04.09.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 04:09:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Wed, 14 Oct 2015 04:08:58 -0700
Message-Id: <1bc2ec06d7fde903377b2f49d581b954337f0b8c.1444820761.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1444820761.git.akuster808@gmail.com>
References: <cover.1444820761.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1444820761.git.akuster808@gmail.com>
References: <cover.1444820761.git.akuster808@gmail.com>
Subject: [PATCH 1/1] README: update maintainers list for jethro
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 11:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/README             | 12 ++++++------
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-gpe/README             | 12 ++++++------
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 13 ++++++-------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          | 14 ++++++--------
 meta-ruby/README            | 11 ++++++-----
 meta-systemd/README         | 12 ++++++------
 meta-webserver/README       | 12 +++++++-----
 meta-xfce/README            | 11 ++++++-----
 14 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index cfffc47..951203a 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,18 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro 
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-python
-branch: master
+branch: jethro 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][jethro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][jethro][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+Jethro branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..9653c66 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,22 +10,22 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.28
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: jethro
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: jethro
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][jethro]' in the subject.
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][jethro][PATCH
 
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..1198af4 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: jethro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][jethro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][jethro][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 7d019f6..571e701 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: jethro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe][jethro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][jethro][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..be4c256 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 
@@ -20,13 +20,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][jethro]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][jethro][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..12af308 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
-branch: master
+branch: jethro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][jethro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][jethro][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..98617a7 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,16 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][jethro]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][jethro][PATCH
+
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 You may also contact the maintainers directly.
 
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..fad1d6d 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,15 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][jethro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][jethro][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..e50f6f1 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: jethro 
   revision: HEAD
   prio: default
 
@@ -75,12 +75,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][jethro]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][jethro][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index f62ab8f..764ef67 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: jethro 
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch:  jethro
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -39,15 +39,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][jethro]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][jethro][PATCH'
 
 Maintenance
 -------------------------
 
-Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
-
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-ruby/README b/meta-ruby/README
index 08e0aa7..18be4ea 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: jethro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][jethro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][jethro][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 2cd90b4..65db7da 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: jethro
 revision: HEAD
 
 To make BBMASK'ing per layer possible the following directory structure is
@@ -15,12 +15,12 @@ used:
 
 $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd][jethro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][jethro][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index 379b54a..153bd7b 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: jethro 
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: jethro 
 revision: HEAD
 
 
@@ -50,12 +50,14 @@ Notes
 
 Maintenance
 -----------
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-systemd][jethro]' in the subject'
 
-Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-systemd][jethro][PATCH'
 
-Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..609af2d 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: jethro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: jethro
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,10 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][jethro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][jethro][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Jethro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
-- 
2.3.5


