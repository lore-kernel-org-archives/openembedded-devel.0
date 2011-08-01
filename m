Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf7-0006x6-2n
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:33 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:12 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:12 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2dI5aa8L2GGrvx8nKrEKjUGjUhCh+1DBa/kb36y
	ATahzgptT+pQxO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:50 +0200
Message-Id: <1312232577-7948-13-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 12/19] xfce4-appfinder: Add initial recipe with version 4.8.0
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:33 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce4-appfinder/xfce4-appfinder_4.8.0.bb       |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb
new file mode 100644
index 0000000..9187041
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION="Xfce4 Application Finder"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS="gtk+ libxfce4util libxfce4ui garcon xfconf"
+
+PR = "r0"
+
+inherit xfce
+
+SRC_URI[md5sum] = "fb4797ef91b90d111b989e98c3e000e0"
+SRC_URI[sha256sum] = "fd74184355e45f8a16cc3cdd32b012b6787a453deb3a8b96af90494c7a8ac77f"
-- 
1.7.4.4



