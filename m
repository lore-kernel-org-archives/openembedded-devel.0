Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id D0FC27FA88
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g24so7545946wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uz1K9RVJ7p4I35Yy3RHqOdkeu0xlKf7URKZZiXwA9B8=;
	b=OswBhPQdPTDeTZdgu9BFUcm0gv8WUPBJNA3++O1OeObc+Zz9Vbm7GqYfk4OCJr0C0h
	rHzGIEhskqDAHrGKjFD+pfUKztIuYzU/5qhxGyD3nompyntEpoyIX4ojv3mKtRcR8Dtg
	WkwiCtZc1ysh5U4gORB7bJjJYA9iJNObiblx0Yn9kwJWw2hNgVeyDCLwctUDkOUqXTCz
	gUjykQZ/EpiheqLUcSDx5KsFxLkfOEKxQMraX1Ro2WMyRYaGpTg6LXPLKASoE4zyCHOU
	6FW+wzMk0R321Q3Fne3dPg6/DhSeSKIxwcSTXMsT5ykjSIYqnnC99HRCpbVnJ57Tc4t0
	yEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uz1K9RVJ7p4I35Yy3RHqOdkeu0xlKf7URKZZiXwA9B8=;
	b=hqzer8kNNiR6Z/deghvC0xr2bmtEuRqWf64/PpqxRR4K1DrxF89gyqCiQOhQ9U25mc
	1Rl9VnrM1yjaXIPWR3Qm1svypfgH3zIHBI8qDgTHTKGKq08LOSTLrzx1hL9p9FYMToK7
	ersGJzH2e+jUt0KLd9qtGdK3IZw61ue8nSoYWuJVAc5iWupTWzEyOymBUCy1BT5GCL9Y
	Kx1FjvIAM+e1X9QCByE8mB0fC3M+VBkmSjWOMX0grsCy4xN1mUHQe8+E1lMZaEO172WP
	6EDJ2nNlJnfRbUzdhIHPOjn2LkSpZzC7sdb5oPROngAWMlH2OlSC4PzLb/K7UZBHqj1D
	efgw==
X-Gm-Message-State: APjAAAX6nC4umFfpAZ38LlrYMMnFSw9DEqL6g/pafZ11sztnD/V28QMT
	xmdq5xL6MTNyvH4Ldj8OkRXrE3Sj
X-Google-Smtp-Source: APXvYqztLk8sxFFh7DmtRg0NA2mwfZ4tlvv9Um8v4VDKIt6Xac0mthCgX+TSx+z7rcCp1QevBc900Q==
X-Received: by 2002:a1c:9601:: with SMTP id y1mr12623858wmd.157.1572219364363; 
	Sun, 27 Oct 2019 16:36:04 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:32 +0100
Message-Id: <20191027233545.4146-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] zenity: rework recipe
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* "xz" is default for GNOME_COMPRESS_TYPE
* instead of patching away help-files, build them and let users decide if and
  how to pack them by inheriting gnome-help.bbclass

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-build-don-t-generate-manual.patch    | 50 -------------------
 .../recipes-gnome/zenity/zenity_3.32.0.bb     | 12 ++---
 2 files changed, 5 insertions(+), 57 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch

diff --git a/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch b/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
deleted file mode 100644
index 488548667..000000000
--- a/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 38eeb345fdfca0298b11427aa942b68e627ba10e Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
-Date: Thu, 12 Sep 2019 13:14:55 +0200
-Subject: [PATCH] build: don't generate manual
-
-We don't have yelp in yocto and even if we did it would pull in
-webkitgtk just to generate help. Just remove the manual generation
-altogether.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
----
- Makefile.am  | 3 +--
- configure.ac | 5 -----
- 2 files changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 81ae6a7..bd073dd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4,8 +4,7 @@ AM_CPPFLAGS = src
- SUBDIRS = \
- 	src	\
- 	po	\
--	data	\
--	help
-+	data
- 
- EXTRA_DIST = \
- 	autogen.sh		\
-diff --git a/configure.ac b/configure.ac
-index 5dccdb0..f88b2c0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -115,11 +115,6 @@ GETTEXT_PACKAGE=zenity
- AC_SUBST([GETTEXT_PACKAGE])
- AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext domain])
- 
--# *******************************
--# User manual
--# *******************************
--YELP_HELP_INIT
--
- # *******************************
- 
- AC_SUBST([AM_CPPFLAGS])
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
index 295288bfb..0384a5c5c 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
@@ -4,19 +4,17 @@ LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-inherit distro_features_check gnomebase gettext
+inherit gnomebase itstool gnome-help distro_features_check gettext
 
-DEPENDS = "gtk+3"
+DEPENDS = " \
+    yelp-tools-native \
+    gtk+3 \
+"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-    file://0001-build-don-t-generate-manual.patch \
-"
-
 SRC_URI[archive.md5sum] = "ba2b2a13248773b4ec0fd323d95e6d5a"
 SRC_URI[archive.sha256sum] = "e786e733569c97372c3ef1776e71be7e7599ebe87e11e8ad67dcc2e63a82cd95"
-GNOME_COMPRESS_TYPE="xz"
 
 do_install_append() {
     # Remove gdialog compatibility helper - we don't want to pull in perl
-- 
2.21.0


