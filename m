Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACB360CD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 09:46:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83150280"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Feb 2020 17:37:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B6B3406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:27:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 11 Feb 2020 17:37:01 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 11 Feb 2020 17:37:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Feb 2020 09:21:33 -0800
Message-ID: <1581441693-85373-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2B6B3406AB15.A075D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: upgrade 4.4.1 -> 4.4.5
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
X-List-Received-Date: Tue, 11 Feb 2020 09:46:36 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../zabbix/{zabbix_4.4.1.bb => zabbix_4.4.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.4.1.bb => zabbix_4.4.5.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb
index 656ff0dd8..108813f1e 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.5.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "e9df94149790f86732f18d042b70155d"
-SRC_URI[sha256sum] = "0bf74e597dd41a558305fe17a2b1ed6fe2d77044b87696a92e4227fbf315564a"
+SRC_URI[md5sum] = "69ab0c1bbf9d1f8979664498d36cc9a6"
+SRC_URI[sha256sum] = "94a897825b062e17b34767c0864305cee6a87476dda8bee88dcf845b24bed0ea"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.17.1




