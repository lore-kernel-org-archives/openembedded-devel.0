Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7SS5-0003le-3H
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 14:35:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 4B0CD3149F78
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 14:34:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bVzb2sJywYDf; Sun, 17 Oct 2010 14:34:22 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 829753149F75;
	Sun, 17 Oct 2010 14:34:21 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 12:34:21 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 12:34:20 +0000
Message-Id: <1287318860-1312-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20101015143014.GA9736@rhein.zuhause.netz>
References: <20101015143014.GA9736@rhein.zuhause.netz>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsdl-directfb: update to 1.2.14
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
X-List-Received-Date: Sun, 17 Oct 2010 12:35:01 -0000

Changes since v1:
* removed patches.
* use autoreconf to update libtool etc.
* inherit lib_package
* dropped some unused configure options.
* ran oe-stylize.py

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libsdl/libsdl-directfb_1.2.14.bb |   49 ++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsdl/libsdl-directfb_1.2.14.bb

diff --git a/recipes/libsdl/libsdl-directfb_1.2.14.bb b/recipes/libsdl/libsdl-directfb_1.2.14.bb
new file mode 100644
index 0000000..045600d
--- /dev/null
+++ b/recipes/libsdl/libsdl-directfb_1.2.14.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "Simple DirectMedia Layer (DirectFB and Framebuffer support)"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "alsa-lib directfb"
+PROVIDES = "virtual/libsdl"
+
+SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz"
+SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
+SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
+
+S = "${WORKDIR}/SDL-${PV}"
+
+inherit autotools lib_package binconfig pkgconfig
+
+EXTRA_OECONF = " \
+        --disable-arts \
+        --disable-diskaudio \
+        --disable-esd \
+        --disable-esd-shared \
+        --disable-esdtest \
+        --enable-input-events \
+        --disable-input-tslib \
+        --disable-mintaudio \
+        --disable-nas \
+        --disable-nasm \
+        --disable-video-dga \
+        --disable-video-dummy \
+        --enable-video-directfb \
+        --enable-video-fbcon \
+        --disable-video-opengl \
+        --disable-video-picogui \
+        --disable-video-ps2gs \
+        --disable-video-ps3 \
+        --disable-video-qtopia \
+        --disable-video-x11 \
+"
+EXTRA_AUTORECONF += "--include=acinclude"
+
+# Skip autoheader, because it must not overwrite SDL_config.h.in.
+export AUTOHEADER = "true"
+
+do_configure_prepend () {
+        # Remove old libtool macros.
+        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+        for i in ${MACROS}; do
+               rm acinclude/$i
+        done
+}
-- 
1.7.1



