Return-Path: <leon.anavi@konsulko.com>
X-Greylist: delayed 2623 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Nov 2019 18:04:04 UTC
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 139F87F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 18:04:04 +0000 (UTC)
Received: from [78.130.245.67] (port=59926 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1iVIn3-0008B9-JD; Thu, 14 Nov 2019 19:20:21 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 19:20:10 +0200
Message-Id: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Thu, 14 Nov 2019 18:04:05 -0000

Add a recipe for surf, a simple web browser based on WebKit2/GTK+.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
 meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
 create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb

diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
new file mode 100644
index 0000000..a3e33ea
--- /dev/null
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
@@ -0,0 +1,36 @@
+From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Thu, 14 Nov 2019 14:28:39 +0000
+Subject: [PATCH] config.mk: Fix compiler and linker
+
+Do not set explicitly compiler and linker.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ config.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index df6e812..bf07406 100644
+--- a/config.mk
++++ b/config.mk
+@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
+ GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
+ 
+ # includes and libs
+-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
+-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
++INCS = ${GTKINC}
++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
+ 
+ # flags
+ CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
+@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
+ #LDFLAGS = ${LIBS}
+ 
+ # compiler and linker
+-CC = cc
++#CC = cc
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
new file mode 100644
index 0000000..98d3b23
--- /dev/null
+++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Simple web browser"
+DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
+HOMEPAGE = "https://surf.suckless.org/"
+SECTION = "x11/graphics"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
+
+DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
+           file://0001-config.mk-Fix-compiler-and-linker.patch \
+"
+SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0644 ${S}/surf ${D}${bindir}
+	chmod +x ${D}${bindir}/surf
+}
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4


