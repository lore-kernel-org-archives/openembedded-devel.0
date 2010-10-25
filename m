Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMZO-0004Hq-WB
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:54:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BE6AF314A20C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:53:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KgJCGa8jb7ma
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:53:39 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 14A6C3149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:53:38 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:53:37 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:53:37 +0000
Message-Id: <1288011217-22888-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285930541-15007-1-git-send-email-obi@opendreambox.org>
References: <1285930541-15007-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 resend] mjpegtools-1.9.0: initial recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Oct 2010 12:54:36 -0000

* v2: Added jpeg to DEPENDS.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../mjpegtools/files/mjpegtools-fix-include.patch  |   65 ++++++++++++++++++++
 .../files/mjpegtools-remove-sdl-dependency.patch   |   15 +++++
 .../files/mjpegtools-v4l-doesnt-mean-x11.patch     |   12 ++++
 recipes/mjpegtools/mjpegtools_1.9.0.bb             |   19 ++++++
 4 files changed, 111 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mjpegtools/files/mjpegtools-fix-include.patch
 create mode 100644 recipes/mjpegtools/files/mjpegtools-remove-sdl-dependency.patch
 create mode 100644 recipes/mjpegtools/files/mjpegtools-v4l-doesnt-mean-x11.patch
 create mode 100644 recipes/mjpegtools/mjpegtools_1.9.0.bb

diff --git a/recipes/mjpegtools/files/mjpegtools-fix-include.patch b/recipes/mjpegtools/files/mjpegtools-fix-include.patch
new file mode 100644
index 0000000..b5ff90a
--- /dev/null
+++ b/recipes/mjpegtools/files/mjpegtools-fix-include.patch
@@ -0,0 +1,65 @@
+Index: mjpegtools-1.9.0rc3/lavtools/Makefile.am
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/lavtools/Makefile.am	2008-04-09 00:44:57.000000000 +0200
++++ mjpegtools-1.9.0rc3/lavtools/Makefile.am	2008-04-09 01:03:10.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir) -I$(top_srcdir)/utils $(LIBQUICKTIME_CFLAGS)
++AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils $(LIBQUICKTIME_CFLAGS)
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+ if HAVE_ALTIVEC
+Index: mjpegtools-1.9.0rc3/yuvcorrect/Makefile.am
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/yuvcorrect/Makefile.am	2008-04-09 01:01:15.000000000 +0200
++++ mjpegtools-1.9.0rc3/yuvcorrect/Makefile.am	2008-04-09 01:01:21.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir) -I$(top_srcdir)/utils
++AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+ if HAVE_ALTIVEC
+Index: mjpegtools-1.9.0rc3/yuvscaler/Makefile.am
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/yuvscaler/Makefile.am	2008-04-09 01:01:43.000000000 +0200
++++ mjpegtools-1.9.0rc3/yuvscaler/Makefile.am	2008-04-09 01:01:50.000000000 +0200
+@@ -2,7 +2,7 @@
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+-AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir) -I$(top_srcdir)/utils
++AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+Index: mjpegtools-1.9.0rc3/y4mdenoise/Makefile.am
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/y4mdenoise/Makefile.am	2008-04-09 01:03:16.000000000 +0200
++++ mjpegtools-1.9.0rc3/y4mdenoise/Makefile.am	2008-04-09 01:03:25.000000000 +0200
+@@ -7,7 +7,7 @@
+ AM_CFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
+ AM_CXXFLAGS = -DNDEBUG -finline-functions @PROGRAM_NOPIC@
+ 
+-INCLUDES =  -I$(top_srcdir) -I$(includedir) -I$(top_srcdir)/utils
++INCLUDES =  -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+ if HAVE_ALTIVEC
+Index: mjpegtools-1.9.0rc3/y4mutils/Makefile.am
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/y4mutils/Makefile.am	2008-04-09 01:03:43.000000000 +0200
++++ mjpegtools-1.9.0rc3/y4mutils/Makefile.am	2008-04-09 01:03:48.000000000 +0200
+@@ -3,7 +3,7 @@
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+ AM_CFLAGS   = @PROGRAM_NOPIC@
+-AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir) -I$(top_srcdir)/utils
++AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/utils
+ 
+ LIBMJPEGUTILS = $(top_builddir)/utils/libmjpegutils.la
+ if HAVE_ALTIVEC
diff --git a/recipes/mjpegtools/files/mjpegtools-remove-sdl-dependency.patch b/recipes/mjpegtools/files/mjpegtools-remove-sdl-dependency.patch
new file mode 100644
index 0000000..fe855d3
--- /dev/null
+++ b/recipes/mjpegtools/files/mjpegtools-remove-sdl-dependency.patch
@@ -0,0 +1,15 @@
+Index: mjpegtools-1.9.0rc3/configure.ac
+===================================================================
+--- mjpegtools-1.9.0rc3.orig/configure.ac	2008-04-09 00:35:08.000000000 +0200
++++ mjpegtools-1.9.0rc3/configure.ac	2008-04-09 00:35:18.000000000 +0200
+@@ -275,10 +275,6 @@
+ dnl Check for the SDL library (for software playback)
+ dnl   (defines SDL_CFLAGS and SDL_LIBS)
+ dnl ********************************************************************
+-AM_PATH_SDL(1.1.3,
+-            [have_sdl=true
+-             AC_DEFINE(HAVE_SDL, 1, [SDL library present]) ],
+-            [have_sdl=false])
+ AM_CONDITIONAL(HAVE_SDL, test x$have_sdl = xtrue)
+ 
+ dnl ***
diff --git a/recipes/mjpegtools/files/mjpegtools-v4l-doesnt-mean-x11.patch b/recipes/mjpegtools/files/mjpegtools-v4l-doesnt-mean-x11.patch
new file mode 100644
index 0000000..a6a537c
--- /dev/null
+++ b/recipes/mjpegtools/files/mjpegtools-v4l-doesnt-mean-x11.patch
@@ -0,0 +1,12 @@
+--- mjpegtools-1.9.0/lavtools/Makefile.am.orig	2010-09-29 19:36:46.000000000 +0000
++++ mjpegtools-1.9.0/lavtools/Makefile.am	2010-09-29 19:37:55.000000000 +0000
+@@ -58,9 +58,6 @@
+ liblavplay_la_CPPFLAGS = $(AM_CPPFLAGS) $(LIBDV_CFLAGS) $(X_CFLAGS)
+ liblavplay_la_LDFLAGS = $(LAV_ALL_LIB_OPTS)
+ liblavplay_la_LIBADD = liblavfile.la $(SDL_LIBS) liblavjpeg.la $(LIBDV_LIBS) $(LIBMJPEGUTILS)
+-if HAVE_V4L
+-   liblavplay_la_LIBADD += ${X_LIBS} -lX11
+-endif
+ liblavplay_la_DEPENDENCIES = liblavfile.la liblavjpeg.la
+ 
+ # *********************************************************************
diff --git a/recipes/mjpegtools/mjpegtools_1.9.0.bb b/recipes/mjpegtools/mjpegtools_1.9.0.bb
new file mode 100644
index 0000000..1c1da47
--- /dev/null
+++ b/recipes/mjpegtools/mjpegtools_1.9.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "MJPEG video capture/editting/playback MPEG encoding"
+HOMEPAGE = "http://sourceforge.net/projects/mjpeg/"
+SECTION = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "jpeg"
+
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/mjpeg/${P}.tar.gz \
+	file://mjpegtools-fix-include.patch \
+	file://mjpegtools-remove-sdl-dependency.patch \
+	file://mjpegtools-v4l-doesnt-mean-x11.patch \
+	"
+
+SRC_URI[md5sum] = "309a6fcf0900a010d6a9c1e91afc2f5c"
+SRC_URI[sha256sum] = "a9322aaab1e0835fbaa00fc10e58e885833454fa0ad6f57c60c89a78f7ed1711"
+
+inherit autotools
+
+EXTRA_OECONF = "--without-x"
-- 
1.7.1



