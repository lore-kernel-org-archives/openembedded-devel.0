Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUJsl-0003Dk-3z
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 18:46:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2013 09:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,528,1363158000"; d="scan'208";a="322383883"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.204])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 09:28:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 17:28:16 +0100
Message-Id: <1366648096-14496-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Koen Kooi <koen@beagleboard.org>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [meta-oe][PATCH] collectd: add recipe for 5.2.2
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
X-List-Received-Date: Mon, 22 Apr 2013 16:46:35 -0000

Based on initial version by Koen Kooi <koen@beagleboard.org>. Initscript
borrowed from Debian with some tweaks.

Note that since collectd uses libltdl, building this successfully
required OE-Core commit db84eaf851b22b262d9dc48eb55bd5224a00fdd2 or else
you get an error about "config/compile" being missing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../collectd/collectd/collectd-version.patch       |   31 +++
 .../collectd/collectd/collectd.init                |  201 ++++++++++++++++++++
 .../collectd/collectd/no-gcrypt-badpath.patch      |   30 +++
 .../recipes-extended/collectd/collectd_5.2.2.bb    |   45 +++++
 4 files changed, 307 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd.init
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
 create mode 100644 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb

diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch b/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
new file mode 100644
index 0000000..1e2b7c1
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd-version.patch
@@ -0,0 +1,31 @@
+Don't pick up version string from parent git repository
+
+If the collectd source is extracted from a tarball underneath a
+directory structure that includes another git repository, that
+repository will be picked up by "git describe" which is not
+desirable. Check whether collectd itself is a git repository and just
+use the default version if not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/version-gen.sh b/version-gen.sh
+index e344541..d1c0929 100755
+--- a/version-gen.sh
++++ b/version-gen.sh
+@@ -2,7 +2,10 @@
+ 
+ DEFAULT_VERSION="5.2.2.git"
+ 
+-VERSION="`git describe 2> /dev/null | sed -e 's/^collectd-//'`"
++VERSION=""
++if test -d .git ; then
++	VERSION="`git describe 2> /dev/null | sed -e 's/^collectd-//'`"
++fi
+ 
+ if test -z "$VERSION"; then
+ 	VERSION="$DEFAULT_VERSION"
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd.init b/meta-oe/recipes-extended/collectd/collectd/collectd.init
new file mode 100644
index 0000000..abdb194
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd.init
@@ -0,0 +1,201 @@
+#!/bin/sh
+#
+# collectd - start and stop the statistics collection daemon
+# http://collectd.org/
+#
+# Copyright (C) 2005-2006 Florian Forster <octo@verplant.org>
+# Copyright (C) 2006-2009 Sebastian Harl <tokkee@debian.org>
+#
+
+### BEGIN INIT INFO
+# Provides:          collectd
+# Required-Start:    $local_fs $remote_fs
+# Required-Stop:     $local_fs $remote_fs
+# Should-Start:      $network $named $syslog $time cpufrequtils
+# Should-Stop:       $network $named $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: manage the statistics collection daemon
+# Description:       collectd is the statistics collection daemon.
+#                    It is a small daemon which collects system information
+#                    periodically and provides mechanisms to monitor and store
+#                    the values in a variety of ways.
+### END INIT INFO
+
+. /etc/init.d/functions
+
+export PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+DISABLE=0
+
+NAME=collectd
+DAEMON=/usr/sbin/collectd
+
+CONFIGFILE=/etc/collectd.conf
+PIDFILE=/var/run/collectd.pid
+
+USE_COLLECTDMON=1
+COLLECTDMON_DAEMON=/usr/sbin/collectdmon
+COLLECTDMON_PIDFILE=/var/run/collectdmon.pid
+
+MAXWAIT=30
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+if [ -r /etc/default/$NAME ]; then
+	. /etc/default/$NAME
+fi
+
+if test "$ENABLE_COREFILES" == 1; then
+	ulimit -c unlimited
+fi
+
+if test "$USE_COLLECTDMON" == 1; then
+	_PIDFILE="$COLLECTDMON_PIDFILE"
+else
+	_PIDFILE="$PIDFILE"
+fi
+
+# return:
+#   0 if config is fine
+#   1 if there is a syntax error
+#   2 if there is no configuration
+check_config() {
+	if test ! -e "$CONFIGFILE"; then
+		return 2
+	fi
+	if ! $DAEMON -t -C "$CONFIGFILE"; then
+		return 1
+	fi
+	return 0
+}
+
+# return:
+#   0 if the daemon has been started
+#   1 if the daemon was already running
+#   2 if the daemon could not be started
+#   3 if the daemon was not supposed to be started
+d_start() {
+	if test "$DISABLE" != 0; then
+		# we get here during restart
+		echo "disabled by /etc/default/$NAME"
+		return 3
+	fi
+
+	if test ! -e "$CONFIGFILE"; then
+		# we get here during restart
+		echo "disabled, no configuration ($CONFIGFILE) found"
+		return 3
+	fi
+
+	check_config
+	rc="$?"
+	if test "$rc" -ne 0; then
+		echo "not starting, configuration error"
+		return 2
+	fi
+
+	if test "$USE_COLLECTDMON" == 1; then
+		start-stop-daemon --start --quiet --oknodo --pidfile "$_PIDFILE" \
+			--exec $COLLECTDMON_DAEMON -- -P "$_PIDFILE" -- -C "$CONFIGFILE" \
+			|| return 2
+	else
+		start-stop-daemon --start --quiet --oknodo --pidfile "$_PIDFILE" \
+			--exec $DAEMON -- -C "$CONFIGFILE" -P "$_PIDFILE" \
+			|| return 2
+	fi
+	return 0
+}
+
+still_running_warning="
+WARNING: $NAME might still be running.
+In large setups it might take some time to write all pending data to
+the disk. You can adjust the waiting time in /etc/default/collectd."
+
+# return:
+#   0 if the daemon has been stopped
+#   1 if the daemon was already stopped
+#   2 if daemon could not be stopped
+d_stop() {
+	PID=$( cat "$_PIDFILE" 2> /dev/null ) || true
+
+	start-stop-daemon --stop --quiet --oknodo --pidfile "$_PIDFILE"
+	rc="$?"
+
+	if test "$rc" -eq 2; then
+		return 2
+	fi
+
+	sleep 1
+	if test -n "$PID" && kill -0 $PID 2> /dev/null; then
+		i=0
+		while kill -0 $PID 2> /dev/null; do
+			i=$(( $i + 2 ))
+			echo -n " ."
+
+			if test $i -gt $MAXWAIT; then
+				echo "$still_running_warning"
+				return 2
+			fi
+
+			sleep 2
+		done
+		return "$rc"
+	fi
+	return "$rc"
+}
+
+case "$1" in
+	start)
+		echo -n "Starting $NAME"
+		d_start
+		case "$?" in
+			0|1) echo "." ;;
+			*) exit 1 ;;
+		esac
+		;;
+	stop)
+		echo -n "Stopping $NAME"
+		d_stop
+		case "$?" in
+			0|1) echo "." ;;
+			*) exit 1 ;;
+		esac
+		;;
+	status)
+		status_of_proc -p "$_PIDFILE" "$DAEMON" "$NAME" && exit 0 || exit $?
+		;;
+	restart|force-reload)
+		echo -n "Restarting $NAME"
+		check_config
+		rc="$?"
+		if test "$rc" -eq 1; then
+			echo "not restarting, configuration error"
+			exit 1
+		fi
+		d_stop
+		rc="$?"
+		case "$rc" in
+			0|1)
+				sleep 1
+				d_start
+				rc2="$?"
+				case "$rc2" in
+					0|1) echo "." ;;
+					*) exit 1 ;;
+				esac
+				;;
+			*)
+				exit 1
+				;;
+		esac
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
+		exit 3
+		;;
+esac
+
+# vim: syntax=sh noexpandtab sw=4 ts=4 :
+
diff --git a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
new file mode 100644
index 0000000..02b1601
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
@@ -0,0 +1,30 @@
+Disable defaulting of GCRYPT_LDFLAGS to -L/usr/lib
+
+Prevents "unsafe for cross compilation" warnings that cause
+do_qa_configure to fail.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/configure.in b/configure.in
+index 98395ed..81c3a2c 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1777,11 +1777,11 @@ then
+ 		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags 2>/dev/null`
+ 	fi
+ 
+-	if test "x$GCRYPT_LDFLAGS" = "x"
+-	then
+-		gcrypt_exec_prefix=`"$with_libgcrypt_config" --exec-prefix 2>/dev/null`
+-		GCRYPT_LDFLAGS="-L$gcrypt_exec_prefix/lib"
+-	fi
++#	if test "x$GCRYPT_LDFLAGS" = "x"
++#	then
++#		gcrypt_exec_prefix=`"$with_libgcrypt_config" --exec-prefix 2>/dev/null`
++#		GCRYPT_LDFLAGS="-L$gcrypt_exec_prefix/lib"
++#	fi
+ 
+ 	if test "x$GCRYPT_LIBS" = "x"
+ 	then
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
new file mode 100644
index 0000000..a508840
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Collects and summarises system performance statistics"
+DESCRIPTION = "collectd is a daemon which collects system performance statistics periodically and provides mechanisms to store the values in a variety of ways, for example in RRD files."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "rrdtool curl mysql5 libpcap libxml2 yajl libgcrypt libtool"
+
+SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
+           file://no-gcrypt-badpath.patch \
+           file://collectd-version.patch \
+           file://collectd.init"
+
+SRC_URI[md5sum] = "29e61411e51845d5ae71ab676078867e"
+SRC_URI[sha256sum] = "7b8906d1c8866155b31820ef108be92abcee7fcd278d386bf0d449e704ba4696"
+
+inherit autotools pythonnative update-rc.d
+
+# Floatingpoint layout, architecture dependent
+# 'nothing', 'endianflip' or 'intswap'
+FPLAYOUT ?= "--with-fp-layout=nothing"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp --with-libnetsnmp=no,net-snmp"
+
+EXTRA_OECONF = " \
+                ${FPLAYOUT} \
+                --disable-perl --with-libperl=no --with-perl-bindings=no \
+                --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
+"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/collectd.init ${D}${sysconfdir}/init.d/collectd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/collectd
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/collectd
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/collectd
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/collectd
+
+    # Fix configuration file to allow collectd to start up
+    sed -i 's!^#FQDNLookup[ \t]*true!FQDNLookup   false!g' ${D}${sysconfdir}/collectd.conf
+}
+
+INITSCRIPT_NAME = "collectd"
+INITSCRIPT_PARAMS = "defaults"
+
-- 
1.7.10.4



