Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 7927760E79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:03:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,693,1389740400"; d="scan'208";a="42997528"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Mar 2014 10:03:09 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 20 Mar 2014 10:03:08 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 20 Mar 2014 10:03:08 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Mar 2014 09:55:53 +0100
Message-ID: <1395305753-2195-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fim 0.4-rc1: add "hf" PACKAGECONFIG option
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
X-List-Received-Date: Thu, 20 Mar 2014 09:03:10 -0000
Content-Type: text/plain

This embedds a console font in fim executable.

To use it, don't forget to define FBFONT with the special value:
export FBFONT='fim://'

Option is enabled by default because kdb-consolefonts package
only provides PSF version 2 files (fim only support version 1 and creates an error).

Benchmarked fim executable size: +6Kb (x86_64) and +7Kb (armv7).

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-graphics/fim/files/cross_cc.patch | 29 +++++++++++++++++++++++
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb       |  6 +++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fim/files/cross_cc.patch

diff --git a/meta-oe/recipes-graphics/fim/files/cross_cc.patch b/meta-oe/recipes-graphics/fim/files/cross_cc.patch
new file mode 100644
index 0000000..85ab1ef
--- /dev/null
+++ b/meta-oe/recipes-graphics/fim/files/cross_cc.patch
@@ -0,0 +1,29 @@
+From 9b0b322d86c7b2d2cddaa62f7dab4aa669739a48 Mon Sep 17 00:00:00 2001
+From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+Date: Wed, 19 Mar 2014 13:18:21 +0100
+Subject: [PATCH] Upstream-Status: Pending
+
+b2ba should be built by BUILD_CC in cross environment
+This is only used when configured with --enable-hardcoded-font
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a1d4330..a8150b9 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -63,7 +63,7 @@ help-acm.cpp: fim.h
+ 	$(ECHO) '//#endif' >> $@
+ 
+ b2ba:
+-	$(CC) -o b2ba b2ba.c
++	$(BUILD_CC) -o b2ba b2ba.c
+ 
+ if FIM_WANT_CUSTOM_HARDCODED_CONSOLEFONT
+ default_font_byte_array.h: $(FIM_CUSTOM_HARDCODED_CONSOLEFONT) b2ba
+-- 
+1.8.5.4
+
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 01aa87c..b291a5a 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
 # flex with provide /usr/include/FlexLexer.h
 DEPENDS = "flex-native bison-native flex"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.gz \
+           file://cross_cc.patch"
 SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
 SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
 
@@ -37,7 +38,7 @@ EXTRA_OECONF = "fim_cv_regex=no fim_cv_regex_broken=no \
 "
 
 # Note: imlib2 is located in meta-efl layer.
-PACKAGECONFIG ??= "jpeg rl"
+PACKAGECONFIG ??= "jpeg rl hf"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
@@ -46,3 +47,4 @@ PACKAGECONFIG[pdf] = "--enable-poppler,--disable-poppler,poppler"
 PACKAGECONFIG[magick] = "--enable-graphicsmagick,--disable-graphicsmagick,imagemagick"
 PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
 PACKAGECONFIG[rl] = "--enable-readline,--disable-readline,readline"
+PACKAGECONFIG[hf] = "--enable-hardcoded-font,--disable-hardcoded-font"
-- 
1.8.5.4


