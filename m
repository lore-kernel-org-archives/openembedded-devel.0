Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QyXP5-0003hn-HW
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 01:07:35 +0200
Received: (qmail invoked by alias); 30 Aug 2011 23:02:41 -0000
Received: from p5B0A1BE9.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.27.233]
	by mail.gmx.net (mp013) with SMTP; 31 Aug 2011 01:02:41 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+7xq8t5Au77iWIO5f92fwtD8/jvhFIac0vTn7XFX
	WjOrMiFcUtKNiq
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 01:06:04 +0200
Message-Id: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] thunar-volman: Add initial recipe with version 0.6.0
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
X-List-Received-Date: Tue, 30 Aug 2011 23:07:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build & partially run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../thunar-volman/thunar-volman_0.6.0.bb           |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
new file mode 100644
index 0000000..ad11d84
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Automatic management of removable drives and media for thunar"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify"
+
+PR = "r0"
+
+inherit xfce
+
+SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305"
+SRC_URI[sha256sum] = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f"
-- 
1.7.4.4



