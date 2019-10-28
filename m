Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18AC77F9A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:29:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="77564292"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 11:29:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A21814B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 11:21:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 28 Oct 2019 11:29:17 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 19:23:38 +0800
Message-ID: <1572261818-121860-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A21814B6EC6E.A7B3B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] dhcpcd: upgrade 8.0.2 -> 8.1.1
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
X-List-Received-Date: Mon, 28 Oct 2019 03:29:14 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
index 79d1dad..87e0bb4 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
@@ -11,8 +11,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
-SRC_URI[md5sum] = "c0375a1f725f1c191b43af60e4f7175b"
-SRC_URI[sha256sum] = "33a26ad561546cd2cfe1e6de6352a85df72b41c37def8c7eb00e90e57c627a5c"
+SRC_URI[md5sum] = "dc4f29a62afc53cdac311e925cfd1bc7"
+SRC_URI[sha256sum] = "485d308fe10febd36b6f936e4260e4ab34a146e4f00a9f7a5509c4377ad5ea82"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.7.4




