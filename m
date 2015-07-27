Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 502D576298
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:18:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98927230"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 17:22:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R9H0XV015051
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:17:00 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 17:18:50 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 17:18:39 +0800
Message-ID: <1437988719-2641-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH 3/3] openvpn: upgrade 2.3.6 -> 2.3.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jul 2015 09:18:57 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/openvpn/{openvpn_2.3.6.bb => openvpn_2.3.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.3.6.bb => openvpn_2.3.7.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb
index 105e369..eaca395 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.7.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "6ca03fe0fd093e0d01601abee808835c"
-SRC_URI[sha256sum] = "7baed2ff39c12e1a1a289ec0b46fcc49ff094ca58b8d8d5f29b36ac649ee5b26"
+SRC_URI[md5sum] = "070bca95e478f88dff9ec6a221e2c3f7"
+SRC_URI[sha256sum] = "1f02a4cd6aeb6250ca9311560875b10ce8957a3c9101a8005bd1e17e5b03146e"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.2


