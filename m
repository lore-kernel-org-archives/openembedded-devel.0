Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6442.1626060210694460085
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jul 2021 20:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16C3NTO6032296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jul 2021 20:23:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 11 Jul 2021 20:23:28 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 11 Jul 2021 20:23:28 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: fix failures to start install_db.service
Date: Mon, 12 Jul 2021 11:23:23 +0800
Message-ID: <20210712032323.13141-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to start install_db.service when install mariadb-setupdb from a
package repo via dnf:

root@qemux86-64:~# systemctl status install_db
x install_db.service - Install MySQL Community Server Database
     Loaded: loaded (/lib/systemd/system/install_db.service; enabled; vendor preset: enabled)
     Active: failed (Result: exit-code) since Fri 2021-07-09 02:55:12 UTC; 5s ago
    Process: 504 ExecStart=/usr/bin/mysql-systemd-start pre (code=exited, status=203/EXEC)
   Main PID: 504 (code=exited, status=203/EXEC)

Jul 09 02:55:12 qemux86-64 systemd[1]: Starting Install MySQL Community Server Database...
Jul 09 02:55:12 qemux86-64 systemd[504]: install_db.service: Failed to locate executable /usr/bin/mysql-systemd-start: No such file or directo>
Jul 09 02:55:12 qemux86-64 systemd[504]: install_db.service: Failed at step EXEC spawning /usr/bin/mysql-systemd-start: No such file or direct>
Jul 09 02:55:12 qemux86-64 systemd[1]: install_db.service: Main process exited, code=exited, status=203/EXEC
Jul 09 02:55:12 qemux86-64 systemd[1]: install_db.service: Failed with result 'exit-code'.
Jul 09 02:55:12 qemux86-64 systemd[1]: Failed to start Install MySQL Community Server Database.

The scripts required by install_db.service are packaged in
mariadb-server which depends on mariadb-setupdb already. So move the
scripts to mariadb-setupdb to make sure start install_db.service
successfully. And move creating user 'mysql' in mariadb-setupdb as well.
Packageconfig 'setupdb' has been useless from last upgrade, so remove it
at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 71978740b..5787ae4bd 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -36,15 +36,15 @@ BINCONFIG_GLOB = "mysql_config"
 inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-server:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db"
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME_${PN}-server = "mysqld"
 INITSCRIPT_PARAMS_${PN}-server ?= "start 45 5 . stop 45 0 6 1 ."
 
-USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
-GROUPADD_PARAM_${PN}-server = "--system mysql"
+USERADD_PACKAGES = "${PN}-setupdb"
+USERADD_PARAM_${PN}-setupdb = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
+GROUPADD_PARAM_${PN}-setupdb = "--system mysql"
 
 INITSCRIPT_NAME_${PN}-setupdb = "install_db"
 INITSCRIPT_PARAMS_${PN}-setupdb ?= "defaults 44 44"
@@ -56,14 +56,18 @@ SYSTEMD_AUTO_ENABLE_${PN}-server ?= "disable"
 SYSTEMD_SERVICE_${PN}-setupdb = "install_db.service"
 SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?= "enable"
 ALLOW_EMPTY_${PN}-setupdb ?= "1"
-FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
+FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db \
+                       ${bindir}/mariadb-install-db \
+                       ${bindir}/my_print_defaults \
+                       ${bindir}/mysql_install_db \
+                       ${bindir}/mysql-systemd-start \
+                       "
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
-PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
 
 # MariaDB doesn't link properly with gold
@@ -185,10 +189,10 @@ do_install() {
     fi
 }
 
-PACKAGES = "${PN}-dbg ${PN} \
+PACKAGES = "${PN}-dbg ${PN}-setupdb ${PN} \
     libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev \
     libmysqlclient libmysqlclient-dev libmysqlclient-staticdev \
-    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-setupdb ${PN}-leftovers"
+    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf ${sysconfdir}/my.cnf.d/server.cnf"
 CONFFILES_${PN}-client += "${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 CONFFILES_libmysqlclient += "${sysconfdir}/my.cnf.d/client.cnf"
@@ -291,7 +295,6 @@ FILES_${PN}-server = "\
     ${bindir}/mysql_convert_table_format \
     ${bindir}/mariadb-convert-table-format \
     ${bindir}/mysql_install_db \
-    ${bindir}/mariadb-install-db \
     ${bindir}/mysql_secure_installation \
     ${bindir}/mariadb-secure-installation \
     ${bindir}/mysql_setpermission \
-- 
2.17.1

