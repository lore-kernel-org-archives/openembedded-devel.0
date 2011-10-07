Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RCGko-0001wf-3V
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 22:10:46 +0200
Received: (qmail invoked by alias); 07 Oct 2011 20:05:05 -0000
Received: from p5B0A137D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.19.125]
	by mail.gmx.net (mp053) with SMTP; 07 Oct 2011 22:05:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+zs8Q0xMqzn3miPGx7xTD+XSM7Syb5wW4+5xPhuB
	FvNvXn3YlETHZD
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2011 22:09:09 +0200
Message-Id: <1318018149-9424-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] ristretto: Add inital recipe for version 0.1.1
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
X-List-Received-Date: Fri, 07 Oct 2011 20:10:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-apps/ristretto/ristretto_0.1.1.bb      |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
new file mode 100644
index 0000000..8944a29
--- /dev/null
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Tiny image-viewer"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "4b0f58c00ef99f13ebf134979ee76980"
+SRC_URI[sha256sum] = "8f4986a646460b24282cc95cc30f03484a5c8e0f1c568a9f4ef5749a66ec62da"
-- 
1.7.4.4



