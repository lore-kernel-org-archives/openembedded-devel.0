Received: from smtpauth16.prod.mesa1.secureserver.net ([64.202.165.22])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <dbatzle@dcbcyber.com>) id 1PBero-00026Y-9C
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 04:38:57 +0200
Received: (qmail 3870 invoked from network); 29 Oct 2010 02:25:27 -0000
Received: from unknown (75.182.70.212)
	by smtpauth16.prod.mesa1.secureserver.net (64.202.165.22) with ESMTP;
	29 Oct 2010 02:25:27 -0000
From: David Batzle <dbatzle@dcbcyber.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Oct 2010 22:32:24 -0400
Message-Id: <1288319544-6131-1-git-send-email-dbatzle@dcbcyber.com>
X-Mailer: git-send-email 1.6.0.6
X-SA-Exim-Connect-IP: 64.202.165.22
X-SA-Exim-Mail-From: dbatzle@dcbcyber.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V3] bullet.bb New recipe
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
X-List-Received-Date: Fri, 29 Oct 2010 02:38:58 -0000

---
 recipes/bullet/bullet.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bullet/bullet.bb

diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
new file mode 100644
index 0000000..50260bb
--- /dev/null
+++ b/recipes/bullet/bullet.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Bullet Physics Library"
+HOMEPAGE = "http://www.bulletphysics.org"
+LICENSE = "Main library is Zlib Extras are Zlib,BSD,LGPL, Common Public License"
+RSUGGESTS_${PN} = "virtual/libx11 freeglut"
+PV = "2.77+svnr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "svn://bullet.googlecode.com/svn;module=trunk;proto=http"
+
+SRCREV = "2218"
+S = "${WORKDIR}/trunk"
+
+inherit cmake
+
+#To build extras and demos change BUILD_DEMOS, BUILD_EXTRAS and
+#USE_GLUT to on and you will need X11 and glut.
+EXTRA_OECMAKE = "-DBUILD_DEMOS:BOOL=OFF -DBUILD_EXTRAS:BOOL=OFF -DUSE_GLUT:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON"
-- 
1.6.0.6



