Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1202C6105E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:54:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,479,1574092800"; d="scan'208";a="83835971"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Feb 2020 17:54:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F56C50A9975
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:45:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 24 Feb 2020 17:54:51 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Feb 2020 17:54:38 +0800
Message-ID: <1582538078-90319-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7F56C50A9975.A5880
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] kea: upgrade 1.7.3 -> 1.7.4
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
X-List-Received-Date: Mon, 24 Feb 2020 09:54:50 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.3.bb => kea_1.7.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.3.bb => kea_1.7.4.bb} (90%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.3.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.4.bb
similarity index 90%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.3.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.4.bb
index e230fd0fe..a2c97655a 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0e5b01c848c7736a0c9e68f9c9cd0281"
+LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
 
 DEPENDS += "kea-native"
 
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "fda03bf465818009b70dffc226da777d"
-SRC_URI[sha256sum] = "30f82c548b844c12ed46c4eb3880d63b45ec04cecfcf2e4ab1d7bada7fff4f2a"
+SRC_URI[md5sum] = "d2d0e3ad8064a5e6f3ba1e970d39f9cc"
+SRC_URI[sha256sum] = "2b7f8d8cafdb9ad2be8df9aceb2de58c8f37c1544e47c28f05e84555d0015ef5"
 
 inherit autotools systemd
 
-- 
2.17.1




