Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.1037.1601011866041376670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 22:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; 
   d="scan'208";a="99602546"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 13:31:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F33548990DF
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 13:30:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 13:30:57 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] arno-iptables-firewall: upgrade 2.1.0 -> 2.1.1
Date: Sat, 26 Sep 2020 01:31:02 +0800
Message-ID: <1601055062-37577-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3F33548990DF.A032E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...tables-firewall_2.1.0.bb => arno-iptables-firewall_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.0.bb => arno-iptables-firewall_2.1.1.bb} (97%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
similarity index 97%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
index 115353fec7..bc9297eab6 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.0.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "39276d14b659684c4c0612725ab83ea841c6ef99"
+SRCREV = "a96b81da4a9b619e4045805f5f13a1e982c95663"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



