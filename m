Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 235C67D72F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 01:20:49 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id o5so1855385pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 18:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fZtJTDaoElig1eVo8ADKPdurxzkHqd6dtsG1OUcLwEw=;
	b=IMfIaqsKM3BA6NgBFkac4jH0zS0GYYLCiORWR4/m25iZmTNo0D3SVj4QRgDIxE9xVO
	fU6AOcTpw7eijk9L8c6hkIjVa15Hq8Sjf8Tmj76lwMh63V9Zr0ETi4XFDoOjOhLjPGiL
	Wo7wY09RL9szFKfbR6VNcmP7APR/YvP+zeVn6A6mvxW0x7PoRkZe/AmrWtWpoipur/qZ
	nsp4zu4/H5X+k4NFNtgGL9Mlz5Sf+NxxeAqtJ1j0p3en79C8Y/mqq5UFxTs3Q05qQkkG
	z1DktGqGKvxEzgLYtniMDEFpCxNlEKlRdyIuaMfKqDlbdciOH2/omirD2nZ4mClkIh4c
	jWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fZtJTDaoElig1eVo8ADKPdurxzkHqd6dtsG1OUcLwEw=;
	b=J6do8thY7Z++yDRw7mPyQlxASVU9FikPAc53bNEOx+kOOQJslX+IORfCWqOMOraY7r
	8d0hyYVK+daL9J0zeMRz4eZYW1a+Ut9fJeqPADAQ2wi4ujTxsCjx6InPqKovmsL2Sq01
	x4H76RqxmbkA+QHvqDFBKV20sUgLAo2WC/LYi5fj3Lcusvs3IkF+PbdPswXkabKWK1RE
	nNfC4GrWLeCF8pnBEh/VEs+8xWRSLE//trS9racJjJh2Y9ZB5hqxLlB8gMpBIKyuOEJ1
	9NEScFDHE61qA5qldhwb4//kGCLpURDQ1JBNayYSHK9KRu79wFOOyzmWKG4TDm7+tQuM
	BfCg==
X-Gm-Message-State: APjAAAWcHOGm5yNk3bd8bmEJBg4MJx18VHuBwScJTH5bO7iHakqDZYnu
	+vfq+H/RouG8N+wXDMgIFpKPccZm
X-Google-Smtp-Source: APXvYqw8ZlF/hDRuacbj5/6Y1i9QMZUwwJaKSnpg9J/trySWyyAJ2MMoznF/9+g3YneKhfXHw+KQ4g==
X-Received: by 2002:a17:902:7284:: with SMTP id
	d4mr6947173pll.249.1556846450729; 
	Thu, 02 May 2019 18:20:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7403:feaf:ea56:abf7])
	by smtp.gmail.com with ESMTPSA id t3sm502625pgu.78.2019.05.02.18.20.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 May 2019 18:20:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2019 18:20:48 -0700
Message-Id: <1556846448-23953-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior][v4][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Fri, 03 May 2019 01:20:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>

[v2]
bump bitbake to warrior version

[v3]
remove bitbake ref from meta-filesystems

[v4]
remove thud from LAYERSERIES_COMPAT
---
 README                           |  2 +-
 meta-filesystems/README          | 13 +++++--------
 meta-filesystems/conf/layer.conf |  2 +-
 meta-gnome/README                | 10 +++++-----
 meta-gnome/conf/layer.conf       |  2 +-
 meta-initramfs/README            |  8 ++++----
 meta-initramfs/conf/layer.conf   |  2 +-
 meta-multimedia/README           | 10 +++++-----
 meta-multimedia/conf/layer.conf  |  2 +-
 meta-networking/MAINTAINERS      | 32 +++-----------------------------
 meta-networking/README           |  6 +++---
 meta-networking/conf/layer.conf  |  2 +-
 meta-oe/README                   |  8 ++++----
 meta-oe/conf/layer.conf          |  2 +-
 meta-perl/README                 | 10 ++++------
 meta-perl/conf/layer.conf        |  2 +-
 meta-python/README               | 12 +++++-------
 meta-python/conf/layer.conf      |  2 +-
 meta-webserver/README            |  8 ++++----
 meta-webserver/conf/layer.conf   |  2 +-
 meta-xfce/README                 | 10 +++++-----
 meta-xfce/conf/layer.conf        |  2 +-
 22 files changed, 58 insertions(+), 91 deletions(-)

diff --git a/README b/README
index 7318f09..881115e 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index 87cb685..8723a0a 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -9,31 +9,28 @@ Dependencies
 
 This layer depends on:
 
-  URI: git://git.openembedded.org/bitbake
-  branch: master
-
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: warrior
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: warrior
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][warrior]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Warrior maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][warrior][PATCH
 
 
 Table of Contents
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 5aa2b0c..932cbf0 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud warrior"
+LAYERSERIES_COMPAT_filesystems-layer = "warrior"
diff --git a/meta-gnome/README b/meta-gnome/README
index 2a682e7..2e9e6bb 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -23,16 +23,16 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: warrior
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: warrior
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][warrior]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][warrior][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Warrior maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 0b68232..bb08847 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud warrior"
+LAYERSERIES_COMPAT_gnome-layer = "warrior"
 
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 79244d4..b56224e 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: warrior
 revision: HEAD
 
 
@@ -20,12 +20,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][warrior]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][warrior][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Warrior maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 6e0b00d..781b195 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud warrior"
+LAYERSERIES_COMPAT_meta-initramfs = "warrior"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 20f4fb8..7229948 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,19 +1,19 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: warrior
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe
-branch: master
+branch: warrior
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][warrior]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][warrior][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Warrior maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index e05a652..177a083 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
+LAYERSERIES_COMPAT_multimedia-layer = "warrior"
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 5c4c4ce..c029935 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][warrior]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][warrior][PATCH
 
-You may also contact the maintainers directly.
-
-Descriptions of section entries:
-
-        M: Mail patches to: FullName <address@domain>
-        F: Files and directories with wildcard patterns.
-           A trailing slash includes all files and subdirectory files.
-           F: recipes-devtools/    all files in and below recipes-devtools
-           F: recipes-selinux/*    all files in recipes-selinux, but not below
-           One pattern per line.  Multiple F: lines acceptable.
-
-Please keep this list in alphabetical order.
-
-Maintainers List (try to look for most precise areas first)
-
-COMMON
-M:      Khem Raj <raj.khem@gmail.com>
-M:      "Joe MacDonald (backup)" <joe@deserted.net>
-L:      openembedded-devel@lists.openembedded.org
-Q:      https://patchwork.openembedded.org/project/oe/
-S:      Maintained
-F:      conf
-F:      recipes-*
-
-NETKIT
-M:      Armin Kuster <akuster808@gmail.com>
-F:      recipes-netkit
+Warrior Maintainer:      Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d..71b48dd 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: warrior
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: warrior
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: warrior
 revision: HEAD
 
 Maintenance
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 67f58bc..00af015 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud warrior"
+LAYERSERIES_COMPAT_networking-layer = "warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/README b/meta-oe/README
index 0e9f842..1ce0915 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -4,13 +4,13 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: warrior 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][warrior]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe[warrior][PATCH'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -19,4 +19,4 @@ Other services like gitorious, repo.or.cz or self-hosted setups are of course ac
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+Warrior maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 31f2f17..bc90390 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
+LAYERSERIES_COMPAT_openembedded-layer = "warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/README b/meta-perl/README
index 67f2910..543e889 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: warrior
   revision: HEAD
   prio: default
 
@@ -75,14 +75,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][warrior]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][warrior][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Warrior maintainers: Armin kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 6e600aa..38c9a3e 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud warrior"
+LAYERSERIES_COMPAT_perl-layer = "warrior"
diff --git a/meta-python/README b/meta-python/README
index 705b035..961efc2 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -13,12 +13,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: warrior
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: warrior
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][warrior]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][warrior][PATCH'
 
 Maintenance
 -------------------------
 
-Layer Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Warrior Maintainers: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index fb5cda5..724f514 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud warrior"
+LAYERSERIES_COMPAT_meta-python = "warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..58b6310 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: warrior
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: warrior
 revision: HEAD
 
 
@@ -52,9 +52,9 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][warrior]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+Warrior Maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 0d69478..af71f60 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud warrior"
+LAYERSERIES_COMPAT_webserver = "warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 7431e8b..2362ecb 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: warrior
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: warrior
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][warrior]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][warrior][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Warrior Maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 6e9d892..2a4c87f 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud warrior"
+LAYERSERIES_COMPAT_xfce-layer = "warrior"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
-- 
2.7.4


