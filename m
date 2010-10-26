Received: from smtpauth17.prod.mesa1.secureserver.net ([64.202.165.29])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <dbatzle@dcbcyber.com>) id 1PAacG-0003Sq-Ah
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 05:54:31 +0200
Received: (qmail 31898 invoked from network); 26 Oct 2010 03:15:55 -0000
Received: from unknown (75.182.70.212)
	by smtpauth17.prod.mesa1.secureserver.net (64.202.165.29) with ESMTP;
	26 Oct 2010 03:15:54 -0000
From: dbatzle <dbatzle@dcbcyber.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 23:28:05 -0400
Message-Id: <1288063685-10500-1-git-send-email-dbatzle@dcbcyber.com>
X-Mailer: git-send-email 1.6.0.6
X-SA-Exim-Connect-IP: 64.202.165.29
X-SA-Exim-Mail-From: dbatzle@dcbcyber.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] New recipe for Bullet Physics library
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
X-List-Received-Date: Tue, 26 Oct 2010 03:54:31 -0000

Signed-off-by: dbatzle <dbatzle@dcbcyber.com>
---
 recipes/bullet/bullet.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bullet/bullet.bb

diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
new file mode 100644
index 0000000..d28734f
--- /dev/null
+++ b/recipes/bullet/bullet.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Bullet Physics Library"
+LICENSE = "Zlib"
+
+PR = "r1"
+SRCREV="2218"
+PV="2.77+svnr${SRCPV}"
+
+#SRC_URI = "file:///home/David/gamestuff/bullet-2.75"
+SRC_URI = "svn://bullet.googlecode.com/svn;module=trunk;proto=http"
+
+#If you want to build the demos you will have to have xlib and glut installed.
+#Then set BUILD_DEMOS, BUILD_EXTRAS, and USE_GLUT to ON
+
+EXTRA_OECMAKE="-DBUILD_DEMOS:BOOL=OFF -DBUILD_EXTRAS:BOOL=OFF -DUSE_GLUT:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON"
+
+inherit cmake
+
+S = "${WORKDIR}/trunk"
-- 
1.6.0.6



