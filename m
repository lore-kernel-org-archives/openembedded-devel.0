Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3109460125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:07:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="70357292"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 16:07:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A5F14CDDD45
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 16:07:39 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 16:07:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 16:09:13 +0800
Message-ID: <20190701080913.11639-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3A5F14CDDD45.AA9D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] wireshark: upgrade 3.0.1 -> 3.0.2
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
X-List-Received-Date: Mon, 01 Jul 2019 08:07:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from wireshark_3.0.1.bb to wireshark_3.0.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.0.1.bb => wireshark_3.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.1.bb => wireshark_3.0.2.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.2.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.2.bb
index 572dc1a45..3e6ffa3a6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "370a113e1c8ec240c4621cfb5abb0c52"
-SRC_URI[sha256sum] = "86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c"
+SRC_URI[md5sum] = "e344675283d6329a4bc213b621d7f46a"
+SRC_URI[sha256sum] = "7e1ec5664a0dba4493d8729f9922378bdd05040fb159c2b03b42111efda2e53b"
 
 PE = "1"
 
-- 
2.20.1




