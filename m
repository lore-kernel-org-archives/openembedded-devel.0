Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6183.1589291728214996517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=R5eJWlTy;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpQ3LnhzJm
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291726;
	bh=HQ4vr6wYAU/I0enHlDQ5nWoHhgGmgSNI0dbIwYavaow=;
	h=From:To:Subject:Date:From;
	b=R5eJWlTy45qPOfCCFi0MzzCunUZt6V0np50ql+ihv4l9dwa+nH7wqvlN8siuNxF2a
	 btapLaXvksFHBTJNMHQeXKV4cL1I7xQVQ0r4g74ONBEKOceNH0RaCPXxfYnv/Y3XKU
	 zVnhtrFN3+TCDI1JL34Rm4PEoWQUTgMVr9vYJ+J/HV+p8loxGjGeAKVzll3KRZK6vu
	 aJrdo03FZDE6y4GOf+7gSMT3Kzn04XGl0VHktEmiKJs7bpr/uIzvrKa9bmhw4sUY3B
	 IJhzOSIas1ww0HbLOPu8+MYSGcDSXN0ly6bAE2xKw09Lygn6bxVDoh5/HlCO7v0AOp
	 0I6Rre419CqrH4LwnmYuWBzeulY0DWX8VfWSoXlyvM8tUnhmaKDMe+JrtBdNeR3HGN
	 3sW8utMCnYIU+cLEe413CtwYeWj1FMa5KMGyf3/P506+OCsIA26MEPya5tH8jEq+Ru
	 PPCl4x7GwxXAC2AZZzhrvp6GZdeeR6jpP/lZ1qvPj76a4TIVcV+HIF6QciljkMazaW
	 w5S/dyiU7LDUfVrOAz78+IuUUtDXZZdraSdkm68sanyvz58Hn2ZzeubgZTXttYJShA
	 T+YJoZUMrHbE0IWPhpkuNIPMa3ThaAF21c9dzExCRdwa1ASRiT7uWfY11f4OZLpn0s
	 wGs+ZXHoIFdr49hpKm7YHmno=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] matchbox-wm: Replace -fcommon with fix
Date: Tue, 12 May 2020 16:55:20 +0300
Message-Id: <20200512135523.19970-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Fix-build-with-gcc-10.patch          | 40 +++++++++++++++++++
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  3 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..14dafc284c
--- /dev/null
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
@@ -0,0 +1,40 @@
+From 8a8f8446e803cad04d7bbceaab78ee45d9778c3c Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Tue, 12 May 2020 09:44:05 +0300
+Subject: Fix build with gcc 10
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/mbtheme.h | 2 +-
+ src/structs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mbtheme.h b/src/mbtheme.h
+index aa9a7c5..ad03bde 100644
+--- a/src/mbtheme.h
++++ b/src/mbtheme.h
+@@ -46,7 +46,7 @@ typedef struct _mb_theme_param
+ 
+ } MBThemeParam;
+ 
+-enum {
++typedef enum {
+   LAYER_GRADIENT_HORIZ = 1,
+   LAYER_GRADIENT_VERT,
+   LAYER_LABEL,
+diff --git a/src/structs.h b/src/structs.h
+index 24985e7..8f53e72 100644
+--- a/src/structs.h
++++ b/src/structs.h
+@@ -148,7 +148,7 @@
+ 
+ /* Atoms, if you change these check ewmh_init() first */
+ 
+-enum {
++typedef enum {
+   WM_STATE = 0,
+   WM_CHANGE_STATE,
+   WM_PROTOCOLS,
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 675ee40fa4..a08eb252ce 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+           file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
@@ -21,8 +22,6 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-CFLAGS += "-fcommon"
-
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
                ${sysconfdir}/matchbox \
-- 
2.17.1

