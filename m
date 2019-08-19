Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5377CED3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 05:33:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="73867832"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2019 13:33:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E8A064CE03D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:33:22 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 13:33:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Aug 2019 13:32:45 +0800
Message-ID: <20190819053245.15242-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E8A064CE03D2.A846F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] cryptsetup: upgrade 2.1.0 -> 2.2.0.
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
X-List-Received-Date: Mon, 19 Aug 2019 05:33:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.1.0.bb => cryptsetup_2.2.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.1.0.bb => cryptsetup_2.2.0.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
index deaede8..6ebf1e2 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
-SRC_URI[sha256sum] = "a3eeb2741f8f3376d16585191f3c60e067dd987e096c3c4b073fab7748b1c897"
+SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
+SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4




