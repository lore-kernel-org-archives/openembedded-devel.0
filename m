Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE9AC77B8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 06:57:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q6vKPh013353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 23:57:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Apr 2017 23:57:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 14:57:09 +0800
Message-ID: <48c1c7f33b191642921d1c97fa81c65806c7e00b.1493189113.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493189113.git.jackie.huang@windriver.com>
References: <cover.1493189113.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/8] freeradius: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Apr 2017 06:57:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

FreeRADIUS is an Internet authentication daemon,
which implements the RADIUS protocol, as defined
in RFC 2865 (and others).

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../freeradius/files/freeradius                    | 110 ++++++++++
 .../freeradius-avoid-searching-host-dirs.patch     | 194 +++++++++++++++++
 ...radius-configure.ac-add-option-for-libcap.patch |  70 ++++++
 ...dius-configure.ac-allow-cross-compilation.patch |  31 +++
 .../files/freeradius-enble-user-in-conf.patch      |  28 +++
 ...eeradius-fix-error-for-expansion-of-macro.patch |  61 ++++++
 ...ius-fix-issues-related-to-m4-include-path.patch | 236 +++++++++++++++++++++
 .../freeradius-fix-quoting-for-BUILT_WITH.patch    |  55 +++++
 .../files/freeradius-libtool-detection.patch       |  89 ++++++++
 .../freeradius-libtool-do-not-use-jlibtool.patch   | 160 ++++++++++++++
 .../freeradius-rlm_python-add-PY_INC_DIR.patch     |  33 +++
 .../freeradius/files/radiusd-volatiles.conf        |   2 +
 .../freeradius/files/radiusd.service               |  16 ++
 .../freeradius/files/volatiles.58_radiusd          |   3 +
 .../freeradius/freeradius_3.0.12.bb                | 223 +++++++++++++++++++
 15 files changed, 1311 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd.service
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd
 create mode 100644 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.12.bb

diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius b/meta-networking/recipes-connectivity/freeradius/files/freeradius
new file mode 100644
index 000000000..fa412e2aa
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius
@@ -0,0 +1,110 @@
+#!/bin/sh
+# Start/stop the FreeRADIUS daemon.
+
+### BEGIN INIT INFO
+# Provides:          freeradius
+# Required-Start:    $remote_fs $network $syslog
+# Should-Start:      $time mysql slapd postgresql samba krb5-kdc
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Radius Daemon
+# Description:       Extensible, configurable radius daemon
+### END INIT INFO
+
+set -e
+
+# Source function library.
+. /etc/init.d/functions
+
+if [ -f /lib/lsb/init-functions ]; then
+  . /lib/lsb/init-functions
+fi
+
+PROG="radiusd"
+PROGRAM="/usr/sbin/radiusd"
+PIDFILE="/var/run/radiusd/radiusd.pid"
+DESCR="FreeRADIUS daemon"
+
+if [ -r /etc/default/$PROG ]; then
+  . /etc/default/$PROG
+fi
+
+test -f $PROGRAM || exit 0
+
+check_certs() {
+	if [ ! -f /etc/raddb/certs/server.pem ]; then
+		echo -n "Creating certificates for freeradius..."
+		if sudo -u radiusd /etc/raddb/certs/bootstrap 1> /dev/null 2> /dev/null; then
+			echo "done"
+		else
+			echo "failed!"
+		fi
+	fi
+
+}
+
+# /var/run may be a tmpfs
+if [ ! -d /var/run/radiusd ]; then
+  mkdir -p /var/run/radiusd
+  chown radiusd:radiusd /var/run/radiusd
+fi
+
+if [ ! -d /var/log/radius ]; then
+  mkdir -p /var/log/radius
+  touch /var/log/radius/radius.log
+  chown radiusd:radiusd /var/run/radius
+fi
+
+if [ ! -f ${PIDFILE} ]; then
+  touch ${PIDFILE}
+  chown radiusd:radiusd ${PIDFILE}
+fi
+
+export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
+
+ret=0
+
+case "$1" in
+        start)
+		check_certs
+                echo -n "Starting $DESCR" "$PROG"
+                start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $PROGRAM -- $FREERADIUS_OPTIONS || ret=$?
+                [ "$ret" == 0 ] && echo " Success" || echo " Failed"
+                exit $ret
+                ;;
+        stop)
+                echo -n "Stopping $DESCR" "$PROG"
+                if [ -f "$PIDFILE" ] ; then
+                  start-stop-daemon --stop --retry=TERM/30/KILL/5 --quiet --pidfile $PIDFILE || ret=$?
+                else
+                  echo -n "$PIDFILE not found"
+                  ret=1
+                fi
+                [ "$ret" == 0 ] && echo " Success" || echo " Failed"
+                ;;
+        status)
+                status $PROGRAM;
+                exit $?
+                ;;
+        restart)
+                $0 stop
+                $0 start
+                ;;
+        reload|force-reload)
+                echo -n "Reloading $DESCR" "$PROG"
+                if [ -f "$PIDFILE" ] ; then
+                  start-stop-daemon --stop --signal HUP --quiet --pidfile $PIDFILE || ret=$?
+                else
+                  echo -n "$PIDFILE not found"
+                  ret=1
+                fi
+                [ "$ret" == 0 ] && echo " Success" || echo " Failed"
+                ;;
+        *)
+                echo "Usage: $0 start|stop|status|restart|force-reload|reload"
+                exit 1
+                ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
new file mode 100644
index 000000000..8ab23d3ef
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
@@ -0,0 +1,194 @@
+From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 4 Jan 2016 01:44:04 -0500
+Subject: [PATCH] avoid searching host dirs
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ acinclude.m4                                                | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      | 6 +++---
+ src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     | 2 +-
+ src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac | 4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   | 4 ++--
+ 8 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index da48acc..b513ae1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -178,7 +178,7 @@ if test "x$smart_lib" = "x"; then
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1${libltdl_cv_shlibext}])
+   FR_LOCATE_DIR(smart_lib_dir,[lib$1.a])
+ 
+-  for try in $smart_lib_dir /usr/local/lib /opt/lib; do
++  for try in $smart_lib_dir; do
+     AC_MSG_CHECKING([for $2 in -l$1 in $try])
+     LIBS="-l$1 $old_LIBS"
+     CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
+@@ -218,7 +218,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+ old_CPPFLAGS="$CPPFLAGS"
+ smart_include=
+ dnl #  The default directories we search in (in addition to the compilers search path)
+-smart_include_dir="/usr/local/include /opt/include"
++smart_include_dir=
+ 
+ dnl #  Our local versions
+ _smart_try_dir=
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+index 75c851a..a262d71 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -ldb2
+-	smart_try_dir="$ibmdb2_lib_dir /usr/local/db2/lib /usr/IBMdb2/V7.1/lib"
++	smart_try_dir="$ibmdb2_lib_dir"
+ 	FR_SMART_CHECK_LIB(db2, SQLConnect)
+ 	if test "x$ac_cv_lib_db2_SQLConnect" != xyes; then
+ 		fail="$fail libdb2"
+ 	fi
+ 
+ 	dnl Check for sqlcli.h
+-	smart_try_dir="$ibmdb2_include_dir /usr/local/db2/include /usr/IBMdb2/V7.1/include"
++	smart_try_dir="$ibmdb2_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sqlcli.h)
+ 	if test "x$ac_cv_header_sqlcli_h" != xyes; then
+ 		fail="$fail sqlcli.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+index 4da57b3..752b043 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
+@@ -56,14 +56,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for isc_attach_database in -lfbclient
+-	smart_try_dir="$firebird_lib_dir /usr/lib/firebird2/lib /usr/local/firebird/lib"
++	smart_try_dir="$firebird_lib_dir"
+ 	FR_SMART_CHECK_LIB(fbclient, isc_attach_database)
+ 	if test "x$ac_cv_lib_fbclient_isc_attach_database" != xyes; then
+ 		fail="$fail libfbclient"
+ 	fi
+ 
+ 	dnl Check for ibase.h
+-	smart_try_dir="$firebird_include_dir /usr/lib/firebird2/include /usr/local/firebird/include"
++	smart_try_dir="$firebird_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(ibase.h)
+ 	if test "x$ac_cv_header_ibase_h" != xyes; then
+ 		fail="$fail ibase.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+index ba6304f..3393557 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -liodbc
+-	smart_try_dir="$iodbc_lib_dir /usr/lib /usr/lib/iodbc /usr/local/lib/iodbc /usr/local/iodbc/lib/iodbc"
++	smart_try_dir="$iodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(iodbc, SQLConnect)
+ 	if test "x$ac_cv_lib_iodbc_SQLConnect" != xyes; then
+ 		fail="$fail libiodbc"
+ 	fi
+ 
+ 	dnl Check for isql.h
+-	smart_try_dir="$iodbc_include_dir /usr/include /usr/include/iodbc /usr/local/iodbc/include"
++	smart_try_dir="$iodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(isql.h)
+ 	if test "x$ac_cv_header_isql_h" != xyes; then
+ 		fail="$fail isql.h"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+index 1401677..2e7db44 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
+@@ -136,7 +136,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient_r
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -145,7 +145,7 @@ if test x$with_[]modname != xno; then
+ 
+ 	dnl # Check for libmysqlclient
+ 	if test "x$have_a_libmysqlclient" != "xyes"; then
+-	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++	    smart_try_dir="$mysql_lib_dir"
+ 	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
+ 	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
+ 			have_a_libmysqlclient='yes'
+@@ -189,7 +189,7 @@ if test x$with_[]modname != xno; then
+     fi
+ 
+     if test "x$have_mysql_h" != "xyes"; then
+-		smart_try_dir="$mysql_include_dir /usr/local/include /usr/local/mysql/include"
++		smart_try_dir="$mysql_include_dir"
+ 		FR_SMART_CHECK_INCLUDE(mysql/mysql.h)
+ 		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
+ 	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+index 3178462..5cbc8c2 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
+@@ -63,7 +63,7 @@ if test x$with_[]modname != xno; then
+     dnl # Check for header files
+     dnl ############################################################
+ 
+-    smart_try_dir="$oracle_include_dir /usr/local/instaclient/include"
++    smart_try_dir="$oracle_include_dir"
+ 
+     if test "x$ORACLE_HOME" != "x"; then
+ 	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+index 4f9a890..e1cf811 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
+@@ -41,7 +41,7 @@ if test x$with_[]modname != xno; then
+ 	  esac ]
+ 	)
+ 
+-	smart_try_dir="$rlm_sql_postgresql_include_dir /usr/include/postgresql /usr/local/pgsql/include /usr/include/pgsql"
++	smart_try_dir="$rlm_sql_postgresql_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
+ 	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
+ 		fail="$fail libpq-fe.h"
+@@ -76,7 +76,7 @@ if test x$with_[]modname != xno; then
+ 		  ])
+ 	fi
+ 
+-	smart_try_dir="$rlm_sql_postgresql_lib_dir /usr/lib /usr/local/pgsql/lib"
++	smart_try_dir="$rlm_sql_postgresql_lib_dir"
+ 	FR_SMART_CHECK_LIB(pq, PQconnectdb)
+ 	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
+ 		fail="$fail libpq"
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+index 3545387..c543ed4 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
++++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
+@@ -57,14 +57,14 @@ if test x$with_[]modname != xno; then
+ 		esac])
+ 
+ 	dnl Check for SQLConnect in -lodbc
+-	smart_try_dir="$unixodbc_lib_dir /usr/local/unixodbc/lib"
++	smart_try_dir="$unixodbc_lib_dir"
+ 	FR_SMART_CHECK_LIB(odbc, SQLConnect)
+ 	if test "x$ac_cv_lib_odbc_SQLConnect" != xyes; then
+ 		fail="$fail libodbc"
+ 	fi
+ 
+ 	dnl Check for sql.h
+-	smart_try_dir="$unixodbc_include_dir /usr/local/unixodbc/include"
++	smart_try_dir="$unixodbc_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(sql.h)
+ 	if test "x$ac_cv_header_sql_h" != xyes; then
+ 		fail="$fail sql.h"
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
new file mode 100644
index 000000000..71b78090c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
@@ -0,0 +1,70 @@
+From 74eed61dec8702c89f3e121d577ea9db25c961a4 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 11 Jan 2016 02:52:16 -0500
+Subject: [PATCH] configure.ac: add option for libcap
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 37 ++++++++++++++++++++++++++++---------
+ 1 file changed, 28 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 066d3d7..6e4266b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -948,6 +948,23 @@ fi
+ dnl Set by FR_SMART_CHECKLIB
+ LIBS="${old_LIBS}"
+ 
++dnl #
++dnl #  extra argument: --with-libcap
++dnl #
++WITH_LIBCAP=yes
++AC_ARG_WITH(libcap,
++[  --with-licap          use licap for debugger checks. (default=yes)],
++[ case "$withval" in
++  no)
++    WITH_LIBCAP=no
++    ;;
++  *)
++    WITH_LIBCAP=yes
++    ;;
++  esac ]
++)
++
++
+ dnl Check for cap
+ dnl extra argument: --with-cap-lib-dir=DIR
+ cap_lib_dir=
+@@ -981,15 +998,17 @@ AC_ARG_WITH(cap-include-dir,
+       ;;
+   esac])
+ 
+-smart_try_dir="$cap_lib_dir"
+-FR_SMART_CHECK_LIB(cap, cap_get_proc)
+-if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
+-  AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
+-else
+-  AC_DEFINE(HAVE_LIBCAP, 1,
+-    [Define to 1 if you have the `cap' library (-lcap).]
+-  )
+-  HAVE_LIBCAP=1
++if test "x$WITH_LIBCAP" = xyes; then
++  smart_try_dir="$cap_lib_dir"
++  FR_SMART_CHECK_LIB(cap, cap_get_proc)
++  if test "x$ac_cv_lib_cap_cap_get_proc" != "xyes"; then
++    AC_MSG_WARN([cap library not found, debugger checks will not be enabled. Use --with-cap-lib-dir=<path>.])
++  else
++    AC_DEFINE(HAVE_LIBCAP, 1,
++      [Define to 1 if you have the `cap' library (-lcap).]
++    )
++    HAVE_LIBCAP=1
++  fi
+ fi
+ 
+ VL_LIB_READLINE
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
new file mode 100644
index 000000000..30497a602
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
@@ -0,0 +1,31 @@
+Subject: [PATCH] configure.ac: allow cross-compilation
+
+The checking OpenSSL library and header version consistency will
+always fail in cross compiling, skip the check and give a warning
+instead for cross compiling.
+
+Upstream-Status: Inappropriate[embedded specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_krb5/configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
+index eb43534..113a079 100644
+--- a/src/modules/rlm_krb5/configure.ac
++++ b/src/modules/rlm_krb5/configure.ac
+@@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
+ 		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
+ 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" == xyes; then
+ 			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
+-				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
++				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
++				[AC_MSG_WARN(cross compiling: not checking)])
+ 		fi
+ 	else
+ 		krb5threadsafe=""
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
new file mode 100644
index 000000000..4a62bf1fa
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
@@ -0,0 +1,28 @@
+Enable and change user and group of freeradius server to radiusd
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ raddb/radiusd.conf.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/raddb/radiusd.conf.in b/raddb/radiusd.conf.in
+index c62f4ff..0b4a84e 100644
+--- a/raddb/radiusd.conf.in
++++ b/raddb/radiusd.conf.in
+@@ -436,8 +436,8 @@ security {
+ 	#  member.  This can allow for some finer-grained access
+ 	#  controls.
+ 	#
+-#	user = radius
+-#	group = radius
++	user = radiusd
++	group = radiusd
+ 
+ 	#  Core dumps are a bad thing.  This should only be set to
+ 	#  'yes' if you're debugging a problem with the server.
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
new file mode 100644
index 000000000..af1bff051
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
@@ -0,0 +1,61 @@
+From 5b6d8b14f2696fcf1dca119212f9d0a0fa04defd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 18 Jan 2017 14:59:39 +0800
+Subject: [PATCH] fix error for expansion of macro in thread.h
+
+The parameter declaration is missing in expansion of macro
+which cause the build error:
+| In file included from src/freeradius-devel/libradius.h:80:0,
+|                  from src/lib/log.c:26:
+| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
+| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
+|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
+|                                ^
+
+Add the missing declaration in macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/include/threads.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/include/threads.h b/src/include/threads.h
+index e36d81d..2bcb6aa 100644
+--- a/src/include/threads.h
++++ b/src/include/threads.h
+@@ -89,7 +89,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ #  define fr_thread_local_get(_n) _n
+ #elif defined(HAVE_PTHREAD_H)
+ #  include <pthread.h>
+-#  define fr_thread_local_setup(_t, _n) \
++#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
+ static pthread_key_t __fr_thread_local_key_##_n;\
+ static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
+ static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
+@@ -100,17 +100,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
+ static void __fr_thread_local_key_init_##_n(void)\
+ {\
+ 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
+-	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ }\
+ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
+ {\
+ 	__fr_thread_local_destructor_##_n = func;\
+ 	if (_n) return _n; \
+ 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
++	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
+ 	return _n;\
+ }
+-#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
+-#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
+-#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
++#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
++#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
++#  define fr_thread_local_get(_n) _n
+ #endif
+ #endif
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
new file mode 100644
index 000000000..d29b2ac39
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
@@ -0,0 +1,236 @@
+From d8e251ef97869ab2c1c82bd374016f402083997c Mon Sep 17 00:00:00 2001
+From: Jorge Pereira <jpereiran@gmail.com>
+Date: Mon, 7 Dec 2015 16:51:07 -0200
+Subject: [PATCH] Fixing issues related to m4 include path
+
+Upstream-Status: Submitted [1]
+
+[1]: https://github.com/FreeRADIUS/freeradius-server/pull/1428
+
+Submmited by: Jorge Pereira <jpereiran@gmail.com>
+---
+ src/modules/rlm_example/config.h.in                | 39 ++--------------------
+ src/modules/rlm_ldap/configure                     |  2 +-
+ src/modules/rlm_pam/config.h.in                    |  3 ++
+ src/modules/rlm_perl/config.h.in                   |  3 ++
+ src/modules/rlm_perl/configure.ac                  |  2 +-
+ src/modules/rlm_radutmp/config.h.in                |  3 ++
+ src/modules/rlm_ruby/configure                     |  1 +
+ src/modules/rlm_ruby/configure.ac                  |  9 ++---
+ src/modules/rlm_smsotp/config.h.in                 |  3 ++
+ .../rlm_sql/drivers/rlm_sql_mysql/config.h.in      |  3 ++
+ src/modules/rlm_unix/config.h.in                   |  6 ++++
+ 11 files changed, 32 insertions(+), 42 deletions(-)
+
+diff --git a/src/modules/rlm_example/config.h.in b/src/modules/rlm_example/config.h.in
+index 2a81ef5..f80de9c 100644
+--- a/src/modules/rlm_example/config.h.in
++++ b/src/modules/rlm_example/config.h.in
+@@ -1,38 +1,5 @@
+ /* config.h.in.  Generated from configure.ac by autoheader.  */
+ 
+-/* Define to 1 if you have the <inttypes.h> header file. */
+-#undef HAVE_INTTYPES_H
+-
+-/* Define to 1 if you have the <memory.h> header file. */
+-#undef HAVE_MEMORY_H
+-
+-/* Define to 1 if you have the `printf' function. */
+-#undef HAVE_PRINTF
+-
+-/* Define to 1 if you have the <stdint.h> header file. */
+-#undef HAVE_STDINT_H
+-
+-/* Define to 1 if you have the <stdio.h> header file. */
+-#undef HAVE_STDIO_H
+-
+-/* Define to 1 if you have the <stdlib.h> header file. */
+-#undef HAVE_STDLIB_H
+-
+-/* Define to 1 if you have the <strings.h> header file. */
+-#undef HAVE_STRINGS_H
+-
+-/* Define to 1 if you have the <string.h> header file. */
+-#undef HAVE_STRING_H
+-
+-/* Define to 1 if you have the <sys/stat.h> header file. */
+-#undef HAVE_SYS_STAT_H
+-
+-/* Define to 1 if you have the <sys/types.h> header file. */
+-#undef HAVE_SYS_TYPES_H
+-
+-/* Define to 1 if you have the <unistd.h> header file. */
+-#undef HAVE_UNISTD_H
+-
+ /* Define to the address where bug reports for this package should be sent. */
+ #undef PACKAGE_BUGREPORT
+ 
+@@ -45,8 +12,8 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+-
+-/* Define to 1 if you have the ANSI C header files. */
+-#undef STDC_HEADERS
+diff --git a/src/modules/rlm_ldap/configure b/src/modules/rlm_ldap/configure
+index e0c15d9..cdf96d5 100755
+--- a/src/modules/rlm_ldap/configure
++++ b/src/modules/rlm_ldap/configure
+@@ -3992,7 +3992,7 @@ smart_prefix=
+ $as_echo "#define WITH_SASL 1" >>confdefs.h
+ 
+ 	    SASL=sasl.c
+-          fi
++	  fi
+ 	fi
+ 
+ 	targetname=rlm_ldap
+diff --git a/src/modules/rlm_pam/config.h.in b/src/modules/rlm_pam/config.h.in
+index 32ef6ff..1ad20c5 100644
+--- a/src/modules/rlm_pam/config.h.in
++++ b/src/modules/rlm_pam/config.h.in
+@@ -45,6 +45,9 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+ 
+diff --git a/src/modules/rlm_perl/config.h.in b/src/modules/rlm_perl/config.h.in
+index 989ed53..f80de9c 100644
+--- a/src/modules/rlm_perl/config.h.in
++++ b/src/modules/rlm_perl/config.h.in
+@@ -12,5 +12,8 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+diff --git a/src/modules/rlm_perl/configure.ac b/src/modules/rlm_perl/configure.ac
+index 44c5fc9..6b2a043 100644
+--- a/src/modules/rlm_perl/configure.ac
++++ b/src/modules/rlm_perl/configure.ac
+@@ -3,7 +3,7 @@ AC_INIT(rlm_perl.c)
+ AC_REVISION($Revision$)
+ AC_DEFUN(modname,[rlm_perl])
+ 
+-m4_include([ax_with_prog.m4])
++m4_include([m4/ax_with_prog.m4])
+ 
+ if test x$with_[]modname != xno; then
+ 	AC_PROG_CC
+diff --git a/src/modules/rlm_radutmp/config.h.in b/src/modules/rlm_radutmp/config.h.in
+index 9a883cc..750b434 100644
+--- a/src/modules/rlm_radutmp/config.h.in
++++ b/src/modules/rlm_radutmp/config.h.in
+@@ -42,6 +42,9 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+ 
+diff --git a/src/modules/rlm_ruby/configure b/src/modules/rlm_ruby/configure
+index 15868ab..c728af2 100755
+--- a/src/modules/rlm_ruby/configure
++++ b/src/modules/rlm_ruby/configure
+@@ -1875,6 +1875,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+ 
+ 
++
+ # ===========================================================================
+ #    http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
+ # ===========================================================================
+diff --git a/src/modules/rlm_ruby/configure.ac b/src/modules/rlm_ruby/configure.ac
+index 9306382..f1c8118 100644
+--- a/src/modules/rlm_ruby/configure.ac
++++ b/src/modules/rlm_ruby/configure.ac
+@@ -3,15 +3,16 @@ AC_INIT(rlm_ruby.c)
+ AC_REVISION($Revision: 1.9 $)
+ AC_DEFUN(modname,[rlm_ruby])
+ 
+-m4_include([ax_with_prog.m4])
++m4_include([m4/ax_with_prog.m4])
+ 
+ AC_DEFUN([AX_WITH_RUBY],[
+     AX_WITH_PROG([RUBY],[ruby],[not-found],[${PATH}:/usr/bin:/usr/local/bin])
+ ])
+ 
+-m4_include([ax_compare_version.m4])
+-m4_include([ax_prog_ruby_version.m4])
+-m4_include([ax_ruby_devel.m4])
++
++m4_include([m4/ax_compare_version.m4])
++m4_include([m4/ax_prog_ruby_version.m4])
++m4_include([m4/ax_ruby_devel.m4])
+ 
+ targetname=modname
+ mod_cflags=
+diff --git a/src/modules/rlm_smsotp/config.h.in b/src/modules/rlm_smsotp/config.h.in
+index 5feaf91..9e69f85 100644
+--- a/src/modules/rlm_smsotp/config.h.in
++++ b/src/modules/rlm_smsotp/config.h.in
+@@ -42,6 +42,9 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+ 
+diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in b/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
+index e03d1a9..6262c48 100644
+--- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
++++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
+@@ -18,5 +18,8 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+diff --git a/src/modules/rlm_unix/config.h.in b/src/modules/rlm_unix/config.h.in
+index dcb9aa2..70b4680 100644
+--- a/src/modules/rlm_unix/config.h.in
++++ b/src/modules/rlm_unix/config.h.in
+@@ -1,5 +1,8 @@
+ /* config.h.in.  Generated from configure.ac by autoheader.  */
+ 
++/* Define to 1 if you have the `getpwnam' function. */
++#undef HAVE_GETPWNAM
++
+ /* Define to 1 if you have the `getspnam' function. */
+ #undef HAVE_GETSPNAM
+ 
+@@ -54,6 +57,9 @@
+ /* Define to the one symbol short name of this package. */
+ #undef PACKAGE_TARNAME
+ 
++/* Define to the home page for this package. */
++#undef PACKAGE_URL
++
+ /* Define to the version of this package. */
+ #undef PACKAGE_VERSION
+ 
+-- 
+2.3.5
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
new file mode 100644
index 000000000..b0929c4b0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
@@ -0,0 +1,55 @@
+Fix quoting for BUILD_WITH
+
+The escaped quotes are to make the -D values produce strings which
+can be used to display these values. However, if the values are more
+than one word, with spaces, they also need shell quoting to make them
+into single words.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/main/libfreeradius-server.mk    | 2 +-
+ src/main/unittest.mk                | 2 +-
+ src/modules/rlm_eap/radeapclient.mk | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/main/libfreeradius-server.mk b/src/main/libfreeradius-server.mk
+index 4495f72..07c28f1 100644
+--- a/src/main/libfreeradius-server.mk
++++ b/src/main/libfreeradius-server.mk
+@@ -18,5 +18,5 @@ SOURCES	:=	conffile.c \
+ TGT_LDLIBS      := $(OPENSSL_LIBS)
+ 
+ ifneq ($(MAKECMDGOALS),scan)
+-SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS=\"$(CPPFLAGS)\" -DBUILT_WITH_CFLAGS=\"$(CFLAGS)\" -DBUILT_WITH_LDFLAGS=\"$(LDFLAGS)\" -DBUILT_WITH_LIBS=\"$(LIBS)\"
++SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
+ endif
+diff --git a/src/main/unittest.mk b/src/main/unittest.mk
+index 09f3938..ed33952 100644
+--- a/src/main/unittest.mk
++++ b/src/main/unittest.mk
+@@ -21,5 +21,5 @@ TGT_PREREQS	+= libfreeradius-eap.a
+ endif
+ 
+ ifneq ($(MAKECMDGOALS),scan)
+-SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS=\"$(CPPFLAGS)\" -DBUILT_WITH_CFLAGS=\"$(CFLAGS)\" -DBUILT_WITH_LDFLAGS=\"$(LDFLAGS)\" -DBUILT_WITH_LIBS=\"$(LIBS)\"
++SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
+ endif
+diff --git a/src/modules/rlm_eap/radeapclient.mk b/src/modules/rlm_eap/radeapclient.mk
+index 6068f54..7d3c556 100644
+--- a/src/modules/rlm_eap/radeapclient.mk
++++ b/src/modules/rlm_eap/radeapclient.mk
+@@ -23,7 +23,7 @@ SRC_CFLAGS += -DWITH_EAPCLIENT
+ SRC_INCDIRS  := ${top_srcdir}/src/modules/rlm_eap/libeap
+ 
+ ifneq ($(MAKECMDGOALS),scan)
+-SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS=\"$(CPPFLAGS)\" -DBUILT_WITH_CFLAGS=\"$(CFLAGS)\" -DBUILT_WITH_LDFLAGS=\"$(LDFLAGS)\" -DBUILT_WITH_LIBS=\"$(LIBS)\"
++SRC_CFLAGS	+= -DBUILT_WITH_CPPFLAGS="\"$(CPPFLAGS)\"" -DBUILT_WITH_CFLAGS="\"$(CFLAGS)\"" -DBUILT_WITH_LDFLAGS="\"$(LDFLAGS)\"" -DBUILT_WITH_LIBS="\"$(LIBS)\""
+ endif
+ 
+ endif
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
new file mode 100644
index 000000000..4eb61ff2e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
@@ -0,0 +1,89 @@
+From 56ef434e454bcc82c162a83d9bcb076d4fc72b7f Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 9 Jan 2014 14:30:26 +0800
+Subject: [PATCH] Fix libtool detection
+
+Upstream-Status: pending
+
+Use LT_INIT instead of the deprecated AC_PROG_LIBTOOL to detect libtool, so it
+can work with our libtoolize and libtool.
+
+Simplify the detection of ltdl. It will find the ltdl from the sysroot; the
+switch --with-system-libltdl is no longer needed. The code is copied from
+pulseaudio configure.ac, together with the comment paragraph.
+
+Also patch autogen.sh so it uses autoreconf, which handles libtoolize better.
+
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ autogen.sh   |  5 +----
+ configure.ac | 36 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 37 insertions(+), 4 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 3418673..e42c3d5 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -5,10 +5,7 @@ parentdir=`dirname $0`
+ cd $parentdir
+ parentdir=`pwd`
+ 
+-libtoolize -f -c
+-#aclocal
+-autoheader
+-autoconf
++autoreconf -Wcross --verbose --install --force
+ 
+ mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
+ mysubdirs=`echo $mysubdirs`
+diff --git a/configure.ac b/configure.ac
+index e73e4ad..066d3d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -205,6 +205,42 @@ dnl #  See if we have Git.
+ dnl #
+ AC_CHECK_PROG(GIT, git, yes, no)
+ 
++#### libtool stuff ####
++
++dnl set this shit so it doesn't force CFLAGS...
++LTCFLAGS=" "
++
++LT_PREREQ(2.2)
++LT_INIT([dlopen disable-static])
++
++dnl Unfortunately, even up to libtool 2.2.6a there is no way to know
++dnl exactly which version of libltdl is present in the system, so we
++dnl just assume that it's a working version as long as we have the
++dnl library and the header files.
++dnl
++dnl As an extra safety device, check for lt_dladvise_init() which is
++dnl only implemented in libtool 2.x, and refine as we go if we have
++dnl refined requirements.
++dnl
++dnl Check the header files first since the system may have a
++dnl libltdl.so for runtime, but no headers, and we want to bail out as
++dnl soon as possible.
++dnl
++dnl We don't need any special variable for this though, since the user
++dnl can give the proper place to find libltdl through the standard
++dnl variables like LDFLAGS and CPPFLAGS.
++
++AC_CHECK_HEADER([ltdl.h],
++    [AC_CHECK_LIB([ltdl], [lt_dladvise_init], [LIBLTDL=-lltdl], [LIBLTDL=])],
++    [LIBLTDL=])
++
++AS_IF([test "x$LIBLTDL" = "x"],
++    [AC_MSG_ERROR([Unable to find libltdl version 2. Makes sure you have libtool 2.2 or later installed.])])
++AC_SUBST([LIBLTDL])
++LTDL_SUBDIRS=
++INCLTDL=-DWITH_SYSTEM_LTDL
++AC_SUBST(LTDL_SUBDIRS)
++
+ dnl Put this in later, when all distributed modules use autoconf.
+ dnl AC_ARG_WITH(disablemodulefoo,
+ dnl [  --without-rlm_foo         Disables module compilation.  Module list:]
+-- 
+1.8.3
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
new file mode 100644
index 000000000..1954586b2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
@@ -0,0 +1,160 @@
+From 16bf899447fc1524ffc3c79e1d35380e5285a552 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 7 Jan 2016 22:37:30 -0800
+Subject: [PATCH] libtool: do not use jlibtool
+
+jlibtool is hardcoded to be used but we need to use
+our libtool, so fix the makfiles to make it compatible
+with our libtool.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Make.inc.in        |  4 ++--
+ scripts/boiler.mk  |  2 ++
+ scripts/install.mk | 14 +++++++-------
+ scripts/libtool.mk | 22 ++++++++++++++++------
+ 4 files changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/Make.inc.in b/Make.inc.in
+index 7a77625..fd8aa3e 100644
+--- a/Make.inc.in
++++ b/Make.inc.in
+@@ -57,7 +57,7 @@ CPPFLAGS	= @CPPFLAGS@
+ LIBPREFIX	= @LIBPREFIX@
+ EXEEXT		= @EXEEXT@
+ 
+-LIBTOOL		= JLIBTOOL
++LIBTOOL		= @LIBTOOL@
+ ACLOCAL		= @ACLOCAL@
+ AUTOCONF	= @AUTOCONF@
+ AUTOHEADER	= @AUTOHEADER@
+@@ -163,7 +163,7 @@ ANALYZE.c       := @clang_path@
+ #
+ ifeq "$(USE_SHARED_LIBS)" "yes"
+ 	TESTBINDIR = ./$(BUILD_DIR)/bin/local
+-	TESTBIN    =  FR_LIBRARY_PATH=./build/lib/.libs $(JLIBTOOL) --quiet --mode=execute $(TESTBINDIR)
++	TESTBIN    =  FR_LIBRARY_PATH=./build/lib/.libs $(LIBTOOL) --quiet --mode=execute $(TESTBINDIR)
+ else
+ 	TESTBINDIR = ./$(BUILD_DIR)/bin
+ 	TESTBIN    = ./$(BUILD_DIR)/bin
+diff --git a/scripts/boiler.mk b/scripts/boiler.mk
+index bccec5e..926a13e 100644
+--- a/scripts/boiler.mk
++++ b/scripts/boiler.mk
+@@ -266,6 +266,7 @@ define COMPILE_C_CMDS
+ 	$(Q)$(ECHO) CC $<
+ 	$(Q)$(strip ${COMPILE.c} -o $@ -c -MD ${CPPFLAGS} ${CFLAGS} ${SRC_CFLAGS} ${INCDIRS} \
+ 	    $(addprefix -I, ${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} $<)
++	${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
+ endef
+ else
+ #
+@@ -281,6 +282,7 @@ define COMPILE_C_CMDS
+ 	$(Q)cppcheck --enable=style -q ${CHECKFLAGS} $(filter -isystem%,${SRC_CFLAGS}) \
+ 	     $(filter -I%,${SRC_CFLAGS}) $(filter -D%,${SRC_CFLAGS}) ${INCDIRS} \
+ 	     $(addprefix -I,${SRC_INCDIRS}) ${SRC_DEFS} ${DEFS} --suppress=variableScope --suppress=invalidscanf $<
++	${Q}mv $(dir $@)/.libs/$(notdir $*.d) ${BUILD_DIR}/objs/$*.d
+ endef
+ endif
+ 
+diff --git a/scripts/install.mk b/scripts/install.mk
+index 9164115..e38c1ed 100644
+--- a/scripts/install.mk
++++ b/scripts/install.mk
+@@ -46,7 +46,7 @@ define ADD_INSTALL_RULE.exe
+     install: $${${1}_INSTALLDIR}/$(notdir ${1})
+ 
+     # Install executable ${1}
+-    $${${1}_INSTALLDIR}/$(notdir ${1}): ${JLIBTOOL} $${${1}_BUILD}/${1} | $${${1}_INSTALLDIR}
++    $${${1}_INSTALLDIR}/$(notdir ${1}): ${LIBTOOL} $${${1}_BUILD}/${1} | $${${1}_INSTALLDIR}
+ 	@$(ECHO) INSTALL ${1}
+ 	$(Q)$${PROGRAM_INSTALL} -c -m 755 $${BUILD_DIR}/bin/${1} $${${1}_INSTALLDIR}/
+ 	$(Q)$${${1}_POSTINSTALL}
+@@ -65,7 +65,7 @@ define ADD_INSTALL_RULE.a
+     install: $${${1}_INSTALLDIR}/$(notdir ${1})
+ 
+     # Install static library ${1}
+-    $${${1}_INSTALLDIR}/$(notdir ${1}): ${JLIBTOOL} ${1} | $${${1}_INSTALLDIR}
++    $${${1}_INSTALLDIR}/$(notdir ${1}): ${LIBTOOL} ${1} | $${${1}_INSTALLDIR}
+ 	@$(ECHO) INSTALL ${1}
+ 	$(Q)$${PROGRAM_INSTALL} -c -m 755 $${BUILD_DIR}/lib/${1} $${${1}_INSTALLDIR}/
+ 	$(Q)$${${1}_POSTINSTALL}
+@@ -87,9 +87,9 @@ define ADD_INSTALL_RULE.la
+     install: $${${1}_INSTALLDIR}/$(notdir ${1})
+ 
+     # Install libtool library ${1}
+-    $${${1}_INSTALLDIR}/$(notdir ${1}): ${JLIBTOOL} $${${1}_BUILD}/${1} | $${${1}_INSTALLDIR}
++    $${${1}_INSTALLDIR}/$(notdir ${1}): ${LIBTOOL} $${${1}_BUILD}/${1} | $${${1}_INSTALLDIR}
+ 	@$(ECHO) INSTALL ${1}
+-	$(Q)$${PROGRAM_INSTALL} -c -m 755 $${LOCAL_FLAGS_MIN} $${BUILD_DIR}/lib/${1} $${${1}_INSTALLDIR}/
++	$(Q)$${PROGRAM_INSTALL} -c -m 755 $${BUILD_DIR}/lib/${1} $${${1}_INSTALLDIR}/
+ 	$(Q)$${${1}_POSTINSTALL}
+ 
+ endef
+@@ -107,7 +107,7 @@ define ADD_INSTALL_RULE.man
+     install: ${2}/$(notdir ${1})
+ 
+     # Install manual page ${1}
+-    ${2}/$(notdir ${1}): ${JLIBTOOL} ${1} | ${2}
++    ${2}/$(notdir ${1}): ${LIBTOOL} ${1} | ${2}
+ 	@$(ECHO) INSTALL $(notdir ${1})
+ 	$(Q)$${PROGRAM_INSTALL} -c -m 644 ${1} ${2}/
+ 
+@@ -122,9 +122,9 @@ endef
+ define ADD_INSTALL_RULE.dir
+     # Install directory
+     .PHONY: ${1}
+-    ${1}: ${JLIBTOOL}
++    ${1}: ${LIBTOOL}
+ 	@$(ECHO) INSTALL -d -m 755 ${1}
+-	$(Q)$${PROGRAM_INSTALL} -d -m 755 ${1}
++	$(Q)$${INSTALL} -d -m 755 ${1}
+ endef
+ 
+ 
+diff --git a/scripts/libtool.mk b/scripts/libtool.mk
+index 57915e1..2cb2f7d 100644
+--- a/scripts/libtool.mk
++++ b/scripts/libtool.mk
+@@ -55,7 +55,9 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+     # Tell GNU Make to use this value, rather than anything specified
+     # on the command line.
+     override LIBTOOL := ${JLIBTOOL}
+-endif    # else we're not using jlibtool
++else    # else we're not using jlibtool
++    all install: ${LIBTOOL}
++endif
+ 
+ # When using libtool, it produces a '.libs' directory.  Ensure that it
+ # is removed on "make clean", too.
+@@ -69,11 +71,19 @@ clean: .libs_clean
+ # Re-define compilers and linkers
+ #
+ OBJ_EXT = lo
+-COMPILE.c = ${LIBTOOL} --silent --mode=compile ${CC}
+-COMPILE.cxx = ${LIBTOOL} --mode=compile ${CXX}
+-LINK.c = ${LIBTOOL} --silent --mode=link ${CC}
+-LINK.cxx = ${LIBTOOL} --mode=link ${CXX}
+-PROGRAM_INSTALL = ${LIBTOOL} --silent --mode=install ${INSTALL}
++ifeq "${LIBTOOL}" "JLIBTOOL"
++    COMPILE.c = ${LIBTOOL} --silent --mode=compile ${CC}
++    COMPILE.cxx = ${LIBTOOL} --mode=compile ${CXX}
++    LINK.c = ${LIBTOOL} --silent --mode=link ${CC}
++    LINK.cxx = ${LIBTOOL} --mode=link ${CXX}
++    PROGRAM_INSTALL = ${LIBTOOL} --silent --mode=install ${INSTALL}
++else
++    COMPILE.c = ${LIBTOOL} --mode=compile --tag=CC ${CC}
++    COMPILE.cxx = ${LIBTOOL} --mode=compile --tag=CC ${CXX}
++    LINK.c = ${LIBTOOL} --mode=link --tag=CC ${CC} -module -export-dynamic
++    LINK.cxx = ${LIBTOOL} --mode=link --tag=CC ${CXX} -module -export-dynamic
++    PROGRAM_INSTALL = ${LIBTOOL} --mode=install ${INSTALL}
++endif
+ 
+ 
+ # LIBTOOL_ENDINGS - Given a library ending in ".a" or ".so", replace that
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
new file mode 100644
index 000000000..675940dd6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
@@ -0,0 +1,33 @@
+From a0bf65e04d2bbd3271cab94bd5ac93f8e877bfc5 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 27 Jan 2016 05:07:19 -0500
+Subject: [PATCH] rlm_python: add PY_INC_DIR in search dir
+
+Upstream-Status: Pending
+
+configure option --with-rlm-python-include-dir is used to set
+PY_INC_DIR which is never used and it fails to find Python.h,
+so add it into search dir to fix it.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_python/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/rlm_python/configure.ac b/src/modules/rlm_python/configure.ac
+index 831a33a..c3792d8 100644
+--- a/src/modules/rlm_python/configure.ac
++++ b/src/modules/rlm_python/configure.ac
+@@ -93,7 +93,7 @@ if test x$with_[]modname != xno; then
+ 
+ 		old_CFLAGS=$CFLAGS
+ 		CFLAGS="$CFLAGS $PY_CFLAGS"
+-		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION"
++		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION $PY_INC_DIR"
+ 		FR_SMART_CHECK_INCLUDE(Python.h)
+ 		CFLAGS=$old_CFLAGS
+ 
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf b/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
new file mode 100644
index 000000000..fa6296297
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
@@ -0,0 +1,2 @@
+d /var/log/radius  0755 radiusd radiusd -
+d /var/run/radiusd 0755 radiusd radiusd -
diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
new file mode 100644
index 000000000..899c4e495
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=FreeRADIUS high performance RADIUS server.
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=@STATEDIR@/run/radiusd/radiusd.pid
+ExecStartPre=-@BASE_BINDIR@/chown -R radiusd.radiusd @STATEDIR@/run/radiusd
+ExecStartPre=-@BASE_BINDIR@/sh -c "if [ ! -f @SYSCONFDIR@/raddb/certs/server.pem ]; then sudo -u radiusd @SYSCONFDIR@/raddb/certs/bootstrap; fi"
+ExecStartPre=@SBINDIR@/radiusd -C
+ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
+ExecReload=@SBINDIR@/radiusd -C
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd b/meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd
new file mode 100644
index 000000000..8cbdae8a6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d radiusd radiusd 0755 /var/run/radiusd none
+d radiusd radiusd 0755 /var/log/radius none
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.12.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.12.bb
new file mode 100644
index 000000000..e46a8ba08
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.12.bb
@@ -0,0 +1,223 @@
+DESCRIPTION = "FreeRADIUS is an Internet authentication daemon, which implements the RADIUS \
+protocol, as defined in RFC 2865 (and others). It allows Network Access \
+Servers (NAS boxes) to perform authentication for dial-up users. There are \
+also RADIUS clients available for Web servers, firewalls, Unix logins, and \
+more.  Using RADIUS allows authentication and authorization for a network to \
+be centralized, and minimizes the amount of re-configuration which has to be \
+done when adding or deleting new users."
+
+SUMMARY = "High-performance and highly configurable RADIUS server"
+HOMEPAGE = "http://www.freeradius.org/"
+SECTION = "System/Servers"
+LICENSE = "GPLv2 & LGPLv2+"
+DEPENDS = "openssl-native openssl libtool libpcap libtalloc"
+
+SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/old/freeradius-server-${PV}.tar.bz2 \
+    file://freeradius \
+    file://volatiles.58_radiusd \
+    file://freeradius-enble-user-in-conf.patch \
+    file://freeradius-configure.ac-allow-cross-compilation.patch \
+    file://freeradius-fix-issues-related-to-m4-include-path.patch \
+    file://freeradius-libtool-detection.patch \
+    file://freeradius-configure.ac-add-option-for-libcap.patch \
+    file://freeradius-avoid-searching-host-dirs.patch \
+    file://freeradius-rlm_python-add-PY_INC_DIR.patch \
+    file://freeradius-libtool-do-not-use-jlibtool.patch \
+    file://freeradius-fix-quoting-for-BUILT_WITH.patch \
+    file://freeradius-fix-error-for-expansion-of-macro.patch \
+    file://radiusd.service \
+    file://radiusd-volatiles.conf \
+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
+SRC_URI[md5sum] = "108a5c12cff8d92b0f905c74841e29c5"
+SRC_URI[sha256sum] = "fe4e1f52cc2873f6aee2b12b0f03236978e4632f2acf298f834686b240c4183d"
+
+PARALLEL_MAKE = ""
+
+S = "${WORKDIR}/freeradius-server-${PV}"
+
+EXTRA_OECONF = " --enable-strict-dependencies \
+        --with-docdir=${docdir}/freeradius-${PV} \
+        --with-openssl-includes=${STAGING_INCDIR} \
+        --with-openssl-libraries=${STAGING_LIBDIR} \
+        --without-rlm_ippool \
+        --without-rlm_cache_memcached \
+        --without-rlm_counter \
+        --without-rlm_couchbase \
+        --without-rlm_dbm \
+        --without-rlm_eap_tnc \
+        --without-rlm_eap_ikev2 \
+        --without-rlm_opendirectory \
+        --without-rlm_redis \
+        --without-rlm_rediswho \
+        --without-rlm_sql_db2 \
+        --without-rlm_sql_firebird \
+        --without-rlm_sql_freetds \
+        --without-rlm_sql_iodbc \
+        --without-rlm_sql_oracle \
+        --without-rlm_sql_sybase \
+        --without-rlm_sqlhpwippool \
+        --without-dhcp \
+        ac_cv_path_PERL=${bindir}/perl \
+        ax_cv_cc_builtin_choose_expr=no \
+        ax_cv_cc_builtin_types_compatible_p=no \
+        ax_cv_cc_builtin_bswap64=no \
+        ax_cv_cc_bounded_attribute=no \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   pcre libcap \
+"
+
+PACKAGECONFIG[krb5] = "--with-rlm_krb5,--without-rlm_krb5,krb5"
+PACKAGECONFIG[pam] = "--with-rlm_pam,--without-rlm_pam,libpam"
+PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
+PACKAGECONFIG[ldap] = "--with-rlm_ldap,--without-rlm_ldap,openldap"
+PACKAGECONFIG[mysql] = "--with-rlm_sql_mysql,--without-rlm_sql_mysql,mysql5"
+PACKAGECONFIG[sqlite] = "--with-rlm_sql_sqlite,--without-rlm_sql_sqlite,sqlite3"
+PACKAGECONFIG[unixodbc] = "--with-rlm_sql_unixodbc,--without-rlm_sql_unixodbc,unixodbc"
+PACKAGECONFIG[postgresql] = "--with-rlm_sql_postgresql,--without-rlm_sql_postgresql,postgresql"
+PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
+PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --with-rlm_perl,--without-rlm_perl,perl-native perl,perl"
+PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
+PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
+PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
+
+inherit useradd autotools-brokensep update-rc.d systemd
+
+# This is not a cpan or python based package, but it needs some definitions
+# from cpan-base and python-dir bbclasses for building rlm_perl and rlm_python
+# correctly.
+inherit cpan-base python-dir
+
+# The modules subdirs also need to be processed by autoreconf. Use autogen.sh
+# in order to handle the subdirs correctly.
+do_configure () {
+    ./autogen.sh
+
+    # the configure of rlm_perl needs this to get correct
+    # mod_cflags and mod_ldflags
+    if ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'true', 'false', d)}; then
+        export PERL5LIB="${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+    fi
+
+    oe_runconf
+
+    # we don't need dhcpclient
+    sed -i -e 's/dhcpclient.mk//' ${S}/src/modules/proto_dhcp/all.mk
+}
+
+INITSCRIPT_NAME = "radiusd"
+
+SYSTEMD_SERVICE_${PN} = "radiusd.service"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --shell /bin/false --user-group radiusd"
+
+do_install() {
+    rm -rf ${D}
+    mkdir -p ${D}/${sysconfdir}/logrotate.d
+    mkdir -p ${D}/${sysconfdir}/pam.d
+    mkdir -p ${D}/${sysconfdir}/init.d
+    mkdir -p ${D}/${localstatedir}/lib/radiusd
+    mkdir -p ${D}${sysconfdir}/default/volatiles
+
+    export LD_LIBRARY_PATH=${D}/${libdir}
+    oe_runmake install R=${D} INSTALLSTRIP=""
+
+    # remove unsupported config files
+    rm -f ${D}/${sysconfdir}/raddb/experimental.conf
+
+    # remove scripts that required Perl(DBI)
+    rm -rf ${D}/${bindir}/radsqlrelay
+
+    cp -f ${WORKDIR}/freeradius ${D}/etc/init.d/radiusd
+    rm -f ${D}/${sbindir}/rc.radiusd
+    chmod +x ${D}/${sysconfdir}/init.d/radiusd
+    rm -rf ${D}/${localstatedir}/run/
+    install -m 0644 ${WORKDIR}/volatiles.58_radiusd  ${D}${sysconfdir}/default/volatiles/58_radiusd
+
+    chown -R radiusd:radiusd ${D}/${sysconfdir}/raddb/
+    chown -R radiusd:radiusd ${D}/${localstatedir}/lib/radiusd
+
+    # For systemd
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/radiusd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+           -e 's,@SBINDIR@,${sbindir},g' \
+           -e 's,@STATEDIR@,${localstatedir},g' \
+           -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+           ${D}${systemd_unitdir}/system/radiusd.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/
+    fi
+}
+
+# This is only needed when we install/update on a running target.
+#
+pkg_postinst_${PN} () {
+    if [ -z "$D" ]; then
+        if command -v systemd-tmpfiles >/dev/null; then
+            # create /var/log/radius, /var/run/radiusd
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/radiusd-volatiles.conf
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+
+        # Fix ownership for /etc/raddb/*, /var/lib/radiusd
+        chown -R radiusd:radiusd ${sysconfdir}/raddb
+        chown -R radiusd:radiusd ${localstatedir}/lib/radiusd
+    fi
+}
+
+# We really need the symlink :(
+INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP_${PN}-krb5 = "dev-so"
+INSANE_SKIP_${PN}-ldap = "dev-so"
+INSANE_SKIP_${PN}-mysql = "dev-so"
+INSANE_SKIP_${PN}-perl = "dev-so"
+INSANE_SKIP_${PN}-postgresql = "dev-so"
+INSANE_SKIP_${PN}-python = "dev-so"
+INSANE_SKIP_${PN}-unixodbc = "dev-so"
+
+PACKAGES =+ "${PN}-utils ${PN}-ldap ${PN}-krb5 ${PN}-perl \
+    ${PN}-python ${PN}-mysql ${PN}-postgresql ${PN}-unixodbc"
+
+FILES_${PN}-utils = "${bindir}/*"
+
+FILES_${PN}-ldap = "${libdir}/rlm_ldap.so* \
+    ${sysconfdir}/raddb/mods-available/ldap \
+"
+
+FILES_${PN}-krb5 = "${libdir}/rlm_krb5.so* \
+    ${sysconfdir}/raddb/mods-available/krb5 \
+"
+
+FILES_${PN}-perl = "${libdir}/rlm_perl.so* \
+    ${sysconfdir}/raddb/mods-config/perl \
+    ${sysconfdir}/raddb/mods-available/perl \
+"
+
+FILES_${PN}-python = "${libdir}/rlm_python.so* \
+    ${sysconfdir}/raddb/mods-config/python \
+    ${sysconfdir}/raddb/mods-available/python \
+"
+
+FILES_${PN}-mysql = "${libdir}/rlm_sql_mysql.so* \
+    ${sysconfdir}/raddb/mods-config/sql/*/mysql \
+    ${sysconfdir}/raddb/mods-available/sql \
+"
+
+FILES_${PN}-postgresql = "${libdir}/rlm_sql_postgresql.so* \
+    ${sysconfdir}/raddb/mods-config/sql/*/postgresql \
+"
+
+FILES_${PN}-unixodbc = "${libdir}/rlm_sql_unixodbc.so*"
+
+FILES_${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
+
+RDEPENDS_${PN} += "perl"
+RDEPENDS_${PN}-utils = "${PN}"
-- 
2.11.0


