Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55D1479AFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:13:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA13D0cd014704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:13:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 31 Oct 2018 20:12:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2018 11:12:45 +0800
Message-ID: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] geoip: update md5sum and sha256sum
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
X-List-Received-Date: Thu, 01 Nov 2018 03:13:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Geolite database update periodically, md5sum and sha256sum
have changed, update them

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 4e717e4..e851c44 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -17,17 +17,17 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
 
-SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
-SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
+SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
+SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
 
-SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
-SRC_URI[GeoIPv6-dat.sha256sum] = "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
+SRC_URI[GeoIPv6-dat.md5sum] = "84c5f225f371463d790270ea83a25765"
+SRC_URI[GeoIPv6-dat.sha256sum] = "5767eebd655f0c06ac8066d0d4611b399ab623af42d71bac7f9478b193e77809"
 
-SRC_URI[GeoLiteCity-dat.md5sum] = "4b6588d0bfe1af22e267ac90aa97f769"
-SRC_URI[GeoLiteCity-dat.sha256sum] = "8a6467033a528f68b1a97de24d9d0ce86c8e8e83683820e16e433ddbd3f712f7"
+SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
+SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
 
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "ad0cb42518af7f752499425dca0952bb"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c712f5378bc723a8c29c0b440f"
+SRC_URI[GeoLiteCityv6-dat.md5sum] = "c195d5295f0e2f0391f1155ff31b6d09"
+SRC_URI[GeoLiteCityv6-dat.sha256sum] = "b221bb34179dfd104fb5f0340c00a2b5ff751cc294640767170aa7b71215ae18"
 
 LICENSE = "LGPL-2.1"
 
-- 
2.7.4


