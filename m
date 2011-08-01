Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf1-0006w0-I4
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:27 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:06 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:06 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18ENi8wLVYEFja/ABl0lGw2ajP+hCfKxwqeGiL6Ns
	80NN83dB1fy4t4
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:41 +0200
Message-Id: <1312232577-7948-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 03/19] xfce4-dev-tools: Add initial recipe with version 4.8.0
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:27 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
new file mode 100644
index 0000000..3df67ee
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Xfce4 development tools"
+SECTION = "x11/libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+
+PR = "r0"
+
+inherit xfce
+
+do_install_append() {
+       install -d ${D}${datadir}/aclocal
+       install -m 644 m4macros/*.m4 ${D}${datadir}/aclocal/
+}
+
+FILES_${PN}-dev += " ${datadir}/xfce4/dev-tools/m4macros/*.m4"
+
+SRC_URI[md5sum] = "9591299c49d92d00ba47974c42a735fa"
+SRC_URI[sha256sum] = "7a1457e9dc839cb121a48e5c53c483ce02a3a5dbaf09376794a13bafe4194815"
-- 
1.7.4.4



