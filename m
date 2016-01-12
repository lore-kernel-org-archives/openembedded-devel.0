Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0388060017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:53:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2475211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 09:53:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A9FF418914F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:53:14 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 09:53:14 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jan 2016 17:52:58 -0800
Message-ID: <1452563578-59899-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 7A9FF418914F.AE0B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] openvpn: 2.3.7 -> 2.3.8
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
X-List-Received-Date: Tue, 12 Jan 2016 01:53:37 -0000
Content-Type: text/plain

Upgrade openvpn from 2.3.7 to 2.3.8.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-support/openvpn/{openvpn_2.3.7.bb => openvpn_2.3.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.3.7.bb => openvpn_2.3.8.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
index eaca395..f010906 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "070bca95e478f88dff9ec6a221e2c3f7"
-SRC_URI[sha256sum] = "1f02a4cd6aeb6250ca9311560875b10ce8957a3c9101a8005bd1e17e5b03146e"
+SRC_URI[md5sum] = "51d996f1f1fc30f501ae251a254effeb"
+SRC_URI[sha256sum] = "532435eff61c14b44a583f27b72f93e7864e96c95fe51134ec0ad4b1b1107c51"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.9.1




