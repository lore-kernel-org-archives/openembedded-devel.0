Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.709.1588567351501355831
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 21:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=foq80RH9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x77so4979724pfc.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2020 21:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qp/DtumQh6YTAoaLUQZHo90wznJXkli4zpEy02sGAoc=;
        b=foq80RH9y8v2MVFXsWX+Pe5jHIlaCBoHcKDNdpI/5frb/oW55Yjlz3NCYfe6bnhKQr
         X1HByD82GDQNHgrpDskSdjAfbCwD2G86L2RzTG7r5JmauoGuP00nJ57zr3Uo5IsyXQn5
         gwTH4HXLlNyBriwoArW+MUaMJyOkLqZ5s/6Ioe0Q0zbLWH9cyY8x6GvtTduJOjbSp1t7
         3kTMQR7SZrOEk2JVEsg4JNARN8xy5VUtP1gL1tQpJY7m1dXrE4IBDoMqtHTT4yOZib0P
         8+zTNkVoRB/8swAGHl+HbjUiL+lK4LfY7KP1eBDFxoeazUXu9v5H05GfIWSZSiiALYNM
         JNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qp/DtumQh6YTAoaLUQZHo90wznJXkli4zpEy02sGAoc=;
        b=DNgO3eVEyhnWKqW+2KRMz6Y3FKZ/CSSoVOV4z22cZw5E28ful1HTYbFCwhh58/o66U
         nXZUGHWAXVcj0dx3TDWqLLofYLG0SOfSgcyk/tnzIMWhKYAks4sTWZwrETJYM2rG3qpm
         GsIQooWWt4PstM4Oe3Hx3xE7t1EKjyaahHXzmKnsoytmrEkCCrmAEryJRBWe2KdxjceJ
         FVbaDRW12MUgPVufw4PLWO4dqETYREebIbfqauLbKbT80ljiO2Qepsx7zlf/ywIVAnTB
         PpdQ1CjyUPEutSdRUKjHLgngnx2eRtvQ8UZv0D5P8wpHXECwnnOpbkQt4Bmh6L/rZNrc
         dUIQ==
X-Gm-Message-State: AGi0PuYXrhwr8WhL9iu2TCZZMjNb/tBXvPoqq7YQFeC2gZEqoQ9QVuFm
	cIdRI9OeIgLoNd3p0pRj2o/ONi6r
X-Google-Smtp-Source: APiQypIHgFyCq3SdgojUVqEAcuKhYopUsYGoucF2kYfpBZuREk8sYMyxJxYgYpZmwG4zBi13obIh6Q==
X-Received: by 2002:a62:aa04:: with SMTP id e4mr14915888pff.317.1588567350511;
        Sun, 03 May 2020 21:42:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:d8cc:ac72:24b0:3118])
        by smtp.gmail.com with ESMTPSA id w125sm6859273pgw.22.2020.05.03.21.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 21:42:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 1/1] README: updated Maintainers list for Dunfell
Date: Sun,  3 May 2020 21:42:27 -0700
Message-Id: <20200504044227.6314-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504044227.6314-1-akuster808@gmail.com>
References: <20200504044227.6314-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README                      |  2 +-
 meta-filesystems/README     | 10 +++++-----
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
 12 files changed, 48 insertions(+), 78 deletions(-)

diff --git a/README b/README
index 7318f09cdb..e8b30de36d 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+dunfell maintainer: Armin Kuster  <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index edcf8bfeef..4731d216fe 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: dunfell
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: dunfell
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][dunfell]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+dunfell maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][dunfell][PATCH
 
 
 Table of Contents
diff --git a/meta-gnome/README b/meta-gnome/README
index a11815fb15..6fdc5cf715 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -3,16 +3,16 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dunfell
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][dunfell]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][dunfell][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 79244d43f0..6d927fffa1 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 
@@ -20,12 +20,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][dunfell]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][dunfell][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+dunfell maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 3c4b1af7f4..1c08f9d9ff 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,19 +1,19 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe
-branch: master
+branch: dunfell
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][dunfell]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][dunfell][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
+dunfell maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 5c4c4ce052..3e151b821b 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][dunfell]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][dunfell][PATCH
 
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
+dunfell Maintainer:      Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d83b..52e7c79601 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: dunfell
 revision: HEAD
 
 Maintenance
diff --git a/meta-oe/README b/meta-oe/README
index 347816b0d1..10583aef27 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
@@ -14,10 +14,10 @@ e.g. on archlinux based distributions install prerequisites like below
 
 pacman -S lib32-gcc-libs lib32-glibc
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][dunfell]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dunfell][PATCH'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -26,4 +26,4 @@ Other services like gitorious, repo.or.cz or self-hosted setups are of course ac
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+dunfell maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 67f291079f..fed2da3451 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: dunfell
   revision: HEAD
   prio: default
 
@@ -75,14 +75,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][dunfell]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][dunfell][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+dunfell maintainers: Armin kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 705b035d9e..237dff3021 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -13,12 +13,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: dunfell
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: dunfell
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][dunfell]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][dunfell][PATCH'
 
 Maintenance
 -------------------------
 
-Layer Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+dunfell Maintainers: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630700..7adeff833a 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: dunfell
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: dunfell
 revision: HEAD
 
 
@@ -52,9 +52,9 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][dunfell]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+dunfell Maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 70ad47a2d1..eaa17175d6 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: dunfell
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][dunfell]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][dunfell][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
+dunfell Maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.17.1

