Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B93FD71A5A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 05:34:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16035458"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2017 13:34:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 692B742B4B03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:34:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 28 Feb 2017 13:34:28 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Feb 2017 13:21:17 +0800
Message-ID: <1488259277-111725-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 692B742B4B03.A5220
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: 2.4.7 -> 3.0.8
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
X-List-Received-Date: Tue, 28 Feb 2017 05:34:40 -0000
Content-Type: text/plain

Upgrade zabbix from 2.4.7 to 3.0.8

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/zabbix/{zabbix_2.4.7.bb => zabbix_3.0.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_2.4.7.bb => zabbix_3.0.8.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb
index 8b9c4b8..7e7d6de 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "9f8aeb11d8415585f41c3f2f22566b78"
-SRC_URI[sha256sum] = "d2c47b8f5b9b91f18010d54c45de55845d979014a8b3fe4bef64e0b08f8b00da"
+SRC_URI[md5sum] = "f7f41850397d2078ccae4b7389f9a005"
+SRC_URI[sha256sum] = "1df3e106427ed21547b8119049a161092f597d04507f9eb535951a9ee887a476"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.7.4




