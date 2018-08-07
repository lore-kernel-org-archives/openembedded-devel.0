Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94E2178AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 00:58:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w770wcFF024906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 17:58:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 6 Aug 2018 17:58:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Aug 2018 08:58:37 +0800
Message-ID: <1533603517-134770-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] phpmyadmin: add rdepend to php-cli
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
X-List-Received-Date: Tue, 07 Aug 2018 00:58:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

phpmyadmin install some bin list below that depend on interpreter php,
without rdepend,  will report "Not found the interpreter php"

/usr/share/phpmyadmin/vendor/phpmyadmin/sql-parser/bin/lint-query
/usr/share/phpmyadmin/vendor/phpmyadmin/sql-parser/bin/tokenize-query
/usr/share/phpmyadmin/vendor/phpmyadmin/sql-parser/bin/highlight-query

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
index c5b515e..a626852 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.2.bb
@@ -38,4 +38,4 @@ do_install() {
 FILES_${PN} = "${datadir}/${BPN} \
                ${sysconfdir}/apache2/conf.d"
 
-RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "bash php-cli"
-- 
2.7.4


