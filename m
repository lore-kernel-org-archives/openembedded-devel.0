Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF61764AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:29:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99379620"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 15:32:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t777RITB027938
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Aug 2015 15:27:18 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 15:29:12 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 15:29:05 +0800
Message-ID: <1438932545-1911-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libjs-jquery: upgrade 1.7.1 -> 1.7.2
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
X-List-Received-Date: Fri, 07 Aug 2015 07:29:21 -0000
Content-Type: text/plain

LICENSE has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../libjs/{libjs-jquery_1.7.1.bb => libjs-jquery_1.7.2.bb}     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libjs/{libjs-jquery_1.7.1.bb => libjs-jquery_1.7.2.bb} (72%)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
similarity index 72%
rename from meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
rename to meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
index cf7c2d5..ec8f360 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "JavaScript library for dynamic web applications"
-LICENSE = "GPLv2+ & MIT"
-LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=2b490904c50a58472452b6e9e1c81203"
+LICENSE = "MIT | BSD | GPL-2"
+LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=5d1ec6f95e0a91d38e2f71de93ddb00e"
 
-SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}-1ubuntu1_all.deb;subdir=${BP}"
-SRC_URI[md5sum] = "1ac8a9e4dfe18de22e65baec3dd53f8b"
-SRC_URI[sha256sum] = "0551e20c88035d80c00b552707573d62ee89e8e5a204d8b427a6020b065e2542"
+SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}+debian-1ubuntu1~ubuntu12.04.1_all.deb;subdir=${BP}"
+SRC_URI[md5sum] = "fa511ab67f6e960c5b6d39a4d665e47f"
+SRC_URI[sha256sum] = "190ca18a71e35c8ab2ba73fe5be3c7cc601fe20b45709d801110818f1b602cc1"
 
 JQUERYDIR = "${datadir}/javascript/jquery"
 JQUERYDOCDIR = "${docdir}/libjs-jquery"
-- 
1.8.4.2


