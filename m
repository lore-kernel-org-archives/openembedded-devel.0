Return-Path: <diego.ml@zoho.com>
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id AE0F8771C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 10:13:47 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=jz0JvTWuh3HV52x09UmVQFPBRe5F3ZX9Lj21DGzERGkX2fhveL4EC0DdqhXx692hZo6ZEf1lwaUC
	+eKtOeAgUTJGbi/U1m2G8+kGi+S+RqYXDtzDJhCZ7opGT6y+krT6  
Received: from ip-172-31-0-222.eu-west-1.compute.internal
	(ec2-52-48-117-71.eu-west-1.compute.amazonaws.com
	[52.48.117.71]) by mx.zohomail.com
	with SMTPS id 1455876826781668.3766595107965;
	Fri, 19 Feb 2016 02:13:46 -0800 (PST)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 10:14:14 +0000
Message-Id: <1455876854-26871-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB UW UB ODL   SGR3_1_0_04026_43
X-ZohoMail-Owner: <1455876854-26871-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 52.48.117.71
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [meta-webserver][PATCH v2] webmin: adjust mysql module default config
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
X-List-Received-Date: Fri, 19 Feb 2016 10:13:47 -0000

Default config of the mysql Webmin module uses paths of a manually installed
MySQL. This commit adjusts paths to the ones used by MariaDB in OE.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../webmin/files/mysql-config-fix.patch            | 50 ++++++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.750.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
new file mode 100644
index 0000000..2cbc627
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
@@ -0,0 +1,50 @@
+From 719206df606acd7a623e8d75da293c25489b7884 Mon Sep 17 00:00:00 2001
+From: Diego Rondini <diego.ml@zoho.com>
+Date: Thu, 18 Feb 2016 15:44:06 +0100
+Subject: [PATCH] Adjust Mysql config defaults
+
+Upstream-status: Inappropriate [configuration]
+
+Signed-off-by: Diego Rondini <diego.ml@zoho.com>
+---
+ mysql/config | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/mysql/config b/mysql/config
+index e5b6fb3..77bfe69 100644
+--- a/mysql/config
++++ b/mysql/config
+@@ -1,13 +1,13 @@
+-start_cmd=cd /usr/local/mysql ; (./bin/safe_mysqld || ./bin/mysqld_safe) &
++start_cmd=/usr/bin/mysqld_safe
+ perpage=25
+-mysql=/usr/local/mysql/bin/mysql
+-mysqldump=/usr/local/mysql/bin/mysqldump
+-mysqlimport=/usr/local/mysql/bin/mysqlimport
+-pass=foo
+-mysqlshow=/usr/local/mysql/bin/mysqlshow
++mysql=/usr/bin/mysql
++mysqldump=/usr/bin/mysqldump
++mysqlimport=/usr/bin/mysqlimport
++pass=
++mysqlshow=/usr/bin/mysqlshow
+ login=root
+-mysql_libs=/usr/local/mysql/lib
+-mysqladmin=/usr/local/mysql/bin/mysqladmin
++mysql_libs=/usr/lib
++mysqladmin=/usr/bin/mysqladmin
+ style=0
+ add_mode=1
+ nodbi=0
+@@ -15,7 +15,7 @@ access=*: *
+ blob_mode=0
+ date_subs=0
+ passwd_mode=0
+-mysql_data=/usr/local/mysql/var
++mysql_data=/var/lib/mysql
+ max_dbs=50
+ my_cnf=/etc/my.cnf
+ max_text=1000
+-- 
+2.5.0
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
index 46478f0..34052a1 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://net-lib.pl.patch \
            file://media-tomb.patch \
            file://remove-python2.3.patch \
+           file://mysql-config-fix.patch \
             "
 
 SRC_URI[md5sum] = "4007c390323d840f26c2e0f43c5c81a3"
-- 
1.9.1



