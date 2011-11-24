Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RTaib-0002Tv-D6
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 15:56:05 +0100
Received: by localhost (Postfix, from userid 1000)
	id C81C5440529; Thu, 24 Nov 2011 15:47:17 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 15:47:04 +0100
Message-Id: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 1/2] gypsy: fix packaging
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
X-List-Received-Date: Thu, 24 Nov 2011 14:56:05 -0000

A wrong path had avoided the packaging of the dbus starter script
/usr/share/dbus-1/system-services/org.freedesktop.Gypsy.service.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/gypsy/gypsy.inc    |    4 +++-
 recipes/gypsy/gypsy_0.7.bb |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
index eab062c..964e336 100644
--- a/recipes/gypsy/gypsy.inc
+++ b/recipes/gypsy/gypsy.inc
@@ -3,6 +3,8 @@ LICENSE = "GPL"
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus-glib bluez4 libxslt-native"
 
+INC_PR = "r1"
+
 inherit autotools pkgconfig
 
 do_configure_prepend () {
@@ -14,6 +16,6 @@ PACKAGES += "libgypsy libgypsy-dev libgypsy-dbg"
 FILES_lib${PN} = "${libdir}/lib*.so*"
 FILES_lib${PN}-dev = "${includedir}/* ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
 FILES_lib${PN}-dbg = "${libdir}/.debug"
-FILES_${PN} = "${datadir}/dbus-1/services/ ${libexecdir}/gypsy-daemon ${sysconfdir}/dbus-1/system.d/*"
+FILES_${PN} = "${datadir}/dbus-1/system-services/* ${libexecdir}/gypsy-daemon ${sysconfdir}/dbus-1/system.d/*"
 FILES_${PN}-dbg ="${libexecdir}/.debug*"
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.d/Gypsy.conf"
diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
index 8cd8760..a10cd6e 100644
--- a/recipes/gypsy/gypsy_0.7.bb
+++ b/recipes/gypsy/gypsy_0.7.bb
@@ -1,5 +1,7 @@
 require gypsy.inc
 
+PR = "${INC_PR}.1"
+
 SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-0.7.tar.gz;name=gypsy \
            file://docs-reference-am.patch \
            file://remove-werror.patch \
-- 
1.7.7



