Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D72116CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 07:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r997Uf07028728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Oct 2013 00:30:42 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 9 Oct 2013 00:30:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2013 15:30:35 +0800
Message-ID: <ec6f9a22f0b97c9e802d26d14f888e2e6b5701d2.1381303657.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381303656.git.hongxu.jia@windriver.com>
References: <cover.1381303656.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 2/2] mariadb: fix warning while invoking 'mysql_install_db' on target
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
X-List-Received-Date: Wed, 09 Oct 2013 07:30:42 -0000
Content-Type: text/plain

Invoke 'mysql_install_db' on target, there are some warnings:
...
Installing MariaDB/MySQL system tables...
131009  6:13:14 [Warning] '--skip-locking' is deprecated and will be removed in a future release. Please use '--skip-external-locking' instead.
OK
Filling help tables...
131009  6:13:14 [Warning] '--skip-locking' is deprecated and will be removed in a future release. Please use '--skip-external-locking' instead.
OK
...

Modify my.cnf to use '--skip-external-locking' instead of '--skip-locking'
could fix this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb/my.cnf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index 8470817..d174381 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -14,7 +14,7 @@ pid-file 					= /var/lib/mysql/mysqld.pid
 log-error 					= /var/log/mysqld.err
 basedir 					= /usr
 datadir 					= /var/mysql
-skip-locking
+skip-external-locking
 skip-networking
 ignore-builtin-innodb
 bind-address					= localhost
-- 
1.8.1.2


