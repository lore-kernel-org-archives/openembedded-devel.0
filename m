Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7598.1604901404133762929
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 21:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
   d="scan'208";a="101080107"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 13:56:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 98DAD48990FB
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 13:56:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 13:56:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.4.9 -> 2.5.0
Date: Mon, 9 Nov 2020 13:56:35 +0800
Message-ID: <1604901395-62823-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 98DAD48990FB.A40F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openvpn/{openvpn_2.4.9.bb => openvpn_2.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb => openvpn_2.5.0.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb
index 529e3912b..3dc25bacd 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "52863fa9b98e5a3d7f8bec1d5785a2ba"
-SRC_URI[sha256sum] = "46b268ef88e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af677298d03e64b6e"
+SRC_URI[md5sum] = "2d42d3c2fff942bfe9eefa41cfd6f123"
+SRC_URI[sha256sum] = "87ef9f5d42c1193fec2ebd86757229b5ae4f295504968392375155adeda83b56"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1



