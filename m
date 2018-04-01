Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 611B9607AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Apr 2018 09:47:55 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v21so21246173wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Apr 2018 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QsGvvPQ1I6oBqlaRHvzaa7+2LNKQ6LavH6pEWnDF/2g=;
	b=XYVo4F8iNsHa6gVRY2sx6YD7B5bJccXQZIwzYlAXhz3cpaM8pMZAIThrNQL5wA0DP7
	8XJ4e11XUDPw1fr1UxMzi6BPdtg6KSoKfOop2gtXVmCxgS33XdQhl6C41xOzBW7kHoKs
	GDH/z9Tj+o9vaIE3kTDnXZGIYlSZM6BbGJ1dSkSZuTtoRkS8gLx6aCg93xmD7n1iUwcr
	U2CSu3j+0YCPQHPR//bVT0xPy4B2+oW32NwkrWwHVAMc0iEpr4p3O0yyYVUJq33UH6+w
	FcfnndyVPFjRhntauk1CSHIFfbnbXeetn5/lhmW1NhBWYU42Ousbn7+hq+1GFMrG2qL/
	0Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QsGvvPQ1I6oBqlaRHvzaa7+2LNKQ6LavH6pEWnDF/2g=;
	b=Q1aOcarGp15PE0KptqObBEp/0O1GJXhxEX2k++p9Y6EoAXk58O61t1icKCVSXP7t5T
	TYiiaPbsmi7/RMs8tsb8OTlTw9sU32gK+wEiZ5Ezd2lDonVi5hbo+a7z/qGyIKvh2eAC
	orkmEqsTHAettcCA635n+hduYg7sgGl817VcvM9QAP2Dk0+baDHmHMt9CiMGWmdKKWJc
	zz+7xfkpfplL49F0Mzlrb0tfLhxdlvkFsJ5OR/teR4rT3cEwwU2c7jzWc+JxeSqGptn0
	1wVFuCOuSHxuawdx5VUHh3mEW4H8yN2QtrGgQnwe5fFeCUa69ricSqT01dy8Tw5zpG6f
	3o4Q==
X-Gm-Message-State: AElRT7F1LWO8DhYNZA9UWZJ/Yvo6uoPP78go7ns7f48yrONcdYFwx0fT
	u0M9JAZbSXqn6qPoOIkbYTOcSg2b
X-Google-Smtp-Source: AIpwx49GLIHkFcMf/B+PTHvnEFXRtwIoDE+WDzmfG9+2X8OmuYEtsS0pYm/7/nWwjvdwNz2LRl0hrw==
X-Received: by 10.28.193.13 with SMTP id r13mr5910763wmf.38.1522576075593;
	Sun, 01 Apr 2018 02:47:55 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD701E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd70:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id h9sm2823639wmc.13.2018.04.01.02.47.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 01 Apr 2018 02:47:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Apr 2018 11:47:36 +0200
Message-Id: <20180401094736.26202-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH][V2] gtkmm3: add initial 3.22.2
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
X-List-Received-Date: Sun, 01 Apr 2018 09:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is gtk3 version of gtkmm. There are no cnflicts with gtkmm for gtk2.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

rebased https://github.com/schnitzeltony/meta-openembedded.git consolidated-pull

 .../gtk+/files/0001-do-not-build-demos.patch       | 51 ++++++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb        | 23 ++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb

diff --git a/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch b/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
new file mode 100644
index 000000000..176e97998
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/files/0001-do-not-build-demos.patch
@@ -0,0 +1,51 @@
+From 6914eccee34376f9067b0ee9f17039fe182125e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 31 Mar 2018 22:29:16 +0200
+Subject: [PATCH] do not build demos
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+They are not installed anyway and add libepoxy dependency
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.am  | 3 ++-
+ configure.ac | 3 ---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 984b6a7..6c754a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -28,7 +28,8 @@ doc_subdirs = docs
+ else
+ doc_subdirs =
+ endif
+-SUBDIRS = tools $(src_subdirs) gdk/gdkmm gtk/gtkmm tests demos $(doc_subdirs)
++
++SUBDIRS = tools $(src_subdirs) gdk/gdkmm gtk/gtkmm tests $(doc_subdirs)
+ 
+ gdkmm_includedir = $(includedir)/$(GDKMM_MODULE_NAME)
+ gdkmm_include_HEADERS = gdk/gdkmm.h
+diff --git a/configure.ac b/configure.ac
+index e5e82dc..c1c7658 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -109,11 +109,8 @@ AS_IF([test "x$gtkmm_enable_api_atkmm" != xno],
+       [GTKMM_MODULES="atkmm-1.6 >= 2.24.2 $GTKMM_MODULES"])
+ AC_SUBST([GTKMM_MODULES])
+ 
+-AC_SUBST([GTKMM_DEMOS_EXTRA_MODULES], ['epoxy >= 1.2'])
+-
+ PKG_CHECK_MODULES([GDKMM], [$GDKMM_MODULES])
+ PKG_CHECK_MODULES([GTKMM], [$GTKMM_MODULES])
+-PKG_CHECK_MODULES([GTKMM_DEMOS_EXTRA], [$GTKMM_DEMOS_EXTRA_MODULES])
+ 
+ MM_PKG_CONFIG_SUBST([GTHREAD_CFLAGS], [--cflags-only-other gthread-2.0])
+ MM_PKG_CONFIG_SUBST([GTHREAD_LIBS], [--libs gthread-2.0])
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
new file mode 100644
index 000000000..96b54dd2c
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "C++ bindings for the GTK+ toolkit V3"
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
+
+BPN = "gtkmm"
+
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "883e9046768b3a5afc8e365988823e77"
+SRC_URI[archive.sha256sum] = "91afd98a31519536f5f397c2d79696e3d53143b80b75778521ca7b48cb280090"
+SRC_URI += "file://0001-do-not-build-demos.patch"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.14.3


