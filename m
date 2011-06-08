Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBxo-0007b9-Nc
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:10:00 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so160340bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=n1EkM5oyHzJHqLoMd2nrGyj2j519QdgZDxCQO2SQUUc=;
	b=s0K4vmiQvo50lK/NM9/NwJTq2VdQYGyO53sJYm+9rXi0KffHiK1Y9muYEKr2NqyV9c
	qtPa8vh50XpPvBt0rrjIBQ4TGT8cAjJVZXxAHbYUFbkI4L0N9w/5mCP6MuZ2mYrpUOQd
	jGlWLw8GapoM3p8IvPlImrqX63E38ofT/UYX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eJPASuZrW7AfhZlz9+IsljOWLOaKAjWyXr/1z2NfeMMcJj3NG7I2w9M1Kv2NLjSBM5
	aNJUaoIvn652060GMgu3dQMAWwXJQqYw+RqmQldQQ91vtvGhYoEdrJqoslFOL/VU6yLN
	am4HIXj0Fd75qiQqq2SZVpkf4tgpXSL1g59+Y=
Received: by 10.204.136.210 with SMTP id s18mr176556bkt.56.1307513204890;
	Tue, 07 Jun 2011 23:06:44 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ek1sm202480bkb.21.2011.06.07.23.06.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:06:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:06:39 +0200
Message-Id: <9b79d5dee5765c2d9e8a1489244eccdfb0870e12.1307513108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1307513108.git.Martin.Jansa@gmail.com>
References: <cover.1307513108.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/3] e-base, e-wm: bump EFL_SRCREV and remove illume1 from e-wm
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
X-List-Received-Date: Wed, 08 Jun 2011 06:10:00 -0000

* illume1 and it's theme were removed in r59932, r59933, r59936, r59982

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e17/e-wm/illume-disable-screensaver.patch      |   13 -------------
 .../recipes-efl/e17/e-wm/illume-flaunch-fix.patch  |   15 ---------------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   17 +----------------
 4 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 26639f6..e87a96b 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "59463"
+EFL_SRCREV ?= "59985"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
diff --git a/meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch b/meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch
deleted file mode 100644
index 984895c..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/illume-disable-screensaver.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: e/config/illume/e.src
-===================================================================
---- e.orig/config/illume/e.src	2009-01-30 23:34:37.000000000 +0100
-+++ e/config/illume/e.src	2009-01-30 23:34:54.000000000 +0100
-@@ -665,7 +665,7 @@
-   value "display_res_height" int: 1;
-   value "display_res_hz" int: 0;
-   value "display_res_rotation" int: 0;
--  value "screensaver_enable" int: 1;
-+  value "screensaver_enable" int: 0;
-   value "screensaver_timeout" int: 30;
-   value "screensaver_interval" int: 5;
-   value "screensaver_blanking" int: 2;
diff --git a/meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch b/meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch
deleted file mode 100644
index 5aab3b5..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/illume-flaunch-fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- e/src/modules/illume/e_flaunch.c	2010-02-09 22:33:25.000000000 +0100
-+++ e/src/modules/illume/e_flaunch.c	2010-02-09 22:33:25.000000000 +0100
-@@ -97,10 +97,10 @@
-    int num = 0, max, count;
-    
-    // FIXME: 3 should become config here
--   max = 10;
-+   max = 3;
-    // for now just look for any apps in "category" 'Bar' and add the first 3
-    // FIXME: category should be configurable... 
--   bar_desktops = efreet_util_desktop_category_list("System");
-+   bar_desktops = efreet_util_desktop_category_list("Bar");
-    if (bar_desktops)
-      {
- 	Efreet_Desktop *desktop;
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index baed233..b32634d 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -17,9 +17,7 @@ SRC_URI = "\
 "
 
 SRC_URI_append_shr = " \
-  file://illume-disable-screensaver.patch \
   file://wizard-module-skipping.patch \
-  file://illume-flaunch-fix.patch \
 "
 
 EXTRA_OECONF = "\
@@ -69,14 +67,12 @@ RREPLACES_${PN} = "systray"
 
 PACKAGES =+ "\
   ${PN}-config-default \
-  ${PN}-config-illume \
   ${PN}-config-illume2 \
   ${PN}-config-minimalist \
   ${PN}-config-netbook \
   ${PN}-config-scaleable \
   ${PN}-config-standard \
   ${PN}-theme-default \
-  ${PN}-theme-illume \
   ${PN}-background-dark-gradient \
   ${PN}-background-light-gradient \
   ${PN}-images \
@@ -104,14 +100,12 @@ RRECOMMENDS_${PN} = "\
 "
 
 PACKAGE_ARCH_${PN}-config-default = "all"
-PACKAGE_ARCH_${PN}-config-illume = "all"
 PACKAGE_ARCH_${PN}-config-illume2 = "all"
 PACKAGE_ARCH_${PN}-config-minimalist = "all"
 PACKAGE_ARCH_${PN}-config-netbook = "all"
 PACKAGE_ARCH_${PN}-config-scaleable = "all"
 PACKAGE_ARCH_${PN}-config-standard = "all"
 PACKAGE_ARCH_${PN}-theme-default = "all"
-PACKAGE_ARCH_${PN}-theme-illume = "all"
 PACKAGE_ARCH_${PN}-background-dark-gradient = "all"
 PACKAGE_ARCH_${PN}-background-light-gradient = "all"
 PACKAGE_ARCH_${PN}-images = "all"
@@ -142,14 +136,12 @@ FILES_${PN} = "\
 "
 
 FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
-FILES_${PN}-config-illume = "${datadir}/enlightenment/data/config/illume"
-FILES_${PN}-config-illume2 = "${datadir}/enlightenment/data/config/illume-home"
+FILES_${PN}-config-illume2 = "${datadir}/enlightenment/data/config/illume"
 FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist"
 FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
 FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
 FILES_${PN}-config-standard = "${datadir}/enlightenment/data/config/standard"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
-FILES_${PN}-theme-illume = "${datadir}/enlightenment/data/themes/illume.edj"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
 FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
@@ -181,14 +173,7 @@ FILES_illume-keyboard-default-terminal = "\
 "
 
 RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-illume = "\
-  ${PN}-theme-illume \
-  illume-keyboard-default-alpha \
-  illume-keyboard-default-numeric \
-  illume-keyboard-default-terminal \
-"
 RRECOMMENDS_${PN}-config-illume2 = "\
-  ${PN}-theme-illume \
   illume-keyboard-default-alpha \
   illume-keyboard-default-numeric \
   illume-keyboard-default-terminal \
-- 
1.7.5.3



