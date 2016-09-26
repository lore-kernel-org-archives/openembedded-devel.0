Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 970B160746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 05:35:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8Q5ZA6v008032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 22:35:10 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Sep 2016 22:35:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 13:31:20 +0800
Message-ID: <1474867881-15637-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1474867881-15637-1-git-send-email-mingli.yu@windriver.com>
References: <1474867881-15637-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/3] mariadb: add libdbd-mysql-perl to RDEPENDS
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
X-List-Received-Date: Mon, 26 Sep 2016 05:35:09 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add libdbd-mysql-perl to RDEPENDS as mysql_setpermission
  depends on DBD::mysql module

  root@test:~# mysql_setpermission -h
  Option h is ambiguous (help, host)
  Password for user to connect to MySQL:
  install_driver(mysql) failed: Can't locate DBD/mysql.pm
  in @INC (you may need to install the DBD::mysql module)
  (@INC contains: /etc/perl /usr/lib64/perl/site_perl/5.22.1/
  /usr/lib64/perl/site_perl/5.22.1
  /usr/lib64/perl/vendor_perl/5.22.1/
  /usr/lib64/perl/vendor_perl/5.22.1
  /usr/lib64/perl/5.22.1/ /usr/lib64/perl/5.22.1
  /usr/local/lib/site_perl /usr/lib64/perl/5.22.1 .)
  at (eval 11) line 3, <STDIN> line 1.
  Perhaps the DBD::mysql perl module hasn't been fully installed,
  or perhaps the capitalisation of 'mysql' isn't right.
  Available drivers: DBM, ExampleP, File, Gofer, Proxy, Sponge.
  at /usr/bin/mysql_setpermission line 90.

* Add libmysqlclient to Provides as libdbd-mysql-perl depend on it

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc       | 2 +-
 meta-oe/recipes-support/mysql/mariadb_5.5.50.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index c2d2ecf..5dd8d64 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -169,7 +169,7 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
 RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
     perl-module-file-copy perl-module-file-temp perl-module-posix \
-    ${PN}-client libdbi-perl"
+    ${PN}-client libdbi-perl libdbd-mysql-perl"
 RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
index 8f998a3..d789573 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
@@ -4,7 +4,7 @@ EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
 DEPENDS += "mariadb-native ncurses zlib readline libaio libevent"
 
-PROVIDES += "mysql5"
+PROVIDES += "mysql5 libmysqlclient"
 
 RPROVIDES_${PN} += "mysql5"
 RREPLACES_${PN} += "mysql5"
-- 
2.8.1


