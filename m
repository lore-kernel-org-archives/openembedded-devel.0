Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFZRN-0006Tm-Ne
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 00:44:21 +0200
Received: (qmail invoked by alias); 16 Oct 2011 22:38:32 -0000
Received: from p5B0A1665.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.22.101]
	by mail.gmx.net (mp066) with SMTP; 17 Oct 2011 00:38:32 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19fIFke5zdfsCFp45JWS6JyLM+4oJ8Wp6ahWDtoW5
	vBZzGu2Vn8stAq
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 00:43:06 +0200
Message-Id: <1318804986-2262-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-efl][V2] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Sun, 16 Oct 2011 22:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

initial source taken from oe-classic epdfview_0.1.7.bb
commit 44985d56bc556786812a0a02d6219afd31a7381d

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb

diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
new file mode 100644
index 0000000..9598990
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A lightweight PDF viewer based on gtk and poppler"
+HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+SECTION = "x11/applications"
+DEPENDS = "gtk+ poppler"
+
+inherit autotools gettext
+
+SRC_URI = "http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2"
+SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
+SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
-- 
1.7.4.4



