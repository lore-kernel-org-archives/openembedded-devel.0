Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6Gh-0006fd-VT
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:04 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BqzSn3uNDKKrot0q5RtAblzWUoFZp5FKrLPLTjvjuKk=;
	b=RoIV1YP34CiVmPphVqhzNIUcdBY+wFAGvu0PMJ27BT7jQGnIl2lH/icpesAs3JRiYp
	vS9TtBevFWQ/iD7iOhbIx8PNcl3iOK3bmboiVf2ZSCvhliNEXObt1GFDDl7JwUsDNBxh
	K97G65ObCY+jeYnMzU5zhuC+Rn6zqXKOyI1P8=
Received: by 10.223.5.66 with SMTP id 2mr12797036fau.26.1319884203446;
	Sat, 29 Oct 2011 03:30:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k16sm23364952fab.8.2011.10.29.03.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:03 +0200
Message-Id: <1881c344694290d71556dec7d9e784b6819f7a17.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 07/12] e-base: bump EFL_SRCREV and refresh patches and elementary version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Oct 2011 10:36:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    2 +-
 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch   |   12 -----
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   44 ++++++++++++-------
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    1 -
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    3 +-
 5 files changed, 30 insertions(+), 32 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index ed08105..18df79b 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "64150"
+EFL_SRCREV ?= "64506"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
diff --git a/meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch b/meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch
deleted file mode 100644
index 3d04453..0000000
--- a/meta-efl/recipes-efl/efl/ecore/exit_uclibc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr ecore.orig//src/lib/ecore_con/ecore_con_info.c ecore/src/lib/ecore_con/ecore_con_info.c
---- ecore.orig//src/lib/ecore_con/ecore_con_info.c	2010-08-13 14:31:18.000000000 +0200
-+++ ecore/src/lib/ecore_con/ecore_con_info.c	2010-08-13 14:49:37.000000000 +0200
-@@ -283,7 +283,7 @@
-         
-         err = write(fd[1], "", 1);
-         close(fd[1]);
--#ifdef __USE_ISOC99
-+#if defined(__USE_ISOC99) && !defined(__UCLIBC__)
-         _Exit(0);
- #else
-         _exit(0);
diff --git a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
index 216b5a5..a2ce285 100644
--- a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
+++ b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
@@ -1,25 +1,34 @@
-#
-# The whole ecore-fb init logic is somewhat flawed; with this patch we
-# get at least a working touchscreen w/ tslib again.
-#
-# Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-#
+From c36cd1201711560b914e567922903083c3b46ff1 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Oct 2011 00:16:55 +0200
+Subject: [PATCH] ecore-fb: fix ts init
 
-diff --git ecore.old/src/lib/ecore_fb/ecore_fb.c ecore/src/lib/ecore_fb/ecore_fb.c
-index 77071e3..a4e1c5d 100644
---- ecore.old/src/lib/ecore_fb/ecore_fb.c
-+++ ecore/src/lib/ecore_fb/ecore_fb.c
-@@ -46,6 +46,9 @@ ecore_fb_init(const char *name __UNUSED__)
+Upstream-Status: Pending
+
+The whole ecore-fb init logic is somewhat flawed; with this patch we
+get at least a working touchscreen w/ tslib again.
+
+Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/lib/ecore_fb/ecore_fb.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/lib/ecore_fb/ecore_fb.c b/src/lib/ecore_fb/ecore_fb.c
+index ca7d73d..5b99989 100644
+--- a/src/lib/ecore_fb/ecore_fb.c
++++ b/src/lib/ecore_fb/ecore_fb.c
+@@ -39,6 +39,9 @@ ecore_fb_init(const char *name __UNUSED__)
     if (!ecore_fb_vt_init())
        return --_ecore_fb_init_count;
  
 +   if (!ecore_fb_ts_init())
-+     return --_ecore_fb_init_count;
++      return --_ecore_fb_init_count;
 +
-    ECORE_FB_EVENT_KEY_DOWN          = ecore_event_type_new();
-    ECORE_FB_EVENT_KEY_UP            = ecore_event_type_new();
-    ECORE_FB_EVENT_MOUSE_BUTTON_DOWN = ecore_event_type_new();
-@@ -72,6 +75,7 @@ ecore_fb_shutdown(void)
+    _ecore_fb_size_get(&_ecore_fb_console_w, &_ecore_fb_console_h);
+ 
+    return _ecore_fb_init_count;
+@@ -59,6 +62,7 @@ ecore_fb_shutdown(void)
     if (--_ecore_fb_init_count != 0)
        return _ecore_fb_init_count;
  
@@ -27,3 +36,6 @@ index 77071e3..a4e1c5d 100644
     ecore_fb_vt_shutdown();
  
     return _ecore_fb_init_count;
+-- 
+1.7.7.1
+
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 99fb3e2..c71c1b9 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -7,7 +7,6 @@ DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
-  file://exit_uclibc.patch \
   file://fix-ecore-fb-initialization.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 1034e0f..6162abd 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cdc6c12b238ccd62635a7517dfe89438"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
-PV = "0.7.0+svnr${SRCPV}"
-PR = "r12"
+PV = "0.8.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
-- 
1.7.7.1



