Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6BD065D53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 01:25:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7M1P6WW027272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Aug 2014 18:25:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 18:25:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Aug 2014 09:25:01 +0800
Message-ID: <1408670701-9201-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: change the group of /var/lib/mysql from 'nogroup' to 'mysql'.
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
X-List-Received-Date: Fri, 22 Aug 2014 01:25:10 -0000
Content-Type: text/plain

The commit 8f637f9bbcdda1dc7a1998d243708c727aa6016f added
mysql group, we should change the group of /var/lib/mysql
from 'nogroup' to 'mysql' also.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
index 8a73833..06c7aba 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
@@ -123,7 +123,7 @@ pkg_postinst_${PN}-server () {
     test -d /usr/bin || mkdir -p /usr/bin
     test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
     mkdir /var/lib/mysql
-    chown mysql.nogroup /var/lib/mysql
+    chown mysql.mysql /var/lib/mysql
 
     mysql_install_db --basedir=${prefix} --user=mysql
 
-- 
1.9.1


