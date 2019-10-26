Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB8D7FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:34:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g7so4606006wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5OrAI0tch+9u0zazIGajQuHxw+mUwobonkxZP/C4hx8=;
	b=TsSZMH+SZ4Uj7kwB74pLAUHEz+NITcjxj6PA8s51a0qp4nDl12H4kSNraZNBoV4XuK
	Dg8dEX3eTJqib+DWyK72Z+RUSb2dJoqGI7zE8LQ2ieqhMxb36i+pxtzjZQiYm94lSvae
	0YqtifyJBInu17KdhF15tcdUE2MDWOfIxrnceNLTb8Szt456+OygeEeSVNZ7S9UW/WP9
	5o526Fx7k1jBg1kvJeZotgy0xo8Nn5GkUxCaKPn2aX9cJMvAVRvaYD7rks+nLLX0IqqN
	8PbJM/FYKqU1gn68etuydudguJfLtGHO0rd2mF+Y+h15xsj/NQhSlg1LjdQhhTER4y5B
	1h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5OrAI0tch+9u0zazIGajQuHxw+mUwobonkxZP/C4hx8=;
	b=l9DCkU63J4Oytg4xXaZo1VC154rW2+dsbBTdf2/KceEzYc5TZlyRAxeyHPzE4HAH3O
	knwhay4OdHpQrFXtZZex4P/LaKRFwo2vD2fyMOOL0fN6bRoF9j8w56gvgqoGDbbi3k6C
	Y2ohOurtI+FDp6xA1uV/fgh3iKExQmvI+P4ptdNFihNhLGTogb+IH4O8H4uWlMPcXQ0A
	lrIys4yZNFEeRt9EdSxr1vDHJ0CohWB2YcIEw9WJMldSymBhrqZaD8OZlh4DHb5Q5mWw
	4YDG+iMbwZw8F/t0z+TdJ71tknV0FmlcYUg2b4LX3YxUWVbeA7JF/g/dpb1slMzwu84u
	QKvQ==
X-Gm-Message-State: APjAAAVGYzbg0uscUbbekeUQ7Mzz9bsNe2YSpIvd3mZu+2JBWmsM08tb
	MCEryesFomC+7+h9VoLynNp39+zI
X-Google-Smtp-Source: APXvYqwckePyhK5NkfmeLYJD0CaKNoGZbN0lxRnbXn5q8z/ZP6aI8LHNH1ONH1BmH4y0+UciFtZ4cA==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr7282485wmh.76.1572082461104; 
	Sat, 26 Oct 2019 02:34:21 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206021D85A12E97BB69DE.dip0.t-ipconnect.de.
	[2003:f0:7f32:602:1d85:a12e:97bb:69de])
	by smtp.gmail.com with ESMTPSA id
	w15sm6281482wro.65.2019.10.26.02.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 26 Oct 2019 02:34:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Oct 2019 11:34:04 +0200
Message-Id: <20191026093404.19659-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191026093404.19659-1-schnitzeltony@gmail.com>
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] zenity: rework recipe
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
X-List-Received-Date: Sat, 26 Oct 2019 09:34:21 -0000
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
index 295288bfb..fb58d1712 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
@@ -4,19 +4,17 @@ LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-inherit distro_features_check gnomebase gettext
+inherit gnomebase gnome-help distro_features_check gettext
 
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


