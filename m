Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 383727F8B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:31:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943167"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:31:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D3004B6EC73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:23:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:31:06 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:10:51 +0800
Message-ID: <1573042251-43309-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3D3004B6EC73.A4B20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] cryptsetup: upgrade 2.2.1 -> 2.2.2
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
X-List-Received-Date: Wed, 06 Nov 2019 08:31:07 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.2.1.bb => cryptsetup_2.2.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.2.1.bb => cryptsetup_2.2.2.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.2.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.2.bb
index ae5988b..479b9eb 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.2.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "1654c8d2aa0dac51c8d1d755df61ae6c"
-SRC_URI[sha256sum] = "94e79a31ed38bdb0acd9af7ccca1605a2ac62ca850ed640202876b1ee11c1c61"
+SRC_URI[md5sum] = "2b64ca9ea16e823df359eacf9c02414b"
+SRC_URI[sha256sum] = "2af0ec9551ab9c870074cae9d3f68d82cab004f4095fa89db0e4413713424a46"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4




