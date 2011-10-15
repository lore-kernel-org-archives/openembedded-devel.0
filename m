Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF5kh-0004eO-77
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 17:02:19 +0200
Received: by eyd9 with SMTP id 9so1890126eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 07:56:29 -0700 (PDT)
Received: by 10.223.7.14 with SMTP id b14mr11840905fab.10.1318690589108;
	Sat, 15 Oct 2011 07:56:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id f10sm10817474fac.14.2011.10.15.07.56.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 07:56:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 16:56:23 +0200
Message-Id: <1318690583-15073-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce] xfce4-settings 4.8.2: change default icon theme to 'gnome'
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
X-List-Received-Date: Sat, 15 Oct 2011 15:02:19 -0000

'task-xfce4-base' doesn't install the 'Rodent' theme leading to missing icons. With this patch all icons show up.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...settingsd-use-gnome-as-default-icon-theme.patch |   29 ++++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.8.2.bb         |    6 +++-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
new file mode 100644
index 0000000..d428848
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
@@ -0,0 +1,29 @@
+From 576e7881bdc84390cc51210ee37e5bdd87a170fc Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 15 Oct 2011 16:43:09 +0200
+Subject: [PATCH] xfsettingsd: use 'gnome' as default icon theme
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: unacceptable (config)
+
+ xfsettingsd/xsettings.xml |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
+index 049b4ed..d8c6a85 100644
+--- a/xfsettingsd/xsettings.xml
++++ b/xfsettingsd/xsettings.xml
+@@ -3,7 +3,7 @@
+ <channel name="xsettings" version="1.0">
+   <property name="Net" type="empty">
+     <property name="ThemeName" type="string" value="Xfce"/>
+-    <property name="IconThemeName" type="string" value="Rodent"/>
++    <property name="IconThemeName" type="string" value="gnome"/>
+   </property>
+   <property name="Xft" type="empty">
+     <property name="DPI" type="int" value="-1"/>
+-- 
+1.6.6.1
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
index 7b31dae..258c238 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
@@ -4,9 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
 
-PR = "r0"
+PR = "r1"
 
 inherit xfce
 
+SRC_URI += "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
+
 SRC_URI[md5sum] = "a45420fea20f29265ab6785cb1d07377"
 SRC_URI[sha256sum] = "3f79865a6a3817f3c868f2412cbf105e73e54810438f62035699ae5fd72c29d0"
+
+RRECOMMENDS_${PN} += "gnome-icon-theme"
-- 
1.6.6.1



