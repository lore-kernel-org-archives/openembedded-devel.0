Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0DWE-0005yn-Hj
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:45:38 +0100
Received: by bwz10 with SMTP id 10so2305178bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 06:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=G8OS7SxLZoNPHJXnXMPo5a+x50mU73OPJTCIvi4oAf4=;
	b=t5QUoIf8OGFg683n6v03moCnKSMi+0pAkxj8giJln0OOM/WUsuYRdM48vL0raHzuAr
	VN6DMroSmbq3gAqcQ1N3VWuFcFPI+5VTvYTQoL46XUa+NwTzg+V9Uz7ElWIibqaYpdh0
	cQunqfIcOh9izVtQDozqyQ70IoqMqweGkX3Xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Okxlp/SKUrMJdzl4fjiocHoly2eW6PnOmduO5uY0ilao2VQZPLSvdeP3SwHQxpGgKQ
	ULHlCkOjkCyXxDX9kXX4HiwRlbrQeBKs6L1WBBm6Me+E0rnsijY+uLJMwJTDtRFEEPAf
	fXt8H5O4WHURjIjR5SFuTx7jW+Z7zsQ+IGHy0=
Received: by 10.204.19.66 with SMTP id z2mr1179592bka.178.1300369434103;
	Thu, 17 Mar 2011 06:43:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm1377230bkx.7.2011.03.17.06.43.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 06:43:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 14:43:47 +0100
Message-Id: <1300369427-3287-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300367747-29308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300367747-29308-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] e-wm: use ESYSACTIONS, EMENU, ECONFIG, ETHEME variables instead of hardcoded e-wm-sysactions/e-wm-menu runtime dependency
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
X-List-Received-Date: Thu, 17 Mar 2011 13:45:38 -0000

* ILLUME_THEME/ILLUME_CONFIG were renamed to ETHEME/ECONFIG to use the
  same variable names as task-demo-x11/task-beagleboard-*

* e-wm-sysactions-shr doesn't need RPROVIDES anymore

* fixes last multiple providers notice I had
  NOTE: multiple providers are available for runtime e-wm-sysactions (e-wm, e-wm-sysactions-shr)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match e-wm-sysactions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/shr.conf                          |    6 ++++--
 recipes/e17/e-wm_svn.bb                       |    6 ++++--
 recipes/freesmartphone/menu-freesmartphone.bb |    4 ++--
 recipes/images/fso-illume-image.bb            |    2 +-
 recipes/images/fso-image.inc                  |    2 +-
 recipes/images/illume-image.bb                |   14 ++++++++------
 recipes/shr/e-wm-config-illume2-shr_git.bb    |    9 ++++++---
 recipes/shr/e-wm-sysactions-shr_git.bb        |    4 +---
 recipes/tasks/task-shr-minimal.bb             |    3 +--
 recipes/tasks/task-x11-illume.bb              |    8 ++++----
 10 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index be2441a..6e0e728 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -115,8 +115,10 @@ IMAGE_INITSCRIPTS = "initscripts-shr"
 IPKG_VARIANT = "opkg"
 
 #Illume settings
-ILLUME_CONFIG = "e-wm-config-illume2-shr"
-ILLUME_THEME = "e-wm-theme-illume-gry"
+ESYSACTIONS = "e-wm-sysactions-shr"
+EMENU = "e-wm-menu-shr"
+ECONFIG = "e-wm-config-illume2-shr"
+ETHEME = "e-wm-theme-illume-gry"
 
 # From minimal.conf
 
diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index e8f6b1e..b7ce1b1 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r18"
+PR = "r19"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives
@@ -91,13 +91,15 @@ PACKAGES =+ "\
   illume-keyboard-default-terminal \
 "
 
+ESYSACTIONS ?= "${PN}-sysactions"
+
 RRECOMMENDS_${PN} = "\
   ${PN}-config-default \
   ${PN}-images \
   ${PN}-icons \
   ${PN}-other \
   ${PN}-input-methods \
-  ${PN}-sysactions \
+  ${ESYSACTIONS} \
 "
 
 PACKAGE_ARCH_${PN}-config-default = "all"
diff --git a/recipes/freesmartphone/menu-freesmartphone.bb b/recipes/freesmartphone/menu-freesmartphone.bb
index 2d1f614..3dfcc3b 100644
--- a/recipes/freesmartphone/menu-freesmartphone.bb
+++ b/recipes/freesmartphone/menu-freesmartphone.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "XDG menu file for the freesmartphone.org project"
 LICENSE = "PD"
 PV = "0.1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "file://applications.menu"
 
@@ -10,7 +10,7 @@ do_install() {
     install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
 }
 
-RPROVIDES_${PN} = "e-wm-menu"
+RCONFLICTS_${PN} = "e-wm-menu"
 CONFFILES_${PN} = "${sysconfdir}/xdg/menus/applications.menu"
 FILES_${PN} = "${sysconfdir}/xdg/menus/applications.menu"
 
diff --git a/recipes/images/fso-illume-image.bb b/recipes/images/fso-illume-image.bb
index 189c8cb..6b85e23 100644
--- a/recipes/images/fso-illume-image.bb
+++ b/recipes/images/fso-illume-image.bb
@@ -14,7 +14,7 @@ BASE_INSTALL = "\
   task-base \
 "
 
-ILLUME_THEME = "illume-theme-fso"
+ETHEME = "illume-theme-fso"
 
 X_INSTALL = "\
   task-x11-illume \
diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
index 5311f84..e4d4e3d 100644
--- a/recipes/images/fso-image.inc
+++ b/recipes/images/fso-image.inc
@@ -9,7 +9,7 @@ BASE_INSTALL = "\
   task-base \
 "
 
-ILLUME_THEME = "illume-theme-freesmartphone"
+ETHEME = "illume-theme-freesmartphone"
 
 X_INSTALL = "\
   task-x11-illume \
diff --git a/recipes/images/illume-image.bb b/recipes/images/illume-image.bb
index e01ef27..3f146c6 100644
--- a/recipes/images/illume-image.bb
+++ b/recipes/images/illume-image.bb
@@ -8,8 +8,10 @@ IMAGE_LINGUAS = "en-us de-de fr-fr pt-br ca-es zh-cn zh-tw bg-bg cs-cz da-dk nl-
 SPLASH = "exquisite exquisite-themes exquisite-theme-illume"
 
 # Default illume theme
-ILLUME_THEME ?= "e-wm-theme-illume"
-ILLUME_CONFIG ?= "e-wm-config-illume2"
+ETHEME ?= "e-wm-theme-illume"
+ECONFIG ?= "e-wm-config-illume2"
+ESYSACTIONS ?= "e-wm-sysactions"
+EMENU ?= "e-wm-menu"
 
 # getting the base system up
 BASE_INSTALL = "\
@@ -42,10 +44,10 @@ X_INSTALL = "\
   shared-mime-info \
   mime-support \
   e-wm \
-  e-wm-menu \
-  e-wm-sysactions \
-  ${ILLUME_CONFIG} \
-  ${ILLUME_THEME} \
+  ${EMENU} \
+  ${ESYSACTIONS} \
+  ${ECONFIG} \
+  ${ETHEME} \
   e-wm-config-standard \
   e-wm-config-netbook \
   e-wm-config-minimalist \
diff --git a/recipes/shr/e-wm-config-illume2-shr_git.bb b/recipes/shr/e-wm-config-illume2-shr_git.bb
index 4d9176f..692d979 100644
--- a/recipes/shr/e-wm-config-illume2-shr_git.bb
+++ b/recipes/shr/e-wm-config-illume2-shr_git.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT BSD"
 RDEPENDS_${PN} = "shr-e-gadgets"
 SRCREV = "b166fa3c8f7160c0102877d32ee3ad09c8afaa7d"
 PV = "1.2+gitr${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 inherit e
 
@@ -19,9 +19,12 @@ EXTRA_OECONF = "\
 
 FILES_${PN} = "${datadir}/enlightenment/data/config/illume2-shr"
 
+ESYSACTIONS ?= "e-wm-sysactions"
+EMENU ?= "e-wm-menu"
+
 RRECOMMENDS_${PN} = "\
-  e-wm-sysactions-shr \
-  e-wm-menu-shr \
+  ${ESYSACTIONS} \
+  ${EMENU} \
   illume-keyboard-default-alpha \
   illume-keyboard-numeric-alt \
   illume-keyboard-default-terminal \
diff --git a/recipes/shr/e-wm-sysactions-shr_git.bb b/recipes/shr/e-wm-sysactions-shr_git.bb
index 68d5b30..6f5da4c 100644
--- a/recipes/shr/e-wm-sysactions-shr_git.bb
+++ b/recipes/shr/e-wm-sysactions-shr_git.bb
@@ -3,12 +3,10 @@ SECTION = "e/utils"
 LICENSE = "MIT BSD"
 SRCREV = "bbcec18f0ebd47e4f6eea88b9b774edf7400e752"
 PV = "1.2+gitr${SRCPV}"
-PR = "r5"
+PR = "r6"
 PACKAGE_ARCH = "all"
 
-RPROVIDES_${PN} = "e-wm-sysactions"
 RCONFLICTS_${PN} = "e-wm-sysactions"
-#RREPLACES_${PN} = "e-wm-sysactions"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
 
diff --git a/recipes/tasks/task-shr-minimal.bb b/recipes/tasks/task-shr-minimal.bb
index b9449e9..1c0e2b1 100644
--- a/recipes/tasks/task-shr-minimal.bb
+++ b/recipes/tasks/task-shr-minimal.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "SHR Lite Image Feed"
-PR = "r40"
+PR = "r41"
 PV = "2.0"
 LICENSE = "GPL"
 
@@ -107,7 +107,6 @@ RDEPENDS_${PN}-audio = "\
 RDEPENDS_${PN}-x = "\
   task-x11-illume \
   task-fonts-truetype-core \
-  e-wm-menu-shr \
   shr-wizard \
   shr-theme-gry \
   xcursor-transparent-theme \
diff --git a/recipes/tasks/task-x11-illume.bb b/recipes/tasks/task-x11-illume.bb
index 5af3a30..7c6fe3e 100644
--- a/recipes/tasks/task-x11-illume.bb
+++ b/recipes/tasks/task-x11-illume.bb
@@ -9,8 +9,8 @@ PR = "r1"
 inherit task
 
 # Default illume theme
-ILLUME_THEME ?= "e-wm-theme-illume"
-ILLUME_CONFIG ?= "e-wm-config-illume2"
+ETHEME ?= "e-wm-theme-illume"
+ECONFIG ?= "e-wm-config-illume2"
 
 RDEPENDS_${PN} = "\
   task-x11-server \
@@ -18,6 +18,6 @@ RDEPENDS_${PN} = "\
 #  xserver-kdrive-splash-illume \
   \
   e-wm \
-  ${ILLUME_CONFIG} \
-  ${ILLUME_THEME} \
+  ${ECONFIG} \
+  ${ETHEME} \
 "
-- 
1.7.4.1



