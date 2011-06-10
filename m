Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QV6Qr-0002Bu-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 20:27:45 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LML00ES7749CXS2@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Jun 2011 13:24:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5331414AF5D; Fri,
	10 Jun 2011 14:24:09 -0400 (EDT)
Date: Fri, 10 Jun 2011 14:24:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110610182409.GE29476@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [PATCH] qt4-*-gles: add RPROVIDES for the main and -dev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 18:27:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Select the proper provider in case someone RDEPENDS on -gles packages.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes/qt4/qt4-embedded-gles_4.6.3.bb |    5 ++++-
 recipes/qt4/qt4-embedded-gles_4.7.3.bb |    6 ++++--
 recipes/qt4/qt4-x11-free-gles_4.6.3.bb |    4 +++-
 recipes/qt4/qt4-x11-free-gles_4.7.3.bb |    4 +++-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/recipes/qt4/qt4-embedded-gles_4.6.3.bb b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
index 0b047fc..6f1253e 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.3.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
@@ -1,7 +1,10 @@
 require qt4-embedded.inc
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 PROVIDES += "qt4-embedded"
+RPROVIDES_${PN} = "qt4-embedded"
+RPROVIDES_${PN}-dev = "qt4-embedded-dev"
+
 QT_GLFLAGS = "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
 
 require qt-${PV}.inc
diff --git a/recipes/qt4/qt4-embedded-gles_4.7.3.bb b/recipes/qt4/qt4-embedded-gles_4.7.3.bb
index 8ab5a6c..b62cb60 100644
--- a/recipes/qt4/qt4-embedded-gles_4.7.3.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.7.3.bb
@@ -2,11 +2,14 @@ DEFAULT_PREFERENCE = "-1"
 
 require qt4-embedded.inc
 
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 PROVIDES += "qt4-embedded"
+RPROVIDES_${PN} = "qt4-embedded"
+RPROVIDES_${PN}-dev = "qt4-embedded-dev"
+
 QT_GLFLAGS = "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
  
 FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
@@ -16,4 +19,3 @@ require qt-${PV}.inc
 QT_CONFIG_FLAGS += " \
  -exceptions \
 "
-
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
index b7cbde5..34795ee 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
@@ -1,5 +1,5 @@
 require qt4-x11-free.inc
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 QT_GLFLAGS = "-opengl es2 -depths 16,24,32 "
 
@@ -15,3 +15,5 @@ FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
 DEPENDS += "virtual/egl"
 require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
+RPROVIDES_${PN} = "qt4-x11-free"
+RPROVIDES_${PN}-dev = "qt4-x11-free"
diff --git a/recipes/qt4/qt4-x11-free-gles_4.7.3.bb b/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
index c5fd6f3..93367e4 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
@@ -1,7 +1,7 @@
 DEFAULT_PREFERENCE = "-1"
 
 require qt4-x11-free.inc
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 QT_GLFLAGS = "-opengl es2 -depths 16,24,32 "
 
@@ -17,3 +17,5 @@ FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
 DEPENDS += "virtual/egl"
 require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
+RPROVIDES_${PN} = "qt4-x11-free"
+RPROVIDES_${PN}-dev = "qt4-x11-free"
-- 
1.7.0.4



