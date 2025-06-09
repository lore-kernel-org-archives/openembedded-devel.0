Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D00C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 03:57:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.51209.1749441416941554563
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jun 2025 20:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G4MSJBeL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749441417; x=1780977417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1DWtFZt5o5+3yD6NmHBhtp/WukAvyTZobRKX4OchqRo=;
  b=G4MSJBeL2JPtgBAvOWQjr7r7rsFGlBXsDExYUn34XbRRwVNREYHVLmqw
   wrFj95+1trnYsyEvTGOM4AQ1JTac+eqUzv7gKDExyvHHi36yNW7zIOkHp
   Zyyg5X9HVN3JsPDNDoJWbfH2VMM+NUJxDHpgifoZ8OuyoXFM3MZUKUgbW
   tw8qytfmsSrNarRAsLOfOEoSUOoOQdqe10V1odmHgSZDY5pX4ghpzd5UY
   uwFgB69qALmHClfO0HQHvD4+ZpStiKXlefTDxq0Tsam5GymDTrmN5QqPR
   7S+6zPO42FkFcvKxF4EAxITUktVrGhKrIlq1LJSvCv22br5e1xy68JohM
   g==;
X-CSE-ConnectionGUID: 5pSC7jGISSqn3B98N/PfnQ==
X-CSE-MsgGUID: h/6MpR03T9660K34ZlsXOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="202145910"
X-IronPort-AV: E=Sophos;i="6.16,221,1744038000"; 
   d="scan'208";a="202145910"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:56:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F349D4C24
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jun 2025 12:56:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45DB4BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Jun 2025 12:56:41 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 766061A0071;
	Mon,  9 Jun 2025 11:56:40 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-xfce] [PATCH] imsettings: upgrade 1.8.3 -> 1.8.10
Date: Mon,  9 Jun 2025 11:56:24 +0800
Message-ID: <20250609035624.1901-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 03:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117778

- old SRC_URI is invalid now, change to official gitlab source code
- Copied ABOUT-NLS from native sysroot's gettext manually to fix issue
  | configure.ac:84: error: required file './ABOUT-NLS' not found
- remove man page since it needs db2x_docbook2man command which we do not have recipe for

Changelog:
- Rename DBus service file
- Drop deprecated m4 macro
- Add GDMSESSION to the list of overriding envvar
- Add SwitchIMwithEnv dbus method
- Set default desktop name for client
- Disable none.conf on all the wayland sessions
- Support wildcard in IMSETTINGS_IGNORE_SESSION
- none.conf: Fix unexpected setup for GNOME and Plasma Wayland
- Check a flag of IMSETTINGS_IGNORE_SESSION at SwitchIM
- Bump API version
- Add IsActionNeeded method
- Add IMSETTINGS_IGNORE_SESSION
- Add is_env_support_needed function
- Drop GNOME support
- Fix too early threshold for detecting the loop of process restarting

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../imsettings/0001-remove-man-page.patch     | 79 +++++++++++++++++++
 ...settings_1.8.3.bb => imsettings_1.8.10.bb} | 13 ++-
 2 files changed, 89 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.8.3.bb => imsettings_1.8.10.bb} (71%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch b/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
new file mode 100644
index 0000000000..a2fe0451b0
--- /dev/null
+++ b/meta-xfce/recipes-extended/imsettings/imsettings/0001-remove-man-page.patch
@@ -0,0 +1,79 @@
+From ea6829c152c18e55cbe2a05317bc12a2be65ed65 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Mon, 9 Jun 2025 03:22:06 +0000
+Subject: [PATCH] remove man page
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ configure.ac      |  1 -
+ utils/Makefile.am | 23 +----------------------
+ 2 files changed, 1 insertion(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b843037..224311f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,7 +65,6 @@ IMSETTINGS_MODULEDIR="${libdir}/imsettings"
+ AC_SUBST(IMSETTINGS_MODULEDIR)
+ 
+ AM_MISSING_PROG([GIT], [git])
+-AM_MISSING_PROG([DB2MAN], [db2x_docbook2man])
+ 
+ dnl ======================================================================
+ dnl functions testing
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index b492532..2236257 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -20,19 +20,11 @@ DEPS =							\
+ 	$(NULL)
+ EXTRA_DIST =						\
+ 	$(autostart_in_files)				\
+-	$(man_xml_files)				\
+-	$(man1_MANS)					\
+ 	$(NULL)
+ DISTCLEANFILES =					\
+ 	$(autostart_DATA)				\
+ 	$(NULL)
+-BUILT_SOURCES =						\
+-	$(man1_MANS)					\
+-	$(NULL)
+-MAINTAINERCLEANFILES =					\
+-	$(man1_MANS)					\
+-	$(NULL)
+-SUFFIXES = .1.xml
++
+ 
+ ##
+ # Local Rules
+@@ -50,12 +42,6 @@ bin_PROGRAMS =						\
+ libexec_PROGRAMS =					\
+ 	imsettings-check				\
+ 	$(NULL)
+-man1_MANS =						\
+-	imsettings-info.1				\
+-	imsettings-list.1				\
+-	imsettings-reload.1				\
+-	imsettings-switch.1				\
+-	$(NULL)
+ #
+ autostartdir = $(sysconfdir)/xdg/autostart
+ #
+@@ -64,13 +50,6 @@ autostart_in_files =					\
+ 	$(NULL)
+ autostart_DATA = $(autostart_in_files:.desktop.in=.desktop)
+ #
+-man_xml_files = $(man1_MANS:.1=.1.xml)
+-#
+-.xml.1:
+-	$(AM_V_GEN) $(DB2MAN) $<
+-.1.xml.1:
+-	$(AM_V_GEN) $(DB2MAN) $<
+-#
+ imsettings_check_SOURCES =				\
+ 	imsettings-check.c				\
+ 	$(NULL)
+-- 
+2.43.0
+
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
similarity index 71%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
index 21e9b3908f..b2d74a3015 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
@@ -10,16 +10,23 @@ SECTION = "Applications/System"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit autotools gtk-doc gobject-introspection gettext features_check
+inherit autotools gettext gtk-doc gobject-introspection features_check
 
 DEPENDS = "autoconf-archive-native gtk+3 libnotify"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main \
            file://imsettings-gcc10.patch \
+           file://0001-remove-man-page.patch \
           "
-SRC_URI[sha256sum] = "45986b9ca1b87b760a5dbaecd9a2b77d080adc47868a0512826077175d5b3ee3"
+SRCREV = "27d84c88831ef76397a15891ba0738ce9a83902a"
+
+S = "${WORKDIR}/git"
+
+do_configure:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
+}
 
 EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
-- 
2.43.0


