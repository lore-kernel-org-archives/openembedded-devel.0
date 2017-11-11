Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1824785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y80so7291083wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iWQHdArc4DyY7P1ovkwBy3kzQwHS7XkkiUrbzjnCHCc=;
	b=YV2ZxAiZWFsWP4p8GJpdgzFb8YlypAVwhNMd5QLfZ5+AQ/Bb1u3awGce2OZPgfDQrN
	q4HRo16GSRS1Anw88fUeUJlKwqicSflrI9OQrRNF8aM98GZS0BJoAktHcGLQh8J4WOQh
	mRcSIFBZgFB/9pI6sH85Woc4Gc88icddVAdHtdB4b0W3ZGpuapSnwJVwIBtpPim0Ir9a
	Q7TWNV7fHjK+gyaTAcVZUCZV7ovK0J/eA5weGT05zU3iOFQlR61LXx+6U6EoatWg8gCV
	p4yvPthZGJYs4/JeEFNUnYwSgFavQyHHUuq7yO48DAbhtd5B4v/0zEW0xsvYt/N3uC1e
	dzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iWQHdArc4DyY7P1ovkwBy3kzQwHS7XkkiUrbzjnCHCc=;
	b=UOI0cy/s2OReNU7G1OkV49dkBd3q2pElGZZN9mrGZnlZhRXBDDh6LdFN9JvXCXcQ41
	xMBC9lCSJGDRhHUwHtssIaZU2ghKJ7cuJqARpSXTOHrem0VraJ0s8lqlFptn8Vk/vmAQ
	KHnA/+fzkpDFpIE2e21wNCD35nUPiHvNBB2+0BOqwFdPdvqvGQA7OhiNDJocDgar1j/L
	G6UyxCy11U6xVMHUVkxgczJhBkEweyP2EkRrX2agNUOfy65rgw/X2sSgv1EfeN34U1Kp
	MdKDHu8/Z32H29C1Gj/dgnbr0ps7xjDh97YYO6XFMpfJcy0244ni/846gFEEZa2kJ1uK
	raew==
X-Gm-Message-State: AJaThX4fUiyxOrELpS9EZQkTwznnvujLW5Fz6VrTI+ML5q8DB7NAJmva
	pZQ8V4mNuoW6OIQbtburpcobYA==
X-Google-Smtp-Source: AGs4zMbkG+EYGt1PsbqutYWBIYSTZdzE+3P4V/Yta1MYlveuLJC08pTSVHe4APtj9xu+mE8GJgiDvQ==
X-Received: by 10.28.147.17 with SMTP id v17mr2727732wmd.9.1510407016062;
	Sat, 11 Nov 2017 05:30:16 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:50 +0100
Message-Id: <20171111132950.12570-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 13/13] xfce4-notifyd: avoid trouble starting daemon for images with multiple desktops
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...gure-option-to-start-daemon-by-autostart-.patch | 105 +++++++++++++++++++++
 .../xfce4-notifyd/xfce4-notifyd_0.4.0.bb           |   5 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
new file mode 100644
index 0000000..7be66f5
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
@@ -0,0 +1,105 @@
+From 751ca1687edae351db7477b00b67a72b7fc55dee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 10 Nov 2017 10:29:28 +0100
+Subject: [PATCH] Add a configure option to start daemon by autostart instead
+ of dbus
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On sytems with multiple desktops installed, dbus service
+'org.freedesktop.Notifications' may be defined by multiple instances. In my
+case it is KDE-Plasma causing unpredictable results: On some environments
+xfce4-notifyd is started on others not.
+
+To help distros/packagers a new configure option '--enable-dbus-start-daemon'
+is introduced. It is desabled by default so no unexpected impact is to expect.
+
+It should be noted that the simplicity of this change is possible since recent
+change: Daemon does not kill itself after being idle for certain time - see
+commit d87a4a93b2ec4ab094f5a35ae818395f750f2891.
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=13989
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.am                            | 13 +++++++++++++
+ configure.ac                           |  8 ++++++++
+ xfce4-notifyd/xfce4-notifyd.desktop.in |  6 ++++++
+ 3 files changed, 27 insertions(+)
+ create mode 100644 xfce4-notifyd/xfce4-notifyd.desktop.in
+
+diff --git a/Makefile.am b/Makefile.am
+index c81bdaa..3bd2d46 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -83,6 +83,7 @@ xfce4_notifyd_config_xfce4_notifyd_config_LDADD = \
+ 	$(common_ldadd) \
+ 	$(LIBNOTIFY_LIBS)
+ 
++if USE_DBUS_START_DAEMON
+ servicedir = $(datadir)/dbus-1/services
+ service_in_files = xfce4-notifyd/org.xfce.xfce4-notifyd.Notifications.service.in
+ service_DATA = $(service_in_files:.service.in=.service)
+@@ -97,6 +98,15 @@ dist_service = \
+ 	xfce4-notifyd/notify-dbus.xml \
+ 	xfce4-notifyd/xfce-notify-marshal.list
+ distclean_service = $(service_DATA) $(systemd_user_DATA)
++else
++autostartdir = $(sysconfdir)/xdg/autostart
++autostart_in_files = xfce4-notifyd/xfce4-notifyd.desktop.in
++autostart_DATA = $(autostart_in_files:.desktop.in=.desktop)
++
++dist_autostart = \
++	$(autostart_in_files)
++distclean_autostart = $(autostart_DATA)
++endif
+ 
+ dist_man1_MANS = \
+ 	xfce4-notifyd-config/xfce4-notifyd-config.1
+@@ -273,6 +283,9 @@ install-data-hook:
+ xfce4-notifyd/%.service: $(srcdir)/xfce4-notifyd/%.service.in Makefile
+ 	sed -e "s,\@notifydir\@,$(xfce4_notifyddir),g" < $< > $@
+ 
++xfce4-notifyd/%.desktop: $(srcdir)/xfce4-notifyd/%.desktop.in Makefile
++	sed -e "s,\@notifydir\@,$(xfce4_notifyddir),g" < $< > $@
++
+ distclean-local:
+ 	-rm -rf *.cache *~
+ 
+diff --git a/configure.ac b/configure.ac
+index 46a132c..a37da8c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -124,6 +124,14 @@ AS_IF([test "x$use_old_gsi_sig" = "xyes"],
+ AM_CONDITIONAL([USE_OLD_GET_SERVER_INFORMATION_SIGNATURE],
+                [test "x$use_old_gsi_sig" = "xyes"])
+ 
++dnl dbus start daemon
++AC_ARG_ENABLE([dbus-start-daemon],
++              [AS_HELP_STRING([--enable-dbus-start-daemon],
++                              [Start daemon by dbus - if not set by autostart. (default=yes)])],
++              [use_dbus_start_daemon=$enableval], [use_dbus_start_daemon=yes])
++AM_CONDITIONAL([USE_DBUS_START_DAEMON],
++               [test "x$use_dbus_start_daemon" = "xyes"])
++
+ dnl create #define for spec version
+ AC_DEFINE_UNQUOTED([NOTIFICATIONS_SPEC_VERSION], ["notifications_spec_version"],
+                    [Set to the version of the freedesktop.org notifications spec we support])
+diff --git a/xfce4-notifyd/xfce4-notifyd.desktop.in b/xfce4-notifyd/xfce4-notifyd.desktop.in
+new file mode 100644
+index 0000000..d1f76f9
+--- /dev/null
++++ b/xfce4-notifyd/xfce4-notifyd.desktop.in
+@@ -0,0 +1,6 @@
++[Desktop Entry]
++Type=Application
++Name=Xfce Notification Daemon
++Exec=@notifydir@/xfce4-notifyd
++Icon=xfce4-notifyd
++OnlyShowIn=XFCE;
+-- 
+2.9.5
+
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
index 0ec6b63..a39396f 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
@@ -15,9 +15,14 @@ DEPENDS = " \
 
 inherit xfce-app
 
+SRC_URI += "file://0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch"
 SRC_URI[md5sum] = "c2de09c30b06eaf2d3faaf3e509d656a"
 SRC_URI[sha256sum] = "2771871f67effc0bb80f656cf4aa3cd71fe0ea0f4c04b5d8e97bb1752faf36c9"
 
+# Avoid trouble with other desktops e.g KDE which also ships dbus service named
+# org.freedesktop.Notifications
+EXTRA_OECONF = "--disable-dbus-start-daemon"
+
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
 }
-- 
2.9.5


