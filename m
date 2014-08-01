Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 23B0360167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:26 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so4319602wev.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YvHAjcPWeQGNNM1zyBM4biiiMSEHkPlyGa+Ius2eQNg=;
	b=d3j+upkoM7Z+7ArBxyIt8v130AGYDjDLnqjtlihriXlv6ILiaMLrNvlzEFhi0hxSLj
	E4tn5jvRGcnP4FKMkQFFOyiTJF7V5X1of5ouTITcKW3v4u7qQ/RzozD5Jcfizryu1ALy
	aAsJCUtfJU3M6KYs9l5xNtcWfshsRRQdEtnNG8ZJWNmcXcQgVYQrepvnJ89JM8xQBiKy
	vWbNBKbGaY1v62BeUE1vjH/vncEdH82MiqNqgZdlXoGqiAWzJeJ7deTLMfCsjOxiOk8Y
	VkhS0cV0O3C9why1CCDI/OP0RMmp31lPOP0hN39TIjXx65PCECQByUP56IBUbgfNVjSX
	/qSQ==
X-Gm-Message-State: ALoCoQlzpc0Jk0Co6Qoo6StmprniulTsaS5ZoBsqbk7H12BssB6TBSZRaEcjjBkizXxEXAPxKXCX
X-Received: by 10.180.74.198 with SMTP id w6mr6988909wiv.7.1406900125675;
	Fri, 01 Aug 2014 06:35:25 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	di7sm21010037wjb.34.2014.08.01.06.35.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:56 +0200
Message-Id: <1406900096-31368-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 10/10] libgnomeprint: use pkgconfig for freetype support
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:27 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...0001-configure-use-pkgconfig-for-freetype.patch | 37 ++++++++++++++++++++++
 .../recipes-gnome/gnome/libgnomeprint_2.18.8.bb    |  5 +--
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint/0001-configure-use-pkgconfig-for-freetype.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint/0001-configure-use-pkgconfig-for-freetype.patch b/meta-gnome/recipes-gnome/gnome/libgnomeprint/0001-configure-use-pkgconfig-for-freetype.patch
new file mode 100644
index 0000000..174985a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint/0001-configure-use-pkgconfig-for-freetype.patch
@@ -0,0 +1,37 @@
+From ed31fd89f4c77d89390774d29427898a85b25ab1 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 1 Aug 2014 13:58:36 +0200
+Subject: [PATCH] configure: use pkgconfig for freetype
+
+Upstream-status: Pending
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure.in | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 729278d..e569429 100644
+--- a/configure.in
++++ b/configure.in
+@@ -164,13 +164,11 @@ dnl Checking for freetype2
+ dnl =================================
+ FREETYPE_LIBS=
+ FREETYPE_CFLAGS=
+-AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
+-if test "x$FREETYPE_CONFIG" = "xno" ; then
+-	AC_MSG_ERROR(You need FreeType2 (freetype-devel v 2.x package) for this version of libgnomeprint)
+-else
+-	FREETYPE_CFLAGS=`$FREETYPE_CONFIG --cflags`
+-	FREETYPE_LIBS=`$FREETYPE_CONFIG --libs`
+-fi
++PKG_CHECK_MODULES(FREETYPE2, freetype2, 
++    FREETYPE_CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
++    FREETYPE_LIBS="$LIBS $FREETYPE2_LIBS",
++    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
++)
+ 
+ libgnomeprint_save_ldflags=$LDFLAGS
+ LDFLAGS="$LDFLAGS $FREETYPE_LIBS"
+-- 
+1.9.0
+
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index c5fd152..15e513a 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -1,10 +1,6 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
-# | checking for freetype-config... no
-# | configure: error: You need FreeType2 (freetype-devel v 2.x package) for this version of libgnomeprint
-PNBLACKLIST[libgnomeprint] = "Broken without freetype-config"
-
 DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -13,6 +9,7 @@ inherit pkgconfig gnomebase
 
 SRC_URI += "file://fix.includes.patch \
             file://freetype.patch \
+            file://0001-configure-use-pkgconfig-for-freetype.patch \
            "
 SRC_URI[archive.md5sum] = "63b05ffb5386e131487c6af30f4c56ac"
 SRC_URI[archive.sha256sum] = "1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691"
-- 
1.9.0


