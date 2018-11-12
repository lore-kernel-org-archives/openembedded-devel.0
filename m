Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2854F6C17D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 06:00:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAC605Oi008579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 22:00:05 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 11 Nov 2018 21:59:52 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Nov 2018 13:59:51 +0800
Message-ID: <1542002391-62018-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] geoip: update GeoLite Database checksum
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
X-List-Received-Date: Mon, 12 Nov 2018 06:00:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

GeoLite Database checksum changed again recently, so
update it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 0657369..1e1a7ff 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
 SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
-SRC_URI[GeoIPv6-dat.sha256sum] = "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
+SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
+SRC_URI[GeoIPv6-dat.sha256sum] = "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
 
 SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
 SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "f6dff70c99f8449af1b7a33073eaa743"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
 
 LICENSE = "LGPL-2.1"
 
-- 
2.7.4


