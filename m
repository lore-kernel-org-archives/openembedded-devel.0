Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QsHnT-0002td-1s
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 19:14:55 +0200
Received: (qmail invoked by alias); 13 Aug 2011 17:10:20 -0000
Received: from p4FDF0956.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.9.86]
	by mail.gmx.net (mp004) with SMTP; 13 Aug 2011 19:10:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19HvvhpC6VH1nLTk2mnhwOdZMEQWru27svfOQUmeI
	yr8pcQIjuRPhb6
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Aug 2011 19:13:35 +0200
Message-Id: <1313255615-14503-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][PATCH v2] xfce4-screenshooter: Add initial recipe with version 1.8.0
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
X-List-Received-Date: Sat, 13 Aug 2011 17:14:55 -0000

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce4-screenshooter_1.8.0.bb                   |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
new file mode 100644
index 0000000..ef409c1
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Application to take screenshots"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
+DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+# decoded to e.g. http://archive.xfce.org/src/apps/xfce4-screenshooter/1.8/xfce4-screenshooter-1.8.0.tar.bz2
+SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
+"
+
+FILES_${PN} += "${datadir}/xfce4/panel-plugins/*"
+FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+
+SRC_URI[md5sum] = "b51ab5725418e7258273c4a6402adb02"
+SRC_URI[sha256sum] = "68748a42ae68c5a8e9ed1c14ec5c741a344ab30b5b325b8812220539548ad83e"
-- 
1.7.4.4



