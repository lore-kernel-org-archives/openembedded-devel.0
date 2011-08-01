Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf0-0006vw-LS
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:26 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:05 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+GrcQTeJmGlS6lD0vz7BNdyc4smiT5t9Z+OuSfOf
	AzO7NJocZTAhpX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:40 +0200
Message-Id: <1312232577-7948-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 02/19] xfce.bbclass: A class for xfce-global settings
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:26 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/classes/xfce.bbclass

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
new file mode 100644
index 0000000..a5a35bb
--- /dev/null
+++ b/meta-xfce/classes/xfce.bbclass
@@ -0,0 +1,11 @@
+HOMEPAGE = "http://www.xfce.org"
+SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
+
+inherit autotools gtk-icon-cache pkgconfig
+
+FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
+FILES_${PN}-doc += "${datadir}/xfce4/doc"
+
+FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
+FILES_${PN}-dbg += "${libdir}/xfce4/*/.debug"
+
-- 
1.7.4.4



