Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0735674060
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 11:21:24 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so61590554wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=zgVqA2I7zpj8cPtsytowm1ydWFeq+/+XcCItcvDYBBY=;
	b=JNMTUh9jjfD6K9pgWClYc+8CTtJHTh/LiyC/voMTe2GQ2FbG0TPLgxWwfZ+Nn6W5xQ
	l32lzimq4gnvU84on5NCWsr4h3e84U4wPaROBd7fOMDQZexOvKUOV232HFr4YY+5k8Fm
	M79+0Gkw3YmszQqDDGJwnAkUIc72KnaqmWYDkovg7VIDBbBYoB0fmE5L/TcyKg44dr63
	QvNkX8EpAc1zlsC5oPyD0HeS7Wl0ZTGKN84kS9tiGWXa3MCn2lRt8cDb/YZY7lWyR6MT
	hinnfM0rMIDmSUrzeijI/9LQLAkXqEc6C4DuXTmm1F5YNuPpCy/GabsLl2bEeXZ2iXHw
	00Sg==
X-Received: by 10.194.177.133 with SMTP id cq5mr47226830wjc.145.1432639285671; 
	Tue, 26 May 2015 04:21:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id 16sm21245212wjs.41.2015.05.26.04.21.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 May 2015 04:21:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 13:20:51 +0200
Message-Id: <1432639251-12249-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432639251-12249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432639251-12249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] poppler: fix configure by pointing on moc
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
X-List-Received-Date: Tue, 26 May 2015 11:21:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed in [1] configure was detecting host's moc and failing in some
configurations.

To get this fixed configure gets a parameter by which the location of moc
is set.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-May/101641.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 91 ++++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.33.0.bb  |  3 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch b/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
new file mode 100644
index 0000000..560b073
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
@@ -0,0 +1,91 @@
+From 91b6275f0e91c25beb040b4ef9484053ae305d86 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 26 May 2015 12:45:47 +0200
+Subject: [PATCH] add manadatory options to find qt4/qt5 moc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 55 ++++++++-----------------------------------------------
+ 1 file changed, 8 insertions(+), 47 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 67599c0..40fa596 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -622,25 +622,10 @@ AC_SUBST(POPPLER_QT4_LIBS)
+ AC_SUBST(POPPLER_QT4_TEST_LIBS)
+ 
+ if test x$enable_poppler_qt4 = xyes; then
+-  AC_CHECK_TOOL(MOCQT4, moc)
+-  AC_MSG_CHECKING([for Qt4 moc])
+-  mocversion=`$MOCQT4 -v 2>&1`
+-  mocversiongrep=`echo $mocversion | grep "Qt 4"`
+-  if test x"$mocversiongrep" != x"$mocversion"; then
+-    AC_MSG_RESULT([no])
+-    # moc was not the qt4 one, try with moc-qt4
+-    AC_CHECK_TOOL(MOCQT42, moc-qt4)
+-    AC_MSG_CHECKING([for Qt4 moc-qt4])
+-    mocversion=`$MOCQT42 -v 2>&1`
+-    mocversiongrep=`echo $mocversion | grep "Qt 4"`
+-    if test x"$mocversiongrep" != x"$mocversion"; then
+-      # no valid moc found
+-      enable_poppler_qt4=no;
+-      MOCQT4="not found"
+-    else
+-      MOCQT4=$MOCQT42
+-    fi
+-  fi
++  AC_ARG_WITH([moc-qt4],
++              AS_HELP_STRING([--with-moc-qt4], [Set location of qt4 moc]),
++              [MOCQT4=$withval]
++  )
+   AC_SUBST(MOCQT4)
+   AC_MSG_RESULT([$MOCQT4])
+ fi
+@@ -679,34 +664,10 @@ AC_SUBST(POPPLER_QT5_LIBS)
+ AC_SUBST(POPPLER_QT5_TEST_LIBS)
+ 
+ if test x$enable_poppler_qt5 = xyes; then
+-  AC_CHECK_TOOL(MOCQT5, moc)
+-  AC_MSG_CHECKING([for Qt5 moc])
+-  mocversion=`$MOCQT5 -v 2>&1`
+-  mocversiongrep=`echo $mocversion | grep "Qt 5\|moc 5"`
+-  if test x"$mocversiongrep" != x"$mocversion"; then
+-    AC_MSG_RESULT([no])
+-    # moc was not the qt5 one, try with moc-qt5
+-    AC_CHECK_TOOL(MOCQT52, moc-qt5)
+-    AC_MSG_CHECKING([for Qt5 moc-qt5])
+-    mocversion=`$MOCQT52 -v 2>&1`
+-    mocversiongrep=`echo $mocversion | grep "Qt 5\|moc-qt5 5\|moc 5"`
+-    if test x"$mocversiongrep" != x"$mocversion"; then
+-      AC_CHECK_TOOL(QTCHOOSER, qtchooser)
+-      AC_MSG_CHECKING([for qtchooser])
+-      qt5tooldir=`QT_SELECT=qt5 qtchooser -print-env | grep QTTOOLDIR | cut -d '=' -f 2 | cut -d \" -f 2`
+-      mocversion=`$qt5tooldir/moc -v 2>&1`
+-      mocversiongrep=`echo $mocversion | grep "Qt 5\|moc 5"`
+-      if test x"$mocversiongrep" != x"$mocversion"; then
+-        # no valid moc found
+-        enable_poppler_qt5=no;
+-        MOCQT5="not found"
+-      else
+-        MOCQT5=$qt5tooldir/moc
+-      fi
+-    else
+-      MOCQT5=$MOCQT52
+-    fi
+-  fi
++  AC_ARG_WITH([moc-qt5],
++              AS_HELP_STRING([--with-moc-qt5], [Set location of qt5 moc]),
++              [MOCQT5=$withval]
++  )
+   AC_SUBST(MOCQT5)
+   AC_MSG_RESULT([$MOCQT5])
+ fi
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-support/poppler/poppler_0.33.0.bb b/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
index 6e8446b..d5362a0 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.33.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
+    file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
 "
 SRC_URI[md5sum] = "69927d1614d6704021c0b0dd0ee6a852"
 SRC_URI[sha256sum] = "a5fa6d7f7dc5382b48caca82b147c54bdffda02698611af76db5326ba64995a6"
@@ -18,7 +19,7 @@ PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
 PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
 PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
-PACKAGECONFIG[qt5] = "--enable-poppler-qt5,--disable-poppler-qt5,qtbase"
+PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase"
 
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
-- 
1.9.3


