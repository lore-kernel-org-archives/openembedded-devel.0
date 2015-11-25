Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82B9A60621
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 02:05:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAP25dYW023099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Nov 2015 18:05:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 Nov 2015 18:04:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Nov 2015 10:04:31 +0800
Message-ID: <1448417071-10888-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
References: <1448077640-5771-1-git-send-email-hongxu.jia@windriver.com>
	<565025D3.4020401@windriver.com>
	<1448093606-8378-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1448093606-8378-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3] mariadb.inc: fix mysqld hung at first init time based on systemd
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
X-List-Received-Date: Wed, 25 Nov 2015 02:05:40 -0000
Content-Type: text/plain

While SYSTEMD_AUTO_ENABLE_mariadb-server = "enable", the mysqld service
hungs.
...
[    **] A start job is running for Run pending postinsts (25s / no limit)
[  OK  ] Stopped MariaDB database server.
...

In mariadb-server's pkg_postinst, it install db at first runtime. And the
following 'systemctl mysqld restart' casued the hunging. So the fix idea
is to reomove pkg_postinst and still install db at first runtime.

Introduce mysql-systemd-start from ${S}/packaging/rpm-oel/. For review
convenience, we add them as file.

The mysql-systemd-start provides two functions: the install_db is to install
db at fist runtime (the first runtime means if a db existed, the install_db
will directly exit); the pinger is to wait for mysqld service startup
completed.

The mysqld.service add ExecStartPost than previous which invoke
'mysql-systemd-start post' to wait for mysqld service startup completed.

We add a package to provide install_db, so the user could choose it
to install database for mariadb at first boot before mysqld started.

It also fix another issue:
When you manually restart mysqld and do mysql test to connect the server,
the return of the restart could make sure mysqld is ready, and the following db
connect will not fail with:
...
Can't connect to local MySQL server through socket
...

Tweak my.cnf to remove obsolete/incorrect parameter.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          | 51 +++++++++--------
 meta-oe/recipes-support/mysql/mariadb/install_db   | 13 +++++
 .../mysql/mariadb/install_db.service               | 17 ++++++
 meta-oe/recipes-support/mysql/mariadb/my.cnf       |  1 -
 .../mysql/mariadb/mysql-systemd-start              | 66 ++++++++++++++++++++++
 .../recipes-support/mysql/mariadb/mysqld.service   |  9 +++
 6 files changed, 132 insertions(+), 25 deletions(-)
 create mode 100755 meta-oe/recipes-support/mysql/mariadb/install_db
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/install_db.service
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 42a4eda..a6826c3 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -10,6 +10,9 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
            file://mysqld.service \
+           file://install_db.service \
+           file://install_db \
+           file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
           "
@@ -23,26 +26,35 @@ BINCONFIG_GLOB = "mysql_config"
 
 inherit cmake gettext binconfig update-rc.d useradd systemd
 
-INITSCRIPT_PACKAGES = "${PN}-server"
-INITSCRIPT_NAME = "mysqld"
-INITSCRIPT_PARAMS = "start 45 5 . stop 45 0 6 1 ."
+INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
+INITSCRIPT_NAME_${PN}-server = "mysqld"
+INITSCRIPT_PARAMS_${PN}-server ?= "start 45 5 . stop 45 0 6 1 ."
 
 USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
 GROUPADD_PARAM_${PN}-server = "--system mysql"
 
-SYSTEMD_PACKAGES = "${PN}-server"
+INITSCRIPT_NAME_${PN}-setupdb = "install_db"
+INITSCRIPT_PARAMS_${PN}-setupdb ?= "defaults 44 44"
+
+SYSTEMD_PACKAGES = "${PN}-server ${PN}-setupdb"
 SYSTEMD_SERVICE_${PN}-server = "mysqld.service"
-SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
+SYSTEMD_AUTO_ENABLE_${PN}-server ?= "disable"
+
+SYSTEMD_SERVICE_${PN}-setupdb = "install_db.service"
+SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?= "enable"
+ALLOW_EMPTY_${PN}-setupdb ?= "1"
+FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} setupdb"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[libedit] = "-DLIBEDIT_INTERFACE=TRUE,-DLIBEDIT_INTERFACE=FALSE,libedit"
 PACKAGECONFIG[krb5] = ", ,krb5"
+PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
@@ -114,39 +126,29 @@ do_install() {
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
+    install -m 0755 ${WORKDIR}/install_db ${D}/${sysconfdir}/init.d/
     mv ${D}/${sysconfdir}/init.d/mysql ${D}/${sysconfdir}/init.d/mysqld
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/mysqld.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BINDIR@,${bindir},g' -e 's,@PREFIX@,${prefix},g' ${D}${systemd_unitdir}/system/mysqld.service
+    install -m 0644 ${WORKDIR}/install_db.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BINDIR@,${bindir},g' -e 's,@PREFIX@,${prefix},g' ${D}${systemd_unitdir}/system/mysqld.service \
+                                                                   ${D}${systemd_unitdir}/system/install_db.service
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	echo "f /var/log/mysqld.err 0640 mysql mysql -" \
             > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
     fi
-}
-
-pkg_postinst_${PN}-server () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    #Install the database
-    test -d /usr/bin || mkdir -p /usr/bin
-    test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
-    mkdir /var/lib/mysql
-    chown mysql.mysql /var/lib/mysql
-
-    mysql_install_db --basedir=${prefix} --user=mysql
+    install -d ${D}${bindir}
+    install -m 755 ${WORKDIR}/mysql-systemd-start ${D}${bindir}
 
-    [ -x /sbin/restorecon ] && /sbin/restorecon -RF /var/lib/mysql
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
     libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \
     libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \
-    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-leftovers"
+    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-setupdb ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf ${sysconfdir}/my.cnf.d/server.cnf"
 CONFFILES_${PN}-client += "${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 CONFFILES_libmysqlclient += "${sysconfdir}/my.cnf.d/client.cnf"
@@ -236,6 +238,7 @@ FILES_${PN}-server = "\
     ${bindir}/mysql_install_db \
     ${bindir}/mysql_secure_installation \
     ${bindir}/mysql_setpermission \
+    ${bindir}/mysql-systemd-start \
     ${bindir}/mysql_tzinfo_to_sql \
     ${bindir}/mysql_upgrade \
     ${bindir}/mysql_plugin \
@@ -268,7 +271,7 @@ FILES_${PN}-server = "\
     ${libdir}/plugin/*.so \
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
-    ${sysconfdir}/init.d \
+    ${sysconfdir}/init.d/mysqld \
     ${sysconfdir}/my.cnf \
     ${sysconfdir}/my.cnf.d/server.cnf \
     ${sysconfdir}/tmpfiles.d"
diff --git a/meta-oe/recipes-support/mysql/mariadb/install_db b/meta-oe/recipes-support/mysql/mariadb/install_db
new file mode 100755
index 0000000..512a7da
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/install_db
@@ -0,0 +1,13 @@
+#! /bin/sh
+case "$1" in
+  start)
+	echo "Starting to install database for mariadb"
+	/usr/bin/mysql-systemd-start pre
+        echo "done."
+	;;
+  *)
+	echo "Usage: /etc/init.d/install_db start"
+	exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/mysql/mariadb/install_db.service b/meta-oe/recipes-support/mysql/mariadb/install_db.service
new file mode 100644
index 0000000..c8369f5
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/install_db.service
@@ -0,0 +1,17 @@
+#
+# Simple install MySQL database service file
+# It shoulb be done before mysqld.service
+
+[Unit]
+Description=Install MySQL Community Server Database
+After=network.target
+After=syslog.target
+Before=mysqld.service
+
+[Install]
+WantedBy=multi-user.target
+
+[Service]
+Type=oneshot
+ExecStart=@BINDIR@/mysql-systemd-start pre
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index 28d3899..dc4c172 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -4,7 +4,6 @@ port						= 3306
 socket						= /var/lib/mysql/mysql.sock
 
 [mysqld_safe]
-err-log						= /var/log/mysql.err
 
 [mysqld]
 user 						= mysql
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start b/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
new file mode 100644
index 0000000..189c020
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
@@ -0,0 +1,66 @@
+#! /bin/sh
+#
+# Needed argument: pre | post
+#
+# pre mode  :  try to run mysql_install_db and fix perms and SELinux contexts
+# post mode :  ping server until answer is received
+#
+
+get_option () {
+    local section=$1
+    local option=$2
+    local default=$3
+    ret=$(/usr/bin/my_print_defaults $section | grep '^--'${option}'=' | cut -d= -f2-)
+    [ -z $ret ] && ret=$default
+    echo $ret
+}
+
+install_db () {
+    # Note: something different than datadir=/var/lib/mysql requires SELinux policy changes (in enforcing mode)
+    datadir=$(get_option mysqld datadir "/var/lib/mysql")
+
+    # Restore log, dir, perms and SELinux contexts
+    [ -d "$datadir" ] || install -d -m 0755 -omysql -gmysql "$datadir" || exit 1
+    log=/var/log/mysqld.log
+    [ -e $log ] || touch $log
+    chmod 0640 $log
+    chown mysql:mysql $log || exit 1
+    if [ -x /usr/sbin/restorecon ]; then
+        /usr/sbin/restorecon "$datadir"
+        /usr/sbin/restorecon $log
+    fi
+
+    # If special mysql dir is in place, skip db install
+    [ -d "$datadir/mysql" ] && exit 0
+
+    # Create initial db
+    /usr/bin/mysql_install_db --rpm --datadir="$datadir" --user=mysql
+    exit 0
+}
+
+pinger () {
+    # Wait for ping to answer to signal startup completed,
+    # might take a while in case of e.g. crash recovery
+    # MySQL systemd service will timeout script if no answer
+    datadir=$(get_option mysqld datadir "/var/lib/mysql")
+    socket=$(get_option  mysqld socket "$datadir/mysql.sock")
+    case $socket in
+        /*) adminsocket="$socket" ;;
+        *) adminsocket="$datadir/$socket" ;;
+    esac
+
+    while /bin/true ; do
+        sleep 1
+        mysqladmin --no-defaults --socket="$adminsocket" --user=UNKNOWN_MYSQL_USER ping >/dev/null 2>&1 && break
+    done
+    exit 0
+}
+
+# main
+case $1 in
+    "pre") install_db ;;
+    "post") pinger ;;
+esac
+
+exit 0
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
index 757d038..d883617 100644
--- a/meta-oe/recipes-support/mysql/mariadb/mysqld.service
+++ b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
@@ -8,7 +8,16 @@ PIDFile=/var/lib/mysql/mysqld.pid
 Type=simple
 User=mysql
 Group=mysql
+
+# Execute post scripts as root
+PermissionsStartOnly=true
+
+# Start main service
 ExecStart=@BINDIR@/mysqld_safe --basedir=@PREFIX@
+
+# Don't signal startup success before a ping works
+ExecStartPost=@BINDIR@/mysql-systemd-start post
+
 TimeoutSec=300
 PrivateTmp=true
 
-- 
1.9.1


