Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T0XIh-0002lP-H0
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 14:29:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2012 05:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,754,1336374000"; d="scan'208";a="179535384"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.82])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2012 05:16:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.linuxtogo.org
Date: Sun, 12 Aug 2012 13:16:23 +0100
Message-Id: <1344773783-17934-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-handheld][PATCH] zaurusd: remove dependency on procps
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
X-List-Received-Date: Sun, 12 Aug 2012 12:29:47 -0000

With a little tweaking we don't need procps; we can rely on what busybox
provides. If nothing else requires procps this saves some space on the
target.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch    |   33 ++++++++++++++++++++
 recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in        |   11 ++++---
 .../zaurusd/zaurusd/zaurus-hinge.matchbox-portrait |    4 +--
 recipes-bsp/zaurusd/zaurusd_git.bb                 |    4 +--
 4 files changed, 43 insertions(+), 9 deletions(-)
 create mode 100644 recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch b/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch
new file mode 100644
index 0000000..9eed68f
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/scripts_pidof.patch
@@ -0,0 +1,33 @@
+From f271fa43ec63ed5650296a393403318ab0e553d4 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Sun, 5 Aug 2012 01:41:16 +0100
+Subject: [PATCH] scripts/zaurusd: use pidof instead of mangling output of ps
+
+busybox provides working pidof if sysvinit doesn't, so use that.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ scripts/zaurusd.in |    5 +----
+ 1 files changed, 1 insertions(+), 4 deletions(-)
+
+diff --git a/scripts/zaurusd.in b/scripts/zaurusd.in
+index ad896aa..acb5158 100755
+--- a/scripts/zaurusd.in
++++ b/scripts/zaurusd.in
+@@ -1,10 +1,7 @@
+ #!/bin/sh
+ 
+ killproc() {            # kill the named process(es)
+-        pid=`/bin/ps -e x |
+-             /bin/grep $1 |
+-             /bin/grep -v grep |
+-             /bin/sed -e 's/^  *//' -e 's/ .*//'`
++        pid=`/bin/pidof $1`
+         [ "$pid" != "" ] && kill $pid
+ }
+ 
+-- 
+1.7.1
+
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
index 0fcad38..660e6cc 100644
--- a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.in
@@ -4,10 +4,7 @@
 #
 
 killproc() {            # kill the named process(es)
-        pid=`/bin/ps -e x |
-             /bin/grep $1 |
-             /bin/grep -v grep |
-             /bin/sed -e 's/^  *//' -e 's/ .*//'`
+        pid=`/bin/pidof $1`
         [ "$pid" != "" ] && kill $pid
 }
 
@@ -19,7 +16,11 @@ if [ -z "$1" ]; then
    exit 1
 fi
 
-panel_user="`ps aux|grep matchbox-panel|grep -v grep | awk '{print $1}'`"
+if [ ps aux > /dev/null 2>&1 ] ; then
+	panel_user="`ps aux|grep matchbox-panel|grep -v grep | awk '{print $1}'`"
+else
+	panel_user="`ps|grep matchbox-panel|grep -v grep | awk '{print $2}'`"
+fi
 
 STATE=$1
 
diff --git a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
index e540e66..bce305d 100644
--- a/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
+++ b/recipes-bsp/zaurusd/zaurusd/zaurus-hinge.matchbox-portrait
@@ -21,9 +21,9 @@
   if test -n "$panel_user"
   then
     echo "Running panel as user [$panel_user]"
-    ps aux | grep "$panel_user" | grep -q "mbinputmgr " || su $panel_user -c ${ZD_BINDIR}/mbinputmgr &
+    ps aux 2>/dev/null || ps | grep "$panel_user" | grep -q "mbinputmgr " || su $panel_user -c ${ZD_BINDIR}/mbinputmgr &
   else
      # A failsafe can't hurt
      echo "Warning: Running mbinputmgr as root!"
-     ps aux | grep -q "mbinputmgr " || ${ZD_BINDIR}/mbinputmgr &
+     ps aux 2>/dev/null || ps | grep -q "mbinputmgr " || ${ZD_BINDIR}/mbinputmgr &
   fi
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index db24c7b..821dbec 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "tslib"
 
 PE = "1"
 PV = "0.0+gitr${SRCPV}"
-PR = "r25"
+PR = "r26"
 
 SRCREV = "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
 SRC_URI = "git://git.yoctoproject.org/zaurusd;protocol=git \
@@ -17,6 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/zaurusd;protocol=git \
 	   file://disable-alsa-handling.patch \
 	   file://avoid-rotated-server.patch \
 	   file://new-make.patch \
+	   file://scripts_pidof.patch \
 	   file://zaurus-hinge.matchbox-portrait \
 	   file://zaurus-hinge.matchbox-landscape \
 	   file://zaurus-hinge.bl-on \
@@ -57,6 +58,5 @@ inherit autotools pkgconfig update-rc.d
 INITSCRIPT_NAME = "zaurusd"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
-RDEPENDS_${PN} = "procps"
 RRECOMMENDS_${PN} += "kernel-module-uinput"
 
-- 
1.7.9.5



