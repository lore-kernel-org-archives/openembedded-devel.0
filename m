Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFaVB-0007wo-RB
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:52:21 +0200
Received: (qmail invoked by alias); 16 Oct 2011 23:46:34 -0000
Received: from p5B0A1665.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.22.101]
	by mail.gmx.net (mp053) with SMTP; 17 Oct 2011 01:46:34 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19KKTxfATZKhcdwd5FJUXvzcHDyx3NyU37NZmiFqO
	HDx9SARxNddcxj
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 01:51:08 +0200
Message-Id: <1318809068-16742-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1318809068-16742-1-git-send-email-schnitzeltony@gmx.de>
References: <1318809068-16742-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome 2/2] nautilus: cleanup package directories
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
X-List-Received-Date: Sun, 16 Oct 2011 23:52:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index f34cbbe..e076ca1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -33,8 +33,7 @@ do_configure() {
 }
 
 RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-networking"
-FILES_${PN} += "${datadir}/icons  /usr/libexec/ "
-FILES_${PN}-dbg += "/usr/libexec/.debug"
+FILES_${PN} += "${datadir}/icons"
 
 # Don't make nautils3 drag us in
 PRIVATE_LIBS = "libnautilus-extension.so.1"
-- 
1.7.4.4



