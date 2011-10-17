Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFlov-0004LX-0K
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 13:57:37 +0200
Received: (qmail invoked by alias); 17 Oct 2011 11:51:34 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	localhost.localdomain) [95.222.156.232]
	by mail.gmx.net (mp037) with SMTP; 17 Oct 2011 13:51:34 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/HgqMo3anH+kOXdWV+yDceNejqxrQeOHzrvnfBgZ
	hHWJvc8i74CO3S
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 13:50:53 +0200
Message-Id: <1318852253-4171-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-efl][V3] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Mon, 17 Oct 2011 11:57:37 -0000
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
index 0000000..5351733
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A lightweight PDF viewer based on gtk and poppler"
+HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
+LICENSE = "GPLv2+"
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
1.7.6.4



