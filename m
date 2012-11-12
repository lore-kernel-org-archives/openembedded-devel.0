Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TXqiv-0008N2-Is
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 10:54:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAC9dp4p001232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2012 01:39:51 -0800 (PST)
Received: from Xouyang-Ubuntu-Desktop.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 12 Nov 2012 01:39:50 -0800
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Nov 2012 17:39:46 +0800
Message-ID: <1352713186-2637-2-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1352713186-2637-1-git-send-email-Xin.Ouyang@windriver.com>
References: <1352713186-2637-1-git-send-email-Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [PATCH V2][meta-networking] netperf: import from oe-classic and upgrade to 2.6.0
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
X-List-Received-Date: Mon, 12 Nov 2012 09:54:34 -0000
Content-Type: text/plain

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 .../recipes-support/netperf/files/cpu_set.patch    |   30 ++++++++++
 meta-networking/recipes-support/netperf/files/init |   62 ++++++++++++++++++++
 .../recipes-support/netperf/files/vfork.patch      |   58 ++++++++++++++++++
 .../recipes-support/netperf/netperf_2.6.0.bb       |   57 ++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/cpu_set.patch
 create mode 100644 meta-networking/recipes-support/netperf/files/init
 create mode 100644 meta-networking/recipes-support/netperf/files/vfork.patch
 create mode 100644 meta-networking/recipes-support/netperf/netperf_2.6.0.bb

diff --git a/meta-networking/recipes-support/netperf/files/cpu_set.patch b/meta-networking/recipes-support/netperf/files/cpu_set.patch
new file mode 100644
index 0000000..434b790
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/cpu_set.patch
@@ -0,0 +1,30 @@
+Subject: [PATCH] netperf: fix CPU_SETSIZE to build with eglibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ src/netlib.c |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/src/netlib.c b/src/netlib.c
+index 206e002..e33aae6 100644
+--- a/src/netlib.c
++++ b/src/netlib.c
+@@ -2265,7 +2265,12 @@ bind_to_specific_processor(int processor_affinity, int use_cpu_map)
+      fall-back on what we had before, which is to use just the size of
+      an unsigned long. raj 2006-09-14 */
+ 
+-#if defined(__CPU_SETSIZE)
++#if defined(CPU_SETSIZE)
++#define NETPERF_CPU_SETSIZE CPU_SETSIZE
++#define NETPERF_CPU_SET(cpu, cpusetp)  CPU_SET(cpu, cpusetp)
++#define NETPERF_CPU_ZERO(cpusetp)      CPU_ZERO (cpusetp)
++  typedef cpu_set_t netperf_cpu_set_t;
++#elif defined(__CPU_SETSIZE)
+ #define NETPERF_CPU_SETSIZE __CPU_SETSIZE
+ #if defined(__CPU_SET_S)
+ #define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET_S(cpu, sizeof (cpu_set_t), cpusetp)
+-- 
+1.7.1.1
+
diff --git a/meta-networking/recipes-support/netperf/files/init b/meta-networking/recipes-support/netperf/files/init
new file mode 100644
index 0000000..8ba2a63
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/init
@@ -0,0 +1,62 @@
+#!/bin/sh
+#
+#
+# Written by Miquel van Smoorenburg <miquels@cistron.nl>.
+# Modified for Debian GNU/Linux by Ian Murdock <imurdock@gnu.org>.
+# Modified for Debian by Christoph Lameter <clameter@debian.org>
+# Modified for openembedded by Bruno Randolf <bruno.randolf@4g-systems.biz>
+
+### BEGIN INIT INFO
+# Provides:             netperf
+# Required-Start:       $remote_fs $local_fs $time
+# Required-Stop:        $remote_fs $local_fs $time
+# Should-Start:         $network $named
+# Should-Stop:          $network $named
+# Default-Start:        2 3 4 5
+# Default-Stop:         0 1 6
+# Short-Description:    network benchmark
+### END INIT INFO
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+DAEMON=/usr/sbin/netserver
+
+test -f $DAEMON || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting network benchmark server: netserver"
+    start-stop-daemon -S -x $DAEMON > /dev/null 2>&1 
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping network benchmark server: netserver"
+    start-stop-daemon -K -x $DAEMON
+    echo "."
+    ;;
+  #reload)
+    #
+    # If the daemon can reload its config files on the fly
+    # for example by sending it SIGHUP, do it here.
+    #
+    # If the daemon responds to changes in its config file
+    # directly anyway, make this a do-nothing entry.
+    #
+    # start-stop-daemon --stop --signal 1 --verbose --exec $DAEMON
+    # ;;
+  restart|force-reload)
+    #
+    # If the "reload" option is implemented, move the "force-reload"
+    # option to the "reload" entry above. If not, "force-reload" is
+    # just the same as "restart".
+    #
+    start-stop-daemon -K -x $DAEMON
+    sleep 1
+    start-stop-daemon -S -x $DAEMON
+    ;;
+  *)
+    echo "Usage: /etc/init.d/netperf {start|stop|restart|force-reload}"
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-support/netperf/files/vfork.patch b/meta-networking/recipes-support/netperf/files/vfork.patch
new file mode 100644
index 0000000..eff98bf
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/vfork.patch
@@ -0,0 +1,58 @@
+Subject: [PATCH] netperf: fix vfork/fork
+
+Upstream-Status: Pending
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ src/netserver.c |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/netserver.c b/src/netserver.c
+index 379a106..f6a8b09 100644
+--- a/src/netserver.c
++++ b/src/netserver.c
+@@ -1020,7 +1020,7 @@ process_requests()
+ void
+ spawn_child() {
+ 
+-#if defined(HAVE_FORK)
++#if defined(HAVE_FORK) || defined(HAVE_VFORK)
+ 
+   if (debug) {
+     fprintf(where,
+@@ -1038,7 +1038,11 @@ spawn_child() {
+ 
+   signal(SIGCLD,SIG_IGN);
+ 
++#if defined(HAVE_FORK)
+   switch (fork()) {
++#else
++  switch (vfork()) {
++#endif
+   case -1:
+     fprintf(where,
+ 	    "%s: fork() error %s (errno %d)\n",
+@@ -1405,7 +1409,7 @@ scan_netserver_args(int argc, char *argv[]) {
+ 
+ void
+ daemonize() {
+-#if defined(HAVE_FORK)
++#if defined(HAVE_FORK) || defined(HAVE_VFORK)
+ 
+   if (debug) {
+     fprintf(where,
+@@ -1419,7 +1423,11 @@ daemonize() {
+   fflush(stdout);
+   fflush(stderr);
+ 
++#if defined(HAVE_FORK)
+   switch (fork()) {
++#else
++  switch (vfork()) {
++#endif
+   case -1:
+     fprintf(stderr,
+ 	    "%s: fork() error %s (errno %d)\n",
+-- 
+1.7.1.1
+
diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
new file mode 100644
index 0000000..2c30951
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -0,0 +1,57 @@
+SUMMARY = "A networking benchmarking tool"
+DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
+SECTION = "console/network"
+HOMEPAGE = "http://www.netperf.org/"
+LICENSE = "netperf"
+LICENSE_FLAGS = "commercial"
+
+PR = "r0"
+
+SRC_URI="ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
+         file://cpu_set.patch \
+         file://vfork.patch \
+         file://init"
+SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
+SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+
+inherit update-rc.d autotools
+
+S = "${WORKDIR}/netperf-${PV}"
+
+# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
+CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
+
+# autotools.bbclass attends to include m4 files with path depth <= 2 by
+# "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
+do_configure_prepend() {
+	test -d m4/m4 && mv -f m4/m4 m4-files
+}
+
+do_install() {
+	sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init
+
+	install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
+	install -m 4755 src/netperf ${D}${bindir}
+	install -m 4755 src/netserver ${D}${sbindir}
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
+
+	# man
+	install -d ${D}${mandir}/man1/
+	install -m 0644 doc/netserver.man ${D}${mandir}/man1/netserver.1
+	install -m 0644 doc/netperf.man ${D}${mandir}/man1/netperf.1
+
+	# move scripts to examples directory
+	install -d ${D}${docdir}/netperf/examples
+	install -m 0644 doc/examples/*_script ${D}${docdir}/netperf/examples/
+
+	# docs ..
+	install -m 0644 COPYING ${D}${docdir}/netperf
+	install -m 0644 Release_Notes ${D}${docdir}/netperf
+	install -m 0644 README ${D}${docdir}/netperf
+	install -m 0644 doc/netperf_old.ps ${D}${docdir}/netperf
+}
+
+INITSCRIPT_NAME="netperf"
+INITSCRIPT_PARAMS="defaults"
-- 
1.7.10.4



