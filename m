Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 37AF06189A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:49:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="84597017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 09:49:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 21C2D49DF125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:40:04 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 09:49:48 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 28 Feb 2020 09:49:50 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2020 00:31:44 -0800
Message-ID: <1582878704-30686-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582878704-30686-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 21C2D49DF125.A17B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: upgrade 4.4.5 -> 4.4.6
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
X-List-Received-Date: Fri, 28 Feb 2020 01:49:51 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../zabbix/{zabbix_4.4.5.bb => zabbix_4.4.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.4.5.bb => zabbix_4.4.6.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
index 108813f1e..0e0ddd577 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "69ab0c1bbf9d1f8979664498d36cc9a6"
-SRC_URI[sha256sum] = "94a897825b062e17b34767c0864305cee6a87476dda8bee88dcf845b24bed0ea"
+SRC_URI[md5sum] = "e666539220be93b1af38e40f5fbb1f79"
+SRC_URI[sha256sum] = "22bb28e667424ad4688f47732853f4241df0e78a7607727b043d704ba726ae0e"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.17.1




