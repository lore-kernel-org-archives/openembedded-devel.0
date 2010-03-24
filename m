Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NuMAw-0007uP-Iu
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 09:42:58 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4E44F491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 09:39:47 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 24 Mar 2010 09:40:13 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id B630272077; Wed, 24 Mar 2010 09:39:46 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 09:39:39 +0100
Message-Id: <1269419979-26397-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
X-OriginalArrivalTime: 24 Mar 2010 08:40:13.0408 (UTC)
	FILETIME=[9EF19600:01CACB2D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rsyslog: new recipe
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
X-List-Received-Date: Wed, 24 Mar 2010 08:42:59 -0000

a reliable and extended syslogd

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/rsyslog/files/initscript            |   90 +++++++++
 recipes/rsyslog/files/rsyslog.conf          |   60 ++++++
 recipes/rsyslog/rsyslog-5.4.0/atomics.patch |  277 +++++++++++++++++++++++++++
 recipes/rsyslog/rsyslog.inc                 |   34 ++++
 recipes/rsyslog/rsyslog_5.4.0.bb            |    7 +
 5 files changed, 468 insertions(+), 0 deletions(-)
 create mode 100644 recipes/rsyslog/files/initscript
 create mode 100644 recipes/rsyslog/files/rsyslog.conf
 create mode 100644 recipes/rsyslog/rsyslog-5.4.0/atomics.patch
 create mode 100644 recipes/rsyslog/rsyslog.inc
 create mode 100644 recipes/rsyslog/rsyslog_5.4.0.bb

diff --git a/recipes/rsyslog/files/initscript b/recipes/rsyslog/files/initscript
new file mode 100644
index 0000000..8dee684
--- /dev/null
+++ b/recipes/rsyslog/files/initscript
@@ -0,0 +1,90 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/rsyslog and type
+# > update-rc.d rsyslog defaults 5
+#
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+NAME=rsyslog
+RSYSLOGD=rsyslogd
+RSYSLOGD_BIN=/usr/sbin/rsyslogd
+RSYSLOGD_OPTIONS="-c5"
+RSYSLOGD_PIDFILE=/var/run/rsyslogd.pid
+SCRIPTNAME=/etc/init.d/$NAME
+# Exit if the package is not installed
+[ -x "$RSYSLOGD_BIN" ] || exit 0
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+#
+# Function that starts the daemon/service
+#
+do_start()
+{
+        DAEMON=$1
+        DAEMON_ARGS=$2
+        PIDFILE=$3
+        # Return
+        #   0 if daemon has been started
+        #   1 if daemon could not be started
+        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS || return 1
+}
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+        NAME=$1
+        PIDFILE=$2
+        # Return
+        #   0 if daemon has been stopped
+        #   1 if daemon was already stopped
+        #   2 if daemon could not be stopped
+        #   other if a failure occurred
+        # QUIT/TERM/INT should work here, but they don't ????? 
+        start-stop-daemon -K --quiet --signal KILL --pidfile $PIDFILE --name $NAME
+        RETVAL="$?"
+        rm -f $PIDFILE
+        return "$RETVAL"
+}
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+        NAME=$1
+        PIDFILE=$2
+        start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --name $NAME
+        return 0
+}
+case "$1" in
+  start)
+        echo -n "starting $RSYSLOGD ... "
+        do_start "$RSYSLOGD_BIN" "$RSYSLOGD_OPTIONS" "$RSYSLOGD_PIDFILE"
+        case "$?" in
+                0) echo "done" ;;
+                1) echo "failed" ;;
+        esac
+        ;;
+  stop)
+        echo -n "stopping $RSYSLOGD ... "
+        do_stop "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
+        case "$?" in
+                0|1) echo "done" ;;
+                2) echo "failed" ;;
+        esac
+        ;;
+  reload|force-reload)
+        echo -n "reloading $RSYSLOGD ... "
+        do_reload "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
+        echo "done"
+        ;;
+  restart)
+        $0 stop
+        $0 start
+        ;;
+  *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+        exit 3
+        ;;
+esac
+exit 0
diff --git a/recipes/rsyslog/files/rsyslog.conf b/recipes/rsyslog/files/rsyslog.conf
new file mode 100644
index 0000000..47fc440
--- /dev/null
+++ b/recipes/rsyslog/files/rsyslog.conf
@@ -0,0 +1,60 @@
+# if you experience problems, check
+# http://www.rsyslog.com/troubleshoot for assistance
+
+# rsyslog v3: load input modules
+# If you do not load inputs, nothing happens!
+# You may need to set the module load path if modules are not found.
+
+$ModLoad immark   # provides --MARK-- message capability
+$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
+$ModLoad imklog   # kernel logging (formerly provided by rklogd)
+
+# Log all kernel messages to the console.
+# Logging much else clutters up the screen.
+#kern.*                                                 /dev/console
+
+# Log anything (except mail) of level info or higher.
+# Don't log private authentication messages!
+*.info;mail.none;authpriv.none;cron.none                -/var/log/messages
+
+# The authpriv file has restricted access.
+authpriv.*                                              /var/log/secure
+
+# Log all the mail messages in one place.
+mail.*                                                  -/var/log/maillog
+
+
+# Log cron stuff
+cron.*                                                  -/var/log/cron
+
+# Everybody gets emergency messages
+*.emerg                                                 *
+
+# Save news errors of level crit and higher in a special file.
+uucp,news.crit                                          -/var/log/spooler
+
+# Save boot messages also to boot.log
+local7.*                                                /var/log/boot.log
+
+# Remote Logging (we use TCP for reliable delivery)
+# An on-disk queue is created for this action. If the remote host is
+# down, messages are spooled to disk and sent when it is up again.
+#$WorkDirectory /rsyslog/spool # where to place spool files
+#$ActionQueueFileName uniqName # unique name prefix for spool files
+#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as possible)
+#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
+#$ActionQueueType LinkedList   # run asynchronously
+#$ActionResumeRetryCount -1    # infinite retries if host is down
+# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
+#*.* @@remote-host:514
+
+
+# ######### Receiving Messages from Remote Hosts ########## 
+# TCP Syslog Server:
+# provides TCP syslog reception and GSS-API (if compiled to support it)
+#$ModLoad imtcp.so  # load module
+#$InputTCPServerRun 514 # start up TCP listener at port 514
+
+# UDP Syslog Server:
+#$ModLoad imudp.so  # provides UDP syslog reception
+#$UDPServerRun 514 # start a UDP syslog server at standard port 514
diff --git a/recipes/rsyslog/rsyslog-5.4.0/atomics.patch b/recipes/rsyslog/rsyslog-5.4.0/atomics.patch
new file mode 100644
index 0000000..ace2921
--- /dev/null
+++ b/recipes/rsyslog/rsyslog-5.4.0/atomics.patch
@@ -0,0 +1,277 @@
+diff -Nurd rsyslog-5.4.0.orig/configure.ac rsyslog-5.4.0/configure.ac
+--- rsyslog-5.4.0.orig/configure.ac	2010-03-08 13:28:35.000000000 +0000
++++ rsyslog-5.4.0/configure.ac	2010-03-16 11:30:44.000000000 +0000
+@@ -87,6 +87,7 @@
+ AC_HEADER_TIME
+ AC_STRUCT_TM
+ AC_C_VOLATILE
++AC_C_TYPEOF
+ 
+ sa_includes="\
+ $ac_includes_default
+@@ -129,7 +130,8 @@
+ # check for availability of atomic operations
+ RS_ATOMIC_OPERATIONS
+ RS_ATOMIC_OPERATIONS_64BIT
+-
++# fall back to POSIX sems for atomic operations (cpu expensive)
++AC_CHECK_HEADERS([semaphore.h])
+ 
+ # Additional module directories
+ AC_ARG_WITH(moddirs,
+diff -Nurd rsyslog-5.4.0.orig/runtime/Makefile.am rsyslog-5.4.0/runtime/Makefile.am
+--- rsyslog-5.4.0.orig/runtime/Makefile.am	2010-03-08 13:27:47.000000000 +0000
++++ rsyslog-5.4.0/runtime/Makefile.am	2010-03-15 16:43:12.000000000 +0000
+@@ -9,6 +9,7 @@
+ 	rsyslog.h \
+ 	unicode-helper.h \
+ 	atomic.h \
++	atomic-posix-sem.c \
+ 	batch.h \
+ 	syslogd-types.h \
+ 	module-template.h \
+diff -Nurd rsyslog-5.4.0.orig/runtime/atomic-posix-sem.c rsyslog-5.4.0/runtime/atomic-posix-sem.c
+--- rsyslog-5.4.0.orig/runtime/atomic-posix-sem.c	1970-01-01 00:00:00.000000000 +0000
++++ rsyslog-5.4.0/runtime/atomic-posix-sem.c	2010-03-16 13:22:27.000000000 +0000
+@@ -0,0 +1,70 @@
++/* atomic_posix_sem.c: This file supplies an emulation for atomic operations using
++ * POSIX semaphores.
++ *
++ * Copyright 2010 DResearch Digital Media Systems GmbH
++ *
++ * This file is part of the rsyslog runtime library.
++ *
++ * The rsyslog runtime library is free software: you can redistribute it and/or modify
++ * it under the terms of the GNU Lesser General Public License as published by
++ * the Free Software Foundation, either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * The rsyslog runtime library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with the rsyslog runtime library.  If not, see <http://www.gnu.org/licenses/>.
++ *
++ * A copy of the GPL can be found in the file "COPYING" in this distribution.
++ * A copy of the LGPL can be found in the file "COPYING.LESSER" in this distribution.
++ */
++
++#include "config.h"
++#ifndef HAVE_ATOMIC_BUILTINS
++#ifdef HAVE_SEMAPHORE_H
++#include <semaphore.h>
++#include <errno.h>
++
++#include "atomic.h"
++#include "rsyslog.h"
++#include "srUtils.h"
++
++sem_t atomicSem;
++
++rsRetVal
++atomicSemInit(void)
++{
++	DEFiRet;
++
++	dbgprintf("init posix semaphore for atomics emulation\n");
++	if(sem_init(&atomicSem, 0, 1) == -1)
++	{
++		char errStr[1024];
++		rs_strerror_r(errno, errStr, sizeof(errStr));
++		dbgprintf("init posix semaphore for atomics emulation failed: %s\n", errStr);
++		iRet = RS_RET_SYS_ERR; /* the right error code ??? */
++	}
++
++	RETiRet;
++}
++
++void
++atomicSemExit(void)
++{
++	dbgprintf("destroy posix semaphore for atomics emulation\n");
++	if(sem_destroy(&atomicSem) == -1)
++	{
++		char errStr[1024];
++		rs_strerror_r(errno, errStr, sizeof(errStr));
++		dbgprintf("destroy posix semaphore for atomics emulation failed: %s\n", errStr);
++	}
++}
++
++#endif /* HAVE_SEMAPHORE_H */
++#endif /* !defined(HAVE_ATOMIC_BUILTINS) */
++
++/* vim:set ai:
++ */
+diff -Nurd rsyslog-5.4.0.orig/runtime/atomic.h rsyslog-5.4.0/runtime/atomic.h
+--- rsyslog-5.4.0.orig/runtime/atomic.h	2010-03-05 07:20:36.000000000 +0000
++++ rsyslog-5.4.0/runtime/atomic.h	2010-03-16 13:23:57.000000000 +0000
+@@ -54,6 +54,122 @@
+ #	define ATOMIC_CAS(data, oldVal, newVal) __sync_bool_compare_and_swap(&(data), (oldVal), (newVal));
+ #	define ATOMIC_CAS_VAL(data, oldVal, newVal) __sync_val_compare_and_swap(&(data), (oldVal), (newVal));
+ #else
++#ifdef HAVE_SEMAPHORE_H
++	/* we use POSIX semaphores instead */
++
++#include "rsyslog.h"
++#include <semaphore.h>
++
++extern sem_t atomicSem;
++rsRetVal atomicSemInit(void);
++void atomicSemExit(void);
++
++#if HAVE_TYPEOF
++#define my_typeof(x) typeof(x)
++#else /* sorry, can't determine types, using 'int' */
++#define my_typeof(x) int
++#endif
++
++#	define ATOMIC_SUB(data, val) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data -= val; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_ADD(data, val) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data += val; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_INC_AND_FETCH(data) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data += 1; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_INC(data) ((void) ATOMIC_INC_AND_FETCH(data))
++
++#	define ATOMIC_DEC_AND_FETCH(data) \
++({ \
++	sem_wait(&atomicSem); \
++	data -= 1; \
++	sem_post(&atomicSem); \
++	data; \
++})
++
++#	define ATOMIC_DEC(data) ((void) ATOMIC_DEC_AND_FETCH(data))
++
++#	define ATOMIC_FETCH_32BIT(data) ((unsigned) ATOMIC_ADD((data), 0xffffffff))
++
++#	define ATOMIC_STORE_1_TO_32BIT(data) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data = 1; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_STORE_0_TO_INT(data) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data = 0; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_STORE_1_TO_INT(data) \
++({ \
++	my_typeof(data) tmp; \
++	sem_wait(&atomicSem); \
++	tmp = data; \
++	data = 1; \
++	sem_post(&atomicSem); \
++	tmp; \
++})
++
++#	define ATOMIC_CAS(data, oldVal, newVal) \
++({ \
++	int ret; \
++	sem_wait(&atomicSem); \
++	if(data != oldVal) ret = 0; \
++	else \
++	{ \
++		data = newVal; \
++		ret = 1; \
++	} \
++	sem_post(&atomicSem); \
++	ret; \
++})
++
++#	define ATOMIC_CAS_VAL(data, oldVal, newVal) \
++({ \
++	sem_wait(&atomicSem); \
++	if(data == oldVal) \
++	{ \
++		data = newVal; \
++	} \
++	sem_post(&atomicSem); \
++	data; \
++})
++
++#else /* not HAVE_SEMAPHORE_H */
+ 	/* note that we gained parctical proof that theoretical problems DO occur
+ 	 * if we do not properly address them. See this blog post for details:
+ 	 * http://blog.gerhards.net/2009/01/rsyslog-data-race-analysis.html
+@@ -68,5 +184,6 @@
+ #	define ATOMIC_FETCH_32BIT(data) (data)
+ #	define ATOMIC_STORE_1_TO_32BIT(data) (data) = 1
+ #endif
++#endif
+ 
+ #endif /* #ifndef INCLUDED_ATOMIC_H */
+diff -Nurd rsyslog-5.4.0.orig/runtime/rsyslog.c rsyslog-5.4.0/runtime/rsyslog.c
+--- rsyslog-5.4.0.orig/runtime/rsyslog.c	2010-03-05 07:20:36.000000000 +0000
++++ rsyslog-5.4.0/runtime/rsyslog.c	2010-03-16 08:30:51.000000000 +0000
+@@ -81,6 +81,7 @@
+ #include "rule.h"
+ #include "ruleset.h"
+ #include "parser.h"
++#include "atomic.h"
+ 
+ /* forward definitions */
+ static rsRetVal dfltErrLogger(int, uchar *errMsg);
+@@ -140,6 +141,12 @@
+ 		CHKiRet(objClassInit(NULL)); /* *THIS* *MUST* always be the first class initilizer being called! */
+ 		CHKiRet(objGetObjInterface(pObjIF)); /* this provides the root pointer for all other queries */
+ 
++#ifndef HAVE_ATOMIC_BUILTINS
++#ifdef HAVE_SEMAPHORE_H
++		CHKiRet(atomicSemInit());
++#endif /* HAVE_SEMAPHORE_H */
++#endif /* !defined(HAVE_ATOMIC_BUILTINS) */
++
+ 		/* initialize core classes. We must be very careful with the order of events. Some
+ 		 * classes use others and if we do not initialize them in the right order, we may end
+ 		 * up with an invalid call. The most important thing that can happen is that an error
+@@ -216,6 +223,13 @@
+ 		glblClassExit();
+ 		rulesetClassExit();
+ 		ruleClassExit();
++
++#ifndef HAVE_ATOMIC_BUILTINS
++#ifdef HAVE_SEMAPHORE_H
++		atomicSemExit();
++#endif /* HAVE_SEMAPHORE_H */
++#endif /* !defined(HAVE_ATOMIC_BUILTINS) */
++
+ 		objClassExit(); /* *THIS* *MUST/SHOULD?* always be the first class initilizer being called (except debug)! */
+ 	}
+ 
diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
new file mode 100644
index 0000000..5058176
--- /dev/null
+++ b/recipes/rsyslog/rsyslog.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
+DEPENDS = "zlib"
+HOMEPAGE = "http://www.rsyslog.com/"
+LICENSE = "GPLv3"
+INC_PR = "r1"
+
+SRC_URI = "http://download.rsyslog.com/rsyslog/${PN}-${PV}.tar.gz;name=archive \
+          file://rsyslog.conf \
+          file://initscript"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools update-rc.d
+
+do_install_append() {
+        install -d ${D}/${sysconfdir}/${PN}
+        install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/rsyslog
+}
+
+pkg_postinst() {
+        update-rc.d -f syslog remove
+}
+
+pkg_postrm() {
+        update-rc.d syslog add 5
+}
+
+CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
+
+INITSCRIPT_NAME = "rsyslog"
+#INITSCRIPT_PARAMS = "defaults 05"
+INITSCRIPT_PARAMS = "remove"
diff --git a/recipes/rsyslog/rsyslog_5.4.0.bb b/recipes/rsyslog/rsyslog_5.4.0.bb
new file mode 100644
index 0000000..b22d4e4
--- /dev/null
+++ b/recipes/rsyslog/rsyslog_5.4.0.bb
@@ -0,0 +1,7 @@
+require rsyslog.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://atomics.patch;patch=1"
+
+SRC_URI[archive.md5sum] = "291882229d50496f42bd63174076dd37"
+SRC_URI[archive.sha256sum] = "d9cd21d2fcd45fcae65eb0a51927c40315cca02afdc62478abd950febfcf7228"
-- 
1.6.4.2



