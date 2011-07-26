Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qlnen-0004u6-Rd
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 21:51:10 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6QJktMf005070
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:46:55 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 12:46:52 -0700
Message-Id: <1311709612-3664-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] rp-pppoe: Port from oe.dev
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
X-List-Received-Date: Tue, 26 Jul 2011 19:51:10 -0000

The difference between this and oe.dev are:
- Reset PR
- Add bitfields site variable to the endian site file
  This was wrong in oe.dev for BE (mips).
- Add LIC_FILES_CHKSUM

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch |  136 ++++++++++++++++++++
 .../rp-pppoe-3.8/dont-swallow-errors.patch         |   11 ++
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.default     |   22 +++
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.init        |   59 +++++++++
 .../rp-pppoe-3.8/pppoe-src-restrictions.patch      |   18 +++
 .../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch       |   25 ++++
 .../rp-pppoe/rp-pppoe-3.8/update-config.patch      |   30 +++++
 .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        |   23 ++++
 .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |   61 +++++++++
 meta-oe/site/endian-big                            |    2 +
 meta-oe/site/endian-little                         |    2 +
 11 files changed, 389 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
 create mode 100755 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
 create mode 100644 meta-oe/site/endian-big
 create mode 100644 meta-oe/site/endian-little

diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
new file mode 100644
index 0000000..381a44d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
@@ -0,0 +1,136 @@
+Index: src/configure.in
+===================================================================
+--- rp-pppoe-3.8.orig/src/configure.in	2006-04-03 00:29:42.000000000 +1000
++++ rp-pppoe-3.8/src/configure.in	2007-06-07 22:19:36.000000000 +1000
+@@ -5,6 +5,13 @@
+ dnl pppd directory for kernel-mode PPPoE
+ PPPD_DIR=ppp-2.4.1.pppoe2
+ 
++dnl hard code some paths
++PPPD=/usr/sbin/pppd
++ID=/usr/bin/id
++ECHO=/bin/echo
++AC_ARG_VAR(PPPD)
++AC_ARG_VAR(ID)
++
+ AC_CONFIG_HEADER(config.h)
+ 
+ AC_PREFIX_DEFAULT(/usr)
+@@ -44,7 +51,7 @@
+ AC_MSG_RESULT($ac_cv_struct_sockaddr_ll)
+ 
+ if test "$ac_cv_struct_sockaddr_ll" = yes ; then
+-AC_DEFINE(HAVE_STRUCT_SOCKADDR_LL)
++AC_DEFINE([HAVE_STRUCT_SOCKADDR_LL], [], [Have struct SOCKADDR_LL])
+ fi
+ 
+ dnl Check for N_HDLC line discipline
+@@ -55,7 +62,7 @@
+ 	ac_cv_n_hdlc=no)
+ AC_MSG_RESULT($ac_cv_n_hdlc)
+ if test "$ac_cv_n_hdlc" = yes ; then
+-AC_DEFINE(HAVE_N_HDLC)
++AC_DEFINE([HAVE_N_HDLC], [], [Have N_HDLC])
+ fi
+ 
+ AC_ARG_ENABLE(plugin, [  --enable-plugin=pppd_src_path   build pppd plugin], ac_cv_pluginpath=$enableval, ac_cv_pluginpath=no)
+@@ -100,13 +107,13 @@
+ if test "$ac_cv_header_linux_if_pppox_h" = yes ; then
+ 	if test "$ac_cv_pluginpath" != no ; then
+ 		LINUX_KERNELMODE_PLUGIN=rp-pppoe.so
+-		AC_DEFINE(HAVE_LINUX_KERNEL_PPPOE)
++		AC_DEFINE([HAVE_LINUX_KERNEL_PPPOE], [], [Have kernel PPPoE])
+ 		PPPD_INCDIR=$ac_cv_pluginpath
+ 	fi
+ fi
+ 
+ if test "$ac_cv_debugging" = "yes" ; then
+-   AC_DEFINE(DEBUGGING_ENABLED)
++   AC_DEFINE([DEBUGGING_ENABLED], [], [Debugging enabled])
+ fi
+ 
+ AC_SUBST(LINUX_KERNELMODE_PLUGIN)
+@@ -131,15 +138,8 @@
+ AC_CHECK_SIZEOF(unsigned int)
+ AC_CHECK_SIZEOF(unsigned long)
+ 
+-dnl Check for location of pppd
+-AC_PATH_PROG(PPPD, pppd, NOTFOUND, $PATH:/sbin:/usr/sbin:/usr/local/sbin)
+-AC_PATH_PROG(ECHO, echo, echo)
+-
+-dnl Check for setsid (probably Linux-specific)
+-AC_PATH_PROG(SETSID, setsid, "", $PATH:/sbin:/usr/sbin:/usr/local/sbin)
+-
+ dnl Check for an "id" which accepts "-u" option -- hack for Solaris.
+-AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
++dnl AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
+ 
+ dnl Check for Linux-specific kernel support for PPPoE
+ AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
+@@ -183,44 +183,8 @@
+ 	CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -ansi"
+ fi
+ 
+-dnl If we couldn't find pppd, die
+-if test "$PPPD" = "NOTFOUND"; then
+-        AC_MSG_WARN([*** Oops!  I couldn't find pppd, the PPP daemon anywhere.])
+-	AC_MSG_WARN([*** You must install pppd, version 2.3.10 or later.])
+-	AC_MSG_WARN([*** I will keep going, but it may not work.])
+-	PPPD=pppd
+-fi
+-
+-dnl Figure out pppd version.  2.3.7 to 2.3.9 -- issue warning.  Less than
+-dnl 2.3.7 -- stop
+-
+-PPPD_VERSION=`$PPPD --version 2>&1 | awk ' /version/ {print $NF}'`
+-
+-case "$PPPD_VERSION" in
+-1.*|2.0.*|2.1.*|2.2.*|2.3.0|2.3.1|2.3.2|2.3.3|2.3.4|2.3.5|2.3.6)
+-	AC_MSG_WARN([*** Oops! Your version of pppd is $PPPD_VERSION, which is too old.])
+-	AC_MSG_WARN([*** You need at least 2.3.7 (2.3.10 or newer recommended.])
+-	AC_MSG_WARN([*** I will keep going, but it may not work.])
+-	;;
+-
+-2.3.7|2.3.8|2.3.9)
+-	AC_MSG_WARN([*** Warning.  Your version of pppd is $PPPD_VERSION.  You will])
+-	AC_MSG_WARN([*** not be able to use connect-on-demand.  Upgrade to pppd])
+-	AC_MSG_WARN([*** 2.3.10 or newer if you need connect-on-demand.])
+-	;;
+-
+-2*|3*|4*|5*|6*|7*|8*|9*)
+-	;;
+-
+-*)
+-	AC_MSG_WARN([*** Oops.  I cannot figure out what version of pppd you have.])
+-	AC_MSG_WARN([*** All I got back was '$PPPD_VERSION'])
+-	AC_MSG_WARN([*** I will keep going, but it may not work.])
+-	;;
+-esac
+-
+ dnl Figure out packing order of structures
+-AC_MSG_CHECKING([packing order of bit fields])
++AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
+ AC_TRY_RUN([
+ union foo {
+     struct bar {
+@@ -245,10 +209,11 @@
+     }
+ }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
+ $ECHO "no defaults for cross-compiling"; exit 0)
++])
+ 
+ if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
+ 	AC_MSG_RESULT(reversed)
+-	AC_DEFINE(PACK_BITFIELDS_REVERSED)
++	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
+ else
+ 	AC_MSG_RESULT(normal)
+ fi
+@@ -312,6 +277,7 @@
+ AC_SUBST(RDYNAMIC)
+ AC_SUBST(LIBEVENT)
+ AC_SUBST(ECHO)
++AC_SUBST(HAVE_STRUCT_SOCKADDR_LL)
+ 
+ datadir_evaluated=`eval echo $datadir`
+ AC_SUBST(datadir_evaluated)
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
new file mode 100644
index 0000000..81ce2db
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
@@ -0,0 +1,11 @@
+--- a/src/configure.in.org	2008-01-14 21:08:38.000000000 +0200
++++ a/src/configure.in	2008-01-14 21:20:09.000000000 +0200
+@@ -208,7 +208,7 @@
+ 	return 2;
+     }
+ }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
+-$ECHO "no defaults for cross-compiling"; exit 0)
++$ECHO "no defaults for cross-compiling"; exit 1)
+ ])
+ 
+ if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
new file mode 100644
index 0000000..996d57f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
@@ -0,0 +1,22 @@
+# PPPoE Server options
+
+# Maximum segment size, not used for in kernel PPPoE
+#MSS=1412
+
+# Device(s) - Space seperated list of devices to listen on
+#DEVICES="eth1"
+
+# Local IP
+#LOCAL_IP=10.0.0.1
+
+# Starting remote IP
+#REMOTE_IP=10.67.15.1
+
+# Service name
+#SERVICE_NAME="acme"
+
+# Maximum number of sessions, default is 16
+#MAX_SESSIONS=64
+
+# Access concentrator name, default is the hostname
+#ACCESS_CONCENTRATOR_NAME="pppoe-rtr-1"
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
new file mode 100755
index 0000000..21afe0b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
@@ -0,0 +1,59 @@
+#! /bin/sh
+
+test -f /usr/sbin/pppoe-server || exit 0
+test -f /etc/default/pppoe-server && . /etc/default/pppoe-server
+
+case $1 in
+  start)
+    OPTIONS=""
+    if [ -n "$MSS" ]; then
+      OPTIONS="$OPTIONS -m $MSS"
+    fi
+    if [ -n "$DEVICES" ]; then
+      for i in $DEVICES; do
+        OPTIONS="$OPTIONS -I $i"
+      done
+    fi
+    if [ -n "$LOCAL_IP" ]; then
+      OPTIONS="$OPTIONS -L $LOCAL_IP"
+    fi
+    if [ -n "$REMOTE_IP" ]; then
+      OPTIONS="$OPTIONS -R $REMOTE_IP"
+    fi
+    if [ -n "$SERVICE_NAME" ]; then
+      OPTIONS="$OPTIONS -S $SERVICE_NAME"
+    fi
+    if [ -n "$MAX_SESSIONS" ]; then
+      OPTIONS="$OPTIONS -N $MAX_SESSIONS"
+    fi
+    if [ -n "$ACCESS_CONCENTRATOR_NAME" ]; then
+      OPTIONS="$OPTIONS -C $ACCESS_CONCENTRATOR_NAME"
+    fi
+    echo -n "Starting PPPoE server: pppoe-server"
+    start-stop-daemon --start --quiet --exec /usr/sbin/pppoe-server -- $OPTIONS
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping PPPoE server: pppoe-server"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/pppoe-server -- $OPTIONS
+    echo "."
+    ;;
+  status)
+    pid=$(pidof pppoe-server)    	          
+    if [ -n "$pid" ] ; then
+	    echo "Running with pid $pid"
+    else
+	    echo "Not running"
+    fi
+    ;;
+  restart|force-reload)
+    $0 stop
+    $0 start
+    ;;
+  *)
+    echo "Usage: /etc/init.d/pppoe-server {start|stop|restart|force-reload}"
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
new file mode 100644
index 0000000..e7e1c2e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
@@ -0,0 +1,18 @@
+Relax restrictions on the PPPoE src address, as per debian bug
+293811:
+
+  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=293811
+
+--- rp-pppoe-3.8.orig/src/discovery.c
++++ rp-pppoe-3.8/src/discovery.c
+@@ -376,8 +376,8 @@
+ 	if (!packetIsForMe(conn, &packet)) continue;
+ 
+ 	if (packet.code == CODE_PADO) {
+-	    if (NOT_UNICAST(packet.ethHdr.h_source)) {
+-		printErr("Ignoring PADO packet from non-unicast MAC address");
++	    if (BROADCAST(packet.ethHdr.h_source)) {
++		printErr("Ignoring broadcast PADO packet");
+ 		continue;
+ 	    }
+ 	    parsePacket(&packet, parsePADOTags, &pc);
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
new file mode 100644
index 0000000..e3b0482
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
@@ -0,0 +1,25 @@
+The autoconf stuff is all in a subdirectory, which is rather annoying
+as OE expects patches to be applied and autoconf stuff to be done in
+S. This adds enough autoconf at the top level to allow it to be
+called there - all it does is run a sub autoconf stuff in the src
+directory.
+
+Index: rp-pppoe-3.8/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ rp-pppoe-3.8/Makefile.am	2007-06-08 15:58:16.000000000 +1000
+@@ -0,0 +1,5 @@
++PACKAGE = rp-pppoe
++VERSION = 3.8
++
++dnl AM_CFLAGS = -Wall -DDEBUG
++SUBDIRS = src
+Index: rp-pppoe-3.8/configure.in
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ rp-pppoe-3.8/configure.in	2007-06-08 15:58:16.000000000 +1000
+@@ -0,0 +1,4 @@
++AC_INIT(src/pppoe.c)
++AM_INIT_AUTOMAKE([rp-pppoe], [3.8])
++AC_CONFIG_SUBDIRS(src)
++AC_OUTPUT(Makefile)
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
new file mode 100644
index 0000000..5642e3c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.patch
@@ -0,0 +1,30 @@
+Set the timeout to 0 since we don't want pppoe to try reconnecting,
+we want whatever is calling it to reconnect. Lots of odd things
+happen when you have pppoe retrying itself.
+
+The path for the plugin is wrong, it's now part of ppp and is in a
+ppp's plugin lib directory. If no path is specified then that's where
+ppp looks, so that's what we do here.
+
+Index: rp-pppoe-3.8/configs/pppoe.conf
+===================================================================
+--- rp-pppoe-3.8.orig/configs/pppoe.conf	2006-04-03 00:29:41.000000000 +1000
++++ rp-pppoe-3.8/configs/pppoe.conf	2007-06-08 16:02:47.000000000 +1000
+@@ -66,7 +66,7 @@
+ # to connect forever after pppoe-start is called.  Otherwise, it will
+ # give out after CONNECT_TIMEOUT seconds and will not attempt to
+ # connect again, making it impossible to reach.
+-CONNECT_TIMEOUT=30
++CONNECT_TIMEOUT=0
+ 
+ # How often in seconds pppoe-start polls to check if link is up
+ CONNECT_POLL=2
+@@ -115,7 +115,7 @@
+ FIREWALL=NONE
+ 
+ # Linux kernel-mode plugin for pppd.  If you want to try the kernel-mode
+-# plugin, use LINUX_PLUGIN=/etc/ppp/plugins/rp-pppoe.so
++# plugin, use LINUX_PLUGIN=rp-pppoe.so
+ LINUX_PLUGIN=
+ 
+ # Any extra arguments to pass to pppoe.  Normally, use a blank string
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
new file mode 100644
index 0000000..1209631
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
@@ -0,0 +1,23 @@
+--- a/src/Makefile.in	2006-04-02 18:29:42.000000000 +0400
++++ b/src/Makefile.in	2010-04-16 17:51:31.000000000 +0400
+@@ -67,16 +67,16 @@ all: $(TARGETS)
+ 	@echo "Type 'make install' as root to install the software."
+ 
+ pppoe-sniff: pppoe-sniff.o if.o common.o debug.o
+-	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o
++	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o $(LDFLAGS)
+ 
+ pppoe-server: pppoe-server.o if.o debug.o common.o md5.o libevent/libevent.a @PPPOE_SERVER_DEPS@
+-	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o md5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent
++	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o md5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent $(LDFLAGS)
+ 
+ pppoe: pppoe.o if.o debug.o common.o ppp.o discovery.o
+-	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o
++	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o $(LDFLAGS)
+ 
+ pppoe-relay: relay.o if.o debug.o common.o
+-	@CC@ -o pppoe-relay relay.o if.o debug.o common.o
++	@CC@ -o pppoe-relay relay.o if.o debug.o common.o $(LDFLAGS)
+ 
+ pppoe.o: pppoe.c pppoe.h
+ 	@CC@ $(CFLAGS) '-DVERSION="$(VERSION)"' -c -o pppoe.o pppoe.c
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
new file mode 100644
index 0000000..371d82e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "A user-mode PPPoE client and server suite for Linux"
+HOMEPAGE = "http://www.roaringpenguin.com/en/penguin/openSourceProducts/rpPppoe"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
+RDEPENDS_${PN} = "ppp"
+RDEPENDS_${PN}-server = "${PN}"
+RRECOMMENDS_${PN} = "ppp-oe"
+PR = "r7"
+
+SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
+           file://top-autoconf.patch \
+           file://configure_in_cross.patch \
+           file://pppoe-src-restrictions.patch \
+           file://update-config.patch \
+           file://dont-swallow-errors.patch \
+	   file://use-ldflags.patch \
+           file://pppoe-server.default \
+           file://pppoe-server.init"
+
+inherit autotools update-rc.d
+
+do_install() {
+        # Install init script and default settings
+        install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d
+        install -m 0644 ${WORKDIR}/pppoe-server.default ${D}${sysconfdir}/default/pppoe-server
+        install -m 0755 ${WORKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server
+        # Install
+        oe_runmake -C ${S} RPM_INSTALL_ROOT=${D} docdir=${docdir} install
+}
+
+# Insert server package before main package
+PACKAGES = "${PN}-dbg ${PN}-server ${PN}-relay ${PN}-sniff ${PN} ${PN}-doc"
+
+FILES_${PN}-server = "${sysconfdir}/default/pppoe-server \
+                      ${sysconfdir}/init.d/pppoe-server \
+                      ${sbindir}/pppoe-server \
+                      ${sysconfdir}/ppp/pppoe-server-options"
+FILES_${PN}-relay = "${sbindir}/pppoe-relay"
+FILES_${PN}-sniff = "${sbindir}/pppoe-sniff"
+
+pkg_postinst_${PN} () {
+    if [ x"$D" != "x" ]; then
+        exit 1
+    fi
+    chmod 4755 ${sbindir}/pppoe
+}
+
+CONFFILES_${PN} = "${sysconfdir}/ppp/pppoe.conf \
+                   ${sysconfdir}/ppp/firewall-standalone \
+                   ${sysconfdir}/ppp/firewall-masq"
+CONFFILES_${PN}-server = "${sysconfdir}/ppp/pppoe-server-options \
+                          ${sysconfdir}/default/pppoe-server"
+
+INITSCRIPT_PACKAGES            = "${PN}-server"
+INITSCRIPT_NAME_${PN}-server   = "pppoe-server"
+INITSCRIPT_PARAMS_${PN}-server = "defaults 92 8"
+
+
+SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
+SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
diff --git a/meta-oe/site/endian-big b/meta-oe/site/endian-big
new file mode 100644
index 0000000..3a968e3
--- /dev/null
+++ b/meta-oe/site/endian-big
@@ -0,0 +1,2 @@
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=normal}
diff --git a/meta-oe/site/endian-little b/meta-oe/site/endian-little
new file mode 100644
index 0000000..0bcd966
--- /dev/null
+++ b/meta-oe/site/endian-little
@@ -0,0 +1,2 @@
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-- 
1.7.0.4



