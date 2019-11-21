Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE717F8BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:54:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78831521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 13:54:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CD5674CE1BE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:46:15 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 13:54:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 13:55:04 +0800
Message-ID: <20191121055504.19928-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: CD5674CE1BE8.AA011
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libdbd-sqlite-perl: upgrade 1.62 -> 1.64
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
X-List-Received-Date: Thu, 21 Nov 2019 05:54:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{libdbd-sqlite-perl_1.62.bb => libdbd-sqlite-perl_1.64.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.62.bb => libdbd-sqlite-perl_1.64.bb} (90%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb
similarity index 90%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb
index 4af9d3c5c..468add972 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.62.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb
@@ -14,8 +14,8 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "f2e11a2bea6bd864404c0363d7eddaf8"
-SRC_URI[sha256sum] = "bd82ef322a9e5469a7a62d845c32fad1188b76ccb49a88520cec768343cce85c"
+SRC_URI[md5sum] = "10796495b52927eb2e1df34c86924027"
+SRC_URI[sha256sum] = "f4ae8f7b50842305566aadd90f7bfd12a9e32b6c603a9b1c1529e73eb82aff01"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.20.1




