Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmX8-000363-Dx
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:48 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so10158672pac.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fnglMJpacWWk7TI1KlPUy6C+wnc8RhJIXyxbQjKbOaQ=;
	b=zStpnChHzYT+bPllMeKUpTQ4F2ykTTTubVDJbFejhEzJGpPunrP80zfpTn5ZrZvYvN
	6WZ17TDV26Ko4wRt0g+DPeSmccoa37DcxF1G24Hor9C3YF0OqJpOYFy4BB/37GSeRJTX
	fLkM/jGytMGvk0oiIo6fWqBJyBB3nqncGxiJVIBjnm7jZX87VeO7Tny25k3whmWyR53D
	y6XZtHxYFqrmXpvUhKJMA5z+5dNOadsZokY8WIzKs+HWsoyELUpc481D6uR8wdhH2sah
	wCN/3ZIXsA2tnIdtzqO2mb6D39skCV29OKe5+4Z3KUwNi/jQuf65OYJRYSfd2IlsX9Hm
	oo2g==
X-Received: by 10.68.228.2 with SMTP id se2mr179046107pbc.93.1357463618161;
	Sun, 06 Jan 2013 01:13:38 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:27 -0800
Message-Id: <1357463568-26241-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 04/25] nis: Import recipes from OE classic
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:49 -0000

Update to latest versions while at it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/nis/files/libdl.patch          |   12 +++
 .../recipes-support/nis/files/no-selinux.patch     |   16 ++++
 .../recipes-support/nis/files/ypbind-yocto.init    |   99 ++++++++++++++++++++
 meta-networking/recipes-support/nis/nis.inc        |   31 ++++++
 .../recipes-support/nis/yp-tools_2.12.bb           |   17 ++++
 .../recipes-support/nis/ypbind-mt_1.36.bb          |   39 ++++++++
 6 files changed, 214 insertions(+)
 create mode 100644 meta-networking/recipes-support/nis/files/libdl.patch
 create mode 100644 meta-networking/recipes-support/nis/files/no-selinux.patch
 create mode 100644 meta-networking/recipes-support/nis/files/ypbind-yocto.init
 create mode 100644 meta-networking/recipes-support/nis/nis.inc
 create mode 100644 meta-networking/recipes-support/nis/yp-tools_2.12.bb
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt_1.36.bb

diff --git a/meta-networking/recipes-support/nis/files/libdl.patch b/meta-networking/recipes-support/nis/files/libdl.patch
new file mode 100644
index 0000000..605af31
--- /dev/null
+++ b/meta-networking/recipes-support/nis/files/libdl.patch
@@ -0,0 +1,12 @@
+--- pwdutils-2.6/configure.in.orig	2005-04-19 20:22:36.603052192 -0700
++++ pwdutils-2.6/configure.in	2005-04-19 21:09:45.308023672 -0700
+@@ -178,6 +178,9 @@
+     AC_CHECK_LIB(ldap, main, LDAP_LIBS="-lldap $LDAP_LIBS" found_ldap_lib=yes,,$LDAP_LIBS)
+   fi
+ 
++  dnl this always needs dl
++  AC_CHECK_LIB(dl, dlopen, LDAP_LIBS="$LDAP_LIBS -ldl")
++
+   if test -z "$found_ldap_lib" -a \( $with_ldap_lib = auto -o $with_ldap_lib = netscape5 \); then
+     AC_CHECK_LIB(ldap50, main, LDAP_LIBS="-lldap50 -lssldap50 -lssl3 -lnss3 -lnspr4 -lprldap50 -lplc4 -lplds4" found_ldap_lib=yes need_pthread=true,, -lpthread)
+   fi
diff --git a/meta-networking/recipes-support/nis/files/no-selinux.patch b/meta-networking/recipes-support/nis/files/no-selinux.patch
new file mode 100644
index 0000000..71da3e3
--- /dev/null
+++ b/meta-networking/recipes-support/nis/files/no-selinux.patch
@@ -0,0 +1,16 @@
+--- pwdutils-2.6/lib/copy_xattr.c.orig	2005-04-16 17:15:52.916660880 -0700
++++ pwdutils-2.6/lib/copy_xattr.c	2005-04-16 17:18:10.345768480 -0700
+@@ -127,8 +127,11 @@
+ 
+ 	  if (lsetxattr (to, name, value, size, 0) != 0)
+ 	    {
+-	      if (strcmp (name, "security.selinux") == 0 &&
+-		  is_selinux_enabled() == 0)
++	      if (strcmp (name, "security.selinux") == 0
++#if defined(WITH_SELINUX)
++				  && is_selinux_enabled() == 0
++#endif
++				  )
+ 		fprintf (stderr,
+ 			 _("SELinux not enabled, ignore attribute %s for `%s'.\n"),
+ 			 name, to);
diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
new file mode 100644
index 0000000..5f50a53
--- /dev/null
+++ b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
@@ -0,0 +1,99 @@
+#! /bin/sh
+# Copyright (c) 2004 Author: Thorsten Kukuk <kukuk@suse.de>
+#
+# /etc/init.d/ypbind
+#
+#   and symbolic its link
+#
+# /usr/sbin/rcypbind
+#
+# System startup script for the ypbind daemon
+#
+### BEGIN INIT INFO
+# Provides: ypbind
+# Required-Start: $remote_fs $portmap
+# Should-Start: ypserv slpd
+# Required-Stop: portmap
+# Default-Start: 3 5
+# Default-Stop: 0 1 2 6
+# Short-Description: Start ypbind (necessary for a NIS client)
+# Description: ypbind finds the server for NIS domains and maintains
+#	the NIS binding information.
+### END INIT INFO
+
+YPBIND_BIN=/usr/sbin/ypbind
+pidfile=/var/run/ypbind.pid
+
+[ -f /etc/default/ypbind ] && . /etc/default/ypbind
+
+case "$1" in
+    start)
+	echo -n "Starting ypbind"
+	## If the domainname is not set, skip starting of ypbind
+	## and return with "program not configured"
+        /bin/ypdomainname &> /dev/null
+        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           if [ -f /etc/defaultdomain ]; then
+             XDOMAINNAME=`cat /etc/defaultdomain`
+             /bin/ypdomainname "$XDOMAINNAME"
+	   fi
+           /bin/ypdomainname &> /dev/null
+           if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+	     # Tell the user this has skipped
+	     echo -n " . . . . . . . . . . No domainname set"
+             # service is not configured
+	     exit 1
+           fi
+        fi
+
+	## If we don't have a /etc/yp.conf file, skip starting of
+        ## ypbind and return with "program not configured"
+        ## if you add the -broadcast Option later, comment this out.
+	if [ ! -f /etc/yp.conf -a "$YPBIND_BROADCAST" != "yes" ] ; then
+	  # Tell the user this has skipped
+	  echo -n " . . . . . . . . . . ${attn}/etc/yp.conf not found${norm}"
+          # service is not configured
+	  exit 1
+        fi
+
+	# evaluate the OPTIONS for ypbind-mt
+	OPTIONS=""
+	test "$YPBIND_LOCAL_ONLY" = "yes" && OPTIONS="-local-only $OPTIONS"
+	test "$YPBIND_BROADCAST" = "yes" && OPTIONS="-broadcast $OPTIONS"
+	test "$YPBIND_BROKEN_SERVER" = "yes" && OPTIONS="-broken-server $OPTIONS"
+
+	start-stop-daemon --start --quiet --pidfile $pidfile --exec $YPBIND_BIN -- $YPBIND_OPTIONS $OPTIONS
+        if [ $? -eq 0 ]; then
+            notfound=1
+            for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
+                ypwhich &>/dev/null && { notfound=0 ; break; };
+                echo -n " ."
+                sleep 1;
+            done
+            if [ $notfound -eq 1 ]; then
+                echo -n " ${warn}No NIS server found${norm}";
+	    fi
+        else
+            exit 1
+        fi
+	;;
+    stop)
+	echo -n "Shutting down ypbind"
+	start-stop-daemon --stop --quiet --pidfile $pidfile
+	# Remove static data, else glibc will continue to use NIS
+        rm -f /var/yp/binding/* /var/run/ypbind.pid
+	;;
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+    reload | force-reload)
+	echo -n "Reload service ypbind"
+	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
+	;;
+    *)
+	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
+	exit 1
+	;;
+esac
diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
new file mode 100644
index 0000000..f9f5bd1
--- /dev/null
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -0,0 +1,31 @@
+# This include file contains global definitions for the
+# various NIS packages.
+#
+# These packages will only function correctly with glibc -
+# the rpcsvc functionality is not present in uclibc
+DESCRIPTION = "NIS Server and Tools"
+HOMEPAGE = "http://www.linux-nis.org/nis/"
+SECTION = "console/network"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit autotools gettext
+
+# install is broken because src/Makefile heroically adds '-s'
+# to the install flags - passing -s to the build /usr/bin/install!
+# install-strip gets it right but installs ypbind -m <default>,
+# not -m 555.  In an OE build this is not, so far as I can see,
+# a security problem (and this fix to the build problem is *much*
+# easier and more maintainable.)
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install-strip
+}
+
+# An attempt to build on uclibc will fail, causing annoyance,
+# so force the package to be skipped here (this will cause a
+# 'nothing provides' error)
+python () {
+    os = bb.data.getVar("TARGET_OS", d, 1)
+    if os == "linux-uclibc":
+        raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
+}
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
new file mode 100644
index 0000000..18a52fc
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
@@ -0,0 +1,17 @@
+# This package builds tools to manage NIS
+# The source package is utils/net/NIS/yp-tools
+#
+PR = "r0"
+DESCRIPTION="\
+Network Information Service tools.  \
+This package contains ypcat, ypmatch, ypset, \
+ypwhich, yppasswd, domainname, nisdomainname \
+and ypdomainname."
+
+require nis.inc
+SRC_URI = "http://www.linux-nis.org/download/yp-tools/${P}.tar.bz2"
+
+SRC_URI[md5sum] = "ce1e06d86caa285fa8cd76fdf103f51e"
+SRC_URI[sha256sum] = "6ae8321666eea7837da343eea90ea30273fb74943ad111d5a4befd2afb252063"
+
+CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
new file mode 100644
index 0000000..96ef19b
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
@@ -0,0 +1,39 @@
+# This package builds the NIS ypbind daemon
+# The source package is utils/net/NIS/ypbind-mt
+#
+PR = "r0"
+DESCRIPTION="\
+Multithreaded NIS bind service (ypbind-mt).  \
+ypbind-mt is a complete new implementation of a NIS \
+binding daemon for Linux. It has the following \
+features.  Supports ypbind protocol V1 and V2.  \
+Uses threads for better response.  Supports multiple \
+domain bindings.  Supports /var/yp/binding/* file \
+for Linux libc 4/5 and glibc 2.x.  Supports a list \
+of known secure NIS server (/etc/yp.conf) Binds to \
+the server which answered as first."
+HOMEPAGE="http://www.linux-nis.org/nis/ypbind-mt/index.html"
+
+require nis.inc
+
+SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${P}.tar.bz2"
+SRC_URI[md5sum] = "135834db97d78ff6d79fdee2810b4056"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=082c9a0886c7c3db1bc862b5b62ffe08"
+SRC_URI[sha256sum] = "0eff76c1849f4b38ea1a60280d8397c4240369c641fe5402ce57edf1a90958c7"
+
+# ypbind-mt now provides all the functionality of ypbind
+# and is used in place of it.
+PROVIDES += "ypbind"
+
+CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
+SRC_URI += "file://ypbind-yocto.init"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/rcS.d
+
+    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
+
+    ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
+}
-- 
1.7.9.5



