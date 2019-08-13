Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF0307E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9N0MF017202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:00 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:22:59 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:10 -0400
Message-ID: <20190813092118.113213-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 08/16] tumbler: 0.2.0 -> 0.2.7
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Update tumbler from 0.2.0 to 0.2.7

* remove patch which has been fixed in upstream
* remove dbus-glib* from DEPENDS that tumbler ports gdbus. glib-2.0
  provides gdbus and already in tumbler's dependency chains.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...nfigure-use-pkg-config-for-freetype2.patch | 45 -------------------
 .../{tumbler_0.2.0.bb => tumbler_0.2.7.bb}    |  9 ++--
 2 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.0.bb => tumbler_0.2.7.bb} (68%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch b/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
deleted file mode 100644
index 5ecc35e37..000000000
--- a/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f5c283b1251ad005da7342e654cd2ec5ae9e5fb2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 26 Sep 2014 13:44:36 +0200
-Subject: [PATCH] configure: use pkg-config for freetype2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- acinclude.m4 | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 66e79d1..4c70b00 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -52,21 +52,7 @@ if test x"$ac_tumbler_font_thumbnailer" = x"yes"; then
-   PKG_CHECK_MODULES([GDK_PIXBUF], [gdk-pixbuf-2.0 >= 2.14], 
-   [
-     dnl Check for FreeType 2.x
--    FREETYPE_LIBS=""
--    FREETYPE_CFLAGS=""
--    AC_PATH_PROG([FREETYPE_CONFIG], [freetype-config], [no])
--    if test x"$FREETYPE_CONFIG" != x"no"; then
--      AC_MSG_CHECKING([FREETYPE_CFLAGS])
--      FREETYPE_CFLAGS="`$FREETYPE_CONFIG --cflags`"
--      AC_MSG_RESULT([$FREETYPE_CFLAGS])
--    
--      AC_MSG_CHECKING([FREETYPE_LIBS])
--      FREETYPE_LIBS="`$FREETYPE_CONFIG --libs`"
--      AC_MSG_RESULT([$FREETYPE_LIBS])
--    else
--      dnl We can only build the font thumbnailer if FreeType 2.x is available
--      ac_tumbler_font_thumbnailer=no
--    fi
-+    PKG_CHECK_MODULES(FREETYPE, freetype2, , [ac_tumbler_font_thumbnailer=no])
-     AC_SUBST([FREETYPE_CFLAGS])
-     AC_SUBST([FREETYPE_LIBS])
-   ], [ac_tumbler_font_thumbnailer=no])
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb
index 9d2669475..434f8741a 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb
@@ -1,14 +1,13 @@
-DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus specification"
+DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "dbus-glib dbus-glib-native freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
+DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "dd5f9bae6a2470eb5fff0dc9edd3ea09"
-SRC_URI[sha256sum] = "4e27a59694b0a5cc69ebccbdb00c724e670b5b7c30bc4dc0b461aac93f234fac"
-SRC_URI += "file://0001-configure-use-pkg-config-for-freetype2.patch"
+SRC_URI[md5sum] = "a59b2a545c9c128dbd2b960a7779dec0"
+SRC_URI[sha256sum] = "f704c35f16716cbee3c94883cee2a8d865e9cf2535d0e84f57e1c8cce00314e4"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
2.20.0


