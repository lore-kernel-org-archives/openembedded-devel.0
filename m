Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADB260B74
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:49:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="84597011"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 09:49:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D759949DF125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:39:55 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 09:49:43 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 28 Feb 2020 09:49:44 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2020 00:31:42 -0800
Message-ID: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D759949DF125.A3F6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libmtp: upgrade 1.1.16 -> 1.1.17
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
X-List-Received-Date: Fri, 28 Feb 2020 01:49:45 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libmtp/{libmtp_1.1.16.bb => libmtp_1.1.17.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.16.bb => libmtp_1.1.17.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb
index 596e315b7..54decbccf 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb
@@ -21,8 +21,8 @@ DEPENDS_append_class-target = " ${BPN}-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI_append_class-target = " file://0001-Use-native-mtp-hotplug.patch"
 
-SRC_URI[md5sum] = "7796179af46e90938dde1d0c4d1d1d4c"
-SRC_URI[sha256sum] = "5b68f9dd1ed38de558de687f40e255a39e4d5e32ef3de601f0ac19dd5682bba0"
+SRC_URI[md5sum] = "81aea5d3139e5189c2e055ed2c98cd91"
+SRC_URI[sha256sum] = "f8a34cf52d9f9b9cb8c7f26b12da347d4af7eb904c13189602e4c6b62d1a79dc"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.17.1




