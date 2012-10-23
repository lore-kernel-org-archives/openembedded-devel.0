Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TQhQL-0007RG-V6
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 18:33:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9NGKMUP011545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 09:20:22 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 23 Oct 2012 09:20:22 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Oct 2012 12:20:18 -0400
Message-ID: <1351009220-30119-2-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH V2 1/3] ntp: Move from meta-oe to meta-networking
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
X-List-Received-Date: Tue, 23 Oct 2012 16:33:50 -0000
Content-Type: text/plain

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntp      |   31 ++++++++++
 .../ntp/files/ntp-4.2.4_p6-nano.patch              |   17 +++++
 meta-networking/recipes-support/ntp/files/ntp.conf |   14 +++++
 meta-networking/recipes-support/ntp/files/ntpd     |   62 ++++++++++++++++++++
 meta-networking/recipes-support/ntp/files/ntpdate  |   49 +++++++++++++++
 .../recipes-support/ntp/files/tickadj.c.patch      |   32 ++++++++++
 .../recipes-support/ntp/ntp-ssl_4.2.6p3.bb         |   11 ++++
 meta-networking/recipes-support/ntp/ntp.inc        |   35 +++++++++++
 meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb |   47 +++++++++++++++
 meta-oe/recipes-support/ntp/files/ntp              |   31 ----------
 .../ntp/files/ntp-4.2.4_p6-nano.patch              |   17 -----
 meta-oe/recipes-support/ntp/files/ntp.conf         |   14 -----
 meta-oe/recipes-support/ntp/files/ntpd             |   62 --------------------
 meta-oe/recipes-support/ntp/files/ntpdate          |   49 ---------------
 meta-oe/recipes-support/ntp/files/tickadj.c.patch  |   32 ----------
 meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb     |   11 ----
 meta-oe/recipes-support/ntp/ntp.inc                |   35 -----------
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   47 ---------------
 18 files changed, 298 insertions(+), 298 deletions(-)
 create mode 100755 meta-networking/recipes-support/ntp/files/ntp
 create mode 100644 meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
 create mode 100644 meta-networking/recipes-support/ntp/files/ntp.conf
 create mode 100755 meta-networking/recipes-support/ntp/files/ntpd
 create mode 100755 meta-networking/recipes-support/ntp/files/ntpdate
 create mode 100644 meta-networking/recipes-support/ntp/files/tickadj.c.patch
 create mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
 create mode 100644 meta-networking/recipes-support/ntp/ntp.inc
 create mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
 delete mode 100755 meta-oe/recipes-support/ntp/files/ntp
 delete mode 100644 meta-oe/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
 delete mode 100644 meta-oe/recipes-support/ntp/files/ntp.conf
 delete mode 100755 meta-oe/recipes-support/ntp/files/ntpd
 delete mode 100755 meta-oe/recipes-support/ntp/files/ntpdate
 delete mode 100644 meta-oe/recipes-support/ntp/files/tickadj.c.patch
 delete mode 100644 meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
 delete mode 100644 meta-oe/recipes-support/ntp/ntp.inc
 delete mode 100644 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb

diff --git a/meta-networking/recipes-support/ntp/files/ntp b/meta-networking/recipes-support/ntp/files/ntp
new file mode 100755
index 0000000..e91a528
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntp
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+FLAGS="defaults 23"
+
+test -f /usr/bin/ntpd || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting NTP server: ntpd"
+  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
+		echo "."
+  		;;
+	stop)
+		echo -n "Stopping NTP server: ntpd"
+  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
+		echo "."
+  		;;
+	restart|force-reload)
+		echo -n "Restarting NTP server: ntpd... "
+  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
+  		sleep 2
+  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
+		echo "done."
+  		;;
+	*)
+  		echo "Usage: /etc/init.d/ntp {start|stop|restart|force-reload}"
+  		exit 1
+		;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch b/meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
new file mode 100644
index 0000000..cb1e2f7
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
@@ -0,0 +1,17 @@
+--- a/include/ntp_syscall.h.orig	2009-05-19 16:44:55.048156467 -0400
++++ b/include/ntp_syscall.h	2009-05-19 16:46:19.293323686 -0400
+@@ -14,6 +14,14 @@
+ # include <sys/timex.h>
+ #endif
+ 
++#if defined(ADJ_NANO) && !defined(MOD_NANO)
++#define MOD_NANO ADJ_NANO
++#endif
++
++#if defined(ADJ_TAI) && !defined(MOD_TAI)
++#define MOD_TAI ADJ_TAI
++#endif
++
+ #ifndef NTP_SYSCALLS_LIBC
+ #ifdef NTP_SYSCALLS_STD
+ # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
new file mode 100644
index 0000000..bf52440
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntp.conf
@@ -0,0 +1,14 @@
+# This is the most basic ntp configuration file
+# The driftfile must remain in a place specific to this
+# machine - it records the machine specific clock error
+driftfile /etc/ntp.drift
+# This obtains a random server which will be close
+# (in IP terms) to the machine.  Add other servers
+# as required, or change this.
+server pool.ntp.org
+# Using local hardware clock as fallback
+# Disable this when using ntpd -q -g -x as ntpdate or it will sync to itself
+server 127.127.1.0
+fudge 127.127.1.0 stratum 14
+# Defining a default security setting
+restrict default
diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
new file mode 100755
index 0000000..ae50f13
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -0,0 +1,62 @@
+#! /bin/sh
+#
+# ntpd	init.d script for ntpdc from ntp.isc.org
+test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
+# rcS contains TICKADJ
+test -r /etc/default/rcS && . /etc/default/rcS
+
+# Functions to do individual actions
+settick(){
+  	# If TICKADJ is set we *must* adjust it before we start, because the
+	# driftfile relies on the correct setting
+	test -n "$TICKADJ" -a -x /usr/bin/tickadj && {
+		echo -n "Setting tick to $TICKADJ: "
+		/usr/bin/tickadj "$TICKADJ"
+		echo "done"
+	}
+}
+startdaemon(){
+	# The -g option allows ntpd to step the time to correct it just
+	# once.  The daemon will exit if the clock drifts too much after
+	# this.  If ntpd seems to disappear after a while assume TICKADJ
+	# above is set to a totally incorrect value.
+	echo -n "Starting ntpd: "
+	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
+	echo "done"
+}
+stopdaemon(){
+	echo -n "Stopping ntpd: "
+	start-stop-daemon --stop -p /var/run/ntp.pid
+	echo "done"
+}
+
+case "$1" in
+  start)
+  	settick
+	startdaemon -g
+	;;
+  stop)
+  	stopdaemon
+	;;
+  force-reload)
+  	stopdaemon
+  	settick
+	startdaemon -g
+	;;
+  restart)
+  	# Don't reset the tick here
+	stopdaemon
+	startdaemon -g
+	;;
+  reload)
+  	# Must do this by hand, but don't do -g
+	stopdaemon
+	startdaemon
+	;;
+  *)
+	echo "Usage: ntpd { start | stop | restart | reload }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-networking/recipes-support/ntp/files/ntpdate
new file mode 100755
index 0000000..784b029
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntpdate
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/bin
+
+test -x /usr/bin/ntpdate || exit 0
+
+if test -f /etc/default/ntpdate ; then
+. /etc/default/ntpdate
+else
+NTPSERVERS="pool.ntp.org"
+fi
+
+test -n "$NTPSERVERS" || exit 0
+
+# This is a heuristic:  The idea is that if a static interface is brought
+# up, that is a major event, and we can put in some extra effort to fix
+# the system time.  Feel free to change this, especially if you regularly
+# bring up new network interfaces.
+if [ "$METHOD" = static ]; then
+	OPTS="-b"
+fi
+
+if [ "$METHOD" = loopback ]; then
+	exit 0
+fi
+
+(
+
+LOCKFILE=/var/lock/ntpdate
+
+# Avoid running more than one at a time
+if [ -x /usr/bin/lockfile-create ]; then
+	lockfile-create $LOCKFILE
+	lockfile-touch $LOCKFILE &
+	LOCKTOUCHPID="$!"
+fi
+
+if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
+	if [ "$UPDATE_HWCLOCK" = "yes" ]; then
+		hwclock --systohc || :
+	fi
+fi
+
+if [ -x /usr/bin/lockfile-create ] ; then
+	kill $LOCKTOUCHPID
+	lockfile-remove $LOCKFILE
+fi
+
+) &
diff --git a/meta-networking/recipes-support/ntp/files/tickadj.c.patch b/meta-networking/recipes-support/ntp/files/tickadj.c.patch
new file mode 100644
index 0000000..9ef9de9
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/tickadj.c.patch
@@ -0,0 +1,32 @@
+Index: ntp-4.2.2p3-r0/ntp-4.2.2p3/util/tickadj.c
+===================================================================
+--- ntp-4.2.2p3/util/tickadj.c	2004-02-25 06:58:33.000000000 +0100
++++ ntp-4.2.2p3/util/tickadj.c	2007-07-07 01:00:54.000000000 +0200
+@@ -21,7 +21,8 @@
+ # include <unistd.h>
+ #endif /* HAVE_UNISTD_H */
+ 
+-#ifdef HAVE___ADJTIMEX		/* Linux */
++/* proper handling here has been moved to upstream ntp bugzilla */
++#ifdef linux
+ 
+ #include <sys/timex.h>
+ struct timex txc;
+@@ -91,7 +92,7 @@
+ 	}
+ 
+ 	if (!errflg) {
+-		if (__adjtimex(&txc) < 0)
++		if (adjtimex(&txc) < 0)
+ 			perror("adjtimex");
+ 		else if (!quiet)
+ 			printf("tick     = %ld\ntick_adj = %d\n",
+@@ -146,7 +147,7 @@
+ #endif
+ 	}
+     
+-	if (__adjtimex(&txc) < 0)
++	if (adjtimex(&txc) < 0)
+ 	{
+ 		perror("adjtimex");
+ 	}
diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
new file mode 100644
index 0000000..a158990
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
@@ -0,0 +1,11 @@
+require ntp_${PV}.bb
+DEPENDS = "openssl"
+
+S = "${WORKDIR}/ntp-${PV}"
+
+EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
+	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
+
+
+SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
+SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
new file mode 100644
index 0000000..1d740f0
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -0,0 +1,35 @@
+DESCRIPTION = "The Network Time Protocol (NTP) is used to \
+synchronize the time of a computer client or server to \
+another server or reference time source, such as a radio \
+or satellite receiver or modem."
+HOMEPAGE = "http://ntp.isc.org/bin/view/Main/WebHome"
+SECTION = "console/network"
+LICENSE = "ntp"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
+RSUGGESTS_${PN} = "iana-etc"
+
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
+	file://ipv6only-workaround.patch \
+	file://ntpd \
+	file://ntp.conf \
+	file://ntpdate \
+	file://ntpd.service \
+"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME = "ntpd"
+# No dependencies, so just go in at the standard level (20)
+INITSCRIPT_PARAMS = "defaults"
+
+# The ac_cv_header_readline_history is to stop ntpdc depending on either
+# readline or curses
+EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
+CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
+
+PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
+# NOTE: you don't need ntpdate, use "ntpd -q -g -x"
+# or the ntpdate systemd service
+
+# This should use rc.update
+FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
new file mode 100644
index 0000000..89a272a
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -0,0 +1,47 @@
+require ntp.inc
+
+PR = "r6"
+
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
+        file://tickadj.c.patch \
+        file://ntp-4.2.4_p6-nano.patch \
+        file://ntpd \
+        file://ntp.conf \
+        file://ntpdate \
+"
+
+SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
+SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
+
+EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
+	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
+	install -d ${D}/${sysconfdir}/network/if-up.d
+	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
+}
+
+FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
+FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_ntp-utils = "${bindir}/*"
+FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
+
+# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
+# with wonky clocks (e.g. OpenSlug)
+RDEPENDS_${PN} = "${PN}-tickadj"
+
+pkg_postinst_ntpdate() {
+if test "x$D" != "x"; then
+        exit 1
+else
+        if ! grep -q -s ntpdate /var/spool/cron/root; then
+                echo "adding crontab"
+                test -d /var/spool/cron || mkdir -p /var/spool/cron
+                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
+        fi
+fi
+}
+
diff --git a/meta-oe/recipes-support/ntp/files/ntp b/meta-oe/recipes-support/ntp/files/ntp
deleted file mode 100755
index e91a528..0000000
--- a/meta-oe/recipes-support/ntp/files/ntp
+++ /dev/null
@@ -1,31 +0,0 @@
-#! /bin/sh
-
-FLAGS="defaults 23"
-
-test -f /usr/bin/ntpd || exit 0
-
-case "$1" in
-	start)
-		echo -n "Starting NTP server: ntpd"
-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
-		echo "."
-  		;;
-	stop)
-		echo -n "Stopping NTP server: ntpd"
-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
-		echo "."
-  		;;
-	restart|force-reload)
-		echo -n "Restarting NTP server: ntpd... "
-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
-  		sleep 2
-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
-		echo "done."
-  		;;
-	*)
-  		echo "Usage: /etc/init.d/ntp {start|stop|restart|force-reload}"
-  		exit 1
-		;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch b/meta-oe/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
deleted file mode 100644
index cb1e2f7..0000000
--- a/meta-oe/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- a/include/ntp_syscall.h.orig	2009-05-19 16:44:55.048156467 -0400
-+++ b/include/ntp_syscall.h	2009-05-19 16:46:19.293323686 -0400
-@@ -14,6 +14,14 @@
- # include <sys/timex.h>
- #endif
- 
-+#if defined(ADJ_NANO) && !defined(MOD_NANO)
-+#define MOD_NANO ADJ_NANO
-+#endif
-+
-+#if defined(ADJ_TAI) && !defined(MOD_TAI)
-+#define MOD_TAI ADJ_TAI
-+#endif
-+
- #ifndef NTP_SYSCALLS_LIBC
- #ifdef NTP_SYSCALLS_STD
- # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
diff --git a/meta-oe/recipes-support/ntp/files/ntp.conf b/meta-oe/recipes-support/ntp/files/ntp.conf
deleted file mode 100644
index bf52440..0000000
--- a/meta-oe/recipes-support/ntp/files/ntp.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-# This is the most basic ntp configuration file
-# The driftfile must remain in a place specific to this
-# machine - it records the machine specific clock error
-driftfile /etc/ntp.drift
-# This obtains a random server which will be close
-# (in IP terms) to the machine.  Add other servers
-# as required, or change this.
-server pool.ntp.org
-# Using local hardware clock as fallback
-# Disable this when using ntpd -q -g -x as ntpdate or it will sync to itself
-server 127.127.1.0
-fudge 127.127.1.0 stratum 14
-# Defining a default security setting
-restrict default
diff --git a/meta-oe/recipes-support/ntp/files/ntpd b/meta-oe/recipes-support/ntp/files/ntpd
deleted file mode 100755
index ae50f13..0000000
--- a/meta-oe/recipes-support/ntp/files/ntpd
+++ /dev/null
@@ -1,62 +0,0 @@
-#! /bin/sh
-#
-# ntpd	init.d script for ntpdc from ntp.isc.org
-test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
-# rcS contains TICKADJ
-test -r /etc/default/rcS && . /etc/default/rcS
-
-# Functions to do individual actions
-settick(){
-  	# If TICKADJ is set we *must* adjust it before we start, because the
-	# driftfile relies on the correct setting
-	test -n "$TICKADJ" -a -x /usr/bin/tickadj && {
-		echo -n "Setting tick to $TICKADJ: "
-		/usr/bin/tickadj "$TICKADJ"
-		echo "done"
-	}
-}
-startdaemon(){
-	# The -g option allows ntpd to step the time to correct it just
-	# once.  The daemon will exit if the clock drifts too much after
-	# this.  If ntpd seems to disappear after a while assume TICKADJ
-	# above is set to a totally incorrect value.
-	echo -n "Starting ntpd: "
-	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
-	echo "done"
-}
-stopdaemon(){
-	echo -n "Stopping ntpd: "
-	start-stop-daemon --stop -p /var/run/ntp.pid
-	echo "done"
-}
-
-case "$1" in
-  start)
-  	settick
-	startdaemon -g
-	;;
-  stop)
-  	stopdaemon
-	;;
-  force-reload)
-  	stopdaemon
-  	settick
-	startdaemon -g
-	;;
-  restart)
-  	# Don't reset the tick here
-	stopdaemon
-	startdaemon -g
-	;;
-  reload)
-  	# Must do this by hand, but don't do -g
-	stopdaemon
-	startdaemon
-	;;
-  *)
-	echo "Usage: ntpd { start | stop | restart | reload }" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/ntp/files/ntpdate b/meta-oe/recipes-support/ntp/files/ntpdate
deleted file mode 100755
index 784b029..0000000
--- a/meta-oe/recipes-support/ntp/files/ntpdate
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-PATH=/sbin:/bin:/usr/bin
-
-test -x /usr/bin/ntpdate || exit 0
-
-if test -f /etc/default/ntpdate ; then
-. /etc/default/ntpdate
-else
-NTPSERVERS="pool.ntp.org"
-fi
-
-test -n "$NTPSERVERS" || exit 0
-
-# This is a heuristic:  The idea is that if a static interface is brought
-# up, that is a major event, and we can put in some extra effort to fix
-# the system time.  Feel free to change this, especially if you regularly
-# bring up new network interfaces.
-if [ "$METHOD" = static ]; then
-	OPTS="-b"
-fi
-
-if [ "$METHOD" = loopback ]; then
-	exit 0
-fi
-
-(
-
-LOCKFILE=/var/lock/ntpdate
-
-# Avoid running more than one at a time
-if [ -x /usr/bin/lockfile-create ]; then
-	lockfile-create $LOCKFILE
-	lockfile-touch $LOCKFILE &
-	LOCKTOUCHPID="$!"
-fi
-
-if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
-	if [ "$UPDATE_HWCLOCK" = "yes" ]; then
-		hwclock --systohc || :
-	fi
-fi
-
-if [ -x /usr/bin/lockfile-create ] ; then
-	kill $LOCKTOUCHPID
-	lockfile-remove $LOCKFILE
-fi
-
-) &
diff --git a/meta-oe/recipes-support/ntp/files/tickadj.c.patch b/meta-oe/recipes-support/ntp/files/tickadj.c.patch
deleted file mode 100644
index 9ef9de9..0000000
--- a/meta-oe/recipes-support/ntp/files/tickadj.c.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Index: ntp-4.2.2p3-r0/ntp-4.2.2p3/util/tickadj.c
-===================================================================
---- ntp-4.2.2p3/util/tickadj.c	2004-02-25 06:58:33.000000000 +0100
-+++ ntp-4.2.2p3/util/tickadj.c	2007-07-07 01:00:54.000000000 +0200
-@@ -21,7 +21,8 @@
- # include <unistd.h>
- #endif /* HAVE_UNISTD_H */
- 
--#ifdef HAVE___ADJTIMEX		/* Linux */
-+/* proper handling here has been moved to upstream ntp bugzilla */
-+#ifdef linux
- 
- #include <sys/timex.h>
- struct timex txc;
-@@ -91,7 +92,7 @@
- 	}
- 
- 	if (!errflg) {
--		if (__adjtimex(&txc) < 0)
-+		if (adjtimex(&txc) < 0)
- 			perror("adjtimex");
- 		else if (!quiet)
- 			printf("tick     = %ld\ntick_adj = %d\n",
-@@ -146,7 +147,7 @@
- #endif
- 	}
-     
--	if (__adjtimex(&txc) < 0)
-+	if (adjtimex(&txc) < 0)
- 	{
- 		perror("adjtimex");
- 	}
diff --git a/meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
deleted file mode 100644
index a158990..0000000
--- a/meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ntp_${PV}.bb
-DEPENDS = "openssl"
-
-S = "${WORKDIR}/ntp-${PV}"
-
-EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
-	        --with-openssl-incdir=${STAGING_INCDIR}/openssl"
-
-
-SRC_URI[md5sum] = "98e16c7aa4ecd4c004b51bff18962e95"
-SRC_URI[sha256sum] = "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4659007cfff278671a"
diff --git a/meta-oe/recipes-support/ntp/ntp.inc b/meta-oe/recipes-support/ntp/ntp.inc
deleted file mode 100644
index 1d740f0..0000000
--- a/meta-oe/recipes-support/ntp/ntp.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "The Network Time Protocol (NTP) is used to \
-synchronize the time of a computer client or server to \
-another server or reference time source, such as a radio \
-or satellite receiver or modem."
-HOMEPAGE = "http://ntp.isc.org/bin/view/Main/WebHome"
-SECTION = "console/network"
-LICENSE = "ntp"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
-RSUGGESTS_${PN} = "iana-etc"
-
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
-	file://ipv6only-workaround.patch \
-	file://ntpd \
-	file://ntp.conf \
-	file://ntpdate \
-	file://ntpd.service \
-"
-
-inherit autotools update-rc.d
-
-INITSCRIPT_NAME = "ntpd"
-# No dependencies, so just go in at the standard level (20)
-INITSCRIPT_PARAMS = "defaults"
-
-# The ac_cv_header_readline_history is to stop ntpdc depending on either
-# readline or curses
-EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
-CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
-
-PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
-# NOTE: you don't need ntpdate, use "ntpd -q -g -x"
-# or the ntpdate systemd service
-
-# This should use rc.update
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
deleted file mode 100644
index 89a272a..0000000
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-require ntp.inc
-
-PR = "r6"
-
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-        file://tickadj.c.patch \
-        file://ntp-4.2.4_p6-nano.patch \
-        file://ntpd \
-        file://ntp.conf \
-        file://ntpdate \
-"
-
-SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
-SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
-
-EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
-	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
-	install -d ${D}/${sysconfdir}/network/if-up.d
-	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
-}
-
-FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_ntp-utils = "${bindir}/*"
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
-
-# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
-# with wonky clocks (e.g. OpenSlug)
-RDEPENDS_${PN} = "${PN}-tickadj"
-
-pkg_postinst_ntpdate() {
-if test "x$D" != "x"; then
-        exit 1
-else
-        if ! grep -q -s ntpdate /var/spool/cron/root; then
-                echo "adding crontab"
-                test -d /var/spool/cron || mkdir -p /var/spool/cron
-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
-        fi
-fi
-}
-
-- 
1.7.0.4



