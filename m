Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdJWS-0004gN-O9
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 12:40:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2012 03:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="224990823"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.231])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2012 03:26:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 11:25:52 +0000
Message-Id: <51c8dbb6281db3bc2894f91d761e1962d82bb177.1354015335.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354015335.git.paul.eggleton@linux.intel.com>
References: <cover.1354015335.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354015335.git.paul.eggleton@linux.intel.com>
References: <cover.1354015335.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v3 7/8] proftpd: add from meta-baryon
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
X-List-Received-Date: Tue, 27 Nov 2012 11:40:22 -0000

This was originally from OE-Classic. Improvements over the OE-Classic
recipe for reference:

* Update to 1.3.4b
* Add workaround for proftpd host IP resolution
* Add initscript, borrowed from Debian with some modifications for
  compatibility and handling for hardcoded paths
* Use autotools.bbclass and remove unnecessary configure options
* PARALLEL_MAKE = "" is no longer needed, the bug was fixed in 1.3.3c
* Set SUMMARY (which sets DESCRIPTION) and base it on the short
  description from the website
* Use useradd.bbclass to add ftp user/group
* Add HOMEPAGE
* Add/fix description in some patches and improve recipe indentation
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM

Some of this work was done by Dexuan Cui <dexuan.cui@intel.com> and
Kevin Strasser <kevin.strasser@linux.intel.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons/proftpd/files/basic.conf.patch |   21 ++
 .../recipes-daemons/proftpd/files/contrib.patch    |   42 ++++
 .../recipes-daemons/proftpd/files/default          |    9 +
 .../recipes-daemons/proftpd/files/make.patch       |   66 ++++++
 .../proftpd/files/proftpd-basic.init               |  220 ++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   66 ++++++
 6 files changed, 424 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/basic.conf.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/contrib.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/default
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/make.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init
 create mode 100644 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb

diff --git a/meta-networking/recipes-daemons/proftpd/files/basic.conf.patch b/meta-networking/recipes-daemons/proftpd/files/basic.conf.patch
new file mode 100644
index 0000000..4967bed
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/basic.conf.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Inappropriate [configuration]
+
+proftpd tries to get the IP address from the hostname.
+Unluckily now the hostname is not properly configured in /etc/hosts.
+We can use this patch as a workaround.
+
+Author: Dexuan Cui <dexuan.cui@intel.com>
+Tue Oct 25 12:59:27 CST 2011
+
+--- proftpd-1.3.3c.orig/sample-configurations/basic.conf
++++ proftpd-1.3.3c/sample-configurations/basic.conf
+@@ -7,6 +7,9 @@
+ ServerType			standalone
+ DefaultServer			on
+ 
++#By default we bind to all interfaces.
++DefaultAddress      0.0.0.0
++
+ # Port 21 is the standard FTP port.
+ Port				21
+ 
diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
new file mode 100644
index 0000000..7e2a8e3
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
@@ -0,0 +1,42 @@
+The contrib directory now contains its own Makefile which is
+used during installation. It was required to pass DESTDIR through
+when it gets called from the base Makefile.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
+---
+ Makefile.in         |    2 +-
+ contrib/Makefile.in |    6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 5b2e683..ee72fe1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
+ 	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
+ 
+ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
+-	cd contrib/ && $(MAKE) install-utils
++	cd contrib/ && $(MAKE) DESTDIR=${DESTDIR} install-utils
+ 	$(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
+ 	$(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
+ 	$(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
+diff --git a/contrib/Makefile.in b/contrib/Makefile.in
+index 5bcc038..51d248c 100644
+--- a/contrib/Makefile.in
++++ b/contrib/Makefile.in
+@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
+ 	cd ../ && ./config.status
+ 
+ install-utils:
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
++	$(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
++	$(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
++	$(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-daemons/proftpd/files/default b/meta-networking/recipes-daemons/proftpd/files/default
new file mode 100644
index 0000000..b31f36c
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/default
@@ -0,0 +1,9 @@
+# Defaults for proftpd initscript
+
+# Master system-wide proftpd switch. The initscript
+# will not run if it is not set to yes.
+RUN="yes"
+
+# Default options.
+# For more exhaustive logging, try "-d 3".
+OPTIONS=""
diff --git a/meta-networking/recipes-daemons/proftpd/files/make.patch b/meta-networking/recipes-daemons/proftpd/files/make.patch
new file mode 100644
index 0000000..c5ff013
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/make.patch
@@ -0,0 +1,66 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: proftpd-1.3.2/Makefile.in
+===================================================================
+--- proftpd-1.3.2.orig/Makefile.in
++++ proftpd-1.3.2/Makefile.in
+@@ -76,7 +76,6 @@ check: proftpd$(EXEEXT)
+ $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(rundir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
+ 	@if [ ! -d $@ ]; then \
+ 		mkdir -p $@; \
+-		chown $(INSTALL_USER):$(INSTALL_GROUP) $@; \
+ 		chmod 0755 $@; \
+ 	fi
+ 
+@@ -86,7 +85,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
+ 		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
+ 	fi
+ 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
+-	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
+ 
+ install-libs: $(DESTDIR)$(libdir)/proftpd
+ 	cd lib/ && $(MAKE) install
+@@ -121,11 +119,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
+ 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
+ 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
+ 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
++	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
+ 
+ install-conf: $(DESTDIR)$(sysconfdir)
+ 	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
+-		$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644 \
++		$(INSTALL) -m 0644 \
+ 		           $(top_srcdir)/sample-configurations/basic.conf \
+ 	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
+ 	fi
+Index: proftpd-1.3.2/Make.rules.in
+===================================================================
+--- proftpd-1.3.2.orig/Make.rules.in
++++ proftpd-1.3.2/Make.rules.in
+@@ -29,9 +29,9 @@ UTILS_LIBS=@UTILS_LIBS@ @LIBS@
+ INSTALL=@INSTALL@
+ INSTALL_USER=@install_user@
+ INSTALL_GROUP=@install_group@
+-INSTALL_BIN=$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
+-INSTALL_SBIN=$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
+-INSTALL_MAN=$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644
++INSTALL_BIN=$(INSTALL) -m 0755
++INSTALL_SBIN=$(INSTALL) -m 0755
++INSTALL_MAN=$(INSTALL) -m 0644
+ 
+ RM=rm -f
+ SHELL=/bin/sh
+Index: proftpd-1.3.2/lib/libcap/Makefile
+===================================================================
+--- proftpd-1.3.2.orig/lib/libcap/Makefile
++++ proftpd-1.3.2/lib/libcap/Makefile
+@@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
+ all: $(LIBNAME)
+ 
+ _makenames: _makenames.c cap_names.sed
+-	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
++	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init b/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init
new file mode 100644
index 0000000..01c998c
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/proftpd-basic.init
@@ -0,0 +1,220 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:          proftpd
+# Required-Start:    $remote_fs $syslog $local_fs $network
+# Required-Stop:     $remote_fs $syslog $local_fs $network
+# Should-Start:      $named
+# Should-Stop:       $named
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Starts ProFTPD daemon
+# Description:       This script runs the FTP service offered
+#                    by the ProFTPD daemon
+### END INIT INFO
+
+# Start the proftpd FTP daemon.
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+DAEMON=/usr/sbin/proftpd
+NAME=proftpd
+
+# Defaults
+RUN="no"
+OPTIONS=""
+CONFIG_FILE=/etc/proftpd.conf
+
+PIDFILE=`grep -i '^pidfile' $CONFIG_FILE|awk '{ print $2 }'`
+if [ "x$PIDFILE" = "x" ];
+then
+    PIDFILE=/var/run/proftpd.pid
+fi
+
+# Read config (will override defaults)
+[ -r /etc/default/proftpd ] && . /etc/default/proftpd
+
+trap "" 1
+trap "" 15
+
+test -f $DAEMON || exit 0
+
+. /etc/init.d/functions
+
+#
+# Servertype could be inetd|standalone|none.
+# In all cases check against inetd and xinetd support.
+#
+if ! egrep -qi "^[[:space:]]*ServerType.*standalone" $CONFIG_FILE
+then
+    if egrep -qi "server[[:space:]]*=[[:space:]]*/usr/sbin/proftpd" /etc/xinetd.conf 2>/dev/null || \
+       egrep -qi "server[[:space:]]*=[[:space:]]*/usr/sbin/proftpd" /etc/xinetd.d/* 2>/dev/null || \
+       egrep -qi "^ftp.*/usr/sbin/proftpd" /etc/inetd.conf 2>/dev/null
+    then
+        RUN="no"
+        INETD="yes"
+    else
+        if ! egrep -qi "^[[:space:]]*ServerType.*inetd" $CONFIG_FILE
+        then
+            RUN="yes"
+            INETD="no"
+        else
+            RUN="no"
+            INETD="no"
+        fi
+    fi
+fi
+
+# /var/run could be on a tmpfs
+
+[ ! -d /var/run/proftpd ] && mkdir /var/run/proftpd
+
+inetd_check()
+{
+    if [ ! -x /usr/sbin/inetd -a ! -x /usr/sbin/xinetd ]; then
+        echo "Neither inetd nor xinetd appears installed: check your configuration."
+    fi
+}
+
+start()
+{
+    set -e
+    echo -n "Starting ftp server $NAME... "
+    start-stop-daemon --start --quiet --pidfile "$PIDFILE" --oknodo --exec $DAEMON -- -c $CONFIG_FILE $OPTIONS
+    echo "done."
+}
+
+signal()
+{
+
+    if [ "$1" = "stop" ]; then
+        SIGNAL="TERM"
+        echo -n "Stopping ftp server $NAME... "
+    else
+        if [ "$1" = "reload" ]; then
+            SIGNAL="HUP"
+            echo -n "Reloading ftp server $NAME... "
+        else
+            echo "ERR: wrong parameter given to signal()"
+            exit 1
+        fi
+    fi
+    if [ -f "$PIDFILE" ]; then
+        start-stop-daemon --stop --signal $SIGNAL --quiet --pidfile "$PIDFILE"
+        if [ $? = 0 ]; then
+            echo "done."
+            return
+        else
+            SIGNAL="KILL"
+            start-stop-daemon --stop --signal $SIGNAL --quiet --pidfile "$PIDFILE"
+            if [ $? != 0 ]; then
+                echo
+                [ $2 != 0 ] || exit 0
+            else
+                echo "done."
+                return
+            fi
+        fi
+        if [ "$SIGNAL" = "KILL" ]; then
+            rm -f "$PIDFILE"
+        fi
+    else
+        echo "done."
+        return
+    fi
+}
+
+case "$1" in
+    start)
+        if [ "x$RUN" = "xyes" ] ; then
+            start
+        else
+            if [ "x$INETD" = "xyes" ] ; then
+                echo "ProFTPD is started from inetd/xinetd."
+                inetd_check
+            else
+                echo "ProFTPD warning: cannot start neither in standalone nor in inetd/xinetd mode. Check your configuration."
+            fi
+        fi
+        ;;
+
+    force-start)
+        if [ "x$INETD" = "xyes" ] ; then
+            echo "Warning: ProFTPD is started from inetd/xinetd (trying to start anyway)."
+            inetd_check
+        fi
+        start
+        ;;
+
+    stop)
+        if [ "x$RUN" = "xyes" ] ; then
+            signal stop 0
+        else
+            if [ "x$INETD" = "xyes" ] ; then
+                echo "ProFTPD is started from inetd/xinetd."
+                inetd_check
+            else
+                echo "ProFTPD warning: cannot start neither in standalone nor in inetd/xinetd mode. Check your configuration."
+            fi
+        fi
+        ;;
+
+    force-stop)
+        if [ "x$INETD" = "xyes" ] ; then
+            echo "Warning: ProFTPD is started from inetd/xinetd (trying to kill anyway)."
+            inetd_check
+        fi
+        signal stop 0
+        ;;
+
+    reload)
+        signal reload 0
+        ;;
+
+    force-reload|restart)
+        if [ "x$RUN" = "xyes" ] ; then
+            signal stop 1
+            sleep 2
+            start
+        else
+            if [ "x$INETD" = "xyes" ] ; then
+                echo "ProFTPD is started from inetd/xinetd."
+                inetd_check
+            else
+                echo "ProFTPD warning: cannot start neither in standalone nor in inetd/xinetd mode. Check your configuration."
+            fi
+        fi
+        ;;
+
+    status)
+        if [ "x$INETD" = "xyes" ] ; then
+            echo "ProFTPD is started from inetd/xinetd."
+            inetd_check
+            exit 0
+        else
+            if [ -f "$PIDFILE" ]; then
+                pid=$(cat $PIDFILE)
+            else
+                pid="x"
+            fi
+            if [ `pidof proftpd|grep "$pid"|wc -l` -ne 0 ] ; then
+                echo "ProFTPD is started in standalone mode, currently running."
+                exit 0
+            else
+                echo "ProFTPD is started in standalone mode, currently not running."
+                exit 3
+            fi
+        fi
+        ;;
+
+    check-config)
+        $DAEMON -t >/dev/null && echo "ProFTPD configuration OK" && exit 0
+        exit 1
+        ;;
+
+    *)
+        echo "Usage: /etc/init.d/$NAME {start|status|force-start|stop|force-stop|reload|restart|force-reload|check-config}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
new file mode 100644
index 0000000..8624c16
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Secure and configurable FTP server"
+SECTION = "console/network"
+HOMEPAGE = "http://www.proftpd.org"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${PN}-${PV}.tar.gz \
+           file://make.patch \
+           file://basic.conf.patch \
+           file://contrib.patch \
+           file://proftpd-basic.init \
+           file://default \
+           "
+
+SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
+SRC_URI[sha256sum] = "9f659585cea90fc6af34a0ffae4a90e4ed37abe92dbd9b6c311f95a436c961cb"
+
+inherit autotools useradd update-rc.d
+
+EXTRA_OECONF = "--disable-cap \
+                --disable-auth-pam \
+		"
+
+# proftpd uses libltdl which currently makes configuring using
+# autotools.bbclass a pain...
+do_configure () {
+	oe_runconf
+}
+
+FTPUSER = "ftp"
+FTPGROUP = "ftp"
+
+do_install () {
+	oe_runmake DESTDIR=${D} install
+	rmdir ${D}${libexecdir} ${D}${libdir}/proftpd ${D}${datadir}/locale
+	sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
+	sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/proftpd
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/proftpd
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/proftpd
+	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/proftpd
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
+}
+
+INITSCRIPT_NAME = "proftpd"
+INITSCRIPT_PARAM = "defaults 85 15"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "${FTPGROUP}"
+USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
+
+pkg_postinst_${PN} () {
+    if [ "x$D" != "x" ] ; then
+        exit 1
+    fi
+
+    # create the pub directory
+    mkdir -p /home/${FTPUSER}/pub/
+    chown -R ${FTPUSER}:${FTPGROUP} /home/${FTPUSER}/pub
+}
-- 
1.7.9.5



