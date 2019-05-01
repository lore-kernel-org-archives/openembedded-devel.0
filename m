Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 946447D39C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 14:52:01 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z8so8297576pln.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQjMIYuSSdD5khbKg5Q7gLebyU5P8MGunbG5NHkeMv0=;
	b=r/0zjCf8XwIjhGJpYHvzoT3rBqdX8NIPIitW3SNNzdmQphGUBvXXKUfDAYFaGsB6R+
	+NkIsXTdx4pnMIudXl6IJhu1pHRVadhxGc3Ewc3IvV6QJ0A72o1RTxvoyVXwiqKemEuC
	QlMDccPZYMdvo1S34hBBhtJtjIoRZ+epBl/3Vkzfjcd9EyOH+mf2OM6KqtODlfTiFpXe
	l5Hqo+k9f/ilFpJRkM3XRFzja9Xml42e81vz1lFgpXDnD0yCEys4JbchIXsB7071UbbQ
	jFWfWpl4PoLD5cgRoqvaW7zHNR9MK/RwQYs0NTaOpSixjycKABtrQO7e1beMrUEyyeuv
	M0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQjMIYuSSdD5khbKg5Q7gLebyU5P8MGunbG5NHkeMv0=;
	b=EOkXNSUhjHIFCfcZtlc7U05xMPgJwJakAaQG9YaCZaeAEk+oZ4s0sjk9RhglfQfM+N
	SBX3Ja+n/P4/78j/6uHQfezcGstn6cjqJy3DP5SzcpGp0hMn+ewirWkZEImQDkC+2rnU
	DDszaFmYrZwVOd39jhz1QbyGRqfYl3THYHlRGbWx2DQ1J1oIRM5BOUAXpBrv19DbPkpm
	C7xiqJyP5Er2sdmWMyP/HIEw/EPd37s6VQRZZu0WLQgmw0cF3NSOqj3+SLm0KGMA/OOd
	akyYWaEr6DCqnDslY1NP7wXeKmLCpsfLnTt/OmzXvK5HJHo2WmxNRQ9GVi2gVtJ60C/n
	fP+w==
X-Gm-Message-State: APjAAAUP9F1tBtyhCSvLeRIRCD/EBOu/ic8L108rpcSN9IjuNf5orsI3
	dFLA0fRj/9bzhJSS7YfSpaql9EaD
X-Google-Smtp-Source: APXvYqzbtnHQdsnrcaM03KT7LDlxrKQFj7MU7Rq7A63XYQOoJIdaSQw1CYZeA3Sct7AyDTBajpeyyA==
X-Received: by 2002:a17:902:20c9:: with SMTP id
	v9mr77368483plg.239.1556722322160; 
	Wed, 01 May 2019 07:52:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:8977:bf2:211e:20be])
	by smtp.gmail.com with ESMTPSA id
	f2sm77995454pgc.30.2019.05.01.07.52.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 07:52:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 07:52:00 -0700
Message-Id: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 14:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README                      |  2 +-
 meta-filesystems/README     | 12 ++++++------
 meta-gnome/README           | 10 +++++-----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 10 +++++-----
 meta-networking/MAINTAINERS | 32 +++-----------------------------
 meta-networking/README      |  6 +++---
 meta-oe/README              |  8 ++++----
 meta-perl/README            | 10 ++++------
 meta-python/README          | 12 +++++-------
 meta-webserver/README       |  8 ++++----
 meta-xfce/README            | 10 +++++-----
 12 files changed, 49 insertions(+), 79 deletions(-)

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
index 87cb685..d9f07df 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,30 +10,30 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.40
 
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
-- 
2.7.4


