Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf5-0006x3-Oj
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:32 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:11 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:11 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1956CM+tgV5mBaMfh1l1iiVTPWB7cWB+3VTHMmjoK
	O2tFSCY2vR5Q9n
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:46 +0200
Message-Id: <1312232577-7948-9-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 08/19] libxfce4ui: Add initial recipe with version 4.8.0
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
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb    |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb
new file mode 100644
index 0000000..82fff58
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
+SECTION = "x11/libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
+DEPENDS = "gtk+ gettext intltool libxfce4util startup-notification xfconf"
+
+PR = "r0"
+
+inherit xfce
+
+FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
+
+SRC_URI[md5sum] = "df9acb3328dff905bd0777b84532b69f"
+SRC_URI[sha256sum] = "21f67fd004653440bfdb44874ed69c9806b4784978ec068d0b1c7012864ba339"
-- 
1.7.4.4



