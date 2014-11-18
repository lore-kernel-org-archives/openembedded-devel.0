Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEF67211F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 09:54:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAI9stRD013654
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 01:54:55 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 18 Nov 2014 01:54:55 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Tue, 18 Nov 2014 17:54:37 +0800
Message-ID: <1416304478-31307-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
References: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] mariadb: re-package configure files
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
X-List-Received-Date: Tue, 18 Nov 2014 09:54:55 -0000
Content-Type: text/plain

There are 3 configure files under /etc/my.cnf.d:

client.cnf: options for client library
mysql-clients.cnf: options for MariaDB tools such as mysqladmin, etc
server.cnf: options for server

They are packaged to mariadb-leftover at this moment. That is not correct.
Split them into sub-packages:
client.cnf          --> libmysqlclient
mysql-clients.cnf   --> mariadb-client
server.cnf          --> mariadb-server

Make these files as configure file by CONFFILES and update global
configure file my.cnf to include /etc/my.cnf.d as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc    | 11 ++++++++---
 meta-oe/recipes-support/mysql/mariadb/my.cnf |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 3d0f593..a04288d 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -135,7 +135,9 @@ PACKAGES = "${PN}-dbg ${PN} \
     libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \
     libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \
     libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-leftovers"
-CONFFILES_${PN}-server += "${sysconfdir}/my.cnf"
+CONFFILES_${PN}-server += "${sysconfdir}/my.cnf ${sysconfdir}/my.cnf.d/server.cnf"
+CONFFILES_${PN}-client += "${sysconfdir}/my.cnf.d/mysql-clients.cnf"
+CONFFILES_libmysqlclient += "${sysconfdir}/my.cnf.d/client.cnf"
 
 FILES_${PN} = " "
 RDEPENDS_${PN} = "${PN}-client ${PN}-server"
@@ -155,7 +157,8 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-modu
     perl-module-io-socket-inet perl-module-io-select"
 
 FILES_libmysqlclient = "\
-    ${libdir}/libmysqlclient.so.*"
+    ${libdir}/libmysqlclient.so.* \
+    ${sysconfdir}/my.cnf.d/client.cnf"
 FILES_libmysqlclient-dev = " \
     ${includedir}/mysql/ \
     ${libdir}/libmysqlclient.so \
@@ -200,7 +203,8 @@ FILES_${PN}-client = "\
     ${bindir}/mysqlshow \
     ${bindir}/mysqlslap \
     ${bindir}/mysqltest_embedded \
-    ${libexecdir}/mysqlmanager"
+    ${libexecdir}/mysqlmanager \
+    ${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 
 FILES_${PN}-server = "\
     ${bindir}/comp_err \
@@ -250,6 +254,7 @@ FILES_${PN}-server = "\
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d \
     ${sysconfdir}/my.cnf \
+    ${sysconfdir}/my.cnf.d/server.cnf \
     ${sysconfdir}/tmpfiles.d"
 
 DESCRIPTION_${PN}-leftovers = "unpackaged and probably unneeded files for ${PN}"
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index c9b785b..876ce36 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -20,3 +20,7 @@ ignore-builtin-innodb
 default-storage-engine				= myisam
 bind-address					= localhost
 
+#
+# include all files from the config directory
+#
+!includedir /etc/my.cnf.d
-- 
1.9.1


