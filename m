Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id AE10B720C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:16:39 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id DxGa1p00B0BVjqb01xGggZ; Mon, 10 Nov 2014 14:16:40 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:16:26 -0600
Message-Id: <5debeca9628a5f6af9487caa4d6f476250a0d937.1415650249.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
In-Reply-To: <cover.1415650249.git.pab@pabigot.com>
References: <cover.1415650249.git.pab@pabigot.com>
Subject: [meta-gnome][RFC 07/10] gnome-bluetooth: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 21:16:39 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 4fd38a0..1f619cd 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 PR = "r1"
 
 SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
+DEPENDS = "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/bluez', 'bluez5', 'bluez5', 'obexd obex-data-server', d)} \
+    gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify virtual/bluez gnome-keyring virtual/libx11 libxi intltool-native"
 
 inherit gnomebase gtk-icon-cache
 
@@ -28,6 +29,6 @@ do_configure_append() {
     sed -i 's,func_fatal_error "error: cannot install,echo "bogus message about,' ${HOST_SYS}-libtool
 }
 
-RRECOMMENDS_${PN} += "obexd obex-data-server"
+RRECOMMENDS_${PN} += "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/bluez', 'bluez5', 'bluez5-obex', 'obexd obex-data-server', d)}"
 
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
-- 
1.8.5.5


