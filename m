Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo2T-00039A-Vy
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:50 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=76lna1+nNrD5svVy1UtKz7/Ujn0PK9WzHR7au8btbto=;
	b=kD0Io+3r80E/7HxRAGEDSxM2LYlUR7qMWPQVYEjkNjAaeNl+j0u+5QjxqH8YxFcZv4
	1RIMwa0S5KFvLWDWOH0dvCcnROwyc6qFDZnEVX8K5TMNXb7mElSU6ITQD/15hHl3dUmB
	0JbHz0iCvjbvz8BcX5DmSkgX3bgDukFojiil8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YJm46psqK0/D2PjLIZYKooBm7jn9ooLRgtbJYqw5u/erWeIp+rhI5gM4ZQnjpl9Bt1
	aR8F+oEe3eaur6KBFkH72ljgE+F1SvBZTVRMJhqnbkEcMIcSsA7dbkCxflZYexYz82gh
	ciIBJBJL4nTmYdski0Z8FRib75RExOFMUnkQA=
Received: by 10.223.127.210 with SMTP id h18mr1253365fas.71.1306706263976;
	Sun, 29 May 2011 14:57:43 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x15sm525354fah.46.2011.05.29.14.57.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:37 +0200
Message-Id: <c4925771f056829e9f123d33e5b7be1cf4d0a0f3.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/14] nfs-utils: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:01:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nfs-utils-S_ISREG-missing-include.patch        |   33 +++++
 .../nfs-utils-tools-unset-cflags.patch             |   92 ++++++++++++
 .../nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch |   49 +++++++
 .../nfs-utils/nfs-utils-1.1.2/nfsserver            |  149 ++++++++++++++++++++
 .../recipes-support/nfs-utils/nfs-utils_1.1.2.bb   |   54 +++++++
 5 files changed, 377 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-S_ISREG-missing-include.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-tools-unset-cflags.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfsserver
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb

diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-S_ISREG-missing-include.patch b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-S_ISREG-missing-include.patch
new file mode 100644
index 0000000..6b2c75e
--- /dev/null
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-S_ISREG-missing-include.patch
@@ -0,0 +1,33 @@
+diff -uNr nfs-utils-1.1.2.orig//utils/exportfs/exportfs.c nfs-utils-1.1.2/utils/exportfs/exportfs.c
+--- nfs-utils-1.1.2.orig//utils/exportfs/exportfs.c	2008-03-14 16:46:29.000000000 +0100
++++ nfs-utils-1.1.2/utils/exportfs/exportfs.c	2010-05-26 10:31:23.000000000 +0200
+@@ -19,6 +19,7 @@
+ #include <getopt.h>
+ #include <netdb.h>
+ #include <errno.h>
++#include <sys/stat.h>
+ #include "xmalloc.h"
+ #include "misc.h"
+ #include "nfslib.h"
+diff -uNr nfs-utils-1.1.2.orig//utils/mount/mount.c nfs-utils-1.1.2/utils/mount/mount.c
+--- nfs-utils-1.1.2.orig//utils/mount/mount.c	2008-03-14 16:46:29.000000000 +0100
++++ nfs-utils-1.1.2/utils/mount/mount.c	2010-05-26 10:31:32.000000000 +0200
+@@ -24,6 +24,7 @@
+ 
+ #include <unistd.h>
+ #include <sys/types.h>
++#include <sys/stat.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <errno.h>
+diff -uNr nfs-utils-1.1.2.orig//utils/mount/network.c nfs-utils-1.1.2/utils/mount/network.c
+--- nfs-utils-1.1.2.orig//utils/mount/network.c	2008-03-14 16:46:29.000000000 +0100
++++ nfs-utils-1.1.2/utils/mount/network.c	2010-05-26 10:31:35.000000000 +0200
+@@ -37,6 +37,7 @@
+ #include <rpc/pmap_prot.h>
+ #include <rpc/pmap_clnt.h>
+ #include <sys/socket.h>
++#include <sys/stat.h>
+ 
+ #include "xcommon.h"
+ #include "mount.h"
diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-tools-unset-cflags.patch b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-tools-unset-cflags.patch
new file mode 100644
index 0000000..16bdebf
--- /dev/null
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-tools-unset-cflags.patch
@@ -0,0 +1,92 @@
+Index: nfs-utils-1.1.2/tools/Makefile.am
+===================================================================
+--- nfs-utils-1.1.2.orig/tools/Makefile.am	2008-03-14 08:46:29.000000000 -0700
++++ nfs-utils-1.1.2/tools/Makefile.am	2009-03-04 01:58:50.000000000 -0800
+@@ -5,7 +5,10 @@
+ if CONFIG_RPCGEN
+ OPTDIRS += rpcgen
+ endif
+-
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ SUBDIRS = locktest rpcdebug nlmtest $(OPTDIRS)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+Index: nfs-utils-1.1.2/tools/locktest/Makefile.am
+===================================================================
+--- nfs-utils-1.1.2.orig/tools/locktest/Makefile.am	2008-03-14 08:46:29.000000000 -0700
++++ nfs-utils-1.1.2/tools/locktest/Makefile.am	2009-03-04 01:58:50.000000000 -0800
+@@ -1,12 +1,13 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+ testlk_SOURCES = testlk.c
+-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
+-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+Index: nfs-utils-1.1.2/tools/nlmtest/Makefile.am
+===================================================================
+--- nfs-utils-1.1.2.orig/tools/nlmtest/Makefile.am	2008-03-14 08:46:29.000000000 -0700
++++ nfs-utils-1.1.2/tools/nlmtest/Makefile.am	2009-03-04 01:58:50.000000000 -0800
+@@ -1,5 +1,8 @@
+ ## Process this file with automake to produce Makefile.in
+-
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ EXTRA_DIST = \
+ 	README \
+ 	host.h \
+Index: nfs-utils-1.1.2/tools/rpcgen/Makefile.am
+===================================================================
+--- nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am	2008-03-14 08:46:29.000000000 -0700
++++ nfs-utils-1.1.2/tools/rpcgen/Makefile.am	2009-03-04 01:58:50.000000000 -0800
+@@ -1,6 +1,10 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = rpcgen
+@@ -9,10 +13,6 @@
+ 		 rpc_util.c rpc_sample.c rpc_output.h rpc_parse.h \
+ 		 rpc_scan.h rpc_util.h
+ 
+-rpcgen_CFLAGS=$(CFLAGS_FOR_BUILD)
+-rpcgen_CPPLAGS=$(CPPFLAGS_FOR_BUILD)
+-rpcgen_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+-
+ MAINTAINERCLEANFILES = Makefile.in
+ 
+ EXTRA_DIST = rpcgen.new.1
+Index: nfs-utils-1.1.2/tools/rpcdebug/Makefile.am
+===================================================================
+--- nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am	2009-03-04 02:01:41.000000000 -0800
++++ nfs-utils-1.1.2/tools/rpcdebug/Makefile.am	2009-03-04 02:02:42.000000000 -0800
+@@ -1,6 +1,10 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++CXXFLAGS=$(CXXFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ man8_MANS = rpcdebug.man
diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch
new file mode 100644
index 0000000..f242ead
--- /dev/null
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch
@@ -0,0 +1,49 @@
+--- a/support/nfs/svc_socket.c.org	2007-05-11 03:40:57 +0000
++++ b/support/nfs/svc_socket.c	2007-10-24 15:20:05 +0000
+@@ -67,8 +67,13 @@
+   memset (&addr, 0, sizeof (addr));
+   addr.sin_family = AF_INET;
+ 
++#ifdef __UCLIBC__
++  rpcp = getrpcbynumber (number);
++  ret = 0;
++#else
+   ret = getrpcbynumber_r (number, &rpcbuf, rpcdata, sizeof rpcdata,
+ 			  &rpcp);
++#endif
+   if (ret == 0 && rpcp != NULL)
+     {
+       /* First try name.  */
+--- a/utils/mountd/cache.c.org	2007-05-11 03:40:57 +0000
++++ b/utils/mountd/cache.c	2007-10-24 15:21:53 +0000
+@@ -131,6 +131,7 @@
+ 	pw = getpwuid(uid);
+ 	if (!pw)
+ 		rv = -1;
++#ifndef __UCLIBC__
+ 	else {
+ 		rv = getgrouplist(pw->pw_name, pw->pw_gid, groups, &ngroups);
+ 		if (rv == -1 && ngroups >= 100) {
+@@ -142,6 +143,7 @@
+ 						  groups, &ngroups);
+ 		}
+ 	}
++#endif
+ 	qword_printint(f, uid);
+ 	qword_printint(f, time(0)+30*60);
+ 	if (rv >= 0) {
+--- a/tools/rpcgen/rpc_cout.c.org	2007-05-11 03:40:57 +0000
++++ b/tools/rpcgen/rpc_cout.c	2007-10-24 15:23:17 +0000
+@@ -647,7 +647,11 @@
+ 	int freed=0;
+ 
+ 	if(flag == PUT)
++#ifdef __UCLIBC__
++		f_print(fout,"\t\t IXDR_PUT_");
++#else
+ 		f_print(fout,"\t\t (void) IXDR_PUT_");
++#endif
+ 	else    
+ 		if(rel== REL_ALIAS)
+ 			f_print(fout,"\t\t objp->%s = IXDR_GET_",decl->name);
+
diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfsserver b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfsserver
new file mode 100644
index 0000000..b4c7662
--- /dev/null
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfsserver
@@ -0,0 +1,149 @@
+#!/bin/sh
+#
+# Startup script for nfs-utils
+#
+#
+# The environment variable NFS_SERVERS may be set in /etc/default/nfsd
+# Other control variables may be overridden here too
+test -r /etc/default/nfsd && . /etc/default/nfsd
+#
+# Location of executables:
+test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
+test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
+test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
+#
+# The user mode program must also exist (it just starts the kernel
+# threads using the kernel module code).
+test -x "$NFS_MOUNTD" || exit 0
+test -x "$NFS_NFSD" || exit 0
+#
+# Default is 8 threads, value is settable between 1 and the truely
+# ridiculous 99
+test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -lt 100 || NFS_SERVERS=8
+#
+# The default state directory is /var/lib/nfs
+test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
+#
+#----------------------------------------------------------------------
+# Startup and shutdown functions.
+#  Actual startup/shutdown is at the end of this file.
+#directories
+create_directories(){
+	echo -n 'creating NFS state directory: '
+	mkdir -p "$NFS_STATEDIR"
+	(	cd "$NFS_STATEDIR"
+		umask 077
+		mkdir -p sm sm.bak
+		test -w sm/state || {
+			rm -f sm/state
+			:>sm/state
+		}
+		umask 022
+		for file in xtab etab smtab rmtab
+		do
+			test -w "$file" || {
+				rm -f "$file"
+				:>"$file"
+			}
+		done
+	)
+	echo done
+}
+#mountd
+start_mountd(){
+	echo -n 'starting mountd: '
+	start-stop-daemon --start --exec "$NFS_MOUNTD" -- "-f /etc/exports $@"
+	echo done
+}
+stop_mountd(){
+	echo -n 'stopping mountd: '
+	start-stop-daemon --stop --quiet --exec "$NFS_MOUNTD"
+	echo done
+}
+#
+#nfsd
+start_nfsd(){
+	echo -n "starting $1 nfsd kernel threads: "
+	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
+	echo done
+}
+delay_nfsd(){
+	for delay in 0 1 2 3 4 5 6 7 8 9 
+	do
+		if pidof nfsd >/dev/null
+		then
+			echo -n .
+			sleep 1
+		else
+			return 0
+		fi
+	done
+	return 1
+}
+stop_nfsd(){
+	# WARNING: this kills any process with the executable
+	# name 'nfsd'.
+	echo -n 'stopping nfsd: '
+	start-stop-daemon --stop --quiet --signal 1 --name nfsd
+	if delay_nfsd || {
+		echo failed
+		echo ' using signal 9: '
+		start-stop-daemon --stop --quiet --signal 9 --name nfsd
+		delay_nfsd
+	}
+	then
+		echo done
+		# This will remove, recursively, dependencies
+		echo -n 'removing nfsd kernel module: '
+		if modprobe -r nfsd
+		then
+			echo done
+		else
+			echo failed
+		fi
+	else
+		echo failed
+	fi
+}
+
+#statd
+start_statd(){
+	echo -n "starting statd: "
+	start-stop-daemon --start --exec "$NFS_STATD"
+	echo done
+}
+stop_statd(){
+	# WARNING: this kills any process with the executable
+	# name 'statd'.
+	echo -n 'stopping statd: '
+	start-stop-daemon --stop --quiet --signal 1 --name statd
+	echo done
+}
+#----------------------------------------------------------------------
+#
+# supported options:
+#  start
+#  stop
+#  reload: reloads the exports file
+#  restart: stops and starts mountd
+#FIXME: need to create the /var/lib/nfs/... directories
+case "$1" in
+start)	create_directories
+	start_nfsd "$NFS_SERVERS"
+	start_mountd
+	start_statd
+	test -r /etc/exports && exportfs -a;;
+stop)	exportfs -ua
+	stop_statd
+	stop_mountd
+	stop_nfsd;;
+reload)	test -r /etc/exports && exportfs -r;;
+restart)exportfs -ua
+	stop_mountd
+	stop_statd
+	# restart does not restart the kernel threads,
+	# only the user mode processes
+	start_mountd
+	start_statd
+	test -r /etc/exports && exportfs -a;;
+esac
diff --git a/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb b/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
new file mode 100644
index 0000000..9510b30
--- /dev/null
+++ b/meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
@@ -0,0 +1,54 @@
+DESCRIPTION = "userspace utilities for kernel nfs"
+PRIORITY = "optional"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+PR = "r9"
+
+DEPENDS = "util-linux tcp-wrappers libevent"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.gz \
+	file://nfs-utils-tools-unset-cflags.patch \
+	file://nfs-utils-uclibc-compile.patch \
+	file://nfs-utils-S_ISREG-missing-include.patch \
+	file://nfsserver \
+   "
+
+S = "${WORKDIR}/nfs-utils-${PV}/"
+
+PARALLEL_MAKE = ""
+
+# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
+# pull in the remainder of the dependencies.
+RDEPENDS_${PN} = "portmap"
+RRECOMMENDS_${PN} = "kernel-module-nfsd"
+
+INITSCRIPT_NAME = "nfsserver"
+# The server has no dependencies at the user run levels, so just put
+# it in at the default levels.  It must be terminated before the network
+# in the shutdown levels, but that works fine.
+INITSCRIPT_PARAMS = "defaults"
+
+inherit autotools update-rc.d
+
+EXTRA_OECONF = "--with-statduser=nobody \
+		--enable-nfsv3 \
+		--disable-nfsv4 \
+		--disable-gss \
+		--with-statedir=/var/lib/nfs"
+
+INHIBIT_AUTO_STAGE = "1"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+
+	rm ${D}${sbindir}/rpcdebug
+}
+
+PACKAGES =+ "nfs-utils-client"
+FILES_nfs-utils-client = "${base_sbindir}/*mount.nfs*"
+
+SRC_URI[md5sum] = "76ee9274c2b867839427eba91b327f03"
+SRC_URI[sha256sum] = "1d09b1c133e4eed9d2df07ead4eba813e6993875c39e66d7b4081287029d4033"
-- 
1.7.5.rc3



