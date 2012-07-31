Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wh-00087O-0T
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:27 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so3664117wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xoXBzKT/IxSC23ULbcdiwNPbwbKVQiw/Omjf1FJB4Mo=;
	b=SI9lyjCrtaM/pO8hdknHXZLvRvas8jV2rcxahi3VS9N+pN8/eWZ77gdfbM6l6fvEBh
	IkWWvWrs0UVZyKH1p9qIKf2wCI5GL9hCt1iAJwIeFum/JdNsoziE3m1yHY/awSWFczOZ
	D9F1K/qlNC7WouEZnnUhhPKtoSwGnLLW1cM3NQmRvferwsWnq5ynbMaet9l5smAdhTOO
	wxUWw6kR5t8RDRPDxnb5tbr2JLWyy8mzqCM9gau0M4JA14sKcmkndPJ8qX88N6cn9ggj
	OXlgtPwnvkw894Cn92s+YahvJiz+QS70G4RL9fYVGnApmb8cPOTvPHMjh0bWt/1XFlHC
	xoXA==
Received: by 10.216.93.6 with SMTP id k6mr7140381wef.86.1343700052813;
	Mon, 30 Jul 2012 19:00:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm19600439wiz.0.2012.07.30.19.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:46 +0200
Message-Id: <b980ffb8627595bf6d8a7269fa9035e16aa53f65.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/24] emacs: fix dso build
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../emacs/emacs-23.1/fix.dso.build.patch           |   39 ++++++++++++++++++++
 meta-oe/recipes-support/emacs/emacs_23.1.bb        |    4 ++-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch

diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch b/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch
new file mode 100644
index 0000000..0396c0c
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport
+
+from bzr changeset 99307
+
+=== modified file 'ChangeLog'
+--- ChangeLog	2010-01-12 05:11:05 +0000
++++ ChangeLog	2010-01-12 16:25:08 +0000
+@@ -1,3 +1,7 @@
++2010-01-12  Chong Yidong  <cyd@stupidchicken.com>
++
++	* configure.in: Explicitly check for and link to -lXrender.
++
+ 2010-01-12  Glenn Morris  <rgm@gnu.org>
+ 
+ 	* INSTALL.BZR, README: Use bug-gnu-emacs rather than emacs-pretest-bug
+
+=== modified file 'configure.in'
+--- configure.in	2010-01-04 05:35:18 +0000
++++ configure.in	2010-01-12 16:25:08 +0000
+@@ -1984,12 +1984,17 @@
+     if test "x${with_xft}" != "xno"; then
+ 
+       PKG_CHECK_MODULES(XFT, xft >= 0.13.0, , HAVE_XFT=no)
+-      if test "$HAVE_XFT" != no; then
++      ## Because xftfont.c uses XRenderQueryExtension, we also
++      ## need to link to -lXrender.
++      HAVE_XRENDER=no
++      AC_CHECK_LIB(Xrender, XRenderQueryExtension, HAVE_XRENDER=yes)
++      if test "$HAVE_XFT" != no && test "$HAVE_XRENDER" != no; then
+ 	OLD_CPPFLAGS="$CPPFLAGS"
+ 	OLD_CFLAGS="$CFLAGS"
+ 	OLD_LIBS="$LIBS"
+ 	CPPFLAGS="$CPPFLAGS $XFT_CFLAGS"
+ 	CFLAGS="$CFLAGS $XFT_CFLAGS"
++	XFT_LIBS="-lXrender $XFT_LIBS"
+ 	LIBS="$XFT_LIBS $LIBS"
+ 	AC_CHECK_HEADER(X11/Xft/Xft.h,
+ 	  AC_CHECK_LIB(Xft, XftFontOpen, HAVE_XFT=yes, , $XFT_LIBS))
+
diff --git a/meta-oe/recipes-support/emacs/emacs_23.1.bb b/meta-oe/recipes-support/emacs/emacs_23.1.bb
index fe134f8..fa7c872 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.1.bb
@@ -3,6 +3,8 @@ require emacs.inc
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
-           file://configure.in.lost.backslashes.patch"
+           file://configure.in.lost.backslashes.patch \
+           file://fix.dso.build.patch \
+"
 SRC_URI[tarball.md5sum] = "a620d4452769d04ad8864d662f34f8dd"
 SRC_URI[tarball.sha256sum] = "a94cd46301f000d2d1dcd3fd7ef08ad952846d01ca5d4168b4ec3e38e857da47"
-- 
1.7.8.6



