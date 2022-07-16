Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B335C43334
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 17:02:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.7422.1657990969907177723
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 10:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZUvhKKMv;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s206so7056119pgs.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwZc5XPAJijvKiHY7SNLHRAmooHY7rep4vUgEwezeuY=;
        b=ZUvhKKMvXxk30VN4CehNBlLOG86rLO3wa4766AoomWVg1h5bTPP2Z0VXfkDxVhYADg
         CVr7QzxKUYionLE8aHSU1F6C00yzLfvf7QHpZcvDj0W723Qf6jijZ7kh0lMcvBP0jwot
         Ep2Hg3Uj4TF/ipwzROORvnWyY+xUrRVD7VkmjD/ZMpyVQmw9wbHQtHS8yXnD4fEe3GQC
         dyMIY2CAyq3gKX7IfN+CZ3zsRvctBKg4ywHT3t610f0x4mDJNsWt3M+PrhkaVXBWcxJQ
         nKRTIxCenOFVpTLdfwtoBbl+J3WRvG7N3sWcWVEMDftu9vu/ggq2i3nV9ztL7rkfpY5S
         dDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwZc5XPAJijvKiHY7SNLHRAmooHY7rep4vUgEwezeuY=;
        b=ofGhMb1er+ck2zlPF5xb6RgfzXvGg/MHuhJQe/KGoQKd0Thl1+UZ7qwZrriVXBnaml
         WPxEtGy8FzYipvyKUqTOx93OrEbWYWOctDgHy4Wf9KBFkuXdxB4FEQGwNPyVk156AzxR
         o5Ju2F0z/2zkpf9uDGAIVhkeZsn/hbcxJcxUlcQRE9z2aa2UokQ1Il+j9sBJf2XhiNcf
         qS3UprYpgQM2YCB+WC/2f2Zjm5XQhKipQtspX0ORCopvqBwYx44nRUB6B0bfuNjBx1ZE
         YGGVQioTda6zdbrIJNxn6S/GB1EB4a+ayu3FoI4sd94G8LdmL19ZBqg5YantRAjHzmej
         XZRg==
X-Gm-Message-State: AJIora/4gID9DxewpYb5YxyC5VGY5jhNnEnpgPOQBOMbY0405oLZUQlb
	GnfoDai8lnEN5eE7I8X34nz5rXHOPJRFFQ==
X-Google-Smtp-Source: 
 AGRyM1sE6kUKFinWk7qq1Q6kACooOJc97IdYds5nJWT4N37rz2huFM19VONpt9PZu7U5N3pW5hCMaQ==
X-Received: by 2002:a05:6a00:319c:b0:52a:ccb2:ee0b with SMTP id
 bj28-20020a056a00319c00b0052accb2ee0bmr19911949pfb.59.1657990968819;
        Sat, 16 Jul 2022 10:02:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 q93-20020a17090a756600b001f061359022sm7860562pjk.54.2022.07.16.10.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 10:02:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xscreensaver: Upgrade to 6.04
Date: Sat, 16 Jul 2022 10:02:45 -0700
Message-Id: <20220716170245.4096889-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 17:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97855

Forward port patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ts.patch => 0001-Tweak-app-defaults.patch} | 31 ++++++++++++++++---
 ...=> 0002-build-Do-not-build-po-files.patch} | 25 ++++++++++-----
 ...reensaver_6.01.bb => xscreensaver_6.04.bb} |  6 ++--
 3 files changed, 46 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-graphics/xscreensaver/files/{tweak-app-defaults.patch => 0001-Tweak-app-defaults.patch} (91%)
 rename meta-oe/recipes-graphics/xscreensaver/files/{0001-build-Do-not-build-po-files.patch => 0002-build-Do-not-build-po-files.patch} (65%)
 rename meta-oe/recipes-graphics/xscreensaver/{xscreensaver_6.01.bb => xscreensaver_6.04.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
similarity index 91%
rename from meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
rename to meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
index 4ce2faed5d..932d221890 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
@@ -1,3 +1,16 @@
+From f2c592352360e52a7c817a1adcc8b09fd92cd941 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Jul 2022 09:58:24 -0700
+Subject: [PATCH 1/2] Tweak app defaults
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ driver/XScreenSaver.ad.in | 259 +-------------------------------------
+ 1 file changed, 6 insertions(+), 253 deletions(-)
+
+diff --git a/driver/XScreenSaver.ad.in b/driver/XScreenSaver.ad.in
+index 2d43407..8ce65e9 100644
 --- a/driver/XScreenSaver.ad.in
 +++ b/driver/XScreenSaver.ad.in
 @@ -29,7 +29,7 @@
@@ -32,7 +45,7 @@
  *splashDuration:	0:00:05
  *visualID:		default
  *installColormap:	True
-@@ -324,250 +324,8 @@ XScreenSaver.bourneShell:		/bin/sh
+@@ -324,255 +324,8 @@ XScreenSaver.bourneShell:		/bin/sh
  !=============================================================================
  
  *programs:								      \
@@ -74,7 +87,7 @@
 -				munch -root				    \n\
 -				penrose -root				    \n\
 -@GL_KLUDGE@ GL: 				pipes -root				    \n\
--				rd-bomb -root				    \n\
+-				rdbomb -root				    \n\
 -@GL_KLUDGE@ GL: 				rubik -root				    \n\
 --				sierpinski -root			    \n\
 -				slip -root				    \n\
@@ -277,11 +290,19 @@
 -@GL_KLUDGE@ GL: 				etruscanvenus -root			    \n\
 -@GL_KLUDGE@ GL: 				gibson -root				    \n\
 -@GL_KLUDGE@ GL: 				headroom -root				    \n\
--@GL_KLUDGE@ GL: 				sphereeversion -root			    \n
--
+-@GL_KLUDGE@ GL: 				sphereeversion -root			    \n\
+-				binaryhorizon -root			    \n\
+-				marbling -root				    \n\
+-@GL_KLUDGE@ GL: 				chompytower -root			    \n\
+-@GL_KLUDGE@ GL: 				mapscroller -root			    \n\
+-@GL_KLUDGE@ GL: 				nakagin -root				    \n\
+-@GL_KLUDGE@ GL: 				squirtorus -root			    \n
 -
 +-				fontglide -root -program "date +'%F %H:%M %z'"
 +				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-black.gif
  
+ 
  !=============================================================================
- !
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch b/meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
similarity index 65%
rename from meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
rename to meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
index 7703a43204..0ceba7be02 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
@@ -1,18 +1,22 @@
-From 19bd0a979677a81d7399d5b567998398ec81f38b Mon Sep 17 00:00:00 2001
+From 6b5d022f6dd9848a2d5ca08a1968929b8c140981 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jul 2021 15:40:10 -0700
-Subject: [PATCH] build: Do not build po files
+Date: Sat, 16 Jul 2022 09:59:40 -0700
+Subject: [PATCH 2/2] build: Do not build po files
 
 Fixes
 | make[1]: Entering directory '/mnt/b/yoe/master/build/tmp/work/cortexa57-yoe-linux/xscreensaver/6.01-r0/xscreensaver-6.01/po'
 | make[1]: *** No rule to make target 'default'.  Stop.
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.in | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ Makefile.in        | 5 ++---
+ driver/Makefile.in | 2 +-
+ 2 files changed, 3 insertions(+), 4 deletions(-)
 
+diff --git a/Makefile.in b/Makefile.in
+index 9de79b2..1c1d16c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -6,8 +6,8 @@ srcdir		= @srcdir@
@@ -26,14 +30,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  SUBDIRS2	= $(SUBDIRS) OSX android
  TARFILES	= README README.hacking INSTALL \
  		  configure configure.ac Makefile.in config.h.in \
-@@ -451,4 +451,3 @@ cerebrum::
- 	--include 'configure*' \
+@@ -461,4 +461,3 @@ cerebrum::
+ 	--include 'ad2c' \
  	--include '*/' \
  	--exclude '*'
 -
+diff --git a/driver/Makefile.in b/driver/Makefile.in
+index e1fa1b2..feca6fc 100644
 --- a/driver/Makefile.in
 +++ b/driver/Makefile.in
-@@ -212,7 +212,7 @@ TEST_EXES	= test-passwd   test-uid
+@@ -211,7 +211,7 @@ TEST_EXES	= test-passwd   test-uid        test-xdpms      test-grab     \
  		  xdpyinfo      test-screens    test-yarandom   test-xinput   \
  	          test-xkb
  
@@ -42,3 +48,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  UTIL_EXES	= xscreensaver-gfx @EXES_SYSTEMD@
  SETUID_EXES	= xscreensaver-auth
  DEMO_EXES	= @ALL_DEMO_PROGRAMS@
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
rename to meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index 2ab5297949..e570f8d9fe 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -4,12 +4,12 @@ LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=c3ce41cdff745eb1dc9d4fcfbffb4d51"
 
 SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "085484665d91f60b4a1dedacd94bcf9b74b0fb096bcedc89ff1c245168e5473b"
+SRC_URI[sha256sum] = "787014b29f0c5793ecc2d93e1109a049ff48ab0c29b851dab34f683ceef6b152"
 
 SRC_URI += " \
     file://xscreensaver.service \
-    file://0001-build-Do-not-build-po-files.patch \
-    file://tweak-app-defaults.patch \
+    file://0001-Tweak-app-defaults.patch \
+    file://0002-build-Do-not-build-po-files.patch \
 "
 
 DEPENDS = "intltool-native libx11 libxext libxt libxft libxi glib-2.0-native bc-native libpam"
-- 
2.37.1


