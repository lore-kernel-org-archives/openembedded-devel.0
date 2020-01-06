Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E29607F953
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:37:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374642"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:37:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DF5D406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:28:34 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:37:30 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:37:38 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:52 -0800
Message-ID: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4DF5D406AB15.A30E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] arno-iptables-firewall: upgrade 2.0.3 -> 2.1.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:37:35 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...tables-firewall_2.0.3.bb => arno-iptables-firewall_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.0.3.bb => arno-iptables-firewall_2.1.0.bb} (97%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb
similarity index 97%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb
index 60aae2145..115353fec 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "ffcb86c30779df58ee057dfe9a3b078adccc1513"
+SRCREV = "39276d14b659684c4c0612725ab83ea841c6ef99"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif"
 
 S = "${WORKDIR}/git"
-- 
2.17.1




