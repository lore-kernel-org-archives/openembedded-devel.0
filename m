Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf5-0006wk-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:31 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:10 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:10 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/7Y8khAUn7FzCu0Q8C/UZvf/H0uEdrTnC9pK8j1X
	BMrXzb0bKMWu7+
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:45 +0200
Message-Id: <1312232577-7948-8-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 07/19] xfconf: Add initial recipe with version 4.8.0
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
 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
new file mode 100644
index 0000000..65efffd
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Xfce configuration daemon and utilities"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+DEPENDS = "dbus-glib libxfce4util perl-native"
+
+PR = "r0"
+
+inherit xfce
+
+FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
+                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+
+SRC_URI[md5sum] = "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
+SRC_URI[sha256sum] = "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6666bc0cdadd1b85d"
-- 
1.7.4.4



