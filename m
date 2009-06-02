Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MBUPC-0005jP-13
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 15:51:54 +0200
Received: (qmail 6880 invoked by uid 813007); 2 Jun 2009 13:43:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Jun 2009 13:43:03 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jun 2009 15:43:34 +0200
Message-Id: <1243950214-11794-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [PATCH 1/1] fbprogress: BUG only tool to show boot progress on built-in monochrome LCD
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
X-List-Received-Date: Tue, 02 Jun 2009 13:51:54 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/fbprogress/fbprogress/fbprogress-init |   34 +++++++++++++++++++++++++
 recipes/fbprogress/fbprogress_1.1.bb          |   32 +++++++++++++++++++++++
 2 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100755 recipes/fbprogress/fbprogress/fbprogress-init
 create mode 100644 recipes/fbprogress/fbprogress_1.1.bb

diff --git a/recipes/fbprogress/fbprogress/fbprogress-init b/recipes/fbprogress/fbprogress/fbprogress-init
new file mode 100755
index 0000000..c1dd378
--- /dev/null
+++ b/recipes/fbprogress/fbprogress/fbprogress-init
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+. /etc/init.d/functions
+
+case "$1" in
+    start)
+    # We don't want this script to block the rest of the boot process
+    if [ "$2" != "background" ]; then
+	$0 $1 background &
+    else
+	. /etc/profile
+
+	echo "Starting FBProgress"
+	fbprogress.sh &
+    fi 
+    ;;
+
+    stop)
+    echo "Stopping FBProgress"
+    killproc fbprogress.sh
+    ;;
+
+    restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+
+    *)
+    echo "usage: $0 { start | stop | restart }"
+    ;;
+esac
+
+exit 0
diff --git a/recipes/fbprogress/fbprogress_1.1.bb b/recipes/fbprogress/fbprogress_1.1.bb
new file mode 100644
index 0000000..8d603b8
--- /dev/null
+++ b/recipes/fbprogress/fbprogress_1.1.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Bug framebuffer progress indicator"
+AUTHOR = "Angel Roman"
+HOMEPAGE = "http://www.buglabs.net/"
+LICENSE = "GPL"
+DEPENDS = "freetype zlib virtual/kernel"
+SRCREV = "9118"
+PR = "r1"
+
+SRC_URI = "svn://svn.buglabs.net/bug/trunk;module=com.buglabs.bug.native.fbprogress;proto=svn \
+           file://fbprogress-init"
+
+S = "${WORKDIR}/com.buglabs.bug.native.fbprogress"
+
+inherit update-rc.d
+
+EXTRA_OEMAKE = "BUG_LINUX_SRC=${STAGING_KERNEL_DIR}"
+
+do_install() {
+  install -d ${D}/${sysconfdir}/fbprogress
+  install -m 0644 ${S}/images/* ${D}/${sysconfdir}/fbprogress/
+  install -d ${D}${layout_bindir}
+  install -m 0755 fbprogress ${D}${layout_bindir}
+  install -m 0755 fbprogress.sh ${D}${layout_bindir}
+  install -d ${D}/${sysconfdir}/init.d
+  install -m 0755 ${WORKDIR}/fbprogress-init ${D}/${sysconfdir}/init.d/fbprogress
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "bug"
+
+INITSCRIPT_NAME = "fbprogress"
+INITSCRIPT_PARAMS = "start 01 S . stop 15  0 1 2 3 4 5 6 ."
-- 
1.6.3.1





