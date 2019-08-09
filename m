Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 214D57F2AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 00:58:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,362,1559491200"; d="scan'208";a="73255619"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 08:58:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4166B4CDFCE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:58:37 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 08:58:42 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2019 08:57:54 +0800
Message-ID: <20190809005754.20397-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4166B4CDFCE8.A7C92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] hostapd: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Fri, 09 Aug 2019 00:58:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/hostapd/{hostapd_2.8.bb => hostapd_2.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.8.bb => hostapd_2.9.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.8.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.8.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 15884d0..e26a6ff 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.8.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://hostapd.service \
 "
 
-SRC_URI[md5sum] = "ed2c254e5f400838cb9d8e7b6e43b86c"
-SRC_URI[sha256sum] = "929f522be6eeec38c53147e7bc084df028f65f148a3f7e4fa6c4c3f955cee4b0"
+SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
+SRC_URI[sha256sum] = "881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7"
 
 S = "${WORKDIR}/hostapd-${PV}"
 B = "${WORKDIR}/hostapd-${PV}/hostapd"
-- 
2.7.4




