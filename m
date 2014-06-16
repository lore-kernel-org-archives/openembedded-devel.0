Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 06DE76FEF3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 16:40:11 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jun 2014 17:40:29 +0100
Message-Id: <1402936829-23184-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.3
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-webserver][PATCH] sthttpd: improve init scripts to use config file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jun 2014 16:40:17 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Rather than put hardcoded values into the init scripts,
use a config file. The SRV_DIR is a special value as it
should be used in the conifg file and also passed to make
so it can put the html files in the correct directory.
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/init         |  6 +++---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.conf  |  1 +
 .../recipes-httpd/sthttpd/sthttpd/thttpd.service          |  2 +-
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb    | 15 ++++++++++-----
 4 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.conf

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/init b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
index 70f6797..f5f7b01 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
@@ -18,7 +18,7 @@ test -x "$thttpd" || exit 0
 case "$1" in
   start)
     echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --start --quiet --exec $thttpd -- -C @@CONFFILE
     echo "."
     ;;
   stop)
@@ -31,7 +31,7 @@ case "$1" in
     ;;
   restart)
     echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --stop --quiet --exec $thttpd -- -C @@CONFFILE
     echo "."
     echo -n "Waiting for thttpd to die off"
     for i in 1 2 3 ;
@@ -41,7 +41,7 @@ case "$1" in
     done
     echo ""
     echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --start --quiet --exec $thttpd -- -C @@CONFFILE
     echo "."
     ;;
   *)
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.conf b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.conf
new file mode 100644
index 0000000..397984f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.conf
@@ -0,0 +1 @@
+dir=@@SRVDIR
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
index e2dae61..f109500 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
@@ -3,7 +3,7 @@ Description=Tiny/Turbo/Throttling Web Server
 
 [Service]
 Type=forking
-ExecStart=/usr/sbin/thttpd -d @@SRVDIR -c cgi-bin/* -i /var/run/thttpd.pid
+ExecStart=/usr/sbin/thttpd -C @@CONFFILE -c cgi-bin/* -i /var/run/thttpd.pid
 PIDFile=/var/run/thttpd.pid
 
 [Install]
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
index 0abd131..7034921 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dc
 
 SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
            file://thttpd.service \
+           file://thttpd.conf \
            file://init"
 
 SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
@@ -15,19 +16,23 @@ S = "${WORKDIR}/sthttpd-${PV}"
 
 inherit autotools update-rc.d systemd
 
-EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
+SRV_DIR ?= "${servicedir}/www"
+
+EXTRA_OEMAKE += "'WEBDIR=${SRV_DIR}'"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/init.d
     install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
-    sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${sysconfdir}/init.d/thttpd
+    install -c -m 755 ${WORKDIR}/thttpd.conf ${D}${sysconfdir}
+    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${sysconfdir}/init.d/thttpd
+    sed -i -e 's,@@SRVDIR,${SRV_DIR},g' ${D}${sysconfdir}/thttpd.conf
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
     sed -i 's!/var/!${localstatedir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
-    sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${systemd_unitdir}/system/thttpd.service
+    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${systemd_unitdir}/system/thttpd.service
 }
 
 INITSCRIPT_NAME = "thttpd"
@@ -35,6 +40,6 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "thttpd.service"
 
-FILES_${PN} += "${servicedir}"
-FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
+FILES_${PN} += "${SRV_DIR}"
+FILES_${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
 
-- 
1.9.3


