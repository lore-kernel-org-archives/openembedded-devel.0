Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC586AC12
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 05:59:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t165xmnY023937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Feb 2015 21:59:48 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 5 Feb 2015 21:59:47 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Feb 2015 13:59:46 +0800
Message-ID: <1423202386-4040-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] mariadb: make it be able to work with SELinux
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
X-List-Received-Date: Fri, 06 Feb 2015 05:59:57 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. change the datadir from /var/mysql to /var/lib/mysql
2. after creating datedir, restorecon on it, make SELinux be able to
work
3. Add the PIDFile for systemd unit file, otherwise systemctl can not
stop mysqld

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc            | 1 +
 meta-oe/recipes-support/mysql/mariadb/my.cnf         | 2 +-
 meta-oe/recipes-support/mysql/mariadb/mysqld.service | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 8068862..f385bfc 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -128,6 +128,7 @@ pkg_postinst_${PN}-server () {
 
     mysql_install_db --basedir=${prefix} --user=mysql
 
+    [ -x /sbin/restorecon ] && /sbin/restorecon -RF /var/lib/mysql
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index 876ce36..28d3899 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -13,7 +13,7 @@ socket 						= /var/lib/mysql/mysql.sock
 pid-file 					= /var/lib/mysql/mysqld.pid
 log-error 					= /var/log/mysqld.err
 basedir 					= /usr
-datadir 					= /var/mysql
+datadir 					= /var/lib/mysql
 skip-external-locking
 skip-networking
 ignore-builtin-innodb
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
index 18ad8d5..757d038 100644
--- a/meta-oe/recipes-support/mysql/mariadb/mysqld.service
+++ b/meta-oe/recipes-support/mysql/mariadb/mysqld.service
@@ -4,6 +4,7 @@ After=syslog.target
 After=network.target
 
 [Service]
+PIDFile=/var/lib/mysql/mysqld.pid
 Type=simple
 User=mysql
 Group=mysql
-- 
2.1.0


