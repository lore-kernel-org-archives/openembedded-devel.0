Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D63806105E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:53:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,479,1574092800"; d="scan'208";a="83835889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Feb 2020 17:53:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CA92B50A9973
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:43:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 24 Feb 2020 17:53:03 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Feb 2020 17:29:08 +0800
Message-ID: <1582536548-89959-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CA92B50A9973.A895D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] dhcpcd: upgrade 8.1.5 -> 8.1.6
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
X-List-Received-Date: Mon, 24 Feb 2020 09:53:07 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dhcpcd/{dhcpcd_8.1.5.bb => dhcpcd_8.1.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.1.5.bb => dhcpcd_8.1.6.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb
index 3349ca153..1cb2af500 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb
@@ -12,8 +12,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 
-SRC_URI[md5sum] = "57fd5dd4ff9722773ec67239db34d3b5"
-SRC_URI[sha256sum] = "c5cbe15069cef347e72d0bf7a19b0255571ee0c184c6705859a09588a50a8ebd"
+SRC_URI[md5sum] = "e1eea03388d12c9ad21ecd7c135fdf8b"
+SRC_URI[sha256sum] = "6c2934a3e1e67a5cfd5bb15b1efa71f65c00314ac1ccb5c50da8eae3a0b8147f"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.17.1




