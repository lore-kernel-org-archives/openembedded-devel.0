Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLZHL-0002iH-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 12:46:48 +0100
Received: (qmail invoked by alias); 02 Nov 2011 11:40:39 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp020) with SMTP; 02 Nov 2011 12:40:39 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+buS9nws6bfb5FXtV5h1oEuumXoFLZzINKeuWFr0
	mGhXo/9MlQox2R
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 12:45:15 +0100
Message-Id: <1320234315-14835-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1320234315-14835-1-git-send-email-schnitzeltony@gmx.de>
References: <1320234315-14835-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 3/3] xfce4-clipman-plugin: initial add 1.2.2
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
X-List-Received-Date: Wed, 02 Nov 2011 11:46:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../clipman/xfce4-clipman-plugin_1.2.2.bb          |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb
new file mode 100644
index 0000000..c830229
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Clipman is a clipboard manager for Xfce"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "xfconf xproto libxtst"
+
+SRC_URI[md5sum] = "60df7769a8271d7fcab177210f4291e8"
+SRC_URI[sha256sum] = "fcac10bc150eb2f73955f28184ac2b8324c9aabc3d773242eadcec137e1096a1"
-- 
1.7.4.4



