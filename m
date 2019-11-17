Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 75B8D6D545
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 18:28:35 +0000 (UTC)
Received: from [78.130.245.67] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1iWPHk-0006Ig-2z; Sun, 17 Nov 2019 20:28:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 20:28:11 +0200
Message-Id: <1574015291-12573-1-git-send-email-leon.anavi@konsulko.com>
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
Subject: [meta-oe][PATCHv4] surf: Add a simple web browser
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
X-List-Received-Date: Sun, 17 Nov 2019 18:28:35 -0000

Add a recipe for surf, a simple web browser based on WebKit2/GTK+.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-config.mk-Fix-compiler-and-linker.patch   | 41 ++++++++++++++++++++++
 meta-oe/recipes-graphics/surf/surf_2.0.bb          | 26 ++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
 create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb

diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
new file mode 100644
index 0000000..fb90432
--- /dev/null
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
@@ -0,0 +1,41 @@
+From e97bb73851f5bbd94260da553a222526485cdfb1 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Fri, 15 Nov 2019 18:24:42 +0000
+Subject: [PATCH] config.mk: Fix compiler and linker
+
+Do not set explicitly compiler and linker.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ config.mk | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index df6e812..5deb991 100644
+--- a/config.mk
++++ b/config.mk
+@@ -15,17 +15,17 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
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
+ CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
+-LDFLAGS = -s ${LIBS}
++LDFLAGS = ${LIBS}
+ 
+ # Solaris
+ #CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
+ #LDFLAGS = ${LIBS}
+ 
+ # compiler and linker
+-CC = cc
++CC ?= cc
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
new file mode 100644
index 0000000..39c0f5e
--- /dev/null
+++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Simple web browser"
+DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
+HOMEPAGE = "https://surf.suckless.org/"
+SECTION = "x11/graphics"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
+
+DEPENDS = "webkitgtk gtk+3 glib-2.0"
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
+inherit pkgconfig distro_features_check
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/surf ${D}${bindir}
+}
-- 
2.7.4


