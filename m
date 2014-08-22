Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53F9C70E75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 02:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7M2b5c4004378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 19:37:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 19:37:05 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Aug 2014 10:37:33 +0800
Message-ID: <1408675054-4549-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mariadb: add systemd unit file
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
X-List-Received-Date: Fri, 22 Aug 2014 02:37:10 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The service file mainly comes from Fedora20.

This patch also adds a configuration file under /etc/tmpfiles.d so
that mysqld could start correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/mysql/mariadb/mysqld.service   |   15 +++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.38.inc   |   19 +++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/mysqld.service

diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
new file mode 100644
index 0000000..698e52d
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=MariaDB database server
+After=syslog.target
+After=network.target
+
+[Service]
+Type=simple
+User=mysql
+Group=mysql
+ExecStart=/usr/bin/mysqld_safe --basedir=/usr
+TimeoutSec=300
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
index 8a73833..83f2a92 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
@@ -9,6 +9,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
+           file://mysqld.service \
           "
 
 SRC_URI[md5sum] = "fa9ba00b084b95a45fab70860c412f10"
@@ -18,7 +19,7 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d useradd
+inherit cmake gettext binconfig update-rc.d useradd systemd
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
@@ -28,6 +29,10 @@ USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
 GROUPADD_PARAM_${PN}-server = "--system mysql"
 
+SYSTEMD_PACKAGES = "mariadb-server"
+SYSTEMD_SERVICE_mariadb-server = "mysqld.service"
+SYSTEMD_AUTO_ENABLE_mariadb-server = "disable"
+
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
 python __anonymous() {
@@ -112,6 +117,15 @@ do_install() {
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
     mv ${D}/${sysconfdir}/init.d/mysql ${D}/${sysconfdir}/init.d/mysqld
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/mysqld.service ${D}${systemd_unitdir}/system
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "f /var/log/mysqld.err 0640 mysql mysql -" \
+            > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
+    fi
 }
 
 pkg_postinst_${PN}-server () {
@@ -247,7 +261,8 @@ FILES_${PN}-server = "\
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d \
-    ${sysconfdir}/my.cnf"
+    ${sysconfdir}/my.cnf \
+    ${sysconfdir}/tmpfiles.d"
 
 DESCRIPTION_${PN}-leftovers = "unpackaged and probably unneeded files for ${PN}"
 FILES_${PN}-leftovers = "/"
-- 
1.7.9.5


