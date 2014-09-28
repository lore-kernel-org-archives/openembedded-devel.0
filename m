Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1429D6FDA0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 09:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S9ZdIr022498
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 02:35:39 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Sep 2014 02:35:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Sep 2014 05:35:37 -0400
Message-ID: <1411896937-16000-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: update to version 1.12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Sep 2014 09:35:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changed:
 * Add init scripts and default configs based on debian
 * Add a patch for crosscompile nm
 * Add a patch to suppress /usr/lib in krb5-config
 * Add DESCRIPTION
 * Remove blacklist and inherit autotools-brokensep
 * Add PACKAGECONFIG for ldap and readline

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../krb5/krb5/crosscompile_nm.patch                |  29 +++++
 .../debian-suppress-usr-lib-in-krb5-config.patch   |  48 +++++++
 .../krb5/krb5/etc/default/krb5-admin-server        |   6 +
 .../krb5/krb5/etc/default/krb5-kdc                 |   5 +
 .../krb5/krb5/etc/init.d/krb5-admin-server         | 140 +++++++++++++++++++++
 .../krb5/krb5/etc/init.d/krb5-kdc                  | 133 ++++++++++++++++++++
 .../krb5/{krb5_1.11.3.bb => krb5_1.12.2.bb}        |  38 ++++--
 7 files changed, 392 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-kdc
 create mode 100755 meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-admin-server
 create mode 100755 meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-kdc
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.11.3.bb => krb5_1.12.2.bb} (49%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
new file mode 100644
index 0000000..d3e6937
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
@@ -0,0 +1,29 @@
+Modifies export-check.pl to use look for $ENV{'NM'} before
+defaulting to using 'nm'
+
+Upstream-Status: Pending
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+
+ export-check.pl |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+Index: src/util/export-check.pl
+===================================================================
+--- src.orig/util/export-check.pl
++++ src/util/export-check.pl
+@@ -38,7 +38,12 @@
+ my($exfile, $libfile) = @ARGV;
+ 
+ @missing = ();
+-open NM, "nm -Dg --defined-only $libfile |" || die "can't run nm on $libfile: $!";
++if (defined($ENV{'NM'})) {
++	$nm = $ENV{'NM'};
++} else {
++	$nm = "nm";
++}
++open NM, "$nm -Dg --defined-only $libfile |" || die "can't run nm on $libfile: $!";
+ open EXPORT, "< $exfile" || die "can't read $exfile: $!";
+ 
+ @export = <EXPORT>;
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch b/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
new file mode 100644
index 0000000..f0182ee
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
@@ -0,0 +1,48 @@
+Subject: [PATCH] debian: suppress /usr/lib in krb5-config
+
+Upstream-Status: Pending
+
+Handel multi-arch suppressions
+
+The patch is from debian.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/build-tools/krb5-config.in |   14 +++++++++-----
+ 1 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/build-tools/krb5-config.in b/src/build-tools/krb5-config.in
+index f6184da..637bad7 100755
+--- a/src/build-tools/krb5-config.in
++++ b/src/build-tools/krb5-config.in
+@@ -138,6 +138,7 @@ if test -n "$do_help"; then
+     echo "        [--defktname]     Show built-in default keytab name"
+     echo "        [--defcktname]    Show built-in default client keytab name"
+     echo "        [--cflags]        Compile time CFLAGS"
++    echo "        [--deps]          Include dependent libraries"
+     echo "        [--libs]          List libraries required to link [LIBRARIES]"
+     echo "Libraries:"
+     echo "        krb5              Kerberos 5 application"
+@@ -209,11 +210,14 @@ fi
+ 
+ if test -n "$do_libs"; then
+     # Assumes /usr/lib is the standard library directory everywhere...
+-    if test "$libdir" = /usr/lib; then
+-	libdirarg=
+-    else
+-	libdirarg="-L$libdir"
+-    fi
++    case $libdir in
++	/usr/lib*)
++	    libdirarg=
++	    ;;
++	*)
++	    libdirarg="-L$libdir"
++	    ;;
++    esac
+     # Ugly gross hack for our build tree
+     lib_flags=`echo $CC_LINK | sed -e 's/\$(CC)//' \
+ 	    -e 's/\$(PURE)//' \
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
new file mode 100644
index 0000000..2835929
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
@@ -0,0 +1,6 @@
+# Automatically generated.  If you change anything in this file other than the
+# values of RUN_KADMIND or DAEMON_ARGS, first run dpkg-reconfigure
+# krb5-admin-server and disable managing the kadmin configuration with
+# debconf.  Otherwise, changes will be overwritten.
+
+RUN_KADMIND=true
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-kdc b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-kdc
new file mode 100644
index 0000000..310bfcf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-kdc
@@ -0,0 +1,5 @@
+# Automatically generated.  Only the value of DAEMON_ARGS will be preserved.
+# If you change anything in this file other than DAEMON_ARGS, first run
+# dpkg-reconfigure krb5-kdc and disable managing the KDC configuration with
+# debconf.  Otherwise, changes will be overwritten.
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-admin-server b/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-admin-server
new file mode 100755
index 0000000..79238d4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-admin-server
@@ -0,0 +1,140 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:             krb5-admin-server
+# Required-Start:       $local_fs $remote_fs $network $syslog
+# Required-Stop:        $local_fs $remote_fs $network $syslog
+# Should-Start:         krb5-kdc
+# Should-Stop:          krb5-kdc
+# Default-Start:        2 3 4 5
+# Default-Stop:         0 1 6
+# Short-Description:    MIT Kerberos KDC administrative daemon
+# Description:          Starts, stops, or restarts the MIT Kerberos KDC
+#                       administrative daemon (kadmind).  This daemon answers
+#                       requests from kadmin clients and allows administrators
+#                       to create, delete, and modify principals in the KDC
+#                       database.
+### END INIT INFO
+
+# Author: Sam Hartman <hartmans@mit.edu>
+# Author: Russ Allbery <rra@debian.org>
+#
+# Based on the /etc/init.d/skeleton template as found in initscripts version
+# 2.86.ds1-15.
+
+# June, 2012: Adopted for yocto <amy.fong@windriver.com>
+
+PATH=/usr/sbin:/usr/bin:/sbin:/bin
+DESC="Kerberos administrative servers"
+NAME=kadmind
+DAEMON=/usr/sbin/$NAME
+DAEMON_ARGS=""
+SCRIPTNAME=/etc/init.d/krb5-admin-server
+DEFAULT=/etc/default/krb5-admin-server
+
+# Exit if the package is not installed.
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration if it is present.
+[ -r "$DEFAULT" ] && . "$DEFAULT"
+
+# Get the setting of VERBOSE and other rcS variables.
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+. /etc/init.d/functions
+
+ADMIN_SERVER_LOG=/var/log/kadmind.log
+[ -f $ADMIN_SERVER_LOG ] && (test ! -x /sbin/restorecon \
+    || /sbin/restorecon -F $ADMIN_SERVER_LOG)
+
+# Return
+#   0 if daemon has been started
+#   1 if daemon was already running
+#   2 if daemon could not be started
+do_start()
+{
+    start-stop-daemon --start --quiet --startas $DAEMON --name $NAME --test \
+        > /dev/null || return 1
+    start-stop-daemon --start --quiet --startas $DAEMON --name $NAME \
+        -- $DAEMON_ARGS || return 2
+}
+
+# Return
+#   0 if daemon has been stopped
+#   1 if daemon was already stopped
+#   2 if daemon could not be stopped
+#   other if a failure occurred
+do_stop()
+{
+    start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --name $NAME
+    RETVAL="$?"
+    [ "$RETVAL" = 2 ] && return 2
+    return "$RETVAL"
+}
+
+
+case "$1" in
+  start)
+    if [ "$RUN_KADMIND" = false ] ; then
+        if [ "$VERBOSE" != no ] ; then
+            echo "Not starting $DESC per configuration"
+        fi
+        exit 0
+    fi
+    [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
+    do_start
+    case "$?" in
+      0|1) [ "$VERBOSE" != no ] && echo 0 ;;
+      2)   [ "$VERBOSE" != no ] && echo 1 ;;
+    esac
+    ;;
+
+  stop)
+    [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
+    do_stop
+    case "$?" in
+      0|1) [ "$VERBOSE" != no ] && echo 0 ;;
+      2)   [ "$VERBOSE" != no ] && echo 1 ;;
+    esac
+    ;;
+
+  restart|force-reload)
+    if [ "$RUN_KADMIND" = false ] ; then
+        if [ "$VERBOSE" != no ] ; then
+            echo "Not restarting $DESC per configuration"
+        fi
+        exit 0
+    fi
+    echo "Restarting $DESC" "$NAME"
+    do_stop
+    case "$?" in
+      0|1)
+        do_start
+        case "$?" in
+          0) [ "$VERBOSE" != no ] && echo 0 ;;
+          *) [ "$VERBOSE" != no ] && echo 1 ;;
+        esac
+        ;;
+      *)
+        echo 1
+        ;;
+    esac
+    ;;
+
+  status)
+    pidofproc "$DAEMON" >/dev/null
+    status=$?
+    if [ $status -eq 0 ]; then
+        echo "$NAME is running."
+    else
+        echo "$NAME is not running."
+    fi
+    exit $status
+    ;;
+
+  *)
+    echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|status}" >&2
+    exit 3
+    ;;
+esac
+
+:
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-kdc b/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-kdc
new file mode 100755
index 0000000..865d1b9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/etc/init.d/krb5-kdc
@@ -0,0 +1,133 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:             krb5-kdc
+# Required-Start:       $local_fs $remote_fs $network $syslog
+# Required-Stop:        $local_fs $remote_fs $network $syslog
+# X-Start-Before: $x-display-manager
+# Default-Start:        2 3 4 5
+# Default-Stop:         0 1 6
+# Short-Description:    MIT Kerberos KDC
+# Description:          Starts, stops, or restarts the MIT Kerberos KDC.  This
+#                       daemon responds to ticket requests from Kerberos
+#                       clients.
+### END INIT INFO
+
+# Author: Sam Hartman <hartmans@mit.edu>
+# Author: Russ Allbery <rra@debian.org>
+#
+# Based on the /etc/init.d/skeleton template as found in initscripts version
+# 2.86.ds1-15.
+
+# June, 2012: Adopted for yocto <amy.fong@windriver.com>
+
+PATH=/usr/sbin:/usr/bin:/sbin:/bin
+DESC="Kerberos KDC"
+NAME=krb5kdc
+DAEMON=/usr/sbin/$NAME
+DAEMON_ARGS=""
+SCRIPTNAME=/etc/init.d/krb5-kdc
+
+# Exit if the package is not installed.
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration if it is present.
+[ -r /etc/default/krb5-kdc ] && . /etc/default/krb5-kdc
+
+# Get the setting of VERBOSE and other rcS variables.
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+. /etc/init.d/functions
+
+# Return
+#   0 if daemon has been started
+#   1 if daemon was already running
+#   2 if daemon could not be started
+do_start_kdc()
+{
+    start-stop-daemon --start --quiet --startas $DAEMON --name $NAME --test \
+        > /dev/null || return 1
+    start-stop-daemon --start --quiet --startas $DAEMON --name $NAME \
+        -- $DAEMON_ARGS || return 2
+}
+
+
+# Return
+#   0 if daemon has been stopped
+#   1 if daemon was already stopped
+#   2 if daemon could not be stopped
+#   other if a failure occurred
+do_stop_kdc()
+{
+    start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --name $NAME
+    RETVAL="$?"
+    [ "$RETVAL" = 2 ] && return 2
+    return "$RETVAL"
+}
+
+
+case "$1" in
+  start)
+    [ "$VERBOSE" != no ] && echo "Starting $DESC" "$NAME"
+    do_start_kdc
+    case "$?" in
+      0|1)
+            [ "$VERBOSE" != no ] && echo 0
+        ;;
+      2)
+        [ "$VERBOSE" != no ] && echo 1
+        ;;
+    esac
+    ;;
+
+  stop)
+    [ "$VERBOSE" != no ] && echo "Stopping $DESC" "$NAME"
+    do_stop_kdc
+    case "$?" in
+      0|1)
+        [ "$VERBOSE" != no ] && echo "krb524d"
+        ;;
+      2)
+        [ "$VERBOSE" != no ] && echo 1
+        ;;
+    esac
+    ;;
+
+  restart|force-reload)
+    echo "Restarting $DESC" "$NAME"
+    do_stop_kdc
+    case "$?" in
+      0|1)
+        do_start_kdc
+        case "$?" in
+          0)
+	  echo 0
+	  ;;
+          1|2)
+            echo 1
+            ;;
+        esac
+        ;;
+      *)
+        echo 1
+        ;;
+    esac
+    ;;
+
+  status)
+    pidofproc "$DAEMON" >/dev/null
+    status=$?
+    if [ $status -eq 0 ]; then
+        echo "$NAME is running."
+    else
+        echo "$NAME is not running."
+    fi
+    exit $status
+    ;;
+
+  *)
+    echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|status}" >&2
+    exit 3
+    ;;
+esac
+
+:
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
similarity index 49%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
index 49b8917..0b14d3c 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
@@ -1,20 +1,36 @@
 SUMMARY = "A network authentication protocol"
+DESCRIPTION = "Kerberos is a system for authenticating users and services on a network. \
+ Kerberos is a trusted third-party service.  That means that there is a \
+ third party (the Kerberos server) that is trusted by all the entities on \
+ the network (users and services, usually called "principals"). \
+ . \
+ This is the MIT reference implementation of Kerberos V5. \
+ . \
+ This package contains the Kerberos key server (KDC).  The KDC manages all \
+ authentication credentials for a Kerberos realm, holds the master keys \
+ for the realm, and responds to authentication requests.  This package \
+ should be installed on both master and slave KDCs."
+
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d9c8180d79838c02eb5eb1a3b184eb9"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=450c80c6258ce03387bd09df37638ebc"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
-inherit autotools binconfig perlnative
-
-PNBLACKLIST[krb5] = "BROKEN: doesn't build with B!=S"
+inherit autotools-brokensep binconfig perlnative
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
            file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
+           file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
+           file://crosscompile_nm.patch \
+           file://etc/init.d/krb5-kdc \
+           file://etc/init.d/krb5-admin-server \
+           file://etc/default/krb5-kdc \
+           file://etc/default/krb5-admin-server \
 "
-SRC_URI[md5sum] = "56f0ae274b285320b8a597cb89442449"
-SRC_URI[sha256sum] = "9abd94bb94a70996da0f8d90408957154bb543271b097e86c63eb33e5f5751b5"
+SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
+SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
 
 S = "${WORKDIR}/${P}/src/"
 
@@ -22,6 +38,8 @@ PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
 PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
 EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
@@ -31,8 +49,8 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
 CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
 LDFLAGS_append += "-lpthread"
 
-FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN} += "${datadir}/gnats"
+FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
 
 krb5_do_unpack() {
@@ -50,3 +68,9 @@ do_configure() {
     autoreconf
     oe_runconf
 }
+
+do_install_append() {
+    mkdir -p ${D}/etc/init.d ${D}/etc/default
+    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/etc/init.d
+    install -m 0644 ${WORKDIR}/etc/default/* ${D}/etc/default
+}
-- 
2.0.0


