Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktF-0007IN-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:41 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:21 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX195P75WLFJ5Y5V7ZAe+vGhPkRzz/qa2Jim/ycajjC
	TLm078vBniRWUb
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:41 +0200
Message-Id: <1316704004-19647-11-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 10/13] xfce4-notifyd: Add initial recipe with version 0.2.2
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce4-notifyd/xfce4-notifyd_0.2.2.bb           |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
new file mode 100644
index 0000000..4fea1de
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Easily themable notification daemon with transparency effects"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
+
+FILES_${PN} += " \
+    ${libdir}/xfce4/notifyd \
+    ${datadir}/themes \
+    ${datadir}/dbus-1 \
+"
+
+SRC_URI[md5sum] = "8687fb7a0f270231ada265e363b6ffcc"
+SRC_URI[sha256sum] = "b66e68dfc2164bcf479acd3c7e8b6f83065d23aef988535e2db3506d06a39168"
-- 
1.7.4.4



