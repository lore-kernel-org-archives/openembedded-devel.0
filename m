Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TTk1A-0003yI-Ne
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 02:56:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA11gk4f009898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 18:42:46 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 31 Oct 2012 18:42:45 -0700
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2012 09:42:45 +0800
Message-ID: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking 1/2] netperf: import recipe
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
X-List-Received-Date: Thu, 01 Nov 2012 01:56:25 -0000
Content-Type: text/plain

Git-Url:
 - http://git.openembedded.org/openembedded/tree/recipes/netperf/

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 .../recipes-support/netperf/files/cpu_set.patch    |   24 +++++++++
 meta-networking/recipes-support/netperf/files/init |   51 ++++++++++++++++++++
 .../recipes-support/netperf/files/vfork.patch      |   26 ++++++++++
 .../recipes-support/netperf/netperf_2.4.4.bb       |   45 +++++++++++++++++
 4 files changed, 146 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-support/netperf/files/cpu_set.patch
 create mode 100644 meta-networking/recipes-support/netperf/files/init
 create mode 100644 meta-networking/recipes-support/netperf/files/vfork.patch
 create mode 100644 meta-networking/recipes-support/netperf/netperf_2.4.4.bb

diff --git a/meta-networking/recipes-support/netperf/files/cpu_set.patch b/meta-networking/recipes-support/netperf/files/cpu_set.patch
new file mode 100644
index 0000000..b2b95c7
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/cpu_set.patch
@@ -0,0 +1,24 @@
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
diff --git a/meta-networking/recipes-support/netperf/files/init b/meta-networking/recipes-support/netperf/files/init
new file mode 100644
index 0000000..7cc053a
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/init
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
diff --git a/meta-networking/recipes-support/netperf/files/vfork.patch b/meta-networking/recipes-support/netperf/files/vfork.patch
new file mode 100644
index 0000000..a40c96f
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/vfork.patch
@@ -0,0 +1,26 @@
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
diff --git a/meta-networking/recipes-support/netperf/netperf_2.4.4.bb b/meta-networking/recipes-support/netperf/netperf_2.4.4.bb
new file mode 100644
index 0000000..4ffa822
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/netperf_2.4.4.bb
@@ -0,0 +1,45 @@
+DESCRIPTION="Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
+SECTION = "console/network"
+HOMEPAGE = "http://www.netperf.org/"
+LICENSE = "netperf"
+PR = "r3"
+
+SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
+         file://cpu_set.patch \
+         file://vfork.patch \
+         file://init"
+
+inherit update-rc.d autotools
+
+S = "${WORKDIR}/netperf-${PV}"
+
+# cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
+CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
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
+SRC_URI[md5sum] = "0e942f22864e601406a994420231075b"
+SRC_URI[sha256sum] = "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"
-- 
1.7.5.4



