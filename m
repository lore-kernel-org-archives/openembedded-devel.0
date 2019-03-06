Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFB0E7C810
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 09:12:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x269Cwab024796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Mar 2019 01:12:58 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 6 Mar 2019 01:12:58 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Mar 2019 01:12:58 -0800
Message-ID: <20190306091258.59600-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mysql-python: fix compilation with MariaDB 10.3.13
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
X-List-Received-Date: Wed, 06 Mar 2019 09:12:59 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Use standard API function MYSQL_OPT_RECONNECT
instead of direct modification of internal structures
which does not work for MariaDB to fix below compile
issue.
| _mysql.c: In function '_mysql_ConnectionObject_ping':
| _mysql.c:2005:41: error: 'MYSQL' {aka 'struct st_mysql'} has no member named 'reconnect'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ompilation-with-MariaDB-with-10.3.13.patch | 39 +++++++++++++++++++
 .../recipes-dbs/mysql/mysql-python_1.2.5.bb   |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch

diff --git a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
new file mode 100644
index 000000000..b816618c7
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
@@ -0,0 +1,39 @@
+From 45436592aa64308b2ab46f84c6107c6d7de0a3ec Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 6 Mar 2019 00:16:17 -0800
+Subject: [PATCH] _mysql.c: fix compilation with MariaDB 10.3.13
+
+Use standard API function MYSQL_OPT_RECONNECT
+instead of direct modification of internal structures
+which does not work for MariaDB.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ _mysql.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/_mysql.c b/_mysql.c
+index f081346..2262e9e 100644
+--- a/_mysql.c
++++ b/_mysql.c
+@@ -2002,7 +2002,14 @@ _mysql_ConnectionObject_ping(
+ 	int r, reconnect = -1;
+ 	if (!PyArg_ParseTuple(args, "|I", &reconnect)) return NULL;
+ 	check_connection(self);
+-	if ( reconnect != -1 ) self->connection.reconnect = reconnect;
++	if ( reconnect != -1 ) {
++             #if MYSQL_VERSION_ID >= 50013
++		 my_bool recon = reconnect;
++		 mysql_options(&self->connection, MYSQL_OPT_RECONNECT, &recon);
++             #else
++                 self->connection.reconnect = reconnect;
++             #endif
++        }
+ 	Py_BEGIN_ALLOW_THREADS
+ 	r = mysql_ping(&(self->connection));
+ 	Py_END_ALLOW_THREADS
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index ac0df4f06..f2faec1c1 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -8,7 +8,9 @@ DEPENDS = "mysql5"
 
 SRCNAME = "MySQL-python"
 
-SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip"
+SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip \
+           file://0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch \
+"
 SRC_URI[md5sum] = "654f75b302db6ed8dc5a898c625e030c"
 SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e140c74"
 
-- 
2.17.1


