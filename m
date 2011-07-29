Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QmqvS-0007Fx-IL
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 19:32:42 +0200
Received: (qmail invoked by alias); 29 Jul 2011 17:28:25 -0000
Received: from p4FDF15A5.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.165]
	by mail.gmx.net (mp070) with SMTP; 29 Jul 2011 19:28:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/vSjtjrBfv6tuVFV7ckNNMNPF6q2RqxMhtrbW2me
	kRVe59XyK9GDyl
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 19:31:00 +0200
Message-Id: <1311960660-7876-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [meta-oe] iceauth: Import from oe-dev and minor cleanup
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
X-List-Received-Date: Fri, 29 Jul 2011 17:32:42 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
new file mode 100644
index 0000000..e98c0cb
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
+LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
+PR = "${INC_PR}.0"
+
+DEPENDS += " libice"
+
+require xorg-app-common.inc
+
+SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
+SRC_URI[sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
-- 
1.7.4.4



