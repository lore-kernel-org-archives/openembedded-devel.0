Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.781.1596602865207798302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 21:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0754lCe3020193
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Aug 2020 21:47:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 4 Aug 2020 21:47:15 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: not use the bundled libpcre2
Date: Wed, 5 Aug 2020 12:42:58 +0800
Message-ID: <20200805044258.1154486-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

From mariadb 10.5.1, it starts to use pcre2 [1] which is the bundled
libpre2 by default. If using the bundled one, it will fetch, unpack
and build the libpcre2 during mariadb do_compile phase as mariadb uses
the bundled libpcre2 as an external project, more details in [2].

To avoid downloading the libpcre2 source from website during mariadb
do_compile phase, switch to use the system libpcre2.

[1] https://mariadb.com/kb/en/pcre/
[2] https://github.com/MariaDB/server/blob/10.5/cmake/pcre.cmake

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb | 2 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc              | 1 +
 meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb        | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
index e1a038dfa..73b2a0980 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 inherit native
 
 PROVIDES += "mysql5-native"
-DEPENDS = "ncurses-native zlib-native bison-native"
+DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 58f573e5e..1aa1f68cd 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -77,6 +77,7 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DNROFF=FALSE \
                  -DENABLE_DTRACE=FALSE \
                  -DWITH_PIC=ON \
+                 -DWITH_PCRE=system \
                  -DINSTALL_LAYOUT=RPM \
                  -DINSTALL_DOCDIR:PATH=${datadir}/doc/${BPN} \
                  -DINSTALL_LIBDIR:PATH=${baselib} \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
index 220b904b2..e6743fe97 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native bison-native curl openssl ncurses zlib libaio libedit libevent libxml2"
+DEPENDS += "mariadb-native bison-native libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.17.1

