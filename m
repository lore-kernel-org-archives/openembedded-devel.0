Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AE87D7F895
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 07:44:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77786274"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 15:44:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F2414CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 15:36:29 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 15:44:29 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Nov 2019 15:44:30 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 19:24:05 +0800
Message-ID: <1572607445-67199-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 7F2414CE1646.A7671
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: upgrade 4.2.6 -> 4.2.7
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
X-List-Received-Date: Fri, 01 Nov 2019 07:44:37 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/zabbix/{zabbix_4.2.6.bb => zabbix_4.2.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.2.6.bb => zabbix_4.2.7.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb
index 33c0a82..ed6c55b 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "6cd55cd743d416d9ffbf2e6fdee680ee"
-SRC_URI[sha256sum] = "646b1f29a768e3123a00a9afadf382b4d0dfd54e20fb31023f0d6da066da0864"
+SRC_URI[md5sum] = "601d3c29322c720c72018950ed969d0a"
+SRC_URI[sha256sum] = "9d9bdf1d858048d72811de04269a429aba257fac2e4b6e782d5a2b1d3a82f627"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.7.4




