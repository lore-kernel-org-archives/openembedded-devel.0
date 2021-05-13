Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.7783.1620872263714852829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 19:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cO7vNyjg;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 10so20438348pfl.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 19:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPjnO0yAqp4dDWJIedvRWowRfYlwwbryGetP8Z3H2Mo=;
        b=cO7vNyjgApLfRW4Nf81D82WYK7vB/ivFzv6TR4u7KRAPf9O+1mq4qpILg7VeqRP8W4
         9O3+cWSjg6DGTlu9UIhzMdvl2l77mX2bW+wMr6LJLifWSZOhHMwtON6/nnO10x9NfVSC
         iOBCHks7j1JSzxy0Nwn4N0iu1WzjHDtJFiXdDmDs55wDLY0Tt3xTMHtlqO3y5PKmgKn2
         161WTtlJb04L8eMrh6xV/HLF8vwjCZM7PVvdoCzRFQdzEtr2Ocs8kXwqUsowctVvQRjq
         26nc8g6P+jXxDDCQnknJvPyFHHH0r63YYuUoKzj/J6gD9qGQev1SfK0o86k2hWs2bZgu
         No4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yPjnO0yAqp4dDWJIedvRWowRfYlwwbryGetP8Z3H2Mo=;
        b=SsPR7TWsqMA/EXiJCpiQw1XI3ryFGrot2ayuBtXxj2mmemdJm5PSKwEasYshBPvhmb
         gy3GGWOem/EJo/L/kfhvUbUHhX9NcKoeRqTVVyTkCGfvBvOGD4fhn0mShge84iXtDeXa
         iiMV4uq78F5YGZJO9ZoIldpUKHQwu34yd7QxKW3aSYVCtrVC1YZHRL/CBO6v04VdsGGI
         YiD4f4JQJu/iXvFUwCg+aNYRZrb2/1pPokXCz/IlO4io4damUubBMoZaxt5x6c7VAeO3
         ez+lUHrPE0oAyXDnOuaBT1snEs6gcmQVDwY2uaeOm94/5AvKPugK1lv5jBraMuxY4wj7
         vLdg==
X-Gm-Message-State: AOAM531jqirv/4zlPJ05gZwMxpsEZ1kGNOsy+tWmNQWlrXZSCF2vFCWu
	1bU12cVDeC9bnaLOBd/qX+Ibk0T3UaE=
X-Google-Smtp-Source: ABdhPJxZBAS06bd/uLLgEkfWmE2pcZKxiVVk83MaaXCg1IEWvLHji5ZcjHf6PWAstyG87JjbaPVHBQ==
X-Received: by 2002:a63:1903:: with SMTP id z3mr38805051pgl.185.1620872262420;
        Wed, 12 May 2021 19:17:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id r32sm864156pgm.49.2021.05.12.19.17.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 19:17:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] audit: migrate from meta-selinux
Date: Thu, 13 May 2021 02:17:39 +0000
Message-Id: <20210513021740.3370640-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move audit to a more common layer to simplify integration.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tue-functions-for-strndupa-rawmemchr.patch | 133 +++++++++++++++
 .../Fixed-swig-host-contamination-issue.patch |  57 +++++++
 .../audit/audit/audit-volatile.conf           |   1 +
 meta-oe/recipes-security/audit/audit/auditd   | 153 ++++++++++++++++++
 .../audit/audit/auditd.service                |  28 ++++
 meta-oe/recipes-security/audit/audit_2.8.5.bb | 105 ++++++++++++
 meta-oe/recipes-security/audit/audit_3.0.1.bb | 109 +++++++++++++
 7 files changed, 586 insertions(+)
 create mode 100644 meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
 create mode 100644 meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
 create mode 100644 meta-oe/recipes-security/audit/audit/audit-volatile.conf
 create mode 100644 meta-oe/recipes-security/audit/audit/auditd
 create mode 100644 meta-oe/recipes-security/audit/audit/auditd.service
 create mode 100644 meta-oe/recipes-security/audit/audit_2.8.5.bb
 create mode 100644 meta-oe/recipes-security/audit/audit_3.0.1.bb

diff --git a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
new file mode 100644
index 000000000..bb6c61e80
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
@@ -0,0 +1,133 @@
+From bdcdc3dff4469aac88e718bd15958d5ed4b9392a Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Tue, 26 Feb 2019 18:33:33 -0500
+Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
+
+Upstream-Status: Backport
+[https://github.com/linux-audit/audit-userspace/commit/d579a08bb1cde71f939c13ac6b2261052ae9f77e]
+---
+ auparse/auparse.c   | 12 +++++++++++-
+ auparse/interpret.c |  9 ++++++++-
+ configure.ac        | 14 +++++++++++++-
+ src/ausearch-lol.c  | 12 +++++++++++-
+ 4 files changed, 43 insertions(+), 4 deletions(-)
+
+diff --git a/auparse/auparse.c b/auparse/auparse.c
+index 650db02..2e1c737 100644
+--- a/auparse/auparse.c
++++ b/auparse/auparse.c
+@@ -1,5 +1,5 @@
+ /* auparse.c --
+- * Copyright 2006-08,2012-17 Red Hat Inc., Durham, North Carolina.
++ * Copyright 2006-08,2012-19 Red Hat Inc., Durham, North Carolina.
+  * All Rights Reserved.
+  *
+  * This library is free software; you can redistribute it and/or
+@@ -1118,6 +1118,16 @@ static int str2event(char *s, au_event_t *e)
+ 	return 0;
+ }
+ 
++#ifndef HAVE_STRNDUPA
++static inline char *strndupa(const char *old, size_t n)
++{
++	size_t len = strnlen(old, n);
++	char *tmp = alloca(len + 1);
++	tmp[len] = 0;
++	return memcpy(tmp, old, len);
++}
++#endif
++
+ /* Returns 0 on success and 1 on error */
+ static int extract_timestamp(const char *b, au_event_t *e)
+ {
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 51c4a5e..67b7b77 100644
+--- a/auparse/interpret.c
++++ b/auparse/interpret.c
+@@ -853,6 +853,13 @@ err_out:
+ 		return print_escaped(id->val);
+ }
+ 
++// rawmemchr is faster. Let's use it if we have it.
++#ifdef HAVE_RAWMEMCHR
++#define STRCHR rawmemchr
++#else
++#define STRCHR strchr
++#endif
++
+ static const char *print_proctitle(const char *val)
+ {
+ 	char *out = (char *)print_escaped(val);
+@@ -863,7 +870,7 @@ static const char *print_proctitle(const char *val)
+ 		// Proctitle has arguments separated by NUL bytes
+ 		// We need to write over the NUL bytes with a space
+ 		// so that we can see the arguments
+-		while ((ptr  = rawmemchr(ptr, '\0'))) {
++		while ((ptr  = STRCHR(ptr, '\0'))) {
+ 			if (ptr >= end)
+ 				break;
+ 			*ptr = ' ';
+diff --git a/configure.ac b/configure.ac
+index 54bdbf1..aef07fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,7 +1,7 @@
+ dnl
+ define([AC_INIT_NOTICE],
+ [### Generated automatically using autoconf version] AC_ACVERSION [
+-### Copyright 2005-18 Steve Grubb <sgrubb@redhat.com>
++### Copyright 2005-19 Steve Grubb <sgrubb@redhat.com>
+ ###
+ ### Permission is hereby granted, free of charge, to any person obtaining a
+ ### copy of this software and associated documentation files (the "Software"),
+@@ -72,6 +72,18 @@ dnl; posix_fallocate is used in audisp-remote
+ AC_CHECK_FUNCS([posix_fallocate])
+ dnl; signalfd is needed for libev
+ AC_CHECK_FUNC([signalfd], [], [ AC_MSG_ERROR([The signalfd system call is necessary for auditd]) ])
++dnl; check if rawmemchr is available
++AC_CHECK_FUNCS([rawmemchr])
++dnl; check if strndupa is available
++AC_LINK_IFELSE(
++  [AC_LANG_SOURCE(
++    [[
++      #define _GNU_SOURCE
++      #include <string.h>
++      int main() { (void) strndupa("test", 10); return 0; }]])],
++ [AC_DEFINE(HAVE_STRNDUPA, 1, [Let us know if we have it or not])],
++ []
++)
+ 
+ ALLWARNS=""
+ ALLDEBUG="-g"
+diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
+index 5d17a72..758c33e 100644
+--- a/src/ausearch-lol.c
++++ b/src/ausearch-lol.c
+@@ -1,6 +1,6 @@
+ /*
+ * ausearch-lol.c - linked list of linked lists library
+-* Copyright (c) 2008,2010,2014,2016 Red Hat Inc., Durham, North Carolina.
++* Copyright (c) 2008,2010,2014,2016,2019 Red Hat Inc., Durham, North Carolina.
+ * All Rights Reserved. 
+ *
+ * This software may be freely redistributed and/or modified under the
+@@ -152,6 +152,16 @@ static int compare_event_time(event *e1, event *e2)
+ 	return 0;
+ }
+ 
++#ifndef HAVE_STRNDUPA
++static inline char *strndupa(const char *old, size_t n)
++{
++	size_t len = strnlen(old, n);
++	char *tmp = alloca(len + 1);
++	tmp[len] = 0;
++	return memcpy(tmp, old, len);
++}
++#endif
++
+ /*
+  * This function will look at the line and pick out pieces of it.
+  */
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
new file mode 100644
index 000000000..740bcb5a7
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
@@ -0,0 +1,57 @@
+From 3d13f92c1bb293523670ba01aea7e655b00a6709 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sun, 19 Jul 2015 02:42:58 +0900
+Subject: [PATCH] audit: Fixed swig host contamination issue
+
+The audit build uses swig to generate a python wrapper.
+Unfortunately, the swig info file references host include
+directories.  Some of these were previously noticed and
+eliminated, but the one fixed here was not.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
+Signed-off-by: Joe Slater <jslater@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bindings/swig/python3/Makefile.am | 3 ++-
+ bindings/swig/src/auditswig.i     | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
+index dd9d934..61b486d 100644
+--- a/bindings/swig/python3/Makefile.am
++++ b/bindings/swig/python3/Makefile.am
+@@ -22,6 +22,7 @@
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
+ AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
++STDINC ?= /usr/include
+ LIBS = $(top_builddir)/lib/libaudit.la
+ SWIG_FLAGS = -python -py3 -modern
+ SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
+@@ -36,7 +37,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
+ _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
+ nodist__audit_la_SOURCES  = audit_wrap.c
+ audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
+-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i 
++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
+ 
+ CLEANFILES = audit.py* audit_wrap.c *~
+ 
+diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
+index 21aafca..dd0f62c 100644
+--- a/bindings/swig/src/auditswig.i
++++ b/bindings/swig/src/auditswig.i
+@@ -39,7 +39,7 @@ signed
+ #define __attribute(X) /*nothing*/
+ typedef unsigned __u32;
+ typedef unsigned uid_t;
+-%include "/usr/include/linux/audit.h"
++%include "linux/audit.h"
+ #define __extension__ /*nothing*/
+ %include <stdint.i>
+ %include "../lib/libaudit.h"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-security/audit/audit/audit-volatile.conf b/meta-oe/recipes-security/audit/audit/audit-volatile.conf
new file mode 100644
index 000000000..9cbe1547a
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/audit-volatile.conf
@@ -0,0 +1 @@
+d  /var/log/audit 0750 root root -
diff --git a/meta-oe/recipes-security/audit/audit/auditd b/meta-oe/recipes-security/audit/audit/auditd
new file mode 100644
index 000000000..6aa7f9475
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/auditd
@@ -0,0 +1,153 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          auditd
+# Required-Start:    $local_fs
+# Required-Stop:     $local_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Audit Daemon
+# Description:       Collects audit information from Linux 2.6 Kernels.
+### END INIT INFO
+
+# Author: Philipp Matthias Hahn <pmhahn@debian.org>
+# Based on Debians /etc/init.d/skeleton and Auditds init.d/auditd.init
+
+# June, 2012: Adopted for yocto <amy.fong@windriver.com>
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DESC="audit daemon"
+NAME=auditd
+DAEMON=/sbin/auditd
+PIDFILE=/var/run/"$NAME".pid
+SCRIPTNAME=/etc/init.d/"$NAME"
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/"$NAME" ] && . /etc/default/"$NAME"
+
+. /etc/default/rcS
+
+. /etc/init.d/functions
+
+#
+# Function that starts the daemon/service
+#
+do_start()
+{
+	# Return
+	#   0 if daemon has been started
+	#   1 if daemon was already running
+	#   2 if daemon could not be started
+	start-stop-daemon -S --quiet --pidfile "$PIDFILE" --exec "$DAEMON" --test > /dev/null \
+		|| return 1
+	start-stop-daemon -S --quiet --pidfile "$PIDFILE" --exec "$DAEMON" -- \
+		$EXTRAOPTIONS \
+		|| return 2
+	if [ -f /etc/audit/audit.rules ]
+	then
+		/sbin/auditctl -R /etc/audit/audit.rules >/dev/null
+	fi
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop()
+{
+	# Return
+	#   0 if daemon has been stopped
+	#   1 if daemon was already stopped
+	#   2 if daemon could not be stopped
+	#   other if a failure occurred
+	start-stop-daemon -K --quiet --pidfile "$PIDFILE" --name "$NAME"
+	RETVAL="$?"
+	[ "$RETVAL" = 2 ] && return 2
+	# Many daemons don't delete their pidfiles when they exit.
+	rm -f "$PIDFILE"
+	rm -f /var/run/audit_events
+	# Remove watches so shutdown works cleanly
+	case "$AUDITD_CLEAN_STOP" in
+		no|NO) ;;
+		*) /sbin/auditctl -D >/dev/null ;;
+	esac
+	return "$RETVAL"
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --name $NAME
+	return 0
+}
+
+if [ ! -e /var/log/audit ]; then
+	mkdir -p /var/log/audit
+	[ -x /sbin/restorecon ] && /sbin/restorecon -F $(readlink -f /var/log/audit)
+fi
+
+case "$1" in
+  start)
+	[ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
+	do_start
+	case "$?" in
+		0|1) [ "$VERBOSE" != no ] && echo 0 ;;
+		2) [ "$VERBOSE" != no ] && echo 1 ;;
+	esac
+	;;
+  stop)
+	[ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
+	do_stop
+	case "$?" in
+		0|1) [ "$VERBOSE" != no ] && echo 0 ;;
+		2) [ "$VERBOSE" != no ] && echo 1 ;;
+	esac
+	;;
+  reload|force-reload)
+	echo "Reloading $DESC" "$NAME"
+	do_reload
+	echo $?
+	;;
+  restart)
+	echo "Restarting $DESC" "$NAME"
+	do_stop
+	case "$?" in
+	  0|1)
+		do_start
+		case "$?" in
+			0) echo 0 ;;
+			1) echo 1 ;; # Old process is still running
+			*) echo 1 ;; # Failed to start
+		esac
+		;;
+	  *)
+		# Failed to stop
+		echo 1
+		;;
+	esac
+	;;
+  rotate)
+	echo "Rotating $DESC logs" "$NAME"
+	start-stop-daemon -K --signal USR1 --quiet --pidfile "$PIDFILE" --name "$NAME"
+	echo $?
+	;;
+  status)
+	pidofproc "$DAEMON" >/dev/null
+	status=$?
+	if [ $status -eq 0 ]; then
+		echo "$NAME is running."
+	else
+		echo "$NAME is not running."
+	fi
+	exit $status
+	;;
+  *)
+	echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload|rotate|status}" >&2
+	exit 3
+	;;
+esac
+
+:
diff --git a/meta-oe/recipes-security/audit/audit/auditd.service b/meta-oe/recipes-security/audit/audit/auditd.service
new file mode 100644
index 000000000..06c63f0e5
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/auditd.service
@@ -0,0 +1,28 @@
+[Unit]
+Description=Security Auditing Service
+DefaultDependencies=no
+After=local-fs.target systemd-tmpfiles-setup.service
+Before=sysinit.target shutdown.target
+Conflicts=shutdown.target
+ConditionKernelCommandLine=!audit=0
+
+[Service]
+Type=forking
+PIDFile=/run/auditd.pid
+ExecStart=/sbin/auditd
+## To use augenrules, uncomment the next line and comment/delete the auditctl line.
+## NOTE: augenrules expect any rules to be added to /etc/audit/rules.d/
+#ExecStartPost=-/sbin/augenrules --load
+ExecStartPost=-/sbin/auditctl -R /etc/audit/audit.rules
+# By default we don't clear the rules on exit.
+# To enable this, uncomment the next line.
+#ExecStopPost=/sbin/auditctl -R /etc/audit/audit-stop.rules
+
+### Security Settings ###
+MemoryDenyWriteExecute=true
+LockPersonality=true
+ProtectControlGroups=true
+ProtectKernelModules=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
new file mode 100644
index 000000000..ee3b3b5e0
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
@@ -0,0 +1,105 @@
+SUMMARY = "User space tools for kernel auditing"
+DESCRIPTION = "The audit package contains the user space utilities for \
+storing and searching the audit records generated by the audit subsystem \
+in the Linux kernel."
+HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
+SECTION = "base"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance \
+           file://Add-substitue-functions-for-strndupa-rawmemchr.patch \
+           file://Fixed-swig-host-contamination-issue.patch \
+           file://auditd \
+           file://auditd.service \
+           file://audit-volatile.conf \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "5fae55c1ad15b3cefe6890eba7311af163e9133c"
+
+inherit autotools python3native update-rc.d systemd
+
+UPDATERCPN = "auditd"
+INITSCRIPT_NAME = "auditd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "auditd"
+SYSTEMD_SERVICE_auditd = "auditd.service"
+
+DEPENDS += "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
+
+EXTRA_OECONF += "--without-prelude \
+        --with-libwrap \
+        --enable-gssapi-krb5=no \
+        --with-libcap-ng=yes \
+        --with-python3=yes \
+        --libdir=${base_libdir} \
+        --sbindir=${base_sbindir} \
+        --without-python \
+        --without-golang \
+        --disable-zos-remote \
+        "
+EXTRA_OECONF_append_arm = " --with-arm=yes"
+EXTRA_OECONF_append_aarch64 = " --with-aarch64=yes"
+
+EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
+	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
+	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+	STDINC='${STAGING_INCDIR}' \
+	pkgconfigdir=${libdir}/pkgconfig \
+	"
+
+SUMMARY_audispd-plugins = "Plugins for the audit event dispatcher"
+DESCRIPTION_audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
+interface to the audit system, audispd. These plugins can do things \
+like relay events to remote machines or analyze events for suspicious \
+behavior."
+
+PACKAGES =+ "audispd-plugins"
+PACKAGES += "auditd ${PN}-python"
+
+FILES_${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
+FILES_auditd += "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
+FILES_audispd-plugins += "${sysconfdir}/audisp/audisp-remote.conf \
+	${sysconfdir}/audisp/plugins.d/au-remote.conf \
+	${sbindir}/audisp-remote ${localstatedir}/spool/audit \
+	"
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
+FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+
+CONFFILES_auditd += "${sysconfdir}/audit/audit.rules"
+RDEPENDS_auditd += "bash"
+
+do_install_append() {
+	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
+	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
+
+	# reuse auditd config
+	[ ! -e ${D}/etc/default ] && mkdir ${D}/etc/default
+	mv ${D}/etc/sysconfig/auditd ${D}/etc/default
+	rmdir ${D}/etc/sysconfig/
+
+	# replace init.d
+	install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+	rm -rf ${D}/etc/rc.d
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d/
+		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
+
+	# install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
+
+	# audit-2.5 doesn't install any rules by default, so we do that here
+	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
+	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
+
+	chmod 750 ${D}/etc/audit ${D}/etc/audit/rules.d
+	chmod 640 ${D}/etc/audit/auditd.conf ${D}/etc/audit/rules.d/audit.rules
+
+	# Based on the audit.spec "Copy default rules into place on new installation"
+	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
+}
diff --git a/meta-oe/recipes-security/audit/audit_3.0.1.bb b/meta-oe/recipes-security/audit/audit_3.0.1.bb
new file mode 100644
index 000000000..ba24d360e
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit_3.0.1.bb
@@ -0,0 +1,109 @@
+SUMMARY = "User space tools for kernel auditing"
+DESCRIPTION = "The audit package contains the user space utilities for \
+storing and searching the audit records generated by the audit subsystem \
+in the Linux kernel."
+HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
+SECTION = "base"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
+           file://Fixed-swig-host-contamination-issue.patch \
+           file://auditd \
+           file://auditd.service \
+           file://audit-volatile.conf \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "46cb7d92443c9ec7b3af15fb0baa65f65f6415d3"
+
+inherit autotools python3native update-rc.d systemd
+
+UPDATERCPN = "auditd"
+INITSCRIPT_NAME = "auditd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "auditd"
+SYSTEMD_SERVICE_auditd = "auditd.service"
+
+DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
+
+EXTRA_OECONF = " --with-libwrap \
+        --enable-gssapi-krb5=no \
+        --with-libcap-ng=yes \
+        --with-python3=yes \
+        --libdir=${base_libdir} \
+        --sbindir=${base_sbindir} \
+        --without-python \
+        --without-golang \
+        --disable-zos-remote \
+        --with-arm=yes \
+        --with-aarch64=yes \
+        "
+
+EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
+	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
+	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+	STDINC='${STAGING_INCDIR}' \
+	pkgconfigdir=${libdir}/pkgconfig \
+	"
+
+SUMMARY_audispd-plugins = "Plugins for the audit event dispatcher"
+DESCRIPTION_audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
+interface to the audit system, audispd. These plugins can do things \
+like relay events to remote machines or analyze events for suspicious \
+behavior."
+
+PACKAGES =+ "audispd-plugins"
+PACKAGES += "auditd ${PN}-python"
+
+FILES_${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
+FILES_auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* ${datadir}/audit/*"
+FILES_audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
+	${sysconfdir}/audit/plugins.d/au-remote.conf \
+	${sysconfdir}/audit/plugins.d/syslog.conf \
+	${base_sbindir}/audisp-remote \
+	${base_sbindir}/audisp-syslog \
+	${localstatedir}/spool/audit \
+	"
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
+FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+
+CONFFILES_auditd = "${sysconfdir}/audit/audit.rules"
+RDEPENDS_auditd = "bash"
+
+do_install_append() {
+	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
+	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
+
+	# reuse auditd config
+	[ ! -e ${D}/etc/default ] && mkdir ${D}/etc/default
+	mv ${D}/etc/sysconfig/auditd ${D}/etc/default
+	rmdir ${D}/etc/sysconfig/
+
+	# replace init.d
+	install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+	rm -rf ${D}/etc/rc.d
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		# install systemd unit files
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
+
+		install -d ${D}${sysconfdir}/tmpfiles.d/
+		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
+
+	# audit-2.5 doesn't install any rules by default, so we do that here
+	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
+	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
+
+	chmod 750 ${D}/etc/audit ${D}/etc/audit/rules.d
+	chmod 640 ${D}/etc/audit/auditd.conf ${D}/etc/audit/rules.d/audit.rules
+
+	# Based on the audit.spec "Copy default rules into place on new installation"
+	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
+
+	# Create /var/spool/audit directory for audisp-remote
+	install -m 0700 -d ${D}${localstatedir}/spool/audit
+}
-- 
2.25.1

