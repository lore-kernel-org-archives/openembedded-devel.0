Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RBvqf-0000yE-D5
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2011 23:51:25 +0200
Received: (qmail invoked by alias); 06 Oct 2011 21:45:49 -0000
Received: from p5B0A22E3.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.227]
	by mail.gmx.net (mp008) with SMTP; 06 Oct 2011 23:45:49 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/+Q7YMkGz+c83hASZyKwNcb9fZwTFucnYIMU1EUo
	FEHiGCskFbFn59
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2011 23:49:57 +0200
Message-Id: <1317937797-27434-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] ristretto: Add inital recipe for version 0.1.0
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
X-List-Received-Date: Thu, 06 Oct 2011 21:51:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-apps/ristretto/ristretto_0.1.0.bb      |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
new file mode 100644
index 0000000..0b9cca0
--- /dev/null
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.1.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Image-viewer application"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "4df4e5e44221940d4c373f51ac1b5cdb"
+SRC_URI[sha256sum] = "47c480f78de1100b704a46948438575acc1025d1a9fef3ef63fba139943739cb"
-- 
1.7.4.4



