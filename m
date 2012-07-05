Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003bw-FX
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 78CFEEA04E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id C00BB60C8D; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:28 +0200
Message-Id: <c7e85ba9134dc14237db102aa6d69668d5fe74a0.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 10/14] gtk+: Add no-test-inline-pixbufs.patch to gtk+-2.20.1
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

This patch adds a patch to the gtk+-2.20.1 recipe that removes the
need to build test-inline-pixbufs.h in the demos/Makefile.am file of
the gtk+-2.20.1 upstream package.
It also removes all the demo programs that were dependant on
test-inline-pixbufs.h from demos/Makefile.am.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch  |   22 ++++++++++++++++++++
 recipes/gtk+/gtk+_2.20.1.bb                        |    1 +
 2 files changed, 23 insertions(+)
 create mode 100644 recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch

diff --git a/recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch b/recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
new file mode 100644
index 0000000..c1fcbd7
--- /dev/null
+++ b/recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
@@ -0,0 +1,22 @@
+--- gtk+-2.20.1/demos/Makefile.am.orig	2012-06-18 21:53:07.365997572 +0200
++++ gtk+-2.20.1/demos/Makefile.am	2012-06-18 21:53:43.718177837 +0200
+@@ -23,18 +23,9 @@
+ 	$(GTK_DEP_LIBS)							\
+ 	$(MATH_LIB)
+ 
+-noinst_PROGRAMS = 		\
+-	testpixbuf-drawable 	\
+-	testanimation 		\
+-	testpixbuf-color	\
+-	testpixbuf-save		\
+-	testpixbuf-scale 	\
+-	pixbuf-demo
+-
+ # Need to build test-inline-pixbufs.h for testpixbuf
+ if HAVE_PNG
+-noinst_PROGRAMS += testpixbuf
+-BUILT_SOURCES = test-inline-pixbufs.h
++BUILT_SOURCES =
+ endif
+ 
+ if CROSS_COMPILING
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index cd3a6d2..62f2f3c 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -7,6 +7,7 @@ SRC_URI_append_virtclass-native = " file://no-demos.patch \
 SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 		  file://cross-nm.patch \
 		  file://xkb-ifdef.patch \
+		  file://no-test-inline-pixbufs.patch \
 		 "
 
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
-- 
1.7.10



