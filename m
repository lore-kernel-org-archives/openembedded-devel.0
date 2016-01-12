Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3DB731EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:39:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2474593"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 09:39:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 78B64418911F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:39:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 09:39:07 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jan 2016 17:38:50 -0800
Message-ID: <1452562730-26714-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 78B64418911F.ABF7E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] cryptsetup: 1.6.7 -> 1.7.0
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
X-List-Received-Date: Tue, 12 Jan 2016 01:39:27 -0000
Content-Type: text/plain

Upgrade cryptsetup from 1.6.7 to 1.7.0.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_1.6.7.bb => cryptsetup_1.7.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.7.bb => cryptsetup_1.7.0.bb} (85%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
similarity index 85%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
index 939ee35..16c21d3 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.6/${BP}.tar.xz"
-SRC_URI[md5sum] = "918406eb5d2e2f5a7348c432ea9b1473"
-SRC_URI[sha256sum] = "c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
+SRC_URI[md5sum] = "56c385fe87fc2b6873df4b7f89202d0f"
+SRC_URI[sha256sum] = "075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148"
 
 inherit autotools gettext pkgconfig
 
-- 
1.9.1




