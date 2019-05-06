Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F36D7D577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m20so4896743wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=solpHtzXXFuo+9uDK9MTAdwQlY7QWMXsDzKkJzkWYU4=;
	b=p31X5BipheUGnpFU5BVT93uPHFmDYVH9D5afDI2b69hRs9E9sm9rZPingw9tkN9ipY
	nevgfjOXR1tEAc8FxwRNfDmHyeIuxsaGVk4W+lJ6NiZkna/VOVvHkqk6q3pReFtR4OKF
	PUaf1Fq0L4iIu9iwsZ4kgr+s+9aI8NsaPhBu/crs0ubWG8z42miqxwqaSSlboCLXTayr
	92A8TajM15REv9thVBr9zEXBOACv5Ka2T6crM6QPRlQj5sNH2brSJPr2evnxA4ybEXvl
	6RcDXwaEpWah8S50kxAJOM6gKQMsvVT4fwsrET0e0/ZCq+r8tPRyqa16Ruk2gRXH62Ph
	l5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=solpHtzXXFuo+9uDK9MTAdwQlY7QWMXsDzKkJzkWYU4=;
	b=L+Lq8S/ycjLmcDHvQRcFTOLts5E1KSUwP/1965z54QPgjB0dJ+mE2cAFHKqYc7MBa1
	L63soox0wGBQlLmD9FcWCjS/1bfbHQIbyU8HQvTy3tlS+My4aRJa3IlnflwBYKdCAKEJ
	+mL0d65PtD5E6IyDHgKlPCUt+pZ9QDGiBRyoFjXthVYDw7a6WKDcomeJBIa587hlvrWQ
	OsXKJ6oKR2sud8+6eXv/BJBaMLOCR2V1/bH86Fo/gToukNd2xLrJW8opdVSSuBp/PRXC
	3Fe2RVL2JJKpUsPK45KDkqvx9F3HiZVL0C/n510F8l3PIGlOgkM+t/M606V5SXwEBL+5
	e15g==
X-Gm-Message-State: APjAAAWbVFKWk+3cC+SLLtnpXIe2TGPUmmqTR3Pm2KS02Hpz2z/oqvI5
	uOYtP0wdT5TOx8JeCWer1LqXWf9O
X-Google-Smtp-Source: APXvYqw86a5kGM8lVciduioAtKWh0hDTNiqvM2MRUQzdXLkCi6ibHlTiDFkfKmLf1OJb5ImE8umNxg==
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr4265306wmh.38.1557131406996; 
	Mon, 06 May 2019 01:30:06 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:45 +0200
Message-Id: <20190506082948.22276-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] exo: upgrade 0.12.4 -> 0.12.5
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
X-List-Received-Date: Mon, 06 May 2019 08:30:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix and cleanup release [1]

[1] https://mail.xfce.org/pipermail/xfce/2019-May/036395.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../reduce-build-to-exo-csource-only.patch    | 29 +++++++++++--------
 .../exo/{exo_0.12.4.bb => exo_0.12.5.bb}      |  9 +++---
 2 files changed, 22 insertions(+), 16 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.4.bb => exo_0.12.5.bb} (81%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index 076477581..8c950299f 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -1,6 +1,6 @@
 From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 28 Mar 2013 23:41:03 +0100
+Date: Sat, 4 May 2019 14:50:11 +0200
 Subject: [PATCH] reduce build to exo-csource only
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -16,11 +16,11 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 
 ---
  Makefile.am  | 10 +---------
- configure.ac | 22 ----------------------
- 2 files changed, 1 insertion(+), 31 deletions(-)
+ configure.ac | 20 --------------------
+ 2 files changed, 1 insertion(+), 29 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 62ad18d..bdc5fae 100644
+index 62ad18d..8934f1f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,15 +1,7 @@
@@ -41,10 +41,10 @@ index 62ad18d..bdc5fae 100644
  distclean-local:
  	rm -rf *.cache *~
 diff --git a/configure.ac b/configure.ac
-index 3f92d1b..0d4cc38 100644
+index 4e4eb5e..237184c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -116,15 +116,6 @@ AC_PROG_CC()
+@@ -120,15 +120,6 @@ AC_PROG_CC()
  AM_PROG_CC_C_O()
  AC_PROG_INSTALL()
  IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])
@@ -60,26 +60,31 @@ index 3f92d1b..0d4cc38 100644
  
  dnl ***************************************
  dnl *** Check for standard header files ***
-@@ -171,19 +162,6 @@ dnl ***********************************
+@@ -175,12 +166,6 @@ dnl ***********************************
  dnl *** Check for required packages ***
  dnl ***********************************
  XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.24.0])
 -XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])
 -XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.12.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
 -XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-unix], [GIO-Unix features])
--
+ 
+ dnl ***********************************************************
+ dnl *** Optional support for a GTK+2 version of the library ***
+@@ -190,11 +175,6 @@ XDT_CHECK_OPTIONAL_PACKAGE([GTK2],
+                            [GTK+ 2 support])
+ AM_CONDITIONAL([ENABLE_GTK2_LIBRARY], [test "x$GTK2_FOUND" = "xyes"])
+ 
 -dnl *********************
 -dnl *** Check for X11 ***
 -dnl *********************
 -XDT_CHECK_LIBX11_REQUIRE()
- 
+-
  dnl *************************
  dnl *** Check for gtk-doc ***
+ dnl *************************
 -- 
-2.14.3
+2.20.1
 
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.4.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.5.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.4.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.5.bb
index 7b7edfe1b..7d61e8f83 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.4.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.5.bb
@@ -20,15 +20,16 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "962bbccb38db0aecd4151ca97f6a39bc"
-SRC_URI[sha256sum] = "b0af60816bdb572ce53f19462fb1f3a5895a04017a878893dc03c166ea2050af"
+SRC_URI[md5sum] = "1de1d539262847d49474d20cbebc78ea"
+SRC_URI[sha256sum] = "e8f434d6436ae647dd1614e8a24aba23c83f70cb14037b5bc98652f558be43e8"
 
 PACKAGES =+ "exo-csource"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-FILES_${PN} += "${datadir}/xfce4/ \
-                ${libdir}/xfce4/exo-1 \
+FILES_${PN} += " \
+    ${datadir}/xfce4/ \
+    ${libdir}/xfce4/exo* \
 "
 
 FILES_exo-csource += "${bindir}/exo-csource"
-- 
2.20.1


