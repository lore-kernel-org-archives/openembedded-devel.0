Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA76665E14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:59:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9x24o021673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Aug 2014 02:59:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:59:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 17:58:57 +0800
Message-ID: <6ce12e65d33024f13f9b04e20acc7af248f2f3d1.1408442157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408442157.git.hongxu.jia@windriver.com>
References: <cover.1408442157.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mariadb: refer ubuntu/redhat to add mysql group
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
X-List-Received-Date: Tue, 19 Aug 2014 09:59:18 -0000
Content-Type: text/plain

In ubuntu/redhat, we have:
...
ps -eo user,group,cmd | grep "mysql"
mysql    mysql    /usr/sbin/mysqld
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.38.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
index e6eae78..8a73833 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
@@ -25,8 +25,8 @@ INITSCRIPT_NAME = "mysqld"
 INITSCRIPT_PARAMS = "start 45 5 . stop 45 0 6 1 ."
 
 USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g nogroup --shell /bin/false mysql"
-
+USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
+GROUPADD_PARAM_${PN}-server = "--system mysql"
 
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
-- 
1.9.1


