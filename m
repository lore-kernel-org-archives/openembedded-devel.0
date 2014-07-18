Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B76B6706D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fk030280; Fri, 18 Jul 2014 09:43:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g0ccPPVq5y2L; Fri, 18 Jul 2014 09:43:08 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gx25030261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:01 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jy-KT; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:42 +0100
Message-Id: <1405672966-25729-23-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 23/27] gegl: Use pkg-config for SDL
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:18 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch | 21 +++++++++++++++++++++
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch

diff --git a/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch b/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
new file mode 100644
index 0000000..d145b62
--- /dev/null
+++ b/meta-oe/recipes-graphics/gegl/gegl/pkgconfig.patch
@@ -0,0 +1,21 @@
+Index: gegl-0.2.0/configure.ac
+===================================================================
+--- gegl-0.2.0.orig/configure.ac	2012-04-02 21:56:49.000000000 +0000
++++ gegl-0.2.0/configure.ac	2014-07-17 21:34:15.312546602 +0000
+@@ -765,15 +765,7 @@
+ 
+ have_sdl="no"
+ if test "x$with_sdl" != "xno"; then
+-  AC_PATH_PROG(SDL_CONFIG, sdl-config, no)
+-  if test "$SDL_CONFIG" = "no"; then
+-    have_sdl="no  (SDL library not found)"
+-    AC_MSG_RESULT([*** Check for SDL library failed.])
+-  else
+-    have_sdl="yes"
+-    SDL_CFLAGS=`$SDL_CONFIG --cflags`
+-    SDL_LIBS=`$SDL_CONFIG --libs`
+-  fi
++  PKG_CHECK_MODULES([SDL], [sdl], [have_sdl="yes"], [have_sdl="no  (SDL library not found)"])
+ fi
+ 
+ AM_CONDITIONAL(HAVE_SDL, test "$have_sdl" = "yes")
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index 849fe9f..58103f6 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -11,7 +11,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
 PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
 
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.2/${BP}.tar.bz2"
+SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.2/${BP}.tar.bz2 \
+           file://pkgconfig.patch "
 SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
 SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
 
-- 
2.0.2


