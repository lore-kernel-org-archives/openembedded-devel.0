Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf2-0006wH-U1
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:29 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:08 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:08 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1//TvRol8//FhlSjchWulJtylsozIc9PbIwO0Luch
	BNhDWYrERIVzTB
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:43 +0200
Message-Id: <1312232577-7948-6-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 05/19] garcon: Add initial recipe with version 0.1.8
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:29 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
new file mode 100644
index 0000000..63825fe
--- /dev/null
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
@@ -0,0 +1,14 @@
+DESCRIPTION="Xfce Menu Library"
+SECTION = "x11/libs"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
+DEPENDS = "glib-2.0 xfce4-dev-tools"
+
+PR = "r0"
+
+inherit xfce
+
+FILES_${PN} += " ${datadir}/desktop-directories"
+
+SRC_URI[md5sum] = "18fbf523ed2865dfaccdfb40b4b20b05"
+SRC_URI[sha256sum] = "955a05e72ebbadc8207bb7b2c7349e71830dbdd596dbba3ea3665f0ecfb9cf63"
-- 
1.7.4.4



