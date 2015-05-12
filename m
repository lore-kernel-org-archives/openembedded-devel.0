Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 149D173F5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:34:48 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so143453437ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=orluP7qbQGPZGFjpX9nf1bxW/l0R/20pLb5wP4n8Hxc=;
	b=hcx7WjkQw8lxYY9rSMoU3qU8gJJGxQpsnXGo/JtPcKnuOqk8je0B1GiKEgc016/5oG
	Jh9ltPSioxNeMOFQPh74kfLBek43x9QJEmqDR8q2UyKC78CBIVcj754BArV0chWDKZyc
	yRyY0pIuLMk+jNX8FnDRKMRpV6QL4dIrJ39he6108/lAUNxUET2RZ/zaHW7kdv8asbvb
	TCkvXGHHzqIkB44Pg/67GvRAVu/is+xukRtKgJBEPN8iLuZXLIZBLGyLtOmDrODjRWyv
	miXxCRI884N+M7c+AJJQkoCXWa4Uka885+Iy0SoEoJ4xODSusRqO3azNmE/c3gZH0iMq
	sf2w==
X-Received: by 10.42.25.7 with SMTP id y7mr1190868icb.18.1431408890277;
	Mon, 11 May 2015 22:34:50 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id r4sm627130igh.9.2015.05.11.22.34.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 22:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:34:43 -0700
Message-Id: <1431408883-7222-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
References: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 9/9 V2] gnome-panel: Fix build with gcc-5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 05:34:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-panel/0001-Fix-build-with-gcc-5.patch    | 35 ++++++++++++++++++++++
 .../gnome-panel/gnome-panel_2.32.1.bb              | 13 +++++---
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch
new file mode 100644
index 0000000..6b7fc5b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch
@@ -0,0 +1,35 @@
+From 20810fcf329c6e0b48b8e7602565ccc70c7ce62b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 10 May 2015 02:10:59 -0700
+Subject: [PATCH] Fix build with gcc 5
+
+cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
+directory [-Werror=missing-include-dirs]
+cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
+directory [-Werror=missing-include-dirs]
+cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
+directory [-Werror=missing-include-dirs]
+cc1: some warnings being treated as errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gnome-panel/libpanel-applet-private/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gnome-panel/libpanel-applet-private/Makefile.am b/gnome-panel/libpanel-applet-private/Makefile.am
+index f12dee8..d556f12 100644
+--- a/gnome-panel/libpanel-applet-private/Makefile.am
++++ b/gnome-panel/libpanel-applet-private/Makefile.am
+@@ -8,7 +8,6 @@ AM_CPPFLAGS =							\
+ 	-I$(srcdir)						\
+ 	-I$(top_srcdir)/gnome-panel				\
+ 	-I$(top_builddir)/gnome-panel				\
+-	-I$(top_builddir)/gnome-panel/libpanel-applets-private	\
+ 	-I$(top_builddir)/gnome-panel/libpanel-util		\
+ 	-DDATADIR=\""$(datadir)"\"				\
+ 	-DPANEL_APPLETS_DIR=\"$(appletsdir)\"			\
+-- 
+2.1.4
+
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 4957a99..3a413bd 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME panel"
-LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
+LICENSE = "GPL-2.0 & LGPL-2.0 & GFDL-1.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
@@ -9,12 +9,17 @@ SECTION = "x11/gnome"
 
 PR = "r7"
 
-DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ pango libwnck gnome-menus cairo libgweather dbus-glib librsvg libcanberra" 
+DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ \
+           pango libwnck gnome-menus cairo libgweather dbus-glib \
+	   librsvg libcanberra"
+RDEPENDS_${PN} = "python"
 
 inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf
 
-SRCREV = "6a364b6a4a9beed3da9ca6f5b0dac81eb99dea2a"
-SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32"
+SRCREV = "8292bd2b8a36df7eed3c760899400790cde68590"
+SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32 \
+           file://0001-Fix-build-with-gcc-5.patch \
+	  "
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


