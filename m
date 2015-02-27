Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 52698737C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:20 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so3007254wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=agTqzR8iIcfnCSu5a250+k3vXdQBfQtwNBrPdyd/sP8=;
	b=kyGg19U2bD1E0sex+NX0Yo/Ql1YBJEit4r7FPlrelIlDlY5CZMyNfgae+SsenmGZA0
	7USn8vmyIcldyIsTYyamrrocpoLh5YWa7IkobHpQvHrLSJk/XmY18tGo9jj5Y5iumnhZ
	ACq8GwUClquvSv2NZkfoZNZpq8ALbyiwxkE10b9xPzITIbi1tdl7NBilu1AmCbV7kPQV
	8foIXSPhxLl+NlvB3XpdSoGM+afu5wxG6GHLnZXCmHvwp2jGRcHS4nI1dJOXorhDtHpW
	lyh8bHg+rPGf2wyDLkVbky66y+cJ7MrDzZLQaL2TAyzmvEL/Swn5IUqMFJY0h4q9J9r/
	NvRg==
X-Received: by 10.194.19.197 with SMTP id h5mr31055829wje.109.1425070581372;
	Fri, 27 Feb 2015 12:56:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	17sm5739539wjt.45.2015.02.27.12.56.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:30 +0100
Message-Id: <1425070591-28158-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 6/7] recipes-git: update to latest revisions in 5.4 branch
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb            |  7 +++-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 14 +++----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  6 +--
 .../0003-Add-external-hostbindir-option.patch      | 20 +++++-----
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  4 +-
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  4 +-
 ...mintegration-Undefine-CursorShape-from-X..patch |  4 +-
 ...ump-path-length-from-256-to-512-character.patch |  8 ++--
 ...gl-error-for-platforms-only-supporting-on.patch |  4 +-
 .../0009-QOpenGLPaintDevice-sub-area-support.patch |  4 +-
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch |  4 +-
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |  8 ++--
 ...-build-it-in-configure-but-allow-to-build.patch |  8 ++--
 ...external-hostbindir-option-for-native-sdk.patch |  6 +--
 .../0012-Set-paths-for-target-properly.patch       |  8 ++--
 ...reserve-built-qmake-and-swap-with-native-.patch |  8 ++--
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  4 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 +-
 recipes-qt/qt5/qtdeclarative_5.4.1.bb              |  1 -
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 46 +++++++++++-----------
 recipes-qt/qt5/qtmultimedia_5.4.1.bb               |  1 -
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +-
 .../0003-add-noqtwebkit-configuration.patch        |  8 ++--
 recipes-qt/qt5/qttools-native_git.bb               |  7 +++-
 recipes-qt/qt5/qttools_git.bb                      |  7 +++-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  4 +-
 ...yland-include-server-buffer-only-when-bui.patch |  4 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_5.4.1.bb                  |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  4 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch | 27 +++++++++++++
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  8 ++--
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  8 ++--
 ...s.prf-allow-build-for-linux-oe-g-platform.patch | 12 +++---
 ...ure.prf-don-t-fail-when-libcap-test-fails.patch | 26 ++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  5 ++-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns.inc                   |  3 --
 recipes-qt/qt5/qtxmlpatterns_5.4.1.bb              |  1 -
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 62 files changed, 209 insertions(+), 146 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
 create mode 100644 recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 521736e..9194a83 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -38,7 +38,7 @@ SRC_URI += " \
     file://OEQt5Toolchain.cmake \
 "
 
-SRCREV = "02c5657a7d6d30c6e874e29a0adcc38b58a45b7d"
+SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 00c4ee4..b659f90 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,4 +4,9 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepends ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
+SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 26fa264..da962b8 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.4.0+git${SRCPV}"
+PV = "5.4.1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 1455c6b..a1ce9f2 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From cfab0821397f5c41e123590b388c6f9c6834b1be Mon Sep 17 00:00:00 2001
+From e04fdddaeb59006c2d599b8b261ce714341029ba Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/12] Add linux-oe-g++ platform
@@ -52,7 +52,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 043d9fc..12fe2f0 100755
+index 6ce6753..0a00d6d 100755
 --- a/configure
 +++ b/configure
 @@ -316,6 +316,16 @@ getQMakeConf()
@@ -119,7 +119,7 @@ index 043d9fc..12fe2f0 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3173,7 +3191,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3178,7 +3196,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -128,7 +128,7 @@ index 043d9fc..12fe2f0 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3211,7 +3229,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -137,7 +137,7 @@ index 043d9fc..12fe2f0 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3682,6 +3700,14 @@ setBootstrapVariable()
+@@ -3687,6 +3705,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -152,7 +152,7 @@ index 043d9fc..12fe2f0 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3720,14 +3746,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -347,5 +347,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 127eada..306af7f 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 060ea3b14cdf9c9224867d114344a4034edfd30f Mon Sep 17 00:00:00 2001
+From 182e7a96a99e9bcabcbd8858c377035a47e4e3e8 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index d592032..c418c5e 100644
+index d66007b..91ca643 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
@@ -35,5 +35,5 @@ index d592032..c418c5e 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 2957c4f..4451751 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 4efa6ef7025ebd03379d76a419c118189e8e9d4e Mon Sep 17 00:00:00 2001
+From 457efc32bb79060a0a58a82ff8a35d67655ef6d6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/12] Add -external-hostbindir option
@@ -34,10 +34,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index 12fe2f0..7ac81d8 100755
+index 0a00d6d..ad5f4cd 100755
 --- a/configure
 +++ b/configure
-@@ -769,6 +769,7 @@ QT_HOST_BINS=
+@@ -770,6 +770,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -45,7 +45,7 @@ index 12fe2f0..7ac81d8 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -888,6 +889,7 @@ while [ "$#" -gt 0 ]; do
+@@ -889,6 +890,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -53,7 +53,7 @@ index 12fe2f0..7ac81d8 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1102,6 +1104,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1107,6 +1109,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -63,7 +63,7 @@ index 12fe2f0..7ac81d8 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2265,6 +2270,10 @@ Installation options:
+@@ -2270,6 +2275,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -74,7 +74,7 @@ index 12fe2f0..7ac81d8 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2944,6 +2953,11 @@ fi
+@@ -2949,6 +2958,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -86,7 +86,7 @@ index 12fe2f0..7ac81d8 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3644,6 +3658,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3649,6 +3663,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -163,7 +163,7 @@ index 6d0de44..ddf7478 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 4387bed..6e1aa7a 100644
+index 7213a84..a977417 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -229,5 +229,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 8790ae6..20ddff9 100644
--- a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From efd941d9d21a7f9a41dcabf7ea88481c3563ae93 Mon Sep 17 00:00:00 2001
+From 8c5554c1ee9a18548c166f6c3a7b487b9d3cdc3e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
@@ -110,5 +110,5 @@ index d213f9e..915c596 100644
  }
  
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index b7bb8c8..02dc13a 100644
--- a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,4 +1,4 @@
-From 4d32129ba11c6b7d4cfd4d037e3e3b73fd32b6b5 Mon Sep 17 00:00:00 2001
+From 825043f0a657cd4b8c3af0e00c79684388460d5c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
 Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
@@ -93,5 +93,5 @@ index 7cc3300..ccbd974a 100644
  }
  
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 386d2e8..251cdc6 100644
--- a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From 29c6088243796faf0b4115a93239d4ada9182757 Mon Sep 17 00:00:00 2001
+From b4d4c91bb504c9e90b69a2d78453bf3523ec6822 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 2b5d5f5..a0aab03 100644
  
  class QEGLPlatformScreen;
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
index d6731d6..23bfa77 100644
--- a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 9eadba2398bfba10209f25b1c2e0ceb04e04957c Mon Sep 17 00:00:00 2001
+From e4235e3a0ebe4494ad1f4f550ddb070100e530e1 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
 Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 7ac81d8..8b42b8e 100755
+index ad5f4cd..c19ff6a 100755
 --- a/configure
 +++ b/configure
-@@ -3622,7 +3622,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3627,7 +3627,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index 7ac81d8..8b42b8e 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 650dd9d..e7e5084 100644
--- a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,4 +1,4 @@
-From b6776c9f0da5988013d5195592b84e313b79daab Mon Sep 17 00:00:00 2001
+From 715b5d739b36588cd2e34962b33a59da1f5427fe Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
 Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
@@ -68,5 +68,5 @@ index 39a3ef9..2c05979 100644
  
      if (isRaster()) {
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
index e30c06f..2f5835c 100644
--- a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 010322a4ca16bcf1ea357689be4a94145733325d Mon Sep 17 00:00:00 2001
+From ab8aa4e79e156ac6df8cd36e287faf838bc32344 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
@@ -153,5 +153,5 @@ index cd268cd..997bc35 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
index d2a1810..1f92eed 100644
--- a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -1,4 +1,4 @@
-From e163574a35ad782a3d43ee8d5e3f212870962e10 Mon Sep 17 00:00:00 2001
+From 276b5046788007bcbc5607046becdd44151960c0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 18 Dec 2014 13:41:09 +0100
 Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
@@ -38,5 +38,5 @@ index 9a846d4..07869ef 100644
  if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
      message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index 728bb5a..3ff193a 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 17929906fd0c057b35ad48b3a22770f8c52c1108 Mon Sep 17 00:00:00 2001
+From c87f9a5ec9a08c415ede4d5118deeb4177778338 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/13] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 81f4fa5..74ec23d 100644
+index 83f7587..9dbcf70 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -162,7 +162,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index 81f4fa5..74ec23d 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index ef65da0..83457f0 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From e199e105df6ded6ea9404b4f7f6f7f8381a51e85 Mon Sep 17 00:00:00 2001
+From f298d49fd1b88ae9bf8f35339a52cd333f42434b Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
@@ -25,10 +25,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  3 files changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 8b42b8e..aa21ff6 100755
+index c19ff6a..7a34b11 100755
 --- a/configure
 +++ b/configure
-@@ -3724,7 +3724,7 @@ setBootstrapEvalVariable()
+@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -64,5 +64,5 @@ index 89d6ea5..0ff4a96 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
index 90dacc2..82505a7 100644
--- a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From dee6fc781f5ac77155817b82f9d66787690a3bb3 Mon Sep 17 00:00:00 2001
+From e598364920b2ff4a90aaaaeb0c58162d1cb64221 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
@@ -45,7 +45,7 @@ index 051e056..50da6ed 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index c418c5e..c8c4188 100644
+index 91ca643..7a567fa 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
@@ -104,5 +104,5 @@ index 6e9d4aa..0ca4daf 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
index 3253ed2..204819c 100644
--- a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
@@ -1,4 +1,4 @@
-From f14e186762bb31f2d9c1e54fd62a0fa4d6cb3550 Mon Sep 17 00:00:00 2001
+From dbfa83051ddb8db0b4a59b226d4e4a41101ae26e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 22 Jan 2015 16:09:35 +0100
 Subject: [PATCH 12/12] Set paths for target properly
@@ -14,10 +14,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 21 insertions(+), 22 deletions(-)
 
 diff --git a/configure b/configure
-index aa21ff6..bc965f6 100755
+index 7a34b11..7bb4476 100755
 --- a/configure
 +++ b/configure
-@@ -3639,28 +3639,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
+@@ -3644,28 +3644,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
      "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
      "qt_tstspath=$QT_SYSROOT_TESTS",
  #else
@@ -68,5 +68,5 @@ index aa21ff6..bc965f6 100755
  };
  static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
index 319fb55..4b48b5b 100644
--- a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 2795008ce11d680385610b80a84b4ee03db78cf0 Mon Sep 17 00:00:00 2001
+From 4ccd1823b88c039415b68a1dc2040859178cb56f Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 8b42b8e..486bb2d 100755
+index c19ff6a..2d920e3 100755
 --- a/configure
 +++ b/configure
-@@ -3874,6 +3874,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3879,6 +3879,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +26,5 @@ index 8b42b8e..486bb2d 100755
  echo "Running configuration tests..."
  
 -- 
-2.3.0
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index b5387b2..cebc021 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -31,7 +31,7 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "02c5657a7d6d30c6e874e29a0adcc38b58a45b7d"
+SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index b6c8411..d33eb68 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-SRC_URI += "\  
+SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
@@ -25,7 +25,7 @@ SRC_URI += "\
     file://0012-Set-paths-for-target-properly.patch \
 "
 
-SRCREV = "02c5657a7d6d30c6e874e29a0adcc38b58a45b7d"
+SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 61411cb..d3586e2 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "944dbb9b558719b3ff9e2d129a328142c0ae6228"
+SRCREV = "dbf0bd93096f8ef54ebcf550ff104237742778dd"
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
index acff84f..8766c34 100644
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From a5a0646f185a8062f6d257afba37f589a223b058 Mon Sep 17 00:00:00 2001
+From f1285bfd6f12cc4dc7727408a38edea13d3d0f46 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtdeclarative_5.4.1.bb b/recipes-qt/qt5/qtdeclarative_5.4.1.bb
index 365a444..eef8841 100644
--- a/recipes-qt/qt5/qtdeclarative_5.4.1.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.4.1.bb
@@ -9,4 +9,3 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 404fb48..af825c7 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c4fcbe9e342f5fa7b86b7facc662575a3f21689b"
+SRCREV = "d43a963e49956ba772644e9f3448dc3672147f77"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 3be2134..5b3f440 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -2,4 +2,4 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "1.1"
-SRCREV = "f8ad37de2d7170d1548252608f8c04aac6ec1035"
+SRCREV = "5581890d3c5919c3bd4b6aafdba650c14a97c312"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ed41baa..cf2498b 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1f7e818a8c6ad81299bd82738b191e7d3ba01faf"
+SRCREV = "6eef4b5fa1836c9cb7ebc5dcb269a8d3114eb6c3"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 6d444eb..db65e6b 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9141782adabcfd374285c3a52b7c386b9b90aa9a"
+SRCREV = "2cf398f541d68f60e0205820524b79b37045bf0f"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 980cb5a..b0258a8 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3c6693ee7f431320b2500c9c4440bb649ed50c89"
+SRCREV = "e746e794dc27933467f6aed0c813e0cc9d0dae77"
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index ab819f2..4020471 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,7 +1,7 @@
-From 4af76880d63e8d392eb8add8b8999e3f5031675a Mon Sep 17 00:00:00 2001
+From a42d29588f9c65d8c480fd9fbcbbd0606f01170f Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
-Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
+Subject: [PATCH] Initial porting effort to GStreamer 1.0.
 
 Imported from git@github.com:jhodapp/qtmultimedia.git
 
@@ -149,13 +149,13 @@ index 6b530cb..975991f 100644
 +LIBS += -lgstphotography-$$GST_VERSION
  
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 3cec526..109dd81 100644
+index cf97e64..d94d6a2 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
 @@ -17,11 +17,26 @@ win32 {
  } else {
-     qtCompileTest(alsa)
-     qtCompileTest(pulseaudio)
+     contains(QT_CONFIG, alsa):qtCompileTest(alsa)
+     contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
 -    qtCompileTest(gstreamer) {
 -        qtCompileTest(gstreamer_photography)
 -        qtCompileTest(gstreamer_encodingprofiles)
@@ -772,7 +772,7 @@ index 2b66f76..804dce9 100644
  #include <gst/gst.h>
  
 diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
-index aa2e2a3..14c1f04 100644
+index 4960187..230fbf4 100644
 --- a/src/gsttools/qgstreamervideowidget.cpp
 +++ b/src/gsttools/qgstreamervideowidget.cpp
 @@ -40,8 +40,13 @@
@@ -789,7 +789,7 @@ index aa2e2a3..14c1f04 100644
  
  QT_BEGIN_NAMESPACE
  
-@@ -169,9 +174,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
+@@ -164,9 +169,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
  {
      GstMessage* gm = message.rawMessage();
  
@@ -804,7 +804,7 @@ index aa2e2a3..14c1f04 100644
          setOverlay();
          QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
          return true;
-@@ -199,18 +208,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
+@@ -194,18 +203,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
  
  void QGstreamerVideoWidgetControl::setOverlay()
  {
@@ -835,7 +835,7 @@ index aa2e2a3..14c1f04 100644
  
          if (caps) {
              m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
-@@ -225,8 +245,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
+@@ -220,8 +240,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
  
  void QGstreamerVideoWidgetControl::windowExposed()
  {
@@ -1032,10 +1032,10 @@ index a373dcc..587b010 100644
  
          if (caps) {
 diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 556fc03..5ea2c59 100644
+index 465f439..cb26137 100644
 --- a/src/gsttools/qgstutils.cpp
 +++ b/src/gsttools/qgstutils.cpp
-@@ -89,8 +89,13 @@ static void addTagToMap(const GstTagList *list,
+@@ -90,8 +90,13 @@ static void addTagToMap(const GstTagList *list,
              break;
          default:
              // GST_TYPE_DATE is a function, not a constant, so pull it out of the switch
@@ -1049,7 +1049,7 @@ index 556fc03..5ea2c59 100644
                  if (g_date_valid(date)) {
                      int year = g_date_get_year(date);
                      int month = g_date_get_month(date);
-@@ -254,6 +259,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
+@@ -255,6 +260,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
  }
  
  
@@ -1074,7 +1074,7 @@ index 556fc03..5ea2c59 100644
  /*!
    Returns audio format for a buffer.
    If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
-@@ -269,7 +292,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
+@@ -270,7 +293,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
      gst_caps_unref(caps);
      return format;
  }
@@ -1083,7 +1083,7 @@ index 556fc03..5ea2c59 100644
  
  /*!
    Builds GstCaps for an audio format.
-@@ -579,7 +602,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
+@@ -588,7 +611,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
  
  void qt_gst_object_ref_sink(gpointer object)
  {
@@ -1689,10 +1689,10 @@ index f944a60..72d1cf1 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index a4038c5..9d1fdfa 100644
+index 1ed663b..e0c6b50 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -760,7 +760,11 @@ qint64 CameraBinSession::duration() const
+@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
          if (fileSink) {
              GstFormat format = GST_FORMAT_TIME;
              gint64 duration = 0;
@@ -1704,7 +1704,7 @@ index a4038c5..9d1fdfa 100644
              gst_object_unref(GST_OBJECT(fileSink));
              if (ret)
                  return duration / 1000000;
-@@ -797,8 +801,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1718,7 +1718,7 @@ index a4038c5..9d1fdfa 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -859,7 +868,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1730,7 +1730,7 @@ index a4038c5..9d1fdfa 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -869,7 +882,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1742,7 +1742,7 @@ index a4038c5..9d1fdfa 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1142,7 +1159,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1754,7 +1754,7 @@ index a4038c5..9d1fdfa 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1262,7 +1283,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
@@ -1862,7 +1862,7 @@ index fed756a..8239710 100644
  }
  
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-index ce267d7..062de07 100644
+index ddc828e..00bee36 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
 @@ -51,7 +51,11 @@
@@ -2365,5 +2365,5 @@ index f2e760a..50bda3d 100644
  
  QT_END_NAMESPACE
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtmultimedia_5.4.1.bb b/recipes-qt/qt5/qtmultimedia_5.4.1.bb
index 0798462..c45ac00 100644
--- a/recipes-qt/qt5/qtmultimedia_5.4.1.bb
+++ b/recipes-qt/qt5/qtmultimedia_5.4.1.bb
@@ -9,4 +9,3 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index aea75d0..fa8d67c 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f420ac286a303bc235b8c1047f8c845314df1f8a"
+SRCREV = "0e161675e6014faeeaa490a9c73a62c1577c674e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 5b24af5..6991e0e 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1f92491bd95abc642dcd882846884a5271c8ba16"
+SRCREV = "41119e843f099ce7d80f966cc754324bfe0f063f"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index e6595d5..1b33c0e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "11df73e4ac2136b72e5fca06bdc4b624a525388a"
+SRCREV = "e10dcd4c98631d1d433073b43101b8c36be05520"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 8f1ba7d..a1d4172 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c6170fa5ee26cf9d0f2140d998fba2420ad1ed79"
+SRCREV = "e12a92d71f2910c961a6ea7d6b28f7c9f55b4e96"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 7fae029..14a9949 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "817a964c710e4bc08b56f45d942944a038d6ab9c"
+SRCREV = "a6a01b612fdb162378c4c184351e7cb8e5a559a0"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 8a5c84d..a4e471b 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "cd9c48833cf4fbf73df68dcdb83f261c03950f91"
+SRCREV = "b84fe7eb3d6d977a347bfbb82da724409b2eda69"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index bf7bf38..b9e57f5 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "5decb627d19ddb2b2aea4d7c317b9abfb86b5b8f"
+SRCREV = "1fb79c9f2b50294b989cf2bdd8bfaaf0a458e2a8"
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index e4ad221..ec58a11 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From ff3f521648906d07ddc1e1aecaddadb95b0314f3 Mon Sep 17 00:00:00 2001
+From 4d4794880eecd27b006b4d00f44c611162d24538 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -151,5 +151,5 @@ index df240e3..27ee687 100644
  installed_cmake.depends = cmake
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 5cc317c..f473041 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 20dd8d70eb3db17173eb3965e757711cc694de2a Mon Sep 17 00:00:00 2001
+From d6fd9b34cd507b054e20c61aaf8bee4bf800abb1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index bf5957b..6eb4d84 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 1d8bf41acc2235528f1d08505cf2dc8afd793aef Mon Sep 17 00:00:00 2001
+From 9868ff8a11f36712f9bc2fe45ad129214994947a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 5f96377..71acdfc 100644
+index 6e82b07..56df78c 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
@@ -25,7 +25,7 @@ index 5f96377..71acdfc 100644
      QT += webkitwidgets
  } else {
      DEFINES += QT_NO_WEBKIT
-@@ -72,7 +72,7 @@ SOURCES += aboutdialog.cpp \
+@@ -71,7 +71,7 @@ SOURCES += aboutdialog.cpp \
      openpageswidget.cpp \
      openpagesmanager.cpp \
      openpagesswitcher.cpp
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index f4eacd1..159f1ba 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
+SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index f4eacd1..159f1ba 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
+SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index f4dffb7..fba976d 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b9481cffeb41ceb9363b7be850bd9cd172b313be"
+SRCREV = "35a64da9fd6fa38e92373798ed17f6cab73586ef"
diff --git a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index ae3d998..a7be5e5 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 99c49a3304c1d08d164e0df252ca85f426381bb7 Mon Sep 17 00:00:00 2001
+From ecaf131c0307f198f8efbf06410976ded97aab80 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 664fa3f..21cc637 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From cd1e17e8c6082fe8578d64baaff55f1f00c0f7a0 Mon Sep 17 00:00:00 2001
+From 256ceb71a2f56060a2716075b8258ad68d992b73 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b8f4a0d..200f586 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "26ec3626f1088c272e3232f0341781bb38f518f3"
+SRCREV = "1e32e71403a6a9cb117343464fbc34564598e831"
diff --git a/recipes-qt/qt5/qtwayland_5.4.1.bb b/recipes-qt/qt5/qtwayland_5.4.1.bb
index 9e868d4..452851b 100644
--- a/recipes-qt/qt5/qtwayland_5.4.1.bb
+++ b/recipes-qt/qt5/qtwayland_5.4.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "653b5e600b1cbf3275d0858415570d2a2611823a4651ee911e684dcae8
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
-QT_VERSION ?= "5.4.1"
+QT_VERSION ?= "${PV}"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a78c34d..f03bcb5 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,13 +1,13 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "26ec3626f1088c272e3232f0341781bb38f518f3"
+SRCREV = "1e32e71403a6a9cb117343464fbc34564598e831"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-QT_VERSION ?= "5.4.0"
+QT_VERSION ?= "5.4.2"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 51176f6..30fcde8 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "86d77a900852691267f556fbde98406a12ee4310"
+SRCREV = "358e5acba3154a8ab4b53b22797c2c1eae4707dc"
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
new file mode 100644
index 0000000..b4a8852
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -0,0 +1,27 @@
+From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 3 Oct 2014 03:52:11 +0200
+Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ chromium/base/base.gypi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
+index a5a990a..af30cfa 100644
+--- a/src/3rdparty/chromium/base/base.gypi
++++ b/src/3rdparty/chromium/base/base.gypi
+@@ -745,7 +745,7 @@
+                 ['include', '^nix/'],
+               ],
+           }],
+-          ['use_qt==1 and target_arch=="ia32"', {
++          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
+               'sources/': [
+                 ['include', 'atomicops_internals_x86_gcc.cc'],
+               ],
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 4587219..c07ada6 100644
--- a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From 41f9b2c1521950e1e3e1f01260f18e698d948814 Mon Sep 17 00:00:00 2001
+From 6e9a0fa4c1e3681deed659c2749223025637b38b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index acf15a8..08b2642 100644
+index 4c2547d..64c08ad 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -84,8 +84,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
  defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
@@ -25,5 +25,5 @@ index acf15a8..08b2642 100644
  }
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 58218a5..91f9724 100644
--- a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From b36aeace50dc429cccbb9b84a6e538ebcd12ade9 Mon Sep 17 00:00:00 2001
+From 418d78e063a47c4a3085ad7761fa1b842775637b Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 08b2642..0123336 100644
+index 64c08ad..b46478b 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -82,7 +82,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -25,5 +25,5 @@ index 08b2642..0123336 100644
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index b19556f..6e9def9 100644
--- a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 69e05cdc9000a1962101b2859d0ae3d77bb751d7 Mon Sep 17 00:00:00 2001
+From 6c8d9e121920519a831ca09f747ed77dfc2bd135 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
@@ -12,18 +12,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 0123336..5cea82a 100644
+index b46478b..6205bf4 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -7,7 +7,7 @@ defineTest(isPlatformSupported) {
+@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
  
-   linux-g++*:!isGCCVersionSupported():return(false)
+   linux-g++*:!isGCCVersionSupported(): return(false)
    !isPythonVersionSupported(): return(false)
 -  linux-g++*|win32-msvc2013|macx-clang: return(true)
 +  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
    boot2qt: return(true)
  
-   warning("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation".)
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch b/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
new file mode 100644
index 0000000..6a2162f
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
@@ -0,0 +1,26 @@
+From 7d20d5e4584abce2353557c90e79ee0b3cdc330e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 27 Feb 2015 19:51:55 +0100
+Subject: [PATCH 4/4] configure.prf: don't fail when libcap test fails
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/configure.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/configure.prf b/tools/qmake/mkspecs/features/configure.prf
+index 6e74b55..b91fde8 100644
+--- a/tools/qmake/mkspecs/features/configure.prf
++++ b/tools/qmake/mkspecs/features/configure.prf
+@@ -20,7 +20,7 @@ defineTest(runConfigure) {
+         qtCompileTest($$test)
+     }
+     # libcap-dev package doesn't ship .pc files on Ubuntu.
+-    linux:!config_libcap:skipBuild("libcap appears to be missing")
++    #linux:!config_libcap:skipBuild("libcap appears to be missing")
+     contains(QT_CONFIG, xcb) {
+         for(package, $$list("libdrm xcomposite xi xrandr")) {
+             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8d1f171..450609d 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -9,10 +9,11 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0004-configure.prf-don-t-fail-when-libcap-test-fails.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
-SRCREV_qtwebengine = "8eefc3a0658d1b10de12f43534cfd63af825ebc8"
-SRCREV_chromium = "be4ec3fa64a4c6c2b641830a9811ab7847c7dd39"
+SRCREV_qtwebengine = "4eceed9ac0b646238e76d77569a619d4dc515ba5"
+SRCREV_chromium = "f9c03801de86b5e9da2b915a9e490c2f2254fecf"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 27dd7ee..0414cbb 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "70bd4d5253f134bf48a30544030bb832f1eba8b3"
+SRCREV = "69a9c9193abe008a9a52640b19a409e4a86c4899"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 0e780f1..c7f25c0 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "88c4538698fbfd7bc7d4e546abb17f9014ed61bd"
+SRCREV = "67aba37ab361fc117366e283365920013b8d8464"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 05ecad0..2913d88 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "df6cc41fbdbed5d61bb43e491c2f2eea32cdc596"
+SRCREV = "fc2b42c874fb41487b86700a04e932e2afaded94"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 6867e04..63ccdcb 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a21bbb45019e1bbc7b583811ff2e84757082a01a"
+SRCREV = "bcc86311359e138ecc3a8fc1ce6eee1cda2ec0f5"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
index 40e1d5c..bbb05a6 100644
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ b/recipes-qt/qt5/qtxmlpatterns.inc
@@ -1,6 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb b/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb
index 8de8de7..583879d 100644
--- a/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb
@@ -9,4 +9,3 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index bb83c1a..3bdbbdc 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2e8b90b33d1d8dce4acdb6a116a227f2a5d3e044"
+SRCREV = "db784fb1c01ca2a0e7ada2c407cd1aab3aa98fee"
-- 
2.3.1


