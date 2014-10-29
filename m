Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF48565D3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 06:13:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T6DWv2019946
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:13:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 23:13:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Oct 2014 14:15:09 +0800
Message-ID: <1414563309-26793-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: change socket location in my.cnf
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
X-List-Received-Date: Wed, 29 Oct 2014 06:13:37 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Change socket location to /var/lib/mysql/mysql.sock. Otherwise, we
could spot errors in systemd systems like below.

mysqladmin: connect to server at 'localhost' failed
error: 'Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)'
Check that mysqld is running and that the socket: '/tmp/mysql.sock' exists!

This is because mysqld.service is using PrivateTmp=true.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb/my.cnf |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index f2c9b90..c9b785b 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -1,7 +1,7 @@
 [client]
 #password					= password
 port						= 3306
-socket						= /tmp/mysql.sock
+socket						= /var/lib/mysql/mysql.sock
 
 [mysqld_safe]
 err-log						= /var/log/mysql.err
@@ -9,7 +9,7 @@ err-log						= /var/log/mysql.err
 [mysqld]
 user 						= mysql
 port 						= 3306
-socket 						= /tmp/mysql.sock
+socket 						= /var/lib/mysql/mysql.sock
 pid-file 					= /var/lib/mysql/mysqld.pid
 log-error 					= /var/log/mysqld.err
 basedir 					= /usr
-- 
1.7.9.5


