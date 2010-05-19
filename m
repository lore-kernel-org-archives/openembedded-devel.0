Received: from ip-70-38-54-39.static.privatedns.com
	([70.38.54.39] helo=ginevra.hungrycats.org ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <postmaster@ginevra.hungrycats.org>)
	id 1OEq1U-0003U1-Kc for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 22:37:49 +0200
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
X-Envelope-Mail-From: oe-dev-esightcorp@mailtoo.hungrycats.org
Received: from gibbs.hungrycats.org (gibbs.vpn7.hungrycats.org [10.132.226.42])
	by ginevra.hungrycats.org (Postfix) with ESMTP id 91D792C016;
	Wed, 19 May 2010 16:24:57 -0400 (EDT)
Received: from zblaxell by gibbs.hungrycats.org with local (Exim 4.69)
	(envelope-from <oe-dev-esightcorp@mailtoo.hungrycats.org>)
	id 1OEpox-0007N1-EP; Wed, 19 May 2010 16:24:51 -0400
From: Zygo Blaxell <oe-dev-esightcorp@mailtoo.hungrycats.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 May 2010 16:24:24 -0400
Message-Id: <1274300664-27902-3-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
References: <1274300664-27902-1-git-send-email-oe-dev-esightcorp@mailtoo.hungrycats.org>
X-SA-Exim-Connect-IP: 70.38.54.39
X-SA-Exim-Mail-From: postmaster@ginevra.hungrycats.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] libsdl-directfb: new upstream version 1.2.14
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
X-List-Received-Date: Wed, 19 May 2010 20:37:50 -0000

This is a copy of libsdl-x11_1.2.14.bb, with EXTRA_OECONF and
DEPENDS from libsdl-directfb_1.2.11.bb.
---
 recipes/libsdl/libsdl-directfb_1.2.14.bb |   56 ++++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsdl/libsdl-directfb_1.2.14.bb

diff --git a/recipes/libsdl/libsdl-directfb_1.2.14.bb b/recipes/libsdl/libsdl-directfb_1.2.14.bb
new file mode 100644
index 0000000..056ca8e
--- /dev/null
+++ b/recipes/libsdl/libsdl-directfb_1.2.14.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Simple DirectMedia Layer (Framebuffer support only)"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "alsa-lib directfb"
+
+DEFAULT_PREFERENCE = "-1"
+
+PROVIDES = "virtual/libsdl"
+PR = "r0"
+
+SRC_URI = "\
+  http://www.libsdl.org/release/SDL-${PV}.tar.gz \
+  file://sdl.m4 \
+"
+
+S = "${WORKDIR}/SDL-${PV}"
+
+inherit autotools binconfig pkgconfig
+
+EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
+                --enable-file --enable-oss --enable-alsa --disable-esd --disable-arts \
+                --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
+                --disable-mintaudio --disable-nasm --disable-video-x11 --disable-video-dga \
+                --enable-video-fbcon --enable-video-directfb --disable-video-ps2gs \
+                --disable-video-xbios --disable-video-gem --disable-video-dummy \
+                --disable-video-opengl --enable-input-events --enable-pthreads \
+                --disable-video-picogui --disable-video-qtopia --enable-dlopen"
+
+do_configure() {
+  oe_runconf
+}
+
+do_configure_append () {
+  cd ${S}
+
+  # prevent libtool from linking libs against libstdc++, libgcc, ...
+  cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=".*"/postdeps=""/' > ${TARGET_PREFIX}libtool.tmp
+  mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
+
+  # copy new sdl.m4 macrofile to the dir for installing
+  cp ${WORKDIR}/sdl.m4 ${S}/
+}
+
+do_stage() {
+  autotools_stage_all		
+  rm ${STAGING_LIBDIR}/libSDL.la
+}
+
+FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${bindir}/*config"
+
+CFLAGS_append  += " -I${STAGING_INCDIR}/directfb"
+
+SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
+SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
-- 
1.7.1



