Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 76C94600BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:18:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13827599"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2016 17:18:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 96C1E477B1C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:18:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 12 Dec 2016 17:18:55 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Dec 2016 17:17:53 +0800
Message-ID: <1481534273-99044-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 96C1E477B1C0.A670C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] wireshark: 2.2.1 -> 2.2.2
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
X-List-Received-Date: Mon, 12 Dec 2016 09:18:54 -0000
Content-Type: text/plain

Upgrade wireshark from 2.2.1 to 2.2.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_2.2.1.bb => wireshark_2.2.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.1.bb => wireshark_2.2.2.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb
index a8f61fe..ad72ca9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "pcre expat glib-2.0"
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
-SRC_URI[md5sum] = "49a1023a69ac108ca089d750eee50e37"
-SRC_URI[sha256sum] = "900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149"
+SRC_URI[md5sum] = "88bb55bcbc5249fee10bcea332a4fece"
+SRC_URI[sha256sum] = "f9acef5e9a9021a400b4244fafc06969f41ec594ec57fd7f0ff63bafca0055b3"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4




