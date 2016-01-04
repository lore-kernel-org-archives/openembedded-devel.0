Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B3D1E731CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:12:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172187"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:12:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B4CD40427C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:12:32 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:12:32 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:12:30 -0800
Message-ID: <1451873550-5499-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 5B4CD40427C0.AEC9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: 2.4.5 -> 2.4.7
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
X-List-Received-Date: Mon, 04 Jan 2016 02:12:43 -0000
Content-Type: text/plain

Upgrade zabbix from 2.4.5 to 2.4.7.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/zabbix/{zabbix_2.4.5.bb => zabbix_2.4.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_2.4.5.bb => zabbix_2.4.7.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
index f8314c6..e55c377 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
@@ -27,8 +27,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
            file://0001-Fix-configure.ac.patch \
            file://zabbix-agent.service"
 
-SRC_URI[md5sum] = "a82eb0d55d3ca947e10a4a55238f4388"
-SRC_URI[sha256sum] = "4e2cf1e4893a45d83379a05e2debabddf16beab324c93e84adc0bb57716fb957"
+SRC_URI[md5sum] = "9f8aeb11d8415585f41c3f2f22566b78"
+SRC_URI[sha256sum] = "d2c47b8f5b9b91f18010d54c45de55845d979014a8b3fe4bef64e0b08f8b00da"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
1.9.1




