Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RXp9Z-0006hN-JL
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 08:09:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB672cP5008664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2011 23:02:38 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 5 Dec 2011 23:02:38 -0800
Message-ID: <db85bdb92ce1ffd1840f4fb719035d3b5692888e.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323141676.git.xiaofeng.yan@windriver.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 14:58:46 +0800
Date: Tue, 6 Dec 2011 14:58:12 +0800
To: <openembedded-devel@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Tue, 06 Dec 2011 07:09:26 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 39a4f4a..7fc55e2 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -12,11 +12,18 @@ SECTION = "libs"
 
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
-           libgcrypt cairo gdk-pixbuf ${X11DEPENDS}"
+           libgcrypt cairo gdk-pixbuf"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+            ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+ 
+PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
+
 
 inherit autotools pkgconfig
 
-PACKAGES += "libgail"
+PACKAGES += "libgail gtk-demo"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache \
 	${bindir}/gtk-query-immodules-2.0 \
@@ -41,6 +48,11 @@ FILES_${PN}-dbg += " \
 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
 
+FILES_gtk-demo = " \
+         ${datadir}/gtk-2.0/demo/* \
+         ${bindir}/gtk-demo \
+         "
+
 FILES_libgail = " \
 	${libdir}/gtk-2.0/modules/libgail.so \
 	${libdir}/gtk-2.0/modules/libferret.so \
-- 
1.7.0.4



