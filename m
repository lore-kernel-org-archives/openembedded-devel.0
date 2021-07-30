Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.23075.1627647224930440872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 05:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16UCDh4R032250
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 05:13:43 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16UCDhP9020958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 05:13:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 30 Jul 2021 05:13:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 30 Jul 2021 05:13:42 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: redefine log-error item
Date: Fri, 30 Jul 2021 20:11:28 +0800
Message-ID: <20210730121128.31993-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The log-error item which defined in my.cnf is "/var/log/mysqld.err"
previouly and it's not consistent with which created in install_db
service file which will call mysql-systemd-start to create the file
"/var/log/mysqld.log".

And it fails when boot with sysvinit as below:
 $ service mysqld start
 Starting MariaDB.210727 04:05:03 mysqld_safe Logging to '/var/log/mysqld.err'.
 210727 04:05:03 mysqld_safe Starting mariadbd daemon with databases from /var/lib/mysql
 /usr/bin/mysqld_safe_helper: Can't create/write to file '/var/log/mysqld.err' (Errcode: 13 "Permission denied")

So make the log-error item consistent to fix the above failure
and also remove the related workaround when boot with systemd.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc    | 5 -----
 meta-oe/recipes-dbs/mysql/mariadb/my.cnf | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 5787ae4bd..7cf08f471 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -168,11 +168,6 @@ do_install() {
     sed -i -e 's,@BINDIR@,${bindir},g' -e 's,@PREFIX@,${prefix},g' ${D}${systemd_unitdir}/system/mysqld.service \
                                                                    ${D}${systemd_unitdir}/system/install_db.service
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "f /var/log/mysqld.err 0640 mysql mysql -" \
-            > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
-    fi
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/mysql-systemd-start ${D}${bindir}
     install -d ${D}${datadir}/doc/${PN}
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/my.cnf b/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
index dc4c172e5..75db46a55 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
@@ -10,7 +10,7 @@ user 						= mysql
 port 						= 3306
 socket 						= /var/lib/mysql/mysql.sock
 pid-file 					= /var/lib/mysql/mysqld.pid
-log-error 					= /var/log/mysqld.err
+log-error 					= /var/log/mysqld.log
 basedir 					= /usr
 datadir 					= /var/lib/mysql
 skip-external-locking
-- 
2.17.1

