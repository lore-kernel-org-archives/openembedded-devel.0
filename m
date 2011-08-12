Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qs0k1-0006oe-Pv
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 01:02:13 +0200
Received: (qmail invoked by alias); 12 Aug 2011 22:57:40 -0000
Received: from p5B0A2886.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.40.134]
	by mail.gmx.net (mp047) with SMTP; 13 Aug 2011 00:57:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/IIbJZE/TIDSY9W3EuIlSaUg1Fx6VELzpnsDVp/G
	CmQeXLjyBYVL8B
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Aug 2011 01:00:57 +0200
Message-Id: <1313190057-17104-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] xfce4-screenshooter: Add new recipe
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
X-List-Received-Date: Fri, 12 Aug 2011 23:02:13 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce4-screenshooter_1.8.0.bb                   |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
new file mode 100644
index 0000000..9b008c3
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "An application to take screenshots"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
+DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/apps/${PN}//${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
+"
+
+FILES_${PN} += "${datadir}/xfce4/panel-plugins/*"
+FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+
+SRC_URI[md5sum] = "b51ab5725418e7258273c4a6402adb02"
+SRC_URI[sha256sum] = "68748a42ae68c5a8e9ed1c14ec5c741a344ab30b5b325b8812220539548ad83e"
-- 
1.7.4.4



