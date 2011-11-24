Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTUlW-0006V9-Dm
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 09:34:42 +0100
Received: by faat2 with SMTP id t2so2667929faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 00:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FyPijqxJl+pyJecSc+1TvjRFDmCGOTVz8LSyQC1WJNA=;
	b=ci7vTL15+BGEQOr/LKduryiSCN5pCcnqOFr9a4Q6U8r+d9VzVuUDgZz3cRmazMg6Xl
	JGuimJe2WSk954wBXjk9SvCq87kqJN/U6baJIaAR5+ZUyJDSlaXmmkYtErGzYRFW0b8x
	xD5bO5DalJiE02aKXUJohVwAmvxOXQuvqGmDk=
Received: by 10.180.106.104 with SMTP id gt8mr27765693wib.6.1322123286701;
	Thu, 24 Nov 2011 00:28:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u3sm6257347wiu.10.2011.11.24.00.28.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 00:28:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 09:15:13 +0100
Message-Id: <1322122513-7706-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <CAMKF1sqefAi5zQoX8hyFXuo8Xus6r3=8KyQ_E4SyCvGewi9KzA@mail.gmail.com>
References: <CAMKF1sqefAi5zQoX8hyFXuo8Xus6r3=8KyQ_E4SyCvGewi9KzA@mail.gmail.com>
Subject: [meta-oe v2] abiword: fix no-undefined param
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
X-List-Received-Date: Thu, 24 Nov 2011 08:34:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../abiword/abiword/fix.no.undefined.param.patch   |  104 ++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |    5 +-
 2 files changed, 108 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
new file mode 100644
index 0000000..aaccf09
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
@@ -0,0 +1,104 @@
+| make[3]: Entering directory
+`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/abiword-2.8.6/src'
+| /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CXX   --mode=link
+arm-oe-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize
+-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
+--sysroot=/OE/shr-core/tmp/sysroots/nokia900  -O2 -pipe -g
+-feliminate-unused-debug-types -fpermissive
+-fvisibility-inlines-hidden  --no-undefined -avoid-version
+-export-dynamic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
+abiword abiword-UnixMain.o libabiword-2.8.la  -pthread -lfribidi -lwv
+-lpng -lgsf-1 -lxml2 -lenchant -lz -lgtk-x11-2.0 -lgdk-x11-2.0
+-latk-1.0 -lpangoft2-1.0 -lpangocairo-1.0 -lpango-1.0 -lfreetype
+-lfontconfig -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lcairo
+-lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0   -ljpeg
+| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-g++
+-march=armv7-a -fno-tree-vectorize -mthumb-interwork
+-mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
+--sysroot=/OE/shr-core/tmp/sysroots/nokia900 -O2 -pipe -g
+-feliminate-unused-debug-types -fpermissive
+-fvisibility-inlines-hidden --no-undefined -Wl,-O1
+-Wl,--hash-style=gnu -Wl,--as-needed -o .libs/abiword
+abiword-UnixMain.o -pthread -Wl,--export-dynamic
+./.libs/libabiword-2.8.so -L=/usr/lib
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfribidi.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libwv.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgsf-1.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libbz2.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libenchant.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgtk-x11-2.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk-x11-2.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libatk-1.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/librsvg-2.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxml2.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangocairo-1.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangoft2-1.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libstdc++.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpango-1.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk_pixbuf-2.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgio-2.0.so -lresolv
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libcairo.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpixman-1.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfontconfig.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libexpat.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfreetype.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpng12.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXrender.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libX11.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxcb.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXau.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXdmcp.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libERROR: Function
+'do_compile' failed (see
+/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/temp/log.do_compile.10916
+for further information)
+| z.so -lm /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgmodule-2.0.so
+-ldl /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgobject-2.0.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libffi.so
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgthread-2.0.so -lpthread
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libglib-2.0.so -lrt
+/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libjpeg.so -pthread
+| arm-oe-linux-gnueabi-g++: error: unrecognized option '--no-undefined'
+| make[3]: *** [abiword] Error 1
+| make[3]: Leaving directory
+`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/abiword-2.8.6/src'
+
+Maybe it's related to
+http://lists.gnu.org/archive/html/libtool/2011-03/msg00015.html
+
+Remove extra '-' in no-undefined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr abiword-2.8.6.orig/src/Makefile.am abiword-2.8.6/src/Makefile.am
+--- abiword-2.8.6.orig/src/Makefile.am	2009-09-09 15:11:01.000000000 +0200
++++ abiword-2.8.6/src/Makefile.am	2011-11-23 09:06:06.000000000 +0100
+@@ -44,7 +44,7 @@
+ 
+ libabiword_2_8_la_LDFLAGS = \
+ 	$(DEPS_LIBS) \
+-	--no-undefined \
++	-no-undefined \
+ 	-avoid-version \
+ 	-export-dynamic
+ 
+@@ -107,7 +107,7 @@
+ 
+ AbiWord_LDFLAGS = \
+ 	$(DEPS_LIBS) \
+-	--no-undefined \
++	-no-undefined \
+ 	-avoid-version \
+ 	-export-dynamic \
+ 	-headerpad_max_install_names 
+@@ -129,7 +129,7 @@
+ 
+ abiword_LDFLAGS = \
+ 	$(platform_ldflags) \
+-	--no-undefined      \
++	-no-undefined      \
+ 	-avoid-version      \
+ 	-export-dynamic
+ 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 1746769..2d0ec97 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -2,9 +2,12 @@ require abiword-2.5.inc
 DEPENDS += " loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
+PR = "r1"
+
 SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
            file://autogen-common.sh \
-           file://nodolt.patch"
+           file://nodolt.patch \
+           file://fix.no.undefined.param.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 
-- 
1.7.8.rc3



