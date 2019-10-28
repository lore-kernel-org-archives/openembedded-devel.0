Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF7817F9A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:28:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,238,1569254400"; d="scan'208";a="77564285"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 11:28:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D54704CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 11:20:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 28 Oct 2019 11:28:58 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 19:23:09 +0800
Message-ID: <1572261789-121779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D54704CE1511.A4E0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Mon, 28 Oct 2019 03:28:57 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
index 42ffb17..29ac5c7 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
@@ -25,8 +25,8 @@ EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${include
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
-SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
+SRC_URI[md5sum] = "c61f60674a5f951f0c50faf33a611fee"
+SRC_URI[sha256sum] = "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
 
 inherit autotools
 
-- 
2.7.4




