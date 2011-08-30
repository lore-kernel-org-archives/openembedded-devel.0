Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyM66-0008UN-JY
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:03:15 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyM1O-0003QK-Hf from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 03:58:23 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 30 Aug 2011 12:58:20 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 15:58:41 +0500
Message-Id: <02730fb2ad9c849b864c0e1221c6039274f55bee.1314691875.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314691875.git.noor_ahsan@mentor.com>
References: <cover.1314691875.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 30 Aug 2011 10:58:21.0398 (UTC)
	FILETIME=[BB6D7F60:01CC6703]
Subject: [meta-e][PATCH 2/3] netperf: Add version 2.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 11:03:15 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Import from oe.dev commit id c03c179bb19249b86c9ba0c6ea88701689ed2f3e.
* Add do_configure_prepend function which make sure the paths in the example script match up where stuff is placed after build.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../recipes-benchmark/netperf/files/cpu_set.patch  |   27 ++++++++++
 meta-oe/recipes-benchmark/netperf/files/init       |   51 +++++++++++++++++++
 .../recipes-benchmark/netperf/files/vfork.patch    |   29 +++++++++++
 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb |   53 ++++++++++++++++++++
 4 files changed, 160 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
 create mode 100644 meta-oe/recipes-benchmark/netperf/files/init
 create mode 100755 meta-oe/recipes-benchmark/netperf/files/vfork.patch
 create mode 100644 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb

diff --git a/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch b/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
new file mode 100644
index 0000000..5d7e149
--- /dev/null
+++ b/meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
@@ -0,0 +1,27 @@
+Define some macroes under the definition of CPU_SETSIZE.
+
+Upstream-Status: Inappropriate [not author]
+Index: netperf-2.4.4/src/netlib.c
+===================================================================
+--- netperf-2.4.4.orig/src/netlib.c	2007-10-17 23:16:02.000000000 +0200
++++ netperf-2.4.4/src/netlib.c	2008-12-03 17:56:32.000000000 +0100
+@@ -1988,10 +1988,15 @@
+      fall-back on what we had before, which is to use just the size of
+      an unsigned long. raj 2006-09-14 */
+ 
+-#if defined(__CPU_SETSIZE)
+-#define NETPERF_CPU_SETSIZE __CPU_SETSIZE
+-#define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET(cpu, cpusetp)
+-#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
++#if defined(CPU_SETSIZE)
++#define NETPERF_CPU_SETSIZE CPU_SETSIZE
++#define NETPERF_CPU_SET(cpu, cpusetp)  CPU_SET(cpu, cpusetp)
++#define NETPERF_CPU_ZERO(cpusetp)      CPU_ZERO (cpusetp)
++  typedef cpu_set_t netperf_cpu_set_t;
++#elif defined(__CPU_SETSIZE)
++#define NETPERF_CPU_SETSIZE __CPU_SETSIZE
++#define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET (cpu, cpusetp)
++#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
+   typedef cpu_set_t netperf_cpu_set_t;
+ #else
+ #define NETPERF_CPU_SETSIZE sizeof(unsigned long)
diff --git a/meta-oe/recipes-benchmark/netperf/files/init b/meta-oe/recipes-benchmark/netperf/files/init
new file mode 100644
index 0000000..7cc053a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/netperf/files/init
@@ -0,0 +1,51 @@
+#!/bin/sh
+#
+#
+# Written by Miquel van Smoorenburg <miquels@cistron.nl>.
+# Modified for Debian GNU/Linux by Ian Murdock <imurdock@gnu.org>.
+# Modified for Debian by Christoph Lameter <clameter@debian.org>
+# Modified for openembedded by Bruno Randolf <bruno.randolf@4g-systems.biz>
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+DAEMON=/usr/sbin/netserver
+
+test -f $DAEMON || exit 0
+
+case "$1" in
+  start)
+		echo -n "Starting network benchmark server: netserver"
+    start-stop-daemon -S -x $DAEMON > /dev/null 2>&1 
+		echo "."
+    ;;
+  stop)
+		echo -n "Stopping network benchmark server: netserver"
+    start-stop-daemon -K -x $DAEMON
+		echo "."
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
+  #
+  # If the "reload" option is implemented, move the "force-reload"
+  # option to the "reload" entry above. If not, "force-reload" is
+  # just the same as "restart".
+  #
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
diff --git a/meta-oe/recipes-benchmark/netperf/files/vfork.patch b/meta-oe/recipes-benchmark/netperf/files/vfork.patch
new file mode 100755
index 0000000..1702f55
--- /dev/null
+++ b/meta-oe/recipes-benchmark/netperf/files/vfork.patch
@@ -0,0 +1,29 @@
+Falls back from fork to vfork if HAVE_FORK is not defined.
+
+Upstream-Status: Inappropriate [not author]
+--- netperf-2.4.4/src/netserver.c	2007-10-17 17:09:12.000000000 -0400
++++ netperf-2.4.4.new/src/netserver.c	2011-01-23 12:26:39.000000000 -0500
+@@ -567,7 +567,11 @@
+   fflush (stdin);
+   fflush (stdout);
+   fflush (stderr);
++#if defined(HAVE_FORK)
+   switch (fork())
++#else
++  switch (vfork())
++#endif
+     {
+     case -1:  	
+       perror("netperf server error");
+@@ -712,7 +716,11 @@
+ #else
+       signal(SIGCLD, SIG_IGN);
+ 	  
++#if defined(HAVE_FORK)
+ 	  switch (fork())
++#else
++	  switch (vfork())
++#endif
+ 	    {
+ 	    case -1:
+ 	      /* something went wrong */
diff --git a/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
new file mode 100644
index 0000000..ee66ece
--- /dev/null
+++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
+SECTION = "console/network"
+HOMEPAGE = "http://www.netperf.org/"
+LICENSE = "netperf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+
+SRC_URI = "ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
+          file://cpu_set.patch \
+          file://vfork.patch \
+          file://init \
+          "
+SRC_URI[md5sum] = "0e942f22864e601406a994420231075b"
+SRC_URI[sha256sum] = "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"
+
+inherit update-rc.d autotools
+
+# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
+CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
+
+do_configure_prepend () {
+    sed -i -e 's,^ *NETHOME=.*$,NETHOME=${bindir},' \
+           -e 's,^ *NETPERF=\./netperf$,NETPERF=${bindir}/netperf,' \
+           -e 's,^ *NETPERF=/usr/bin/netperf$,NETPERF=${bindir}/netperf,' \
+           -e 's,^ *NETPERF_CMD=.*$,NETPERF_CMD=${bindir}/netperf,' \
+           doc/examples/*_script
+}
+
+do_install() {
+        install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
+        install -m 4755 src/netperf ${D}${bindir}
+        install -m 4755 src/netserver ${D}${sbindir}
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
+
+        # man
+        install -d ${D}${mandir}/man1/
+        install -m 0644 doc/netserver.man ${D}${mandir}/man1/netserver.1
+        install -m 0644 doc/netperf.man ${D}${mandir}/man1/netperf.1
+
+        # move scripts to examples directory
+        install -d ${D}${docdir}/netperf/examples
+        install -m 0644 doc/examples/*_script ${D}${docdir}/netperf/examples/
+
+        # docs ..
+        install -m 0644 COPYING ${D}${docdir}/netperf
+        install -m 0644 Release_Notes ${D}${docdir}/netperf
+        install -m 0644 README ${D}${docdir}/netperf
+        install -m 0644 doc/netperf_old.ps ${D}${docdir}/netperf
+}
+
+INITSCRIPT_NAME="netperf"
+INITSCRIPT_PARAMS="defaults"
+
+
-- 
1.7.0.4



