Received: from tone.orchestra.cse.unsw.edu.au ([129.94.242.59])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PM8Rj-0002oQ-8e
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 01:15:22 +0100
Received: From localhost.localdomain ([129.94.175.7] ==
	runswift.cse.unsw.EDU.AU) By
	tone With Smtp ; Sat, 27 Nov 2010 11:13:59 +1100 
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 11:13:33 +1100
Message-Id: <1290816813-20648-1-git-send-email-jayen@cse.unsw.edu.au>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 129.94.242.59
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: [PATCH] libQGLViewer: New program
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
X-List-Received-Date: Sat, 27 Nov 2010 00:15:22 -0000

* Starting with libQGLViewer 2.3.8
* libqglviewer (also known as libQGLViewer) is a free C++ library based on
*  Qt that enables the quick creation of OpenGL 3D viewers. It features a
*  powerful camera trackball and simple applications simply require an
*  implementation of the draw() function. It is a tool of choice for OpenGL
*  beginners and assignements. It provides screenshot saving, mouse
*  manipulated frames, stereo display, interpolated keyFrames, object
*  selection, and much more. It is fully customizable and easy to extend to
*  create complex applications, with a possible Qt GUI.

Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
---
 recipes/libqglviewer/libqglviewer.inc      |   21 +++++++++++++++++++++
 recipes/libqglviewer/libqglviewer_2.3.8.bb |    3 +++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libqglviewer/libqglviewer.inc
 create mode 100644 recipes/libqglviewer/libqglviewer_2.3.8.bb

diff --git a/recipes/libqglviewer/libqglviewer.inc b/recipes/libqglviewer/libqglviewer.inc
new file mode 100644
index 0000000..4d19276
--- /dev/null
+++ b/recipes/libqglviewer/libqglviewer.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "an OpenGL 3D viewer library based on Qt4 - development files\
+libqglviewer (also known as libQGLViewer) is a free C++ library based on Qt that enables the quick creation of OpenGL 3D viewers. It features a powerful camera trackball and simple applications simply require an implementation of the draw() function. It is a tool of choice for OpenGL beginners and assignements. It provides screenshot saving, mouse manipulated frames, stereo display, interpolated keyFrames, object selection, and much more. It is fully customizable and easy to extend to create complex applications, with a possible Qt GUI."
+HOMEPAGE = "http://www.libqglviewer.com/"
+SECTION = "libdevel"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = ""
+
+INC_PR = "r0"
+
+SRC_URI = "http://www.libqglviewer.com/src/libQGLViewer-${PV}.tar.gz"
+
+S = "${WORKDIR}/libQGLViewer-${PV}/QGLViewer/"
+
+inherit qt4x11
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
+
+FILES_${PN}-dev += " ${libdir}/libQGLViewer.prl"
diff --git a/recipes/libqglviewer/libqglviewer_2.3.8.bb b/recipes/libqglviewer/libqglviewer_2.3.8.bb
new file mode 100644
index 0000000..813f1a6
--- /dev/null
+++ b/recipes/libqglviewer/libqglviewer_2.3.8.bb
@@ -0,0 +1,3 @@
+require libqglviewer.inc
+
+PR = "${INC_PR}.0"
-- 
1.7.0.4



