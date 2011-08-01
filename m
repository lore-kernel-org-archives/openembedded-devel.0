Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QnzfA-0006yj-LD
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:37 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:16 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:16 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/tnhhMP7XtGuTrNhspMMt8EIQ6pqHxijbYXPjcvk
	3tpK3ck/ZbyjbY
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:57 +0200
Message-Id: <1312232577-7948-20-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 19/19] task-xfce-base: Add initial recipe adding all recipes required for xfce desktop
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:38 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |   35 ++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
new file mode 100644
index 0000000..8a87203
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "All packages required for a base installation of XFCE"
+SECTION = "x11/wm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = " \
+    xfwm4 \
+    xfwm4-theme-default \
+    xfce4-session \     
+    xfconf \
+    xfdesktop \
+    xfce4-panel \
+    \
+    gtk-xfce-engine \
+    \
+    xfce-utils \
+    xfce4-panel-plugin-actions \
+    xfce4-panel-plugin-applicationsmenu \
+    xfce4-panel-plugin-clock \
+    xfce4-panel-plugin-directorymenu \
+    xfce4-panel-plugin-launcher \
+    xfce4-panel-plugin-pager \
+    xfce4-panel-plugin-separator \
+    xfce4-panel-plugin-showdesktop \
+    xfce4-panel-plugin-systray \
+    xfce4-panel-plugin-tasklist \
+    xfce4-panel-plugin-windowmenu \   
+    xfce4-settings \
+    xfce-terminal \
+    thunar \
+#    thunar-volman \
+"
-- 
1.7.4.4



