Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylX-0001l8-Rq
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:07 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7g2jWqJIZlAd5PeYRJiOckDK/m8om19JOswOIDTuD78=;
	b=T+KgYZEqTnplVasjmIpvrgVLawHd73beQDYj8PRHMnUcC3fqWDxe/UdwM1Ry9dp6AV
	Iffjn2vsV7/stULQqeqSC870MJXkTlAT7QDZUXGYVc+XI0hMvhzcK56VxJ3Tgv9WkJHs
	ocTJhM03cowJP/HdwrXA+ZE23wE4RgTqRjt/zIDuP+ZoRTS2AP9BBQUC/IzoIXfmfbOp
	BCRJu2JRZJp6DCa5bWl0Y+JH9UueO2YexOpOwkfGC3hRHrA9Lb88nGSOWkf851Y7urB5
	LstCSR5AJGJRHQcC+xIoY1QSXZT4Yw1Uh03aIP/W7rziUovgAv4+PE4SFd1uV7W/jh7E
	Jjzw==
Received: by 10.204.148.82 with SMTP id o18mr2033bkv.41.1347977670056;
	Tue, 18 Sep 2012 07:14:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:52 +0200
Message-Id: <1347977601-28665-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 11/40] xfce4-settings: update to 4.10.0 and set default themes
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...settingsd-use-gnome-as-default-icon-theme.patch |   29 ------------------
 ...ttings.xml-remove-trouble-causing-comment.patch |   31 +++++++++++++++++++
 .../0002-xsettings.xml-Set-default-themes.patch    |   32 ++++++++++++++++++++
 ...-settings_4.8.3.bb => xfce4-settings_4.10.0.bb} |    8 +++--
 4 files changed, 68 insertions(+), 32 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.8.3.bb => xfce4-settings_4.10.0.bb} (50%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
deleted file mode 100644
index d428848..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 576e7881bdc84390cc51210ee37e5bdd87a170fc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 15 Oct 2011 16:43:09 +0200
-Subject: [PATCH] xfsettingsd: use 'gnome' as default icon theme
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-status: unacceptable (config)
-
- xfsettingsd/xsettings.xml |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index 049b4ed..d8c6a85 100644
---- a/xfsettingsd/xsettings.xml
-+++ b/xfsettingsd/xsettings.xml
-@@ -3,7 +3,7 @@
- <channel name="xsettings" version="1.0">
-   <property name="Net" type="empty">
-     <property name="ThemeName" type="string" value="Xfce"/>
--    <property name="IconThemeName" type="string" value="Rodent"/>
-+    <property name="IconThemeName" type="string" value="gnome"/>
-   </property>
-   <property name="Xft" type="empty">
-     <property name="DPI" type="int" value="-1"/>
--- 
-1.6.6.1
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
new file mode 100644
index 0000000..a76fad2
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
@@ -0,0 +1,31 @@
+From a84a7a6537544cdf56e1d4cad47a4cf002964039 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 20 May 2012 15:20:08 +0200
+Subject: [PATCH 1/2] xsettings.xml: remove trouble causing comment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream-status: Pending
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ xfsettingsd/xsettings.xml |    5 -----
+ 1 files changed, 0 insertions(+), 5 deletions(-)
+
+diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
+index 8f9e2eb..49a4c1e 100644
+--- a/xfsettingsd/xsettings.xml
++++ b/xfsettingsd/xsettings.xml
+@@ -1,8 +1,3 @@
+-<!--
+-  Default values for the X settings registry as described in
+-  http://www.freedesktop.org/wiki/Specifications/XSettingsRegistry
+--->
+-
+ <?xml version="1.0" encoding="UTF-8"?>
+ <channel name="xsettings" version="1.0">
+   <property name="Net" type="empty">
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
new file mode 100644
index 0000000..498f8d0
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
@@ -0,0 +1,32 @@
+From 071a390ba09a8a412f73d295be81a805804a1f24 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 20 May 2012 15:22:09 +0200
+Subject: [PATCH 2/2] xsettings.xml: Set default themes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstram status:  Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ xfsettingsd/xsettings.xml |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
+index 49a4c1e..5ec94e9 100644
+--- a/xfsettingsd/xsettings.xml
++++ b/xfsettingsd/xsettings.xml
+@@ -1,8 +1,8 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+ <channel name="xsettings" version="1.0">
+   <property name="Net" type="empty">
+-    <property name="ThemeName" type="empty"/>
+-    <property name="IconThemeName" type="empty"/>
++    <property name="ThemeName" type="string" value="Xfce"/>
++    <property name="IconThemeName" type="string" value="gnome"/>
+     <property name="DoubleClickTime" type="int" value="250"/>
+     <property name="DoubleClickDistance" type="int" value="5"/>
+     <property name="DndDragThreshold" type="int" value="8"/>
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
similarity index 50%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
index c3dd8fd..fb9083d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
@@ -6,9 +6,11 @@ DEPENDS = "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx1
 
 inherit xfce
 
-SRC_URI += "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.patch"
+SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
+            file://0002-xsettings.xml-Set-default-themes.patch"
+SRC_URI[md5sum] = "cc4dd9179ead9046c056431f01a12000"
+SRC_URI[sha256sum] = "0843f09ba9673f1d1b5df8dce4a17b63c183a9ba3be75fb6ef99a67fc8c1f77e"
 
-SRC_URI[md5sum] = "4669298cc8a4abf0e5a410016b575030"
-SRC_URI[sha256sum] = "d878cc474e1e677e9607279b9a1007cb90ed35ff078de180259a8b2b8d06bc2e"
+FILES_${PN} += "${libdir}/xfce4"
 
 RRECOMMENDS_${PN} += "gnome-icon-theme"
-- 
1.7.6.5



