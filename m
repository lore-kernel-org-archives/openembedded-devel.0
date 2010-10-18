Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoW-0004VW-Fd
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:05 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 1A26D275CEAD; Mon, 18 Oct 2010 20:51:33 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 01D62275CD26;
	Mon, 18 Oct 2010 20:51:31 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:12 +0200
Message-Id: <1287427884-1517-4-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/15] tsmd: add initial recipe
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:05 -0000

tsmd is a touchscreen management daemon for the palmpre machine. It has juast one simple
task to do: It open's the touchscreen dev node on /dev/touchscreen, process it's data with
tslib and forward all input events to uinput dev node.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/palmpre/tsmd/tsmd   |   38 ++++++++++++++++++++++++++++++++++++++
 recipes/palmpre/tsmd_git.bb |   30 ++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100755 recipes/palmpre/tsmd/tsmd
 create mode 100644 recipes/palmpre/tsmd_git.bb

diff --git a/recipes/palmpre/tsmd/tsmd b/recipes/palmpre/tsmd/tsmd
new file mode 100755
index 0000000..53d94c8
--- /dev/null
+++ b/recipes/palmpre/tsmd/tsmd
@@ -0,0 +1,38 @@
+#! /bin/sh
+#
+# tsmd -- This shell script starts and stops the tsmd daemon
+#
+# chkconfig: 345 10 10
+# description: a simple utility daemon which forwards all events from a independent device node to a more general uinput one
+# processname: tsmd
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+NAME=tsmd
+
+case "$1" in 
+    start)
+        echo -n "Starting tsmd: "
+        start-stop-daemon --start --pidfile /var/run/${NAME}.pid --make-pidfile --background -x /usr/bin/${NAME} -- -n /dev/touchscreen -f
+        if [ $? = 0 ]; then
+            echo "(ok)"
+        else
+            echo "(failed)"
+        fi
+        ;;
+    stop)
+        echo -n "Stopping tsmd: "
+        start-stop-daemon --stop --pidfile /var/run/${NAME}.pid --oknodo
+        rm -f /var/run/${NAME}.pid
+        echo "(done)"
+        ;;
+    restart|force-reload)
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: /etc/init.d/tsmd {start|stop|restart|force-reload}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes/palmpre/tsmd_git.bb b/recipes/palmpre/tsmd_git.bb
new file mode 100644
index 0000000..839e176
--- /dev/null
+++ b/recipes/palmpre/tsmd_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Touchscreen management daemon - manages the touchscreen of the palm pre machine"
+HOMEPAGE = "http://www.freesmartphone.org"
+AUTHOR = "Valéry Febvre <vfebvre@easter-eggs.com>
+SECTION = "base"
+LICENSE = "GPL"
+
+DEPENDS = "tslib"
+
+PR = "r0"
+PV = "1.0.0+gitr${SRCPV}"
+
+SRCREV = "798c26a7022decaebdaa829ec30852fdcf08f061"
+SRC_URI = " \
+ ${FREESMARTPHONE_GIT}/utilities.git;protocol=git;branch=master \
+ file://tsmd \
+"
+
+S = "${WORKDIR}/git/palmpre/tsmd"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "tsmd"
+INITSCRIPT_PARAMS = "defaults 00"
+
+do_install_append() {
+	install -d 0644 ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/
+}
-- 
1.7.1



