Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sglky-0002jy-Ia
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 01:53:16 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 9BD70EA040;
	Tue, 19 Jun 2012 01:50:23 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 44543604DE; Tue, 19 Jun 2012 01:42:34 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org, Martin Jansa <martin.jansa@gmail.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Date: Tue, 19 Jun 2012 01:42:10 +0200
Message-Id: <1340062930-19293-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
Subject: [PATCH 1/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Mon, 18 Jun 2012 23:53:16 -0000

This fix regenerates the gtk+-2.20.1/no-demos.patch file because the
targeted Makefile.am file changed since gtk+-2.10.1.
The gtk+_2.20.1.bb recipe is also updated to fix an issue where
no-demos.patch was not taken into account during the do_patch() stage.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
 recipes/gtk+/gtk+_2.20.1.bb             |    3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
index 0fc4c48..ac0730d 100644
--- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
+++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
@@ -1,7 +1,8 @@
---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
-+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
-@@ -1,6 +1,6 @@
+--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
+@@ -1,7 +1,7 @@
  ## Makefile.am for GTK+
+ include $(top_srcdir)/Makefile.decl
  
 -SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos tests perf contrib
 +SRC_SUBDIRS = gdk-pixbuf gdk gtk modules tests perf contrib
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 9cffee1..6e3c291 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -1,10 +1,9 @@
 require gtk+.inc
 
-SRC_URI_append_virtclass-native = " file://no-demos.patch \
-"
 SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 		  file://cross-nm.patch \
 		  file://xkb-ifdef.patch \
+		  file://no-demos.patch \
 		 "
 
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
-- 
1.7.10



