Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCM9-0008HM-Sk
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 18:54:37 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2009238faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EUPl98lmzw0ZNKjxM8TN551zVpz/l3oHf/ilZWej8Ao=;
	b=uonpZ4+V5qrApRkvg5itSYDrA0yERyozATgG5IY7+AYORoi7rxMh+fESQBOV1rGg5i
	bpvrpSPv7Q15mcmEhKoLHRy0FwqOp2RdxPLZeoc+PypibalRAJEV7N18u7x1NDhRbm/P
	aUYiTQqfjBGp/j1xXxY0ClVlrKhDUtDKKV5+Y=
Received: by 10.223.17.80 with SMTP id r16mr6104854faa.37.1320860904542;
	Wed, 09 Nov 2011 09:48:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm7466468faf.0.2011.11.09.09.48.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:48:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:47:55 +0100
Message-Id: <15e1d24dd8ceb0b5caad096f215a3ace86f6c14d.1320860740.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
References: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860740.git.Martin.Jansa@gmail.com>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
Subject: [meta-oe 3/4] libsdl-x11: drop from meta-oe
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
X-List-Received-Date: Wed, 09 Nov 2011 17:54:38 -0000

* there is libsdl in oe-core and nothing depends on libsdl-x11 here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc  |   27 --------------------
 .../recipes-graphics/libsdl/libsdl-x11_1.2.14.bb   |   18 -------------
 2 files changed, 0 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-x11_1.2.14.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
deleted file mode 100644
index 92627e3..0000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.14.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Simple DirectMedia Layer (DirectFB and Framebuffer support)"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
-
-DEPENDS = "alsa-lib"
-PROVIDES = "virtual/libsdl"
-INC_PR = "r0"
-
-SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz"
-SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
-SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
-
-S = "${WORKDIR}/SDL-${PV}"
-
-inherit autotools lib_package binconfig pkgconfig
-
-EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
-
-do_configure_prepend () {
-        # Remove old libtool macros.
-        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
-        for i in ${MACROS}; do
-               rm -f acinclude/$i
-        done
-	export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
-}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-x11_1.2.14.bb b/meta-oe/recipes-graphics/libsdl/libsdl-x11_1.2.14.bb
deleted file mode 100644
index 26f2c18..0000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl-x11_1.2.14.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require libsdl-1.2.14.inc
-
-DEPENDS += "virtual/libgl virtual/libx11 libxext tslib"
-DEPENDS_avr32 += "alsa-lib virtual/libx11 libxext tslib"
-
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF = " \
-  --disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
-  --enable-file --enable-oss --enable-alsa --disable-esd --disable-arts \
-  --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
-  --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
-  --enable-video-fbcon --disable-video-directfb --disable-video-ps2gs \
-  --disable-video-xbios --disable-video-gem --disable-video-dummy \
-  --enable-video-opengl --enable-input-events --enable-pthreads \
-  --disable-video-picogui --disable-video-qtopia --enable-dlopen \
-  --enable-input-tslib --disable-video-ps3 --disable-rpath \
-"
-- 
1.7.8.rc1



