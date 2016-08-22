Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E8B9B731DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 05:43:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10138554"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Aug 2016 13:43:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B94E4430CD01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:43:38 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 22 Aug 2016 13:43:41 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Aug 2016 13:42:21 +0800
Message-ID: <1471844541-24817-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: B94E4430CD01.AE571
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl][PATCH] libnet-dns-perl: 0.81 -> 1.06.
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
X-List-Received-Date: Mon, 22 Aug 2016 05:43:48 -0000
Content-Type: text/plain

1)Upgrade libnet-dns-perl from 0.81 to 1.06.
2)Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../libnet/{libnet-dns-perl_0.81.bb => libnet-dns-perl_1.06.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_0.81.bb => libnet-dns-perl_1.06.bb} (70%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb
similarity index 70%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb
index 9dc4268..5309df9 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "This package contains the DNS.pm module with friends."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-LIC_FILES_CHKSUM = "file://README;md5=524da96a3365f2caff73fea0ae67c3a0"
+LIC_FILES_CHKSUM = "file://README;md5=10b1fae0c40a1627bdf0b2a7ac431632"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "26375d4310beb108b0e2b3bf30403ee5"
-SRC_URI[sha256sum] = "b36c8ead6edf68da5d9de2b0a22a47d7216e2d7eb52c8cde96724988f68a6d46"
+SRC_URI[md5sum] = "ed17abd6e7e3ba0a8db42649e34a53ae"
+SRC_URI[sha256sum] = "a3587b780ca36a8255180ac723d4f6e11407504b5b9a18e0ec098a11c218a51e"
 
 S = "${WORKDIR}/Net-DNS-${PV}"
 
-- 
2.7.4




