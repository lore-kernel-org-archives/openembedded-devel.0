Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B89646FBB9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 16:14:08 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id ft15so4369885pdb.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vWCIuOUfu+wzslbILaEJkRbfcUB1aL0J+NkIgtZrdrs=;
	b=RnSjuybaqv/OcscXNNvZ+C3XP4nZxXoyx+e9otpiDpkzvvLJ+u1ZTTUH8qBzrPou8o
	tLvoWZr6EX3qoSnB6VhKchFFCQri0NYq8Ww+NPflWKZ0eVsxH/O/mZ5OtpDsnl276vPW
	8eR2Y6o2zkjylYjJyEUPcJycKpIFnqAjQ/epGejJ6HqrBdZJul1zrv3664Gh/aHq1zt8
	zLs1RFIrnOqV5cp9YkuXl5I4BRM7d3rl+ongq2ZPuuVOOhsz8E5m1mK+vpKf1whHp8Cn
	RwwgrWCZxll20Asvkz96kyl19onRCC7aSD4aiAgRdBt9MVElqT0U2x8DgFE7tw8xBj8W
	9oLQ==
X-Received: by 10.68.65.99 with SMTP id w3mr18489831pbs.90.1413130449244;
	Sun, 12 Oct 2014 09:14:09 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id z13sm8821062pbt.74.2014.10.12.09.14.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Oct 2014 09:14:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Oct 2014 09:14:03 -0700
Message-Id: <1413130443-11407-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [dizzy][PATCH] update maintainer info in README's for dizzy
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
X-List-Received-Date: Sun, 12 Oct 2014 16:14:11 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/README             | 14 ++++++++++----
 meta-filesystems/README     | 14 ++++++++++----
 meta-gnome/README           | 14 ++++++++++----
 meta-gpe/README             | 14 ++++++++++----
 meta-initramfs/README       | 12 +++++++++---
 meta-multimedia/README      | 13 +++++++++----
 meta-networking/MAINTAINERS | 10 ++++++++--
 meta-networking/README      |  6 +++---
 meta-oe/README              | 12 +++++++++---
 meta-perl/README            | 12 +++++++++---
 meta-ruby/README            | 14 ++++++++++----
 meta-systemd/README         | 14 ++++++++++----
 meta-webserver/README       | 11 ++++++++---
 meta-xfce/README            | 14 ++++++++++----
 toolchain-layer/README      | 11 ++++++++---
 15 files changed, 133 insertions(+), 52 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index cfffc47..dfcf93e 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,18 +1,24 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch:  dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-python
-branch: master
+branch: dizzy 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][dizzy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][dizzy][PATCH'
 
 Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                            Martin Jansa <martin.jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..639d9ee 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,22 +10,28 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.24
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: dizzy
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: dizzy
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][dizzy]' in the subject.
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..6358d14 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,22 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][dizzy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][dizzy][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-gpe/README b/meta-gpe/README
index 7d019f6..3be1d10 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,17 +1,23 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe][dizzy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][dizzy][PATCH'
 
 Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                            Martin Jansa <martin.jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..e5d27d7 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 
@@ -20,15 +20,21 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][dizzy]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][dizzy][PATCH'
 
 Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
                    Paul Eggleton <paul.eggleton@linux.intel.com>
 
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
+
 License
 -------
 
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..9727ac6 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,26 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][dizzy]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][dizzy][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                         Martin Jansa <martin.jansa@gmail.com>
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 49ced8f..82f9dcc 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][dizzy]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][dizzy][PATCH
 
 You may also contact the maintainers directly.
 
@@ -25,6 +25,12 @@ Please keep this list in alphabetical order.
 
 Maintainers List (try to look for most precise areas first)
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
+
 COMMON
 M:      Joe MacDonald <joe_macdonald@mentor.com>
 F:      conf
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d..383a028 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: dizzy
 revision: HEAD
 
 Maintenance
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..c5823eb 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,21 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][dizzy]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dizzy]PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
                        Martin Jansa <martin.jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..04ecefc 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: dizzy 
   revision: HEAD
   prio: default
 
@@ -75,13 +75,19 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][dizzy]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][dizzy][PATCH'
 
 Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
+
 License
 -------
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 99cd9bc..65db19e 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,16 +1,22 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][dizzy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][dizzy][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-systemd/README b/meta-systemd/README
index 2cd90b4..5f42b99 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 To make BBMASK'ing per layer possible the following directory structure is
@@ -15,12 +15,18 @@ used:
 
 $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd][dizzy]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][dizzy][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
                        Martin Jansa <martin.jansa@gmail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/meta-webserver/README b/meta-webserver/README
index f3fe735..ead9e2a 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: dizzy
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: dizzy
 revision: HEAD
 
 
@@ -38,10 +38,15 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][dizzy]' in the subject.
 
 Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
 
 License
 -------
diff --git a/meta-xfce/README b/meta-xfce/README
index e346888..5caff8f 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dizzy
 revision: HEAD
 meta-xfce depends on meta-oe and meta-multimedia in this repository.
 
@@ -14,9 +14,15 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][dizzy]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][dizzy][PATCH'
 
 Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 7af26ec..611524d 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -1,15 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dizzy
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer][dizzy]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][dizzy][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
-- 
1.9.1


