Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73E3F6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 03:10:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N3AWIV010105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 20:10:33 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 20:10:31 -0700
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 11:10:30 +0800
Message-ID: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: add libdbi-perl to the depends of mariadb-server
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
X-List-Received-Date: Tue, 23 Aug 2016 03:10:33 -0000
Content-Type: text/plain

The commands(mysql_convert_table_format and mysql_setpermission) need
to the supported API provided by the libdbi-perl package.
So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 73905b6..c2d2ecf 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -169,7 +169,7 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
 RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
     perl-module-file-copy perl-module-file-temp perl-module-posix \
-    ${PN}-client"
+    ${PN}-client libdbi-perl"
 RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
-- 
1.9.1


