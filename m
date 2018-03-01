Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 00510788C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:10 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id u49so8246568wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2yOPEH4JcjyXEJAB/HvqRnhxneC0secZ1E3esd/wsh8=;
	b=sTzbc+erlqsw6e2bpn6B9JEwxxP99pRrJaerGq4748s+rUD+5FfQl11uy55U9iTZFQ
	QYrrj36wlEtzYuQsnfxN+/xGlLv6Ml5Tt1BdQYcHWe02oAm2hzjWmJSSAGB53+Z/Bv6I
	qYOsHQhNU+7by9FklOFmF9bKZrVSy5zcWFclpIeye/MXp6jYMqTB1xweMHonymZEiAqN
	8evyjnfYON7eX3uDbrntsg7bkKEjP6qM3Sz/QXx6tGwAWIjHXnzy+XsQEzESDFcun45w
	Lc3wqkKddHrSfXE1KPqkwGkpIYyIX+qz/ESIE82ClGWJRQVQuNfvhR6Onkx3eTpQCnun
	omCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2yOPEH4JcjyXEJAB/HvqRnhxneC0secZ1E3esd/wsh8=;
	b=mzkma+BtoK0Yn0d+6r7+xRzrW3/5ZZAcWQS+RZOKVEA47ltCXMDdIu1nHYctCLF+Mh
	usywtfCfM5IFIQTHBYVH9dF+VQmuuIRyh7F9FC3MKr2TQ6szp9M7NnOHyHCGiXL8f5vd
	9oBNwr2NIUhQO/z3KqSO4Ad8Fr8M8y3p2gNOnqnS9cy7YM7LkXTwGC2NpXLiH1oaOVrg
	tYGm/R5YVL0RkKFvXwI4QLhsnEHh2Mk2x9RU0rkO/ruiEg4do6ID4n+nUpN7Qv8lmsOC
	HkdDfO08xDuZHjJJ0Mqcg/6vkUwSTiPsmA1n0T0Q31D2tnfAEW3CZSnNHavnGzSAW60m
	Bzug==
X-Gm-Message-State: APf1xPCSd1CPaJc0Ue2vNadvTZi3lAowrPADzhceBWM2g4GqswscPkOh
	GlRWim3wARjDv4WfqgQOaa9UGg==
X-Google-Smtp-Source: AG47ELsv642DIsT5ikj7IWpP+mGBFF7XdJH5ocXRI0x2A8KZ4/6ZNFT2AKNahoCcEvfcnvBr8b8acw==
X-Received: by 10.223.154.173 with SMTP id a42mr3436119wrc.240.1519945330979; 
	Thu, 01 Mar 2018 15:02:10 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:45 +0100
Message-Id: <20180301230148.2284-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] xfce4-notifyd: update 0.4.0 -> 0.4.2
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch was applied upstream and is working now after additional tarball fix.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...gure-option-to-start-daemon-by-autostart-.patch | 105 ---------------------
 ...ce4-notifyd_0.4.0.bb => xfce4-notifyd_0.4.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.0.bb => xfce4-notifyd_0.4.2.bb} (77%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
deleted file mode 100644
index 7be66f55b..000000000
--- a/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 751ca1687edae351db7477b00b67a72b7fc55dee Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 10 Nov 2017 10:29:28 +0100
-Subject: [PATCH] Add a configure option to start daemon by autostart instead
- of dbus
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On sytems with multiple desktops installed, dbus service
-'org.freedesktop.Notifications' may be defined by multiple instances. In my
-case it is KDE-Plasma causing unpredictable results: On some environments
-xfce4-notifyd is started on others not.
-
-To help distros/packagers a new configure option '--enable-dbus-start-daemon'
-is introduced. It is desabled by default so no unexpected impact is to expect.
-
-It should be noted that the simplicity of this change is possible since recent
-change: Daemon does not kill itself after being idle for certain time - see
-commit d87a4a93b2ec4ab094f5a35ae818395f750f2891.
-
-Upstream-Status: Submitted [1]
-
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=13989
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- Makefile.am                            | 13 +++++++++++++
- configure.ac                           |  8 ++++++++
- xfce4-notifyd/xfce4-notifyd.desktop.in |  6 ++++++
- 3 files changed, 27 insertions(+)
- create mode 100644 xfce4-notifyd/xfce4-notifyd.desktop.in
-
-diff --git a/Makefile.am b/Makefile.am
-index c81bdaa..3bd2d46 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -83,6 +83,7 @@ xfce4_notifyd_config_xfce4_notifyd_config_LDADD = \
- 	$(common_ldadd) \
- 	$(LIBNOTIFY_LIBS)
- 
-+if USE_DBUS_START_DAEMON
- servicedir = $(datadir)/dbus-1/services
- service_in_files = xfce4-notifyd/org.xfce.xfce4-notifyd.Notifications.service.in
- service_DATA = $(service_in_files:.service.in=.service)
-@@ -97,6 +98,15 @@ dist_service = \
- 	xfce4-notifyd/notify-dbus.xml \
- 	xfce4-notifyd/xfce-notify-marshal.list
- distclean_service = $(service_DATA) $(systemd_user_DATA)
-+else
-+autostartdir = $(sysconfdir)/xdg/autostart
-+autostart_in_files = xfce4-notifyd/xfce4-notifyd.desktop.in
-+autostart_DATA = $(autostart_in_files:.desktop.in=.desktop)
-+
-+dist_autostart = \
-+	$(autostart_in_files)
-+distclean_autostart = $(autostart_DATA)
-+endif
- 
- dist_man1_MANS = \
- 	xfce4-notifyd-config/xfce4-notifyd-config.1
-@@ -273,6 +283,9 @@ install-data-hook:
- xfce4-notifyd/%.service: $(srcdir)/xfce4-notifyd/%.service.in Makefile
- 	sed -e "s,\@notifydir\@,$(xfce4_notifyddir),g" < $< > $@
- 
-+xfce4-notifyd/%.desktop: $(srcdir)/xfce4-notifyd/%.desktop.in Makefile
-+	sed -e "s,\@notifydir\@,$(xfce4_notifyddir),g" < $< > $@
-+
- distclean-local:
- 	-rm -rf *.cache *~
- 
-diff --git a/configure.ac b/configure.ac
-index 46a132c..a37da8c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -124,6 +124,14 @@ AS_IF([test "x$use_old_gsi_sig" = "xyes"],
- AM_CONDITIONAL([USE_OLD_GET_SERVER_INFORMATION_SIGNATURE],
-                [test "x$use_old_gsi_sig" = "xyes"])
- 
-+dnl dbus start daemon
-+AC_ARG_ENABLE([dbus-start-daemon],
-+              [AS_HELP_STRING([--enable-dbus-start-daemon],
-+                              [Start daemon by dbus - if not set by autostart. (default=yes)])],
-+              [use_dbus_start_daemon=$enableval], [use_dbus_start_daemon=yes])
-+AM_CONDITIONAL([USE_DBUS_START_DAEMON],
-+               [test "x$use_dbus_start_daemon" = "xyes"])
-+
- dnl create #define for spec version
- AC_DEFINE_UNQUOTED([NOTIFICATIONS_SPEC_VERSION], ["notifications_spec_version"],
-                    [Set to the version of the freedesktop.org notifications spec we support])
-diff --git a/xfce4-notifyd/xfce4-notifyd.desktop.in b/xfce4-notifyd/xfce4-notifyd.desktop.in
-new file mode 100644
-index 0000000..d1f76f9
---- /dev/null
-+++ b/xfce4-notifyd/xfce4-notifyd.desktop.in
-@@ -0,0 +1,6 @@
-+[Desktop Entry]
-+Type=Application
-+Name=Xfce Notification Daemon
-+Exec=@notifydir@/xfce4-notifyd
-+Icon=xfce4-notifyd
-+OnlyShowIn=XFCE;
--- 
-2.9.5
-
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
similarity index 77%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
index a39396fa9..54e702eed 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
@@ -15,9 +15,8 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI += "file://0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch"
-SRC_URI[md5sum] = "c2de09c30b06eaf2d3faaf3e509d656a"
-SRC_URI[sha256sum] = "2771871f67effc0bb80f656cf4aa3cd71fe0ea0f4c04b5d8e97bb1752faf36c9"
+SRC_URI[md5sum] = "ecb930ef6ae6e1f310a5afe5f638eff8"
+SRC_URI[sha256sum] = "f6f28af47fdfb41db84bd003f0d76f5f4abf2137d1e27e9d378f063bb8f82356"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.14.3


