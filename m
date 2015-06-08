Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4367873D89
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 16:56:43 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so64113347igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5XM1qK9XaBHs9ZCnqfzo2YjxQP33K8Qra3gwzsw9trk=;
	b=HsRokKCQ0QE7TLs9Sh7GbSOE2hDwjHKUgeqRsxJxJyMr0mTOWPkuN5lywCRkNBmkRT
	Nl7Z8uKp3oFbjC9XGofkwgdWyZiVTtz+X7P77tPTtgynQ9zBwP9TS3ZI5iwHc760Ta8g
	BHebjfb+3r9IhMY/Pe+yfcZMPgO/i1LGQ9ATfaTTPu+nGokGqnawx/NM6kLBWYBRQNla
	DHO8m1Wz3bFLh+B0tDzd1Xn+wj5aIYN4dNBoqmh4u/DRWo7TSZEvJxB7Y2HwI8zTLPJM
	hBKKk2b4NWaMUXovD7tp3JCzWOhwhgDUAvWz6p/Nwe6os3Tag5TXIKVgndNvnY/1fjVj
	mdNw==
X-Received: by 10.50.25.162 with SMTP id d2mr14750763igg.11.1433782604764;
	Mon, 08 Jun 2015 09:56:44 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id rr5sm704273igb.7.2015.06.08.09.56.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 09:56:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 09:56:36 -0700
Message-Id: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 16:56:44 -0000

This is a generic fix to accomodate musl which is adhering to posix
and doesnt have legacy to carry, so lets invert the conditional so the
special legacy case of glibc is checked and else part then covers rest
of cases which are newer glibc/uclibc and musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 43 ++++++++++------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 0f6bcbe..d54079c 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
-diff --git a/configure b/configure
-index 6ce6753..0a00d6d 100755
---- a/configure
-+++ b/configure
+Index: git/configure
+===================================================================
+--- git.orig/configure
++++ git/configure
 @@ -316,6 +316,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
@@ -128,7 +128,7 @@ index 6ce6753..0a00d6d 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]
          exit 1
      fi
  fi
@@ -152,7 +152,7 @@ index 6ce6753..0a00d6d 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -175,10 +175,10 @@ index 6ce6753..0a00d6d 100755
  
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
-diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 6b37a04..dcf6025 100644
---- a/mkspecs/features/configure.prf
-+++ b/mkspecs/features/configure.prf
+Index: git/mkspecs/features/configure.prf
+===================================================================
+--- git.orig/mkspecs/features/configure.prf
++++ git/mkspecs/features/configure.prf
 @@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
      }
  
@@ -194,11 +194,10 @@ index 6b37a04..dcf6025 100644
              log("yes$$escape_expand(\\n)")
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
-diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
-new file mode 100644
-index 0000000..2ad2810
+Index: git/mkspecs/linux-oe-g++/qmake.conf
+===================================================================
 --- /dev/null
-+++ b/mkspecs/linux-oe-g++/qmake.conf
++++ git/mkspecs/linux-oe-g++/qmake.conf
 @@ -0,0 +1,40 @@
 +#
 +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
@@ -240,11 +239,10 @@ index 0000000..2ad2810
 +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
 +
 +load(qt_config)
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-new file mode 100644
-index 0000000..dd12003
+Index: git/mkspecs/linux-oe-g++/qplatformdefs.h
+===================================================================
 --- /dev/null
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
++++ git/mkspecs/linux-oe-g++/qplatformdefs.h
 @@ -0,0 +1,100 @@
 +/****************************************************************************
 +**
@@ -334,10 +332,10 @@ index 0000000..dd12003
 +
 +#undef QT_SOCKLEN_T
 +
-+#if defined(__GLIBC__) && (__GLIBC__ >= 2)
-+#define QT_SOCKLEN_T            socklen_t
-+#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
 +#define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
 +#endif
 +
 +#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
@@ -346,6 +344,3 @@ index 0000000..dd12003
 +#endif
 +
 +#endif // QPLATFORMDEFS_H
--- 
-2.4.2
-
-- 
2.1.4


