Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B87D27F7C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:36:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAK8atKG020301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 00:36:55 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 20 Nov 2019 00:36:42 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 16:36:38 +0800
Message-ID: <20191120083638.37926-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: replace dependency readline with libedit
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
X-List-Received-Date: Wed, 20 Nov 2019 08:36:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Because readline changed its license to GPLv3 from version 6.0, if
build mariadb for distribution, it skips readline and turns to libedit.
If no libedit available, it uses bundled readline in the source code
finally. There is readline 8.0 in oe-core, so remove dependency readline
and use libedit instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc        | 1 -
 meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e1ae58ae7..ec5ac11ef 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -58,7 +58,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
-PACKAGECONFIG[libedit] = "-DLIBEDIT_INTERFACE=TRUE,-DLIBEDIT_INTERFACE=FALSE,libedit"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
index de24c920f..c0b53379d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native bison-native openssl ncurses zlib readline libaio libevent libxml2"
+DEPENDS += "mariadb-native bison-native openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.17.1


