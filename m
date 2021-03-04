Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.3931.1614846537852349158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105151997"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:28:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9D22C4CE92FD
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:28:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:28:54 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.0 -> 2.5.1
Date: Thu, 4 Mar 2021 16:28:53 +0800
Message-ID: <1614846533-104573-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9D22C4CE92FD.A567A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openvpn/{openvpn_2.5.0.bb => openvpn_2.5.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.0.bb => openvpn_2.5.1.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
index 3dc25bacd2..6aa7b17be6 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "2d42d3c2fff942bfe9eefa41cfd6f123"
-SRC_URI[sha256sum] = "87ef9f5d42c1193fec2ebd86757229b5ae4f295504968392375155adeda83b56"
+SRC_URI[md5sum] = "b1c279e89d97849d5fcde31d76812f04"
+SRC_URI[sha256sum] = "e9582b8e9457994bd8d50012be82c23b2f465da51460c9b2360a81da0f4e06e6"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1



