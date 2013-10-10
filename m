Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBB2E6CF1E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 09:21:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A9LRMj010011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2013 02:21:27 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 10 Oct 2013 02:21:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2013 17:21:22 +0800
Message-ID: <cb7c8ef452b8ffb463de5b396594a056efac74b2.1381396778.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381396778.git.hongxu.jia@windriver.com>
References: <cover.1381396778.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 1/1] mariadb: Add mysql5 to RPROVIDES for backwards compatibility
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
X-List-Received-Date: Thu, 10 Oct 2013 09:21:25 -0000
Content-Type: text/plain

It failed to build image while IMAGE_INSTALL += "mysql5"
For backwards compatibility:
- Add mysql5 to RPROVIDES_${PN}
- Add mysql5-dbg to RPROVIDES_${PN}-dbg
- Add mysql5-leftovers to RPROVIDES_${PN}-leftovers
- Use "+=" instead of "=" in  RPROVIDES_${PN}-client and
  RPROVIDES_${PN}-server

The same to RREPLACES and RCONFLICTS.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
index fdf20dc..fc499d4 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
@@ -4,11 +4,23 @@ DEPENDS += "mariadb-native"
 
 PROVIDES += "mysql5"
 
-RPROVIDES_${PN}-client = "mysql5-client"
-RREPLACES_${PN}-client = "mysql5-client"
-RCONFLICTS_${PN}-client = "mysql5-client"
+RPROVIDES_${PN} += "mysql5"
+RREPLACES_${PN} += "mysql5"
+RCONFLICTS_${PN} += "mysql5"
 
-RPROVIDES_${PN}-server = "mysql5-server"
-RREPLACES_${PN}-server = "mysql5-server"
-RCONFLICTS_${PN}-server = "mysql5-server"
+RPROVIDES_${PN}-dbg += "mysql5-dbg"
+RREPLACES_${PN}-dbg += "mysql5-dbg"
+RCONFLICTS_${PN}-dbg += "mysql5-dbg"
+
+RPROVIDES_${PN}-leftovers += "mysql5-leftovers"
+RREPLACES_${PN}-leftovers += "mysql5-leftovers"
+RCONFLICTS_${PN}-leftovers += "mysql5-leftovers"
+
+RPROVIDES_${PN}-client += "mysql5-client"
+RREPLACES_${PN}-client += "mysql5-client"
+RCONFLICTS_${PN}-client += "mysql5-client"
+
+RPROVIDES_${PN}-server += "mysql5-server"
+RREPLACES_${PN}-server += "mysql5-server"
+RCONFLICTS_${PN}-server += "mysql5-server"
 
-- 
1.8.1.2


