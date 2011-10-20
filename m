Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RGzOM-00077V-56
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 22:39:06 +0200
Received: (qmail invoked by alias); 20 Oct 2011 20:33:13 -0000
Received: from p4FDF0EB6.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.14.182]
	by mail.gmx.net (mp007) with SMTP; 20 Oct 2011 22:33:13 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1945Oo/vC141Hnf8ep99nC+deuRofcfU6n5Rvztqx
	LIlsibqVLbPdjt
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:37:53 +0200
Message-Id: <1319143073-23469-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319143073-23469-1-git-send-email-schnitzeltony@gmx.de>
References: <1319143073-23469-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/1] xfce4-icon-theme: initial add 4.4.3
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
X-List-Received-Date: Thu, 20 Oct 2011 20:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb

diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
new file mode 100644
index 0000000..bc6229a
--- /dev/null
+++ b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "xfce4 icon theme rodent"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce
+
+SRC_URI = "http://archive.xfce.org/src/art/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "73ce2977b84f634a6a6c5d9c27e336db"
+SRC_URI[sha256sum] = "d4786692d56b8a563f66a5f260f1f13ade11e86c78cbcb25a9f9a5fc47cf66fa"
+
+#FILES_${PN} += "${datadir}/xfce4"
+
+
-- 
1.7.4.4



