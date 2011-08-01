Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QnzfA-0006xx-8v
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:36 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:15 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19vFr4vivhvmjnAElEetoQK0slQ1Lx+/ckVZIgUTv
	wGIvb4bGMqe50c
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:56 +0200
Message-Id: <1312232577-7948-19-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 18/19] xfce-terminal: Add initial recipe with version 0.4.8
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:37 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce-terminal/xfce-terminal_0.4.8.bb           |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb

diff --git a/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb b/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
new file mode 100644
index 0000000..697c5c6
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "virtual/libx11 exo gtk+ vte dbus-glib"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/apps/terminal//${@'${PV}'[0:3]}/Terminal-${PV}.tar.bz2 \
+"
+
+S = "${WORKDIR}/Terminal-${PV}"
+
+FILES_${PN} += "${datadir}/Terminal \
+                ${datadir}/gnome-control-center/default-apps/Terminal-default-apps.xml"
+
+SRC_URI[md5sum] = "8dff62234da14e1a5e542fb56560ebe2"
+SRC_URI[sha256sum] = "fe5db0b7127ce87efa1e10f44d8915be88005b6ce4f0bfea6b64533e25cc788d"
-- 
1.7.4.4



