Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.105897.1597908750518783568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 00:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07K7WS3T008106
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 00:32:29 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 20 Aug 2020
 00:32:28 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: package executables named with mariadb
Date: Thu, 20 Aug 2020 00:32:28 -0700
Message-ID: <20200820073228.98628-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After mariadb upgrades to 10.5.x, the below commit introduced:
9e1b3af4a49 MDEV-21303 Make executables MariaDB named

Before the above commit:
 $ ls -l tmp-glibc/work/core2-64-wrs-linux/mariadb/10.4.12-r0/build/scripts/mysql_install_db
 -rwxr-xr-x 1 myu users 21649 Aug 20 10:36 tmp-glibc/work/core2-64-wrs-linux/mariadb/10.4.12-r0/build/scripts/mysql_install_db
 $ ls -l tmp-glibc/work/core2-64-wrs-linux/mariadb/10.4.12-r0/build/scripts/mariadb-install-db
 lrwxrwxrwx 1 myu users 16 Aug 20 10:36 tmp-glibc/work/core2-64-wrs-linux/mariadb/10.4.12-r0/build/scripts/mariadb-install-db -> mysql_install_db

After the above commit:
 $ ls -l tmp-glibc/work/corei7-64-wrs-linux/mariadb/10.5.4-r0/build/scripts/mysql_install_db
 lrwxrwxrwx 1 myu users 18 Aug 19 15:02 tmp-glibc/work/corei7-64-wrs-linux/mariadb/10.5.4-r0/build/scripts/mysql_install_db -> mariadb-install-db
 $ ls -l tmp-glibc/work/corei7-64-wrs-linux/mariadb/10.5.4-r0/build/scripts/mariadb-install-db
 -rwxr-xr-x 1 myu users 21630 Aug 19 15:02 tmp-glibc/work/corei7-64-wrs-linux/mariadb/10.5.4-r0/build/scripts/mariadb-install-db

So package the corresponding mariadb named executables to -server and
-client packages and also correct MULTILIB_SCRIPTS part accordingly.

Also cleanup some deprecated files defined for mariadb-server
and mariadb-client.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 52 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1aa1f68cd..46a64006d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -31,7 +31,8 @@ BINCONFIG_GLOB = "mysql_config"
 
 inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
 
-MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mysql_install_db ${PN}-server:${bindir}/mysqld_safe"
+MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
+                    ${PN}-server:${bindir}/mariadb-install-db"
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME_${PN}-server = "mysqld"
@@ -243,69 +244,78 @@ FILES_libmysqld-dev = "\
 FILES_${PN}-client = "\
     ${bindir}/myisam_ftdump \
     ${bindir}/mysql \
+    ${bindir}/mariadb \
     ${bindir}/mysql_client_test \
+    ${bindir}/mariadb-client-test \
     ${bindir}/mysql_client_test_embedded \
+    ${bindir}/mariadb-client-test-embedded \
     ${bindir}/mysql_find_rows \
+    ${bindir}/mariadb-find-rows \
     ${bindir}/mysql_fix_extensions \
+    ${bindir}/mariadb-fix-extensions \
     ${bindir}/mysql_waitpid \
+    ${bindir}/mariadb-waitpid \
     ${bindir}/mysqlaccess \
+    ${bindir}/mariadb-access \
     ${bindir}/mysqladmin \
-    ${bindir}/mysqlbug \
+    ${bindir}/mariadb-admin \
     ${bindir}/mysqlcheck \
+    ${bindir}/mariadb-check \
     ${bindir}/mysqldump \
+    ${bindir}/mariadb-dump \
     ${bindir}/mysqldumpslow \
+    ${bindir}/mariadb-dumpslow \
     ${bindir}/mysqlimport \
+    ${bindir}/mariadb-import \
     ${bindir}/mysqlshow \
+    ${bindir}/mariadb-show \
     ${bindir}/mysqlslap \
+    ${bindir}/mariadb-slap \
     ${bindir}/mysqltest_embedded \
+    ${bindir}/mariadb-test-embedded \
     ${libexecdir}/mysqlmanager \
     ${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 
 FILES_${PN}-server = "\
-    ${bindir}/comp_err \
-    ${bindir}/isamchk \
-    ${bindir}/isamlog \
     ${bindir}/msql2mysql \
     ${bindir}/my_print_defaults \
     ${bindir}/myisamchk \
     ${bindir}/myisamlog \
     ${bindir}/myisampack \
     ${bindir}/mysql_convert_table_format \
-    ${bindir}/mysql_fix_privilege_tables \
+    ${bindir}/mariadb-convert-table-format \
     ${bindir}/mysql_install_db \
+    ${bindir}/mariadb-install-db \
     ${bindir}/mysql_secure_installation \
+    ${bindir}/mariadb-secure-installation \
     ${bindir}/mysql_setpermission \
+    ${bindir}/mariadb-setpermission \
     ${bindir}/mysql-systemd-start \
     ${bindir}/mysql_tzinfo_to_sql \
+    ${bindir}/mariadb-tzinfo-to-sql \
     ${bindir}/mysql_upgrade \
+    ${bindir}/mariadb-upgrade \
     ${bindir}/mysql_plugin \
-    ${bindir}/mysql_zap \
+    ${bindir}/mariadb-plugin \
     ${bindir}/mysqlbinlog \
+    ${bindir}/mariadb-binlog \
     ${bindir}/mysqld_multi \
+    ${bindir}/mariadbd-multi \
+    ${bindir}/mariadbd-safe \
     ${bindir}/mysqld_safe \
     ${bindir}/mysqld_safe_helper \
+    ${bindir}/mariadbd-safe-helper \
     ${bindir}/mysqlhotcopy \
+    ${bindir}/mariadb-hotcopy \
     ${bindir}/mysqltest \
-    ${bindir}/ndb_delete_all \
-    ${bindir}/ndb_desc \
-    ${bindir}/ndb_drop_index \
-    ${bindir}/ndb_drop_table \
-    ${bindir}/ndb_mgm \
-    ${bindir}/ndb_restore \
-    ${bindir}/ndb_select_all \
-    ${bindir}/ndb_select_count \
-    ${bindir}/ndb_show_tables \
-    ${bindir}/ndb_waiter \
-    ${bindir}/pack_isam \
+    ${bindir}/mariadb-test \
     ${bindir}/perror \
     ${bindir}/replace \
     ${bindir}/resolve_stack_dump \
     ${bindir}/resolveip \
     ${libexecdir}/mysqld \
     ${sbindir}/mysqld \
-    ${sbindir}/ndb_cpcd \
-    ${sbindir}/ndbd \
-    ${sbindir}/ndb_mgmd \
+    ${sbindir}/mariadbd \
     ${libdir}/plugin/*.so \
     ${libdir}/security/*.so \
     ${libdir}/plugin/auth_pam_tool_dir/auth_pam_tool \
-- 
2.17.1

