Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EAF2D6D5B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 03:58:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,442,1544457600"; d="scan'208";a="55923502"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2019 11:58:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9153A4C7F2A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 11:57:57 +0800 (CST)
Received: from localhost.local (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 5 Mar 2019 11:58:20 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Mar 2019 11:59:36 +0800
Message-ID: <20190305035936.24600-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 9153A4C7F2A8.A92E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] twm: upgrade to 1.0.10
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
X-List-Received-Date: Tue, 05 Mar 2019 03:58:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1.Upgrade tem from 1.0.9 to 1.0.10

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{twm_1.0.9.bb => twm_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.9.bb => twm_1.0.10.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb
index 41c804bb3..3a2267ae9 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.10.bb
@@ -5,8 +5,8 @@ DEPENDS += " libxext libxt libxmu bison-native"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
-SRC_URI[md5sum] = "59a6f076cdacb5f6945dac809bcf4906"
-SRC_URI[sha256sum] = "c575167ac33edf3bd1592f1bedfe0559debb128ed5fb4873c1278e3be166310a"
+SRC_URI[md5sum] = "e322c08eeb635f924ede5b8eba3db54e"
+SRC_URI[sha256sum] = "6449eadca16ce0f0d900605b0cc020b95f40619261b7beccfb46bcc1836445d7"
 
 FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
2.20.1




