Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11D3775C51
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:13:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10033615"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 14:13:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6229A42BC500
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:13:33 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 14:13:32 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 14:12:20 +0800
Message-ID: <1471500740-9570-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 6229A42BC500.A92F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl][PATCH] libdbi-perl: 1.634 -> 1.636
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
X-List-Received-Date: Thu, 18 Aug 2016 06:13:42 -0000
Content-Type: text/plain

1)Upgrade libdbi-perl from 1.634 to 1.636.
2)Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../libdb/{libdbi-perl_1.634.bb => libdbi-perl_1.636.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbi-perl_1.634.bb => libdbi-perl_1.636.bb} (82%)

diff --git a/meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb b/meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb
similarity index 82%
rename from meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb
rename to meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb
index 0238781..085b904 100644
--- a/meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb
+++ b/meta-perl/recipes-perl/libdb/libdbi-perl_1.636.bb
@@ -13,11 +13,11 @@ RDEPENDS_${PN} = " perl-module-carp \
                    perl-module-dynaloader \
 "
 
-LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=d4e73f2616b2b41334cf2f7d25d827a2"
+LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=2e5f6cf47e5ad7b77dcb6172edc29292"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "4ad15a9c2cc9b68e3fe1f5cadf9cdb30"
-SRC_URI[sha256sum] = "250712f385864818abfba409420d16d9ee61f1cc73ac85159d054a5ee86d1450"
+SRC_URI[md5sum] = "60f291e5f015550dde71d1858dfe93ba"
+SRC_URI[sha256sum] = "8f7ddce97c04b4b7a000e65e5d05f679c964d62c8b02c94c1a7d815bb2dd676c"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.7.4




