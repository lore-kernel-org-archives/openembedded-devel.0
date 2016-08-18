Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A58C4760AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:10:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10027451"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 10:10:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C95C342BC503
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:10:44 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 10:10:42 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 10:09:26 +0800
Message-ID: <1471486166-8546-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: C95C342BC503.AD055
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] hwdata: 0.288 -> 0.291
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
X-List-Received-Date: Thu, 18 Aug 2016 02:10:44 -0000
Content-Type: text/plain

Upgrade hwdata from 0.288 to 0.291.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/hwdata/{hwdata_0.288.bb => hwdata_0.291.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.288.bb => hwdata_0.291.bb} (78%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb b/meta-oe/recipes-support/hwdata/hwdata_0.291.bb
similarity index 78%
rename from meta-oe/recipes-support/hwdata/hwdata_0.288.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.291.bb
index 67199e9..f00f73b 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.291.bb
@@ -6,8 +6,8 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "f3fa1c5edb66ce5b376d95e772b2d303"
-SRC_URI[sha256sum] = "56fc26275b102e538fcfcf9c1093a09f476a1ea8d4e0c733d3c578442923693d"
+SRC_URI[md5sum] = "90ffce584bbcb1a5e77eac8503949f71"
+SRC_URI[sha256sum] = "e1007a96645cb3390aa9c0ed3f090a69d2302ce4d801914b6af1ab4ec85ede4e"
 
 do_configure() {
     ${S}/configure --datadir=${datadir} --libdir=${libdir}
-- 
2.7.4




