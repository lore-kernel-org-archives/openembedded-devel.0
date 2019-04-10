Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 84BF57D7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:43:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549900800"; d="scan'208";a="58923979"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Apr 2019 14:43:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 86DD54CD8102
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 14:43:28 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 10 Apr 2019 14:43:26 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Apr 2019 14:44:05 +0800
Message-ID: <20190410064405.28359-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 86DD54CD8102.A7847
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] wireshark: upgrade 3.0.0 -> 3.0.1
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
X-List-Received-Date: Wed, 10 Apr 2019 06:43:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from wireshark_3.0.0.bb to wireshark_3.0.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.0.0.bb => wireshark_3.0.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.0.bb => wireshark_3.0.1.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
index dc55e3de0..572dc1a45 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
-SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
+SRC_URI[md5sum] = "370a113e1c8ec240c4621cfb5abb0c52"
+SRC_URI[sha256sum] = "86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c"
 
 PE = "1"
 
-- 
2.20.1




