Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DB51B731BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:11:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172110"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:11:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 25DFA4066D28
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:10:43 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:10:42 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:10:40 -0800
Message-ID: <1451873440-5229-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 25DFA4066D28.AF167
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] sblim-sfcb: 1.4.8 -> 1.4.9
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
X-List-Received-Date: Mon, 04 Jan 2016 02:11:01 -0000
Content-Type: text/plain

Upgrade sblim-sfcb from 1.4.8 to 1.4.9.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../sblim-sfcb-1.3.15-fix-provider-debugging.patch                    | 0
 .../sblim-sfcb-1.3.16-maxMsgLen.patch                                 | 0
 .../sblim-sfcb-1.3.16-multilib-man-cfg.patch                          | 0
 .../sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch                  | 0
 .../sblim-sfcb-1.4.5-service.patch                                    | 0
 .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch                    | 0
 .../sblim-sfcb-1.4.9-fix-ftbfs.patch                                  | 0
 .../sblim-sfcb/{sblim-sfcb_1.4.8.bb => sblim-sfcb_1.4.9.bb}           | 4 ++--
 8 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.3.15-fix-provider-debugging.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.3.16-maxMsgLen.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.3.16-multilib-man-cfg.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.4.5-service.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.8 => sblim-sfcb-1.4.9}/sblim-sfcb-1.4.9-fix-ftbfs.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb_1.4.8.bb => sblim-sfcb_1.4.9.bb} (95%)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.15-fix-provider-debugging.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.15-fix-provider-debugging.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.15-fix-provider-debugging.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-maxMsgLen.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-maxMsgLen.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-maxMsgLen.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-multilib-man-cfg.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.16-multilib-man-cfg.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-multilib-man-cfg.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.5-service.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.5-service.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.5-service.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.9-fix-ftbfs.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-ftbfs.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/sblim-sfcb-1.4.9-fix-ftbfs.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-ftbfs.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
similarity index 95%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 81f47ba..efd4295 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.4.9-fix-ftbfs.patch \
            file://sfcb.service"
            
-SRC_URI[md5sum] = "b2e0cb26628cb31e2374959637d9268c"
-SRC_URI[sha256sum] = "7dc0f16e2c2d3767466a09afee04e6febd611c157d66f8f0ae666be1fefbff3b"
+SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
+SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 inherit autotools
 inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
-- 
1.9.1




