Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 03B9360125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 09:29:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99291433"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 17:33:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t759Rp1X020365
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 17:27:51 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 17:29:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 17:29:39 +0800
Message-ID: <1438766979-2418-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] geoip: upgrade 1.6.0 -> 1.6.6
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
X-List-Received-Date: Wed, 05 Aug 2015 09:29:51 -0000
Content-Type: text/plain

*Modify SRC_URI.
*Modify chksum of file COPYING and LICENSE,since the context changed.
But the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb}     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb} (89%)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
similarity index 89%
rename from meta-networking/recipes-support/geoip/geoip_1.6.0.bb
rename to meta-networking/recipes-support/geoip/geoip_1.6.6.bb
index f1b2aac..eb9d31c 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
@@ -8,12 +8,13 @@ using reverse DNS lookups."
 HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "libdevel"
 
-SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
+SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
 "
+SRCREV = "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
 
 SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
 SRC_URI[tarball.sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
@@ -32,10 +33,10 @@ SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c7
 
 LICENSE = "LGPL-2.1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d5d53d6b948c064f4070183180a4fa89 \
-                    file://LICENSE;md5=f04db71812ba70aaba8b38da91984cd2 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
+                    file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
 
-S = "${WORKDIR}/GeoIP-1.6.0"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.8.4.2


