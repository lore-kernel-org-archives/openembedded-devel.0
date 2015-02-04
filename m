Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62BDE6013C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 05:28:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t145SeQF023899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Feb 2015 21:28:41 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Feb 2015 21:28:39 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Feb 2015 13:28:38 +0800
Message-ID: <1423027718-23540-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: mariadb-server depends on mariadb-client
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
X-List-Received-Date: Wed, 04 Feb 2015 05:28:47 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

/etc/init.d/mysqld from mariadb-server uses mysqladmin, which is installed
into mariadb-client, so add the dependency to make this script be able
to run

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index cacb0d5..8068862 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -147,7 +147,8 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
     perl-module-exporter"
 RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
-    perl-module-file-copy perl-module-file-temp perl-module-posix"
+    perl-module-file-copy perl-module-file-temp perl-module-posix \
+    ${PN}-client"
 RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
-- 
2.1.0


