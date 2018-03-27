Return-Path: <s.sonski@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D23C060102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 18:02:03 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l9so430329wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ekdfwbf6HgFR/RTeXjhbEGtJKADti7rcOmM6H0hw7II=;
	b=IGFgI9Sw8ytUfLSJ3xcU1PpJgVO6OE6Mz01snqiJY1fkk5UQpPhsevkBXh0lGJ1j+o
	nWJIjmruBdjXjDmtCQd8/x8WKUxIjd1tT8ZKaKq4atVHtACRsUghJybzba8Eowp+Uc7B
	Q8B30aneuwosNpWm1nwEBqNbRYSjlMR1Mj4Jq2/D1sYlXEsZdNlMxlnKnNMtwr36r3Tp
	CspcI30IaebJt7/gUB6tqKlB+XnnGAGE2uCQ2muTAfrSYPfHRmiBFp3rerIMPKtj2D4u
	dAhsbkR9oCboCysi9S5iAgxCayMStfUtsppOVBnyoSkx5FnmpZ8jKQvxDwgmZ8pJq+WV
	mhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ekdfwbf6HgFR/RTeXjhbEGtJKADti7rcOmM6H0hw7II=;
	b=IMeupE4OkvSlriBolIv1IJMd4b9RswUKmxT1ubGjeopm5G1AamUrp5gsl7Q++PpYq/
	KeMtYdlF+AFJOhe7vj2WgWHJ6M2MB0pGpU39lGHtC5CTRJJZyXeqUA5+i4ykAR+5pRus
	Zva2PJJxtkduHs+neVsDPVOlniKeIEofLNfJSqa157CiFvLSIQbMzQFwAttXJp6BpJoq
	XDsN0xCITuuVyEI6olk9AUjaU3DrMU/gnWCTEtuTrfsGsuJgZhSUXMny6UHfdTPLp1aG
	zohXnWaFcWL4XKmbs3WymFIk4eOZ5rxyinRc4eJsm1NAf/QeGtu9mGSPIiRZylAIZPvB
	MF7g==
X-Gm-Message-State: AElRT7FvXFB/6HVRixoc8cFrur8gz3jDvfK5N8MfA2YaZlbAV4Ph1wlR
	pbNMVilbnNZJeyFOtz1+wikjWb8I
X-Google-Smtp-Source: AIpwx48uQVDHFP0HjlYEYl643tG/RwIsuum4vO+wOPakfJYeD8hcig2+MA1wdl7HNDqtTaAvo48Mkg==
X-Received: by 10.28.235.5 with SMTP id j5mr194535wmh.11.1522173724394;
	Tue, 27 Mar 2018 11:02:04 -0700 (PDT)
Received: from sonski-desktop.home
	(p200300C803EAC300BF237F051B63C165.dip0.t-ipconnect.de.
	[2003:c8:3ea:c300:bf23:7f05:1b63:c165])
	by smtp.gmail.com with ESMTPSA id 67sm1968374wra.9.2018.03.27.11.02.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Mar 2018 11:02:03 -0700 (PDT)
From: Stefan Sonski <s.sonski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2018 20:01:59 +0200
Message-Id: <20180327180159.9837-1-s.sonski@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-qt5][PATCH] nativesdk-qtbase Enable objcopy for qmake
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
X-List-Received-Date: Tue, 27 Mar 2018 18:02:04 -0000

Enable objcopy for qmake to support separate_debug_info flag for cross-compiled
applications in nativesdk-qtbase.

Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
---
 classes/qmake5_base.bbclass                        |  2 ++
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 ++
 .../0013-Add-objcopy-to-linux-oe-gplatform.patch   | 32 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.patch

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 8f1d143..bfde1d2 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
     OE_QMAKE_LINK='${OE_QMAKE_LINK}' \
     OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
     OE_QMAKE_AR='${OE_QMAKE_AR}' \
+    OE_QMAKE_OBJCOPY='${OE_QMAKE_OBJCOPY}' \
     OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
     OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
 "
@@ -41,6 +42,7 @@ export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
 export OE_QMAKE_LINK = "${CXX}"
 export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
 export OE_QMAKE_AR = "${AR}"
+export OE_QMAKE_OBJCOPY = "${OBJCOPY}"
 export OE_QMAKE_STRIP = "echo"
 
 # qmake reads if from shell environment
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index efcb82c..f4d80e9 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -40,6 +40,7 @@ SRC_URI += "\
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
     file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
+    file://0013-Add-objcopy-to-linux-oe-gplatform.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
@@ -192,6 +193,7 @@ fakeroot do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
     echo 'export OE_QMAKE_LINK=$CXX' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export OE_QMAKE_OBJCOPY=$OBJCOPY' >> $script
     echo 'export OE_QMAKE_STRIP=$STRIP' >> $script
     echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
diff --git a/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.patch b/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.patch
new file mode 100644
index 0000000..fcbce51
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.patch
@@ -0,0 +1,32 @@
+From 487c7a7704106eda0cfea9d9652cb42b9889b5e2 Mon Sep 17 00:00:00 2001
+From: Stefan Sonski <s.sonski@gmail.com>
+Date: Tue, 27 Mar 2018 19:38:13 +0200
+Subject: [PATCH] Add objcopy to linux oe gplatform
+
+---
+ mkspecs/linux-oe-g++/qmake.conf | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
+index 30d31ed16d..740f3bab9d 100644
+--- a/mkspecs/linux-oe-g++/qmake.conf
++++ b/mkspecs/linux-oe-g++/qmake.conf
+@@ -10,6 +10,7 @@ include(../common/linux.conf)
+ 
+ # QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
+ QMAKE_AR              = $$(OE_QMAKE_AR) cqs
++QMAKE_OBJCOPY         = $$(OE_QMAKE_OBJCOPY)
+ QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
+ 
+ include(../common/gcc-base-unix.conf)
+@@ -36,7 +37,5 @@ QMAKE_LINK_C_SHLIB = $$(OE_QMAKE_LINK)
+ # for the SDK
+ isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $$(OE_QMAKE_QT_CONFIG)
+ 
+-include(../oe-device-extra.pri)
+-
+ load(device_config)
+ load(qt_config)
+-- 
+2.16.2
+
-- 
2.16.2


