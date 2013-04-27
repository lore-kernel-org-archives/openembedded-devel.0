Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UW4po-00083v-JE
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 15:06:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2013 05:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,562,1363158000"; d="scan'208";a="327215926"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2013 05:48:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 13:48:43 +0100
Message-Id: <1367066923-7632-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [meta-webserver][PATCH] sthttpd: add recipe
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
X-List-Received-Date: Sat, 27 Apr 2013 13:06:53 -0000

This is the "supported" fork of thttpd which has a rewritten build
system to avoid the need to patch it, as well as other minor
fixes. The recipe was based on the thttpd recipe in meta-arago-extras
(originally migrated from OE-Classic by
Franklin S. Cooper Jr <fcooper@ti.com>) with the following improvements:

* Set SUMMARY
* Remove PARALLEL_MAKE = "" (new build system should avoid previous issues)
* Use more accurate LICENSE
* Rearrange recipe to conform with current style
* Use += instead of _append for FILES definitions
* Add LSB headers to initscript
* Fix hardcoded ${sbindir} in initscript

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/init  |   52 ++++++++++++++++++++
 .../recipes-httpd/sthttpd/sthttpd_2.26.4.bb        |   31 ++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/init
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/init b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
new file mode 100644
index 0000000..70f6797
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:          thttpd
+# Required-Start:    $remote_fs $syslog
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Small http server
+# Description:       thttpd is a simple, small, portable, fast, and secure HTTP server.
+### END INIT INFO
+
+
+thttpd=/usr/sbin/thttpd
+test -x "$thttpd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd
+    ;;
+  restart)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    echo -n "Waiting for thttpd to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
new file mode 100644
index 0000000..ba2f047
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -0,0 +1,31 @@
+SUMMARY = "A simple, small, portable, fast, and secure HTTP server"
+DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server (supported fork of thttpd)."
+HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
+
+SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://init"
+
+SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
+SRC_URI[sha256sum] = "78e87979140cbda123c81b4051552242dbbffb5dec1a17e5f95ec4826b1eaddb"
+
+S = "${WORKDIR}/sthttpd-${PV}"
+
+inherit autotools update-rc.d
+
+EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
+    sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${sysconfdir}/init.d/thttpd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
+}
+
+INITSCRIPT_NAME = "thttpd"
+INITSCRIPT_PARAMS = "defaults"
+
+FILES_${PN} += "${servicedir}"
+FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
+
-- 
1.7.10.4



