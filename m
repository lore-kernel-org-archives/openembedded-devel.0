Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RPhX2-0000Db-6Q
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Nov 2011 22:24:04 +0100
Received: (qmail invoked by alias); 13 Nov 2011 21:17:43 -0000
Received: from p5B0A37D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.209]
	by mail.gmx.net (mp060) with SMTP; 13 Nov 2011 22:17:43 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+tBlF7gkmtWnlXHZJ7oTnbFo+UARzs/koWqrBL34
	lKSArjfzbbqj0D
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Nov 2011 22:22:39 +0100
Message-Id: <1321219363-17855-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/5] xfce4-dev-tools: cleanups
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
X-List-Received-Date: Sun, 13 Nov 2011 21:24:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* do not inherit xfce class to avoid unwanted native dependencies
* xfce4-dev-tools.ipk contains complete set of xfce developer extensions
* run tested on fresh build dir / image similar to angstrom xfce-nm-image
  (task-xfce-extended included) / target overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
index 01e5e18..ce21bf0 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
@@ -1,20 +1,22 @@
 DESCRIPTION = "Xfce4 development tools"
+HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
-PR = "r1"
+PR = "r2"
 
 BBCLASSEXTEND = "native"
 
-inherit xfce
+inherit autotools
 
 do_install_append() {
        install -d ${D}${datadir}/aclocal
        install -m 644 m4macros/*.m4 ${D}${datadir}/aclocal/
 }
 
-FILES_${PN}-dev += " ${datadir}/xfce4/dev-tools/m4macros/*.m4"
+FILES_${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
 
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "9591299c49d92d00ba47974c42a735fa"
 SRC_URI[sha256sum] = "7a1457e9dc839cb121a48e5c53c483ce02a3a5dbaf09376794a13bafe4194815"
-- 
1.7.4.4



