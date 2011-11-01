Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLCyq-0001b7-7h
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 12:58:12 +0100
Received: (qmail invoked by alias); 01 Nov 2011 11:52:06 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp017) with SMTP; 01 Nov 2011 12:52:06 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/A5q4T/ZjAirRyx+JPeVfOybXZxxou1b3847V2OW
	jB72Aw/EvDgeyH
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 12:56:37 +0100
Message-Id: <1320148597-10157-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome] gnome-control-center: fix unshipped packages
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
X-List-Received-Date: Tue, 01 Nov 2011 11:58:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

warnings fixed:
WARNING: For recipe gnome-control-center, the following files were installed but not shipped in any package:
WARNING:   /usr/share/mime/XMLnamespaces
WARNING:   /usr/share/mime/version
WARNING:   /usr/share/mime/subclasses
WARNING:   /usr/share/mime/globs2
WARNING:   /usr/share/mime/globs
WARNING:   /usr/share/mime/types
WARNING:   /usr/share/mime/mime.cache
WARNING:   /usr/share/mime/icons
WARNING:   /usr/share/mime/generic-icons
WARNING:   /usr/share/mime/treemagic
WARNING:   /usr/share/mime/magic
WARNING:   /usr/share/mime/aliases

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../gnome-control-center_2.32.1.bb                 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index b308350..1ebfb6d 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra"
 
+PR = "r1"
+
 inherit gnome
 
 SRC_URI[archive.md5sum] = "b4e8ab5c7556ae07addbfcfb4fa2f761"
@@ -20,6 +22,7 @@ FILES_${PN} += "${datadir}/icon* \
                 ${libdir}/window-manager-settings/*.so \
                 ${datadir}/gnome \
                 ${datadir}/desktop-directories \
+                ${datadir}/mime \
                "
 FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
 FILES_${PN}-dev += "${libdir}/window-manager-settings/*a"
-- 
1.7.4.4



