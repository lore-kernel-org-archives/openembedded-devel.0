Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1F67F836
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 09:05:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78058944"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 17:05:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B0F324CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 16:57:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 8 Nov 2019 17:05:14 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 20:44:37 +0800
Message-ID: <1573217077-81107-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B0F324CE1646.A4C88
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] zabbix: upgrade 4.2.7 -> 4.2.8
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
X-List-Received-Date: Fri, 08 Nov 2019 09:05:30 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/zabbix/{zabbix_4.2.7.bb => zabbix_4.2.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.2.7.bb => zabbix_4.2.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb
index ed6c55b..489ab0b 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "601d3c29322c720c72018950ed969d0a"
-SRC_URI[sha256sum] = "9d9bdf1d858048d72811de04269a429aba257fac2e4b6e782d5a2b1d3a82f627"
+SRC_URI[md5sum] = "9a816afd4f7984a841bed64a25ba523c"
+SRC_URI[sha256sum] = "57dbc2a95a09581b5196d2abc86ee1aaf65f3c909d6b4bc53d260dc4dd69b9c6"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.7.4




