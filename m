Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QNmDQ-0003zn-T5
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 15:27:37 +0200
Received: from localhost.localdomain (95.244.3.148) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F03883A0E; Sat, 21 May 2011 15:24:38 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2011 15:24:33 +0200
Message-Id: <1305984274-18073-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/2] xserver-common: add support for the htcdream
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
X-List-Received-Date: Sat, 21 May 2011 13:27:37 -0000

Without that patch the DPI of the htcdream is the default DPI
  which is incorrect.

Note that the htc dreams's /proc/cpuinfo machine name is trout

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../xserver-common/files/Xserver.htcdream.patch    |   14 ++++++++++++++
 recipes/xserver-common/xserver-common_1.34.bb      |    3 ++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xserver-common/files/Xserver.htcdream.patch

diff --git a/recipes/xserver-common/files/Xserver.htcdream.patch b/recipes/xserver-common/files/Xserver.htcdream.patch
new file mode 100644
index 0000000..11842a2
--- /dev/null
+++ b/recipes/xserver-common/files/Xserver.htcdream.patch
@@ -0,0 +1,14 @@
+Index: xserver-common-1.34/X11/xserver-common
+===================================================================
+--- xserver-common-1.34.orig/X11/xserver-common	2011-05-20 23:37:56.031433456 +0200
++++ xserver-common-1.34/X11/xserver-common	2011-05-20 23:39:56.451433492 +0200
+@@ -126,6 +126,9 @@
+         "htc_tornado")
+             ARGS="$ARGS -hide-cursor"
+             DPI="100" ;;
++        "trout")
++            DPI="181"
++            ARGS="$ARGS -dpi ${DPI}";;
+         "generic_omap1510/1610/1710")
+             ARGS="$ARGS -screen ${SCREEN_SIZE}"
+             DPI="225" ;;
diff --git a/recipes/xserver-common/xserver-common_1.34.bb b/recipes/xserver-common/xserver-common_1.34.bb
index d8c29d1..0b2da5b 100644
--- a/recipes/xserver-common/xserver-common_1.34.bb
+++ b/recipes/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -20,6 +20,7 @@ SRC_URI_append = " \
                    file://Xserver.add.nocursor.for.gta.patch \
                    file://Xserver.add.dpi.for.gta.patch \
                    file://Xserver.n900.patch \
+                   file://Xserver.htcdream.patch \
 "
 
 
-- 
1.7.0.4



