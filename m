Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15E966D351
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:20:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,316,1539619200"; d="scan'208";a="49007544"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2018 09:20:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0263D4B734BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:20:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 5 Dec 2018 09:20:18 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Dec 2018 09:22:05 +0800
Message-ID: <20181205012205.27900-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 0263D4B734BF.ADBFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-networking][PATCH] wireshark: upgrade to 2.6.5
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
X-List-Received-Date: Wed, 05 Dec 2018 01:20:12 -0000
Content-Type: text/plain

1.Upgrade wireshark from 2.6.4 to 2.6.5.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_2.6.4.bb => wireshark_2.6.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.4.bb => wireshark_2.6.5.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
index 595502e..b3e0dd4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.5.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "8aa7b8c8ce0b6ce4256a081493819d6f"
-SRC_URI[sha256sum] = "a06b007e6343f148b8b93443b2fcfc9bb3204311cd268565d54d1b71660bc861"
+SRC_URI[md5sum] = "e25257d5969705f2a18cae627ed42d80"
+SRC_URI[sha256sum] = "93155b798544b2f07693920f4ac1b531c952965ee4eb1d98419961240177438a"
 
 PE = "1"
 
-- 
2.7.4




