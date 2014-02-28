Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id D083C60E79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:58:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,562,1389740400"; d="scan'208";a="41953856"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Feb 2014 17:58:10 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 28 Feb 2014 17:58:10 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 28 Feb 2014 17:58:09 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2014 17:51:01 +0100
Message-ID: <1393606261-26991-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fim: add newrecipe for version 0.4-rc1
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
X-List-Received-Date: Fri, 28 Feb 2014 16:58:12 -0000
Content-Type: text/plain

FIM (Fbi IMproved) is a framebuffer (customizable and scriptable) image viewer.
It is based on Fbi image viewer.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb

diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
new file mode 100644
index 0000000..01aa87c
--- /dev/null
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Framebuffer (scriptable) image viewer"
+DESCRIPTION = "FIM (Fbi IMproved) aims to be a highly customizable and scriptable \
+               image viewer targeted at users who are comfortable with software \
+               like the Vim text editor or the Mutt mail user agent."
+SECTION = "utils"
+HOMEPAGE = "http://www.autistici.org/dezperado/fim/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
+
+# flex with provide /usr/include/FlexLexer.h
+DEPENDS = "flex-native bison-native flex"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
+SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
+
+PARALLEL_MAKE = ""
+
+inherit autotools
+
+# Don't use provided regex.c
+EXTRA_OECONF = "fim_cv_regex=no fim_cv_regex_broken=no \
+    --enable-framebuffer \
+    --disable-djvu \
+    --disable-ps \
+    --disable-xcftopnm \
+    --disable-convert \
+    --disable-inkscape \
+    --disable-xfig \
+    --disable-dia \
+    --disable-aa \
+    --disable-sdl \
+    --enable-read-dirs \
+    --enable-recursive-dirs \
+    --enable-custom-status-bar \
+"
+
+# Note: imlib2 is located in meta-efl layer.
+PACKAGECONFIG ??= "jpeg rl"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
+PACKAGECONFIG[gif] = "--enable-gif,--disable-gif,giflib"
+PACKAGECONFIG[pdf] = "--enable-poppler,--disable-poppler,poppler"
+PACKAGECONFIG[magick] = "--enable-graphicsmagick,--disable-graphicsmagick,imagemagick"
+PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
+PACKAGECONFIG[rl] = "--enable-readline,--disable-readline,readline"
-- 
1.8.5.4


