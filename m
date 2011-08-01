Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf6-0006x4-CQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:32 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:12 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:12 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2dI5aa8L2GGrvx8nKrEKjUGjUhCh+1DBa/kb36y
	ATahzgptT+pQxO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:48 +0200
Message-Id: <1312232577-7948-11-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 10/19] xfce4-panel: Add initial recipe with version 4.8.5
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:32 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb  |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb
new file mode 100644
index 0000000..d99f332
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Xfce4 Panel"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
+DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
+
+PR = "r0"
+
+inherit xfce
+
+python populate_packages_prepend() {
+	plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
+	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
+	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+	                  '${PN} plugin for %s', extra_depends='', prepend=True,
+	                  aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
+	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
+	                                     '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
+	                                     '${bindir}/*%s*'])
+}
+
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
+
+FILES_${PN} += "${libdir}/xfce4/panel/migrate \
+                ${libdir}/xfce4/panel/wrapper"
+
+FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
+		   "
+
+FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
+                   "
+
+SRC_URI[md5sum] = "3c00e92821709baa2a71b166a32d46a2"
+SRC_URI[sha256sum] = "df8379a18d337481b847cf232eec907a927287917788e7b730deef4a535deada"
-- 
1.7.4.4



